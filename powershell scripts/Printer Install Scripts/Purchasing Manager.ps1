pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\Purchasing Manager Printer\x3univx.inf" /install

Add-PrinterDriver -Name "Xerox Global Print Driver PCL6"

Add-PrinterPort -Name "TCPPort:10.200.3.81" -PrinterHostAddress "10.200.3.81"

Add-Printer -Name "Purchasing Manger" -DriverName "Xerox Global Print Driver PCL6" -PortName "TCPPort:10.200.3.81"