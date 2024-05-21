$EncryptedPasswordFile = "C:\Scripts\smtppw.txt"

$username="smtp@frederickwater.com"

$password = Get-Content -Path $EncryptedPasswordFile | ConvertTo-SecureString

$credential = New-Object System.Management.Automation.PSCredential($username, $password)

#setting the sharepoint site
$spSite = "https://frederickwater.sharepoint.com/sites/Engineering"

#defining the original file to copy
$sourceFile = "Shared Documents/General/Inspector Time Transfer Forms/Original/Original Form.pdf"

#setting the desitnation for each copy
$targetFolder1 = "Shared Documents/General/Inspector Time Transfer Forms/Jeff Philyaw"
$targetFolder2 = "Shared Documents/General/Inspector Time Transfer Forms/Lee Brill"
$targetFolder3 = "Shared Documents/General/Inspector Time Transfer Forms/Timmy Keefer"

#assigning the files to rename
$renameFile1 = "Shared Documents/General/Inspector Time Transfer Forms/Jeff Philyaw/Original Form.pdf"
$renameFile2 = "Shared Documents/General/Inspector Time Transfer Forms/Lee Brill/Original Form.pdf"
$renameFile3 = "Shared Documents/General/Inspector Time Transfer Forms/Timmy Keefer/Original Form.pdf"

#setting the dates and assigning it to the desired naming format
$currentDate = Get-Date -Format "MM-dd-yyyy"
$EndOfWeekDate = (Get-Date).AddDays(4).ToString("MM-dd-yyyy")
$fileName = $currentDate + " to " + $EndOfWeekDate + [System.IO.Path]::GetExtension($sourceFile)

#connecting to sharepoint (requires credentials)
Connect-PnPOnline -Url $spSite -credentials $credential

#copying the file to each folder
Copy-PnPFile -SourceURL $sourceFile -TargetURL $targetFolder1 -force
Copy-PnPFile -SourceURL $sourceFile -TargetURL $targetFolder2 -force
Copy-PnPFile -SourceURL $sourceFile -TargetURL $targetFolder3 -force

#renaming each file after being copied
Rename-PnpFile -siteRelativeUrl $renameFile1 -TargetFileName $fileName -force
Rename-PnpFile -siteRelativeUrl $renameFile2 -TargetFileName $fileName -force
Rename-PnpFile -siteRelativeUrl $renameFile3 -TargetFileName $fileName -force