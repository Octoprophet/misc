$destination = "C:\Users\Public\Desktop"
$folderName = "Parkins Mill Links"
$OGfiles = "\\dc1\SoftwareDeployment\Sharepoint Shortcuts\$folderName"
$combinedPath = "$destination\$folderName"

write-output $combinedPath

if (Test-Path $OGfiles) {
    write-output "$OGfiles is a valid source"
} else {
    write-output "$OGfiles does not exist. Please check original file location"
    exit
}

$OGchild = Get-ChildItem -Path $OGfiles

if (Test-Path $combinedPath) {
    write-output "$folderName already exists"
} else {
    New-Item -ItemType "directory" -Path "$destination\$folderName"
    write-output "$folderName did not exist and has now been created"
}

foreach ($file in $OGchild) {
    if(Test-Path "$combinedPath\$file") {
    } else {
        copy-item "$OGfiles\$file" -Destination "$destination\$folderName"
        write-output "$file has been copied to target desktop"
    }
}