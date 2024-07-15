pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\Customer Service Printer\esf6u.inf" /install

Add-PrinterDriver -Name "TOSHIBA Universal Printer 2"

Add-PrinterPort -Name "TCPPort:10.200.3.80" -PrinterHostAddress "10.200.3.80"

Add-Printer -Name "Admin MFP" -DriverName "TOSHIBA Universal Printer 2" -PortName "TCPPort:10.200.3.80"