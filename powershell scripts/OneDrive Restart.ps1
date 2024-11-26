Stop-Process -Name OneDrive -Force
Start-Process "C:\Program Files\Microsoft OneDrive\OneDrive.exe"

# Pause and wait for user input
Read-Host -Prompt "Press Enter to exit"
