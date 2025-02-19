$credential = get-credential

Connect-SPOService -url "https://frederickwater-admin.sharepoint.com" -Credential $credential

add-spouser -site "https://frederickwater.sharepoint.com/sites/CustomerServiceSharepoint" -LoginName wesley.gardner@frederickwater.com -Group "Members"