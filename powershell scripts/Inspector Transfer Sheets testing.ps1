$OriginalFile = "C:\Users\wesley.gardner\frederickwater.com\Service Testing - Documents\Inspector Transfer Sheets\Original Copy\Inspector Time Transfer Fillable Form - ORIGINAL.pdf"

$Engineer1Destination = "C:\Users\wesley.gardner\frederickwater.com\Service Testing - Documents\Inspector Transfer Sheets\Engineer 1"

$Engineer2Destination = "C:\Users\wesley.gardner\frederickwater.com\Service Testing - Documents\Inspector Transfer Sheets\Engineer 2"

$currentDate = Get-Date -Format "MM-dd-yyyy"

$Engineer1FileName = $currentDate+" - Engineer1" + [System.IO.Path]::GetExtension($OriginalFile)
$Engineer2FileName = $currentDate+" - Engineer2" + [System.IO.Path]::GetExtension($OriginalFile)

$Engineer1path = Join-Path -Path $Engineer1Destination -ChildPath $Engineer1FileName
$Engineer2path = Join-Path -Path $Engineer2Destination -ChildPath $Engineer2FileName

Copy-Item -Path $OriginalFile -Destination $Engineer1path
Copy-Item -Path $OriginalFile -Destination $Engineer2path

