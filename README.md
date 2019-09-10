*psNGENposh*: Powershell module to perform various SYNCHRONOUS ngen functions.
===================================================================
###### by Collin Chaffin  
[![Twitter Follow](https://img.shields.io/twitter/follow/collinchaffin.svg?style=social)](https://twitter.com/collinchaffin)

[![Development Status](https://img.shields.io/badge/Status-Active-brightgreen.svg)](https://raw.githubusercontent.com/CollinChaffin/psNGENposh/master/README.md)[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/CollinChaffin/psNGENposh/master/LICENSE)[![GitHub stars](https://img.shields.io/github/stars/collinchaffin/psNGENposh)](https://github.com/CollinChaffin/psNGENposh/stargazers)[![GitHub forks](https://img.shields.io/github/forks/collinchaffin/psNGENposh)](https://github.com/CollinChaffin/psNGENposh/network)[![GitHub issues](https://img.shields.io/github/issues/collinchaffin/psNGENposh)](https://github.com/CollinChaffin/psNGENposh/issues)


Description:
------------

This Powershell module performs various SYNCHRONOUS ngen functions.

Since the purpose of this module is to for interactive use, I intentionally did not include any "Queue" options.



# Installation Instructions

Install via the PSGallery via:
	
```
Install-Module psNGENposh -AllowPrerelease -Scope AllUsers
```



Examples:
---------

Open Windows Powershell and execute:

```
Import-Module psNGENposh
```

To invoke ngen on currently loaded assembles, skipping those already generated:

```
PS C:\> Invoke-NGENposh
```

To invoke ngen on currently loaded assembles (ensure up to date even if cached):

```
 PS C:\> Invoke-NGENposh -Force
```

To invoke ngen to regenerate cache for all system assemblies (*SEE WARNING BELOW**):

```
 PS C:\> Invoke-NGENposh -All
```  

**WARNING: The '-All' switch since the execution is SYNCHRONOUS will
              take considerable time, and literally regenerate all the
              global assembly cache.  There should theoretically be no
              downside to this, but bear in mind other than time (and cpu)
              that since all the generated cache files are new, any
              system backups will consider those files as new and may
              likely cause your next incremental backup to be much larger**

Changelog:
-------------

| Version | Release Date    |    Description                           |
|---------|-----------------|------------------------------------------|
| v1.0.0.1 | 09-10-2019	| Initial release |



TODO:
-------------

No immediate TODOs but please submit PRs or requests via GH issue and I will update accordingly.


LICENSE:
-------------
Please see the included LICENSE file.  
  
_THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE._  



__Collin Chaffin__  
[![Twitter Follow](https://img.shields.io/twitter/follow/collinchaffin.svg?style=social)](https://twitter.com/collinchaffin)



Donations:
-----------------------------

You can support my efforts and every donation is greatly appreciated!  
<a href="https://paypal.me/CollinChaffin"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" alt="[paypal]" /></a>  

