
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
$Uptime= get-computerinfo | Select-Object OSUptime 
if ($Uptime.OsUptime.Days -ge 7){
    Write-Output "Device has not rebootet on $($Uptime.OsUptime.Days) days, notify user to reboot"
    Exit 1
}else {
    Write-Output "Device has rebootet $($Uptime.OsUptime.Days) days ago, all good"
    Exit 0
}
