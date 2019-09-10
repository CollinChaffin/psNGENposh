#=======================================================================#
#
# Author:				Collin Chaffin
# Last Modified:		09-10-2019 12:00PM
# Filename:				psNGENposh.psd1
#
#
# Changelog:
#
#	v 1.0.0.1	:	09-10-2019	:	Initial release
#
# Notes:
#
#   This Powershell module performs various SYNCHRONOUS ngen functions
#
#   Since the purpose of this module is to for interactive use,
#   I intentionally did not include any "Queue" options.
#		
#	
#
# Installation Instructions:
#
#	Install via the PSGallery via:
#	
#	    Install-Module psNGENposh -AllowPrerelease -Scope AllUsers
#
#	Once installed, open Windows Powershell and execute:
#
#	    Import-Module psNGENposh
#
#	To invoke ngen on currently loaded assembles, skipping those already generated:
#
#       PS C:\> Invoke-NGENposh
#
#	To invoke ngen on currently loaded assembles (ensure up to date even if cached):
#
#       PS C:\> Invoke-NGENposh -Force
#
#   To invoke ngen to regenerate cache for all system assemblies (*SEE WARNING BELOW**):
#
#       PS C:\> Invoke-NGENposh -All
#
#   **WARNING: The '-All' switch since the execution is SYNCHRONOUS will
#              take considerable time, and literally regenerate all the
#              global assembly cache.  There should theoretically be no
#              downside to this, but bear in mind other than time (and cpu)
#              that since all the generated cache files are new, any
#              system backups will consider those files as new and may
#              likely cause your next incremental backup to be much larger
#
#=======================================================================#

#Requires -Version 5.0
using namespace System.Management.Automation


# INTERNAL HELPER
function Write-InfoInColor
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$Message,
		[Parameter(Mandatory = $false)]
		[ValidateNotNullOrEmpty()]
		[System.ConsoleColor[]]$Background = $Host.UI.RawUI.BackgroundColor,
		[Parameter(Mandatory = $false)]
		[ValidateNotNullOrEmpty()]
		[System.ConsoleColor[]]$Foreground = $Host.UI.RawUI.ForegroundColor,
		[Switch]$NoNewline
	)
	
	[HostInformationMessage]$outMessage = @{
		Message			     = $Message
		ForegroundColor	     = $Foreground
		BackgroundColor	     = $Background
		NoNewline		     = $NoNewline
	}
	Write-Information $outMessage -InformationAction Continue
}

function Invoke-NGENposh
{
<#
	.SYNOPSIS
		This Powershell function performs various SYNCHRONOUS ngen functions
	
	.DESCRIPTION
		This Powershell function performs various SYNCHRONOUS ngen functions
	
		Since the purpose of this module is to for interactive use,
		I intentionally did not include any "Queue" options.
	
	.PARAMETER All
		Regenerate cache for all system assemblies
	
	.PARAMETER Force
		Invoke ngen on currently loaded assembles (ensure up to date even if cached)
	
	.EXAMPLE
		To invoke ngen on currently loaded assembles, skipping those already generated:

		PS C:\> Invoke-NGENposh
	
	.EXAMPLE	
		To invoke ngen on currently loaded assembles (ensure up to date even if cached):

		PS C:\> Invoke-NGENposh -Force
	
	.EXAMPLE	
		To invoke ngen to regenerate cache for all system assemblies (*SEE WARNING BELOW**):

		PS C:\> Invoke-NGENposh -All
	
	.NOTES
		 **WARNING: The '-All' switch since the execution is SYNCHRONOUS will
					take considerable time, and literally regenerate all the
					global assembly cache.  There should theoretically be no
					downside to this, but bear in mind other than time (and cpu)
					that since all the generated cache files are new, any
					system backups will consider those files as new and may
					likely cause your next incremental backup to be much larger
#>
	
	param
	(
		[switch]$All,
		[switch]$Force
	)
	
	Write-InfoInColor "`n===================================================================================" -Foreground 'DarkCyan'
	Write-InfoInColor "                             BEGINNING TO NGEN                                     " -Foreground 'Cyan'
	Write-InfoInColor "===================================================================================`n" -Foreground 'DarkCyan'
	
	Set-Alias ngenpsh (Join-Path ([System.Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory()) ngen.exe) -Force
	
	if ($All)
	{
		Write-InfoInColor "EXECUTING GLOBAL NGEN`n`n" -Foreground 'Cyan'
		ngenpsh update /nologo /force
	}
	else
	{
		Write-InfoInColor "EXECUTING TARGETED NGEN`n`n" -Foreground 'Cyan'
		
		[AppDomain]::CurrentDomain.GetAssemblies() |
		ForEach-Object {
			if ($_.Location)
			{
				$Name = (Split-Path $_.location -leaf)
				if ((!($Force)) -and [System.Runtime.InteropServices.RuntimeEnvironment]::FromGlobalAccessCache($_))
				{
					Write-InfoInColor "[SKIPPED]" -Foreground 'Yellow' -NoNewLine
					Write-InfoInColor " :: " -Foreground 'White' -NoNewline
					Write-InfoInColor "[ $Name ]" -Foreground 'Cyan'
					
				}
				else
				{
					
					ngenpsh install $_.location /nologo | ForEach-Object {
						if ($?)
						{
							Write-InfoInColor "[SUCCESS]" -Foreground 'Green' -NoNewLine
							Write-InfoInColor " :: " -Foreground 'White' -NoNewline
							Write-InfoInColor "[ $Name ]" -Foreground 'Cyan'
						}
						else
						{
							Write-InfoInColor "[FAILURE]" -Foreground 'Red' -NoNewLine
							Write-InfoInColor " :: " -Foreground 'White' -NoNewline
							Write-InfoInColor "[ $Name ]" -Foreground 'Cyan'
						}
					}
				}
			}
		}
	}
	Write-InfoInColor "`n===================================================================================" -Foreground 'DarkCyan'
	Write-InfoInColor "                               COMPLETED NGEN                                      " -Foreground 'Cyan'
	Write-InfoInColor "===================================================================================`n" -Foreground 'DarkCyan'
}

Export-ModuleMember -Function Invoke-NGENposh



