#Get windows drive
$windowsDrive = (Get-WmiObject Win32_OperatingSystem).SystemDrive

#define destination, shortcut name, and URL link
$targetLocation = "$windowsDrive\Users\Public\Desktop"
$name = "Employee Master Map"
$link = "https://gis.frederickwater.com/portal/apps/experiencebuilder/experience/?id=c2c72642923f42a39dd1188189f727ac"

$shortcutPath = "$targetLocation\$name.url"
$shortcutContent = "[InternetShortcut]`r`nURL=$link`r`n"

if (!(Test-Path $shortcutPath)) {
    Set-Content -Path $shortcutPath -Value $shortcutContent -Encoding ASCII
    write-output "Shortcut has been created"
} else {
    Write-Output "Shortcut already exists"
}