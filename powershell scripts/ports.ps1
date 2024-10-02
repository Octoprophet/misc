New-NetFirewallRule -DisplayName "Block Port 137" -Direction Inbound -Action Block -Protocol UDP -LocalPort 137


# Remove-NetFirewallRule -DisplayName "Block port 137"
