$targetPath = "\\arcgissql\Shares\FCSAENPM\FCSA_EN_PM.exe"

$publicDesktop = [System.Environment]::GetFolderPath("CommonDesktopDirectory")

$shortcutPath = Join-Path -Path $publicDesktop -ChildPath "NSC.lnk"

$wshShell = New-Object -ComObject WScript.Shell

$shortcut = $wshShell.CreateShortcut($shortcutPath)

$shortcut.TargetPath = $targetPath

$shortcut.Save()

Write-Output "Shortcut created at $shortcutPath"