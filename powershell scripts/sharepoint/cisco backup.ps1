if ($PSVersionTable.PSVersion.Major -lt 7) {
    $ps7Path = "C:\Program Files\PowerShell\7\pwsh.exe"
    $currentScript = $MyInvocation.MyCommand.Definition
    Start-Process -FilePath $ps7Path -ArgumentList "-File `"$currentScript`"" -Wait -NoNewWindow
    exit
}

Import-Module PnP.PowerShell

$site = "frederickwaterit"
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

$ciscoLocation = "C:\scripts\Cisco Backups"
$backupFolder = "C:\scripts\Cisco Backups\Backups"
$sharepointFolder = "Shared Documents/Network/NetworkBackups/Cisco Automated Backups"
$backupLocations = "$sharepointFolder/Backups"

# cd $ciscoLocation
& "C:\Program Files\Python313\python.exe" "$ciscoLocation\backup_cisco.py"



$backupFiles = get-childItem $backupFolder

foreach ($i in $backupFiles){
    write-output $i
    Add-PnPFile -path $i -Folder $backupLocations
    try {
        Get-PnPFolderItem -FolderSiteRelativeUrl "$backupLocations" -ItemName "$i.name" -ErrorAction Stop
        Remove-Item -path $i
    } catch {
        write-output "File not copied"
    }
}



