# Define variables
$spSite = "https://frederickwater.sharepoint.com/sites/Engineering"
$sourceFile = "Shared Documents/General/Test/Original/Original.pdf"
$targetFolder = "Shared Documents/General/Test/New"
$newFile = "Shared Documents/General/Test/New/Original.pdf"

# Connect to SharePoint Online
Connect-PnPOnline -Url $spSite -UseWebLogin

# Copy the file
Copy-PnPFile -SourceUrl $sourceFile -TargetUrl $targetFolder

# Rename the file
Rename-PnpFile -SiteRelativeUrl $newFile -TargetFileName "testfile.pdf"
