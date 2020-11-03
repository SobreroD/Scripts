
<#PSScriptInfo
.VERSION 1.1
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
$software = "Adobe Acrobat Reader DC"
$softwarereplace = "Adobe Acrobat Pro DC";
# https://helpx.adobe.com/enterprise/kb/how-to-determine-which-versions-of-adobe-applications-are-instal.html
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null
# $installed = (Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null
If(-Not $installed) {
    # checked and was successfull
    Write-Host "'$software' NOT is installed.";

} else {
    # so Something
    Write-Host "'$software' is installed."
    Write-Host "Unstinalling '$Software' and replacing with '$softwarereplace'"
<#
Run tool with the desired command line parameters as follows:
AdbeArCleaner.exe /silent /product=<ProductId> /installpath=<InstallPath> /cleanlevel=<CleanLevel> 
/scanforothers=<ScanForOthers>

ProductId	Identifies the product:
0 = Acrobat (Default)
1 = Reader
InstallPath	Specifies the product installation path. Default = the product’s default location; e.g. C:\Program Files (x86)\Adobe\Reader 10.0. You must use this parameter when using ScanForOthers = 0.
CleanLevel	Specifies the level of cleanup; i.e. shared components should be cleaned or not:
0 (Default) = clean only components for the selected product.
1 = clean components for the selected product as well as shared components.
ScanForOthers	Specifies whether to search for and delete only the installation directory identified by InstallPath or all directories on the machine:
0 = Search for and delete only directories found on the path specified by the InstallPath parameter.
1 (Default) = Search for and delete installation directories system wide. This search includes non-default paths as well as default paths such as C:\Program Files\Adobe\Acrobat 10.0.
/?	Invokes the tool’s Help; for example: AdbeArCleaner.exe /?
#>
    Start-Process -FilePath ".\AdbeArCleaner.exe" /silent /product=1 /cleanlevel=0 /scanforothers=1
}
