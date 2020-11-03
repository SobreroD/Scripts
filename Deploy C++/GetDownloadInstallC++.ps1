
<#PSScriptInfo
.VERSION 1.0
.GUID
.AUTHOR Donovan M Sobrero
.COMPANYNAME Networkmechanics.net
.COPYRIGHT
.TAGS
.LICENSEURI
.PROJECTURI
.ICONURI
.EXTERNALMODULEDEPENDENCIES 
.REQUIREDSCRIPTS
.EXTERNALSCRIPTDEPENDENCIES
.RELEASENOTES
Version 1.0: Initial version.
.PRIVATEDATA
#>

# Install VCRedist PS Module
Install-Module VcRedist -AllowClobber -Verbose -Confirm:$false -Repository PSGallery -Force
# Create Folder Structure
New-Item -Path C:\Temp\VcRedist -ItemType Directory
# Download newest Distribitables 
Get-VcList | Save-VcRedist -Path C:\Temp\VcRedist
# Install both x86 and x64
Install-VcRedist -Path C:\Temp\VcRedist -VcList (Get-VcList) -Silent -Confirm:$false
# Clean up after my self
Get-ChildItem -Path "C:\temp\VcRedist\" -Include *.* -Recurse | Remove-Item
