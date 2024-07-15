pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\Engineering Plotter\hpi5122s.inf" /install

Add-PrinterDriver -Name "HP Designjet T3500 PCL3GUI"

Add-PrinterPort -Name "TCPPort:10.200.6.81" -PrinterHostAddress "10.200.6.81"

Add-Printer -Name "Engineering Plotter" -DriverName "HP Designjet T3500 PCL3GUI" -PortName "TCPPort:10.200.6.81"