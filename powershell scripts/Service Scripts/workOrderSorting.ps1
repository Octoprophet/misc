#date variables
$date = Get-Date -Format "MM-dd-yyyy"
# $day = Get-Date -Format "dd"
# $month = Get-Date -Format "MM"
$monthInWords = Get-Date -Format "MMMM"
$year = Get-Date -Format "yyyy"

#file locations
$sortFolder = 'C:\Users\wesley.gardner\OneDrive - frederickwater.com\Documents\Service Work Orders\New Work Order'
$newMonthFolder = "C:\Users\wesley.gardner\OneDrive - frederickwater.com\Documents\Service Work Orders\Sorted Work Orders"

#selects the most recently added pdf file
$newestFile = Get-ChildItem -Path $sortFolder | Sort-Object LastWriteTime -Descending | Select-Object -First 1

#rename the folder and file
$monthFolderName = $monthInWords + " " + $year
$newName = $date+[System.IO.Path]::GetExtension($newestFile)

#join folder path with the name
$newFolderPath = Join-Path -Path $newMonthFolder -ChildPath $monthFolderName

#check whether the folder already exists, if not, it creates that folder
if (-not (Test-Path $newFolderPath -PathType Container)) {
    New-Item -ItemType Directory -Path $newFolderPath
    Write-Output $monthFolderName " created"
}

#assigns the destination to the folder with the current month
$destinationFolder = "C:\Users\wesley.gardner\OneDrive - frederickwater.com\Documents\Service Work Orders\Sorted Work Orders\$monthFolderName"
$newFilePath = Join-Path -Path $destinationFolder -ChildPath $newName
Copy-Item -Path $newestFile -Destination $newFilePath

#deletes the file
Remove-Item -Path $newestFile