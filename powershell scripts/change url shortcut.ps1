$shortcutPath = "C:\Users\wesley.gardner\OneDrive - frederickwater.com\Desktop\test.url"

$newURL = "https://frederickwater.sharepoint.com/_layouts/15/sharepoint.aspx"

$shortcutContent = Get-Content $shortcutPath

$shortcutContent = $shortcutContent -replace 'URL=.*', "URL=$newURL"

write-output $shortcutContent

$shortcutContent | Set-Content $shortcutPath