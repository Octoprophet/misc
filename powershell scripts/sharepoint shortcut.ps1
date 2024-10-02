$windowsDrive = (Get-WmiObject win32_OperatingSystem).SystemDrive
$folderName = "Diehl Links"
$destination = "$windowsDrive\Users\Public\Desktop\$folderName"
$OGfiles = "\\dc1\SoftwareDeployment\Sharepoint Shortcuts\$folderName"

if (Test-Path $OGfiles) {
    write-output "$OGfiles is a valid source"
} else {
    write-output "$OGfiles does not exist. Please check original file location"
    exit
}

$OGchild = Get-ChildItem -Path $OGfiles
$destChild = Get-ChildItem -Path $destination

if (Test-Path $destination) {
    write-output "$folderName already exists"
} else {
    New-Item -ItemType "directory" -Path "$destination\$folderName"
    write-output "$folderName did not exist and has now been created"
}
Write-Output "-------------------"
foreach ($file in $OGchild) {
    if(Test-Path "$destination\$file") {
        $clientShortcut = "$destination\$file"
        $clientURL = (Get-content "$destination\$file" | Select-String -Pattern "^URL=").Line.Trim()
        $serverURL = (Get-Content "$OGfiles\$file" | Select-String -Pattern "^URL=").Line.Trim()
        $clientContent = Get-Content "$destination\$file"
        if ($clientURL -eq $serverURL){
        } else {
            Write-Output "$file URLs do not match"
            $clientContent = $clientContent -replace 'URL=.*', "$serverURL"
            $clientContent | Set-Content $clientShortcut
            Write-Output "-------------------"
            Write-Output "$file client URL has been updated to the server URL"
        }
        
    } else {
        copy-item "$OGfiles\$file" -Destination "$destination"
        write-output "$file has been copied to target desktop"
    }
}
foreach ($clientFile in $destChild){
    $clientName = $clientFile.name
    $serverList = @()
    foreach($serverFile in $OGchild){
        $serverName = $serverFile.Name
        $serverList += "$serverName"
    }
    if ($serverList -contains $clientName) {
    } else {
        Remove-Item "$destination\$clientName"
        Write-Output "$clientName is NOT on the server and has been removed"
    }
}