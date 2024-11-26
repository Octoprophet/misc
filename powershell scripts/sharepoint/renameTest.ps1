$inspectors = @('Jeff Philyaw', 'Lee Brill', 'Timmy Keefer')
$currentDate = Get-Date -Format "MM-dd-yyyy"
$futureDate = (Get-Date).AddDays(4).ToString("MM-dd-yyyy")


foreach ($i in $inspectors){
    $fileNames = "$currentDate to $futureDate $i.pdf"
    Write-Host $fileNames
}