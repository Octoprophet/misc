# Define the registry path
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings"

# Define the name and value to add
$valueName = "IsDynamicSearchBoxEnabled"
$valueData = 0  # Set it to 1 for enabled, 0 for disabled

# Create a new registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData
