$storagePolicyFolder = "HKCU:\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy"

$storageSenseEnable = "01"
$storageSenseFrequency = "2048"
$tempFiles = "04"
$recycling = "04"
$recyclingTime = "256"



$var = Get-ChildItem -Path $storagePolicyFolder


for ($i=0; $i -le $var.count-1; $i++){

    if ($var[$i] -like "*OneDrive*"){
        write-output $var[$i].name
        write-output "------------------------"
    }
}