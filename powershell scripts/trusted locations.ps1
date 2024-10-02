$trustedLocationsFolder = "HKCU:\Software\Microsoft\Office\16.0\Excel\Security\Trusted Locations"
$trustedLocationsValueName = "AllowNetworkLocations"

$trustedLocationsValue = Get-itemproperty -Path $trustedLocationsFolder -name $trustedLocationsValueName -ErrorAction SilentlyContinue

if($null -ne $trustedLocationsValue) {
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Excel\Security\Trusted Locations" -Name "AllowNetworkLocations" -Value "1"
    Write-Output "Trusted locations value exists, value has been set to 1"
} else {
    New-ItemProperty -Path $trustedLocationsFolder -name $trustedLocationsValueName -Value 1 -PropertyType DWORD -Force
    Write-Output "Trusted locations value does not exists. Value has been created and set to 1"
}



$filePath = "\\file2019"
$allowSubFolders = 1
$description = "Network Share"
$registryPath = "HKCU:\Software\Microsoft\Office\16.0\Excel\Security\Trusted Locations"
$folderCount = ((Get-ChildItem -Path $registryPath).count)

$newKey = "Location$($folderCount)"
$newKeyPath = Join-Path $registryPath $newKey

$check = 0

for ($i=0; $i -le $folderCount-1; $i++) {
    $iterate = (Get-ItemProperty -Path "$registryPath\Location$i" -Name "Path").Path
    write-output $iterate
    if ($iterate -eq $filePath){
        $check++
    }
}

if ($check -eq 0) {
    New-Item -Path $newKeyPath -Force | Out-Null
    New-ItemProperty -Path $newKeyPath -Name "Path" -Value $filePath -PropertyType "String" | Out-Null
    New-ItemProperty -Path $newKeyPath -Name "Description" -Value $description -PropertyType "String" | Out-Null
    New-ItemProperty -Path $newKeyPath -Name "AllowSubFolders" -Value $allowSubFolders -PropertyType "DWORD" | Out-Null
    Write-Host "Added $filePath to Excel's trusted locations. ($newKey)"
} else {
    write-host "$filePath already exists in the trusted locations"
}



