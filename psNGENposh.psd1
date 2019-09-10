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


@{
	
	# Script module or binary module file associated with this manifest
	ModuleToProcess = 'psNGENposh.psm1'
	
	# Version number of this module.
	ModuleVersion = '1.0.0.1'
	
	# ID used to uniquely identify this module
	GUID = 'b5a4e695-3355-4fd6-becb-72c8ea0f73d4'
	
	# Author of this module
	Author = 'Collin Chaffin'
	
	# Company or vendor of this module
	CompanyName = ''
	
	# Copyright statement for this module
	Copyright = '(c) 2019. All rights reserved.'
	
	# Description of the functionality provided by this module
	Description = 'psNGENposh Windows Powershell Module - performs various SYNCHRONOUS ngen functions'
	
	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '5.0'
	
	# Processor architecture (None, X86, Amd64, IA64) required by this module
	ProcessorArchitecture = 'None'
	
	# Modules that must be imported into the global environment prior to importing
	# this module
	RequiredModules = @()
	
	# Assemblies that must be loaded prior to importing this module
	RequiredAssemblies = @()
	
	# Script files (.ps1) that are run in the caller's environment prior to
	# importing this module
	ScriptsToProcess = @()
	
	# Type files (.ps1xml) to be loaded when importing this module
	TypesToProcess = @()
	
	# Format files (.ps1xml) to be loaded when importing this module
	FormatsToProcess = @()
	
	# Modules to import as nested modules of the module specified in
	# ModuleToProcess
	NestedModules = @()
	
	# Functions to export from this module
	FunctionsToExport = '*' #For performanace, list functions explicity
	
	# Cmdlets to export from this module
	CmdletsToExport = '*' 
	
	# Variables to export from this module
	VariablesToExport = '*'
	
	# Aliases to export from this module
	AliasesToExport = '*' #For performanace, list alias explicity
	
	# List of all modules packaged with this module
	ModuleList = @()
	
	# List of all files packaged with this module
	FileList = @()
	
	# Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData = @{
		
		#Support for PowerShellGet galleries.
		PSData = @{
			
			# Tags applied to this module. These help with module discovery in online galleries.
			Tags   = 'ngen', 'psNGENposh', 'dotnet', 'cache'
			
			# A URL to the license for this module.
			LicenseUri = 'https://github.com/collinchaffin/psNGENposh/blob/master/LICENSE'
			
			# A URL to the main website for this project.
			ProjectUri = 'https://github.com/collinchaffin/psNGENposh'
			
			# A URL to an icon representing this module.
			# IconUri = ''
			
			# ReleaseNotes of this module
			ReleaseNotes = "v 1.0.0.1	:	09-10-2019	:	Initial release"
			
		} # End of PSData hashtable
		
	} # End of PrivateData hashtable
}







