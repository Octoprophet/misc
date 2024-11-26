# This changes Ninja to run in PowerShell 7
if ($PSVersionTable.PSVersion.Major -lt 7) {
    $ps7Path = "C:\Program Files\PowerShell\7\pwsh.exe"
    $currentScript = $MyInvocation.MyCommand.Definition
    Start-Process -FilePath $ps7Path -ArgumentList "-File `"$currentScript`"" -Wait -NoNewWindow
    exit
}

