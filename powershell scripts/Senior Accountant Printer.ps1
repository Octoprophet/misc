pnputil /add-driver "\\dc1\SoftwareDeployment\Heather's Printer\hpcu130u.inf" /install

Add-PrinterDriver -Name "HP Universal Printing PCL 6"

Add-PrinterPort -Name "TCPPort:10.200.3.83" -PrinterHostAddress "10.200.3.83"

Add-Printer -Name "Senior Accountant" -DriverName "HP Universal Printing PCL 6" -PortName "TCPPort:10.200.3.83"