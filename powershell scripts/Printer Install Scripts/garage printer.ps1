pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\Garage Printer\prncacl1.inf" /install

Add-PrinterDriver -Name "Canon Office XPS Class Driver"

Add-PrinterPort -Name "TCPPort:10.200.7.81" -PrinterHostAddress "10.200.7.81"

Add-Printer -Name "Garage" -DriverName "Canon Office XPS Class Driver" -PortName "TCPPort:10.200.7.81"