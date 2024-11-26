if ($PSVersionTable.PSVersion.Major -lt 7) {
    $ps7Path = "C:\Program Files\PowerShell\7\pwsh.exe"
    $currentScript = $MyInvocation.MyCommand.Definition
    Start-Process -FilePath $ps7Path -ArgumentList "-File `"$currentScript`"" -Wait -NoNewWindow
    exit
}

# Import the PnP PowerShell module
Import-Module PnP.PowerShell

# Variable to pass
$site = "Engineering"
$url = "https://frederickwater.sharepoint.com/sites/$site"

# Connect to SharePoint Online
$connectionResult = Connect-PnPOnline -ClientId "0f3c9e01-6df0-41a6-8b5a-a20fbc7424f2" `
    -CertificatePath "\\dc1\SoftwareDeployment\SharepointAPI\FrederickWater.pfx" `
    -CertificatePassword (ConvertTo-SecureString -AsPlainText "Fortune3^" -Force) `
    -Url $url -Tenant "frederickwater.onmicrosoft.com"

# Check if the connection was successful and output to plain text
if ($connectionResult -eq $null) {
    "Connected to SharePoint site $site successfully." | Out-Host
} else {
    "Failed to connect to SharePoint site $site." | Out-Host
}

$inspectors = @('Jeff Philyaw', 'Lee Brill', 'Timmy Keefer')
$currentDate = Get-Date -Format "MM-dd-yyyy"
$futureDate = (Get-Date).AddDays(4).ToString("MM-dd-yyyy")
$transferFormFolder = "Shared Documents/General/Inspector Time Transfer Forms"
$originalFile = "$transferFormFolder/Original/Original Form.pdf"
$fileName = "$currentDate to $futureDate TESTING.pdf"

foreach ($i in $inspectors){
    $copyTarget = "$transferFormFolder/$i"
    $newFile = "$copyTarget/Original Form.pdf"
    Copy-PnPFile -SourceUrl $originalFile -TargetUrl $copyTarget -Force
    Rename-PnPFile -SiteRelativeUrl $newFile -TargetFileName $fileName -Force
    write-host "File copied for $i"
}