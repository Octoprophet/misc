# Define the possible shortcut names
$shortcutNames = @("FCSA_EN_PM.exe - Shortcut.lnk", "FCSA_EN_PM.exe.lnk", "FCSA_EN_PM.lnk")

# Get the OneDrive path for the current user from the environment variable
$onedrivePath = [System.Environment]::GetEnvironmentVariable("OneDrive")

# Define the path to the OneDrive Desktop
$desktopPath = Join-Path -Path $onedrivePath -ChildPath "Desktop"

# Initialize the flag to check if any shortcut was found and removed
$shortcutRemoved = $false

Write-Output $desktopPath

foreach ($shortcutName in $shortcutNames) {
    # Combine the desktop path and shortcut name to get the full path
    $shortcutPath = Join-Path -Path $desktopPath -ChildPath $shortcutName
    Write-Output $shortcutPath

    # Check if the shortcut exists
    if (Test-Path $shortcutPath) {
        # Remove the shortcut
        Remove-Item $shortcutPath
        Write-Output "Shortcut '$shortcutName' has been removed from the desktop."
        $shortcutRemoved = $true
        break
    }
}

# Notify if neither of the shortcuts were found
if (-not $shortcutRemoved) {
    Write-Output "Neither of the shortcuts were found on the desktop."
}
