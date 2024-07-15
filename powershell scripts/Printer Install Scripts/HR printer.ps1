pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\HR Printer\prnxx002.inf" /install

Add-PrinterDriver -Name "Xerox Phaser 6180N PS"

Add-PrinterPort -Name "TCPPort:10.200.3.84" -PrinterHostAddress "10.200.3.84"

Add-Printer -Name "HR" -DriverName "Xerox Phaser 6180N PS" -PortName "TCPPort:10.200.3.84"