# set download variables
$officeShare = '\\dc1.fcsa-water.local\SoftwareDeployment\OfficeSetup.exe'

#set destination variable
$officeLocal = 'C:\Temp\OfficeSetup.exe'

#create Temp file if it doesn't exist
if (!(Test-Path -Path 'C:\Temp' -ErrorAction SilentlyContinue)) {
    New-Item -ItemType Directory -Path 'C:\Temp' -Force
}

#copy installer from DC1 to local Temp file
if (Test-Path -Path $officeShare) {
    Copy-Item -Path $officeShare -Destination $officeLocal -Force
}

#check if Microsoft365 service is present. If it's not, run the installer
if (!(Get-Service -name OfficeSvcManagerAddons -ErrorAction SilentlyContinue)) {
    & $officeLocal /install /quiet /norestart
}