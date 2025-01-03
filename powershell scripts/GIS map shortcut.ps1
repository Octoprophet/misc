#Get windows drive
$windowsDrive = (Get-WmiObject Win32_OperatingSystem).SystemDrive

#define destination, shortcut name, and URL link
$targetLocation = "$windowsDrive\Users\Public\Desktop"
$name = "Employee Web Map"
$link = "https://gis.frederickwater.com/portal/apps/experiencebuilder/experience/?id=2e3a0110b5f94f8db8eb40faef4e1f3c&page=Page-1"

$shortcutPath = "$targetLocation\$name.url"
$shortcutContent = "[InternetShortcut]`r`nURL=$link`r`n"

if (!(Test-Path $shortcutPath)) {
    Set-Content -Path $shortcutPath -Value $shortcutContent -Encoding ASCII
    write-output "Shortcut has been created"
} else {
    Write-Output "Shortcut already exists"
}