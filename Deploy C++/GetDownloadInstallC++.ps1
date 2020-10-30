<#
********************************
**    By Donovan M Sobrero    ##
**        10/27/2020          ##
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