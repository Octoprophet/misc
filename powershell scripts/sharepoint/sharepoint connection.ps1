if ($PSVersionTable.PSVersion.Major -lt 7) {
    $ps7Path = "C:\Program Files\PowerShell\7\pwsh.exe"
    $currentScript = $MyInvocation.MyCommand.Definition
    Start-Process -FilePath $ps7Path -ArgumentList "-File `"$currentScript`"" -Wait -NoNewWindow
    exit
}

Import-Module PnP.PowerShell

$site = #Enter Sharepoint page name
$url = "https://frederickwater.sharepoint.com/sites/$site"

$connectionResult = Connect-PnPOnline -ClientId "0f3c9e01-6df0-41a6-8b5a-a20fbc7424f2" `
    -CertificatePath "\\dc1\SoftwareDeployment\SharepointAPI\FrederickWater.pfx" `
    -CertificatePassword (ConvertTo-SecureString -AsPlainText "Fortune3^" -Force) `
    -Url $url -Tenant "frederickwater.onmicrosoft.com"

if ($connectionResult -eq $null) {
    "Connected to SharePoint site $site successfully." | Out-Host
} else {
    "Failed to connect to SharePoint site $site." | Out-Host
}