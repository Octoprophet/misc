#Setting the unedited form
$OriginalFile = "C:\Users\wesley.gardner\frederickwater.com\Engineering - Documents\General\Inspector Time Transfer Forms\Original\Inspector Time Transfer Fillable Form - ORIGINAL.pdf"

#Destination Paths to each inspector
$JeffPhilyawDestination = "C:\Users\wesley.gardner\frederickwater.com\Engineering - Documents\General\Inspector Time Transfer Forms\Jeff Philyaw"
$LeeBrillDestination = "C:\Users\wesley.gardner\frederickwater.com\Engineering - Documents\General\Inspector Time Transfer Forms\Lee Brill"
$TimmyKeeferDestination = "C:\Users\wesley.gardner\frederickwater.com\Engineering - Documents\General\Inspector Time Transfer Forms\Timmy Keefer"

$currentDate = Get-Date -Format "MM-dd-yyyy"

#Building the file name and extension
$JeffPhilyawFileName = $currentDate+" - Jeff Philyaw" + [System.IO.Path]::GetExtension($OriginalFile)
$LeeBrillFileName = $currentDate+" - Lee Brill" + [System.IO.Path]::GetExtension($OriginalFile)
$TimmyKeeferFileName = $currentDate+" - Timmy Keefer" + [System.IO.Path]::GetExtension($OriginalFile)

#combining the path and name
$JeffPhilyawPath = Join-Path -Path $JeffPhilyawDestination -ChildPath $JeffPhilyawFileName
$LeeBrillPath = Join-Path -Path $LeeBrillDestination -ChildPath $LeeBrillFileName
$TimmyKeeferPath = Join-Path -Path $TimmyKeeferDestination -ChildPath $TimmyKeeferFileName

#Copying the orignal to it's destination
Copy-Item -Path $OriginalFile -Destination $JeffPhilyawPath
Copy-Item -Path $OriginalFile -Destination $LeeBrillPath
Copy-Item -Path $OriginalFile -Destination $TimmyKeeferPath
