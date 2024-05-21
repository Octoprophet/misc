# set download variables
$vpnShare = '\\dc1.fcsa-water.local\SoftwareDeployment\FortiClientVPNOnlineInstaller.exe'

#set destination variable
$vpnLocal = 'C:\Temp\FortiClientVPNOnlineInstaller.exe'

#create Temp file if it doesn't exist
if (!(Test-Path -Path 'C:\Temp' -ErrorAction SilentlyContinue)) {
    New-Item -ItemType Directory -Path 'C:\Temp' -Force
}

#copy installer from DC1 to local Temp file
if (Test-Path -Path $vpnshare) {
    Copy-Item -Path $vpnShare -Destination $vpnLocal -Force
}

#check if Microsoft365 service is present. If it's not, run the installer
if (!(Get-Service -name "FortiClient VPN Service Scheduler" -ErrorAction SilentlyContinue)) {
    & $vpnLocal /install /quiet /norestart
}