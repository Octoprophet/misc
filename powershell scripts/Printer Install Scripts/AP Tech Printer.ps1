pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\Heather's Printer\hpcu130u.inf" /install

Add-PrinterDriver -Name "HP Universal Printing PCL 6"

Add-PrinterPort -Name "TCPPort:10.200.3.85" -PrinterHostAddress "10.200.3.85"

Add-Printer -Name "AP Tech" -DriverName "HP Universal Printing PCL 6" -PortName "TCPPort:10.200.3.85"