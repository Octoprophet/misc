# set download variables
$readerShare = '\\dc1.fcsa-water.local\SoftwareDeployment\Reader_Install_Setup.exe'

#set destination variable
$readerLocal = 'C:\Temp\Reader_Install_Setup.exe'

#create Temp file if it doesn't exist
if (!(Test-Path -Path 'C:\Temp' -ErrorAction SilentlyContinue)) {
    New-Item -ItemType Directory -Path 'C:\Temp' -Force
}

#copy installer from DC1 to local Temp file
if (Test-Path -Path $readerShare) {
    Copy-Item -Path $readerShare -Destination $readerLocal -Force
}

#check if Microsoft365 service is present. If it's not, run the installer
if (!(Get-Service -name "Adobe Acrobat Update Service" -ErrorAction SilentlyContinue)) {
    & $readerLocal /install /quiet /norestart
}