$systemDrive = $env:SystemDrive
$restartDestination = "$systemDrive\scripts\restartOneDrive.ps1"
$scriptLocation = "\\dc1\SoftwareDeployment\Ninja Scripts\restartOneDrive.ps1"

$shortcutLocation = "$systemDrive\Users\Public\Desktop\Restart OneDrive.lnk"
$powershellLocation = "$systemDrive\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$WScriptShell = New-Object -ComObject WScript.Shell;

$arguments = "-ExecutionPolicy RemoteSigned -File $restartDestination"

$present = 0

if (Test-Path $restartDestination) {
    Write-Output "OneDrive restart script already present"
    $present = 1
} else {
    Copy-Item $scriptLocation -Destination $restartDestination
    if (Test-Path $restartDestination) {
        Write-Output "Script copied to $systemDrive root"
        $present = 1
    } else {
        Write-Output "Script could not be copied"
    }
}

if ($present -eq 1) {
    if (test-path $shortcutLocation) {
        Write-Output "Shortcut already exists on desktop"
    } else {
        $shortcut = $WScriptShell.CreateShortcut($shortcutLocation)
        $shortcut.TargetPath = $powershellLocation
        $shortcut.Arguments = $arguments
        $shortcut.Save()
        Write-Output "Restart OneDrive shortcut has been created"
    }
}
