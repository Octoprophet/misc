$path = "C:\Users\wesley.gardner\frederickwater.com\Engineering - Documents\General\Inspector Time Transfer Forms"

#Setting the unedited form
$OriginalFile = "$path\Original\Original Form.pdf"

#Destination Paths to each inspector
$JeffPhilyawDestination = "$path\Jeff Philyaw"
$LeeBrillDestination = "$path\Lee Brill"
$TimmyKeeferDestination = "$path\Timmy Keefer"
$destinations = @($JeffPhilyawDestination, $LeeBrillDestination, $TimmyKeeferDestination)

#Assign files to rename
$JeffPhilyawRename = "$JeffPhilyawDestination\Original Form.pdf"
$LeeBrillRename = "$LeeBrillDestination\Original Form.pdf"
$TimmyKeeferRename = "$TimmyKeeferDestination\Original Form.pdf"
$renames = @($JeffPhilyawRename, $LeeBrillRename, $TimmyKeeferRename)

#setting the dates and assigning it to the desired naming format
$currentDate = Get-Date -Format "MM-dd-yyyy"
$EndOfWeekDate = (Get-Date).AddDays(4).ToString("MM-dd-yyyy")
$fileName = $currentDate + " to " + $EndOfWeekDate + "TESTING.pdf"

forEach($location in $destinations) {
    write-output "location: $location"
    Copy-Item $OriginalFile -Destination $location
}

forEach($name in $renames) {
    write-output "Names: $name"
    Rename-Item -Path $name -NewName $fileName
}