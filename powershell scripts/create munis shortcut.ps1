# Get windows drive in case windows isn't installed on C drive
$windowsDrive = (Get-WmiObject win32_OperatingSystem).SystemDrive

#create a new folder for the shortcuts
$folderPath = "$windowsDrive\Users\wesley.gardner\OneDrive - frederickwater.com\desktop\MUNIS Folder"
$testFolder = test-path $folderPath
if(!$testFolder){
    New-Item -Path $folderPath -ItemType Directory
    write-output "Folder created"
    } else {
    write-output "Folder Already Exists"
    }

#list the shortcuts created and the URL
$shortcuts = 
    @{
        name = "Munis Live"
        value = "https://frederickcntsntautva.tylerhub.com"
    },
    @{
        name = "Munis Self Service"
        value = "https://frederickcntsntautva.munisselfservice.com/ess"
    },
    @{
        name = "Munis Support"
        value = "http://www.tylertech.com/client-support/munis-support"
    }

#iterate through the list
for ($i=0; $i -lt $shortcuts.length; $i++) {
    $shortcutName = $shortcuts[$i].name
    $shortcutValue = $shortcuts[$i].value
    $url = ".url"
    #concatenate the final file path
    $shortcutPath = "$folderPath\$shortcutName$url"
    #create shortcut variable
    $shortcutContent = "[InternetShortcut]`r`nURL=$shortcutValue`r`n"
    #create shortcut if one doesn't already exist
    $shortcutTest = test-path $shortcutPath    
    if (!$shortcutTest){
        Set-Content -Path $shortcutPath -Value $shortcutContent -Encoding ASCII
        write-output "$shortcutName shortcut has been created"
    } else {
        write-output "Shortcut for $shortcutName already exists"
    }
}