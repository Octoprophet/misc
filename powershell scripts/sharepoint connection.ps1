# Uninstall-Module -Name PnP.PowerShell -AllVersions -Force
# Install-Module -Name PnP.PowerShell -RequiredVersion 1.9.0 -Force

Import-Module PnP.PowerShell
$siteUrl = "https://frederickwater.sharepoint.com/sites/Engineering"
Connect-PnPOnline -Url $siteUrl -Interactive