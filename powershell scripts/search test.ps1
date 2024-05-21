# Registry path and value
$Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings"
$Name = "IsDynamicSearchBoxEnabled"
$Value = 0

try {
    # Create or open the registry key
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }

    # Set the registry value
    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type DWORD -Force | Out-Null

    Write-Host "Registry value '$Name' set to $Value"
}
catch {
    Write-Error "Failed to set registry value: $_"
    exit 1
}