$windowsDrive = (Get-WmiObject Win32_OperatingSystem).SystemDrive
$iconPath = "$windowsDrive\Users\Public\image.ico"
Copy-Item -Path "\\arcgissql\Shares\FCSAENPM\image.ico" -Destination $iconPath

$targetPath = "\\arcgissql\Shares\FCSAENPM\FCSA_EN_PM.exe"
$publicDesktop = [System.Environment]::GetFolderPath("CommonDesktopDirectory")
$shortcutPath = Join-Path -Path $publicDesktop -ChildPath "NSC.lnk"

$wshShell = New-Object -ComObject WScript.Shell

$shortcut = $wshShell.CreateShortcut($shortcutPath)

$shortcut.TargetPath = $targetPath

$shortcut.IconLocation = $iconPath

$shortcut.Save()

Write-Output "Shortcut created at $shortcutPath"

$user = (Get-CimInstance -class Win32_ComputerSystem).username.split('\')[1]
Write-Output $user

$oldPath = "$windowsDrive\Users\$user\OneDrive - frederickwater.com\Desktop\FCSA_EN_PM.exe - Shortcut.lnk"
$oldPath2 = "$windowsDrive\Users\$user\OneDrive - frederickwater.com\Desktop\FCSA_EN_PM.lnk"

write-output $oldPath
write-output $oldPath2

$oldPathTest = test-path $oldPath
$oldPath2Test = test-path $oldPath2


if ($oldPathTest) {
    remove-item $oldPath
    write-output "File removed"
} elseif ($oldpath2Test) {
    remove-item $oldpath2
    write-output "File removed"
} else {
    write-output "File not found"
}
