pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\IT Printer\GPlus_UFRII_Driver_V300_W64_00\Driver\CNLB0MA64.INF" /install

Add-PrinterDriver -Name "Canon Generic Plus UFR II"

Add-PrinterPort -Name "TCPPort:10.200.3.82" -PrinterHostAddress "10.200.3.82"

Add-Printer -Name "IT Printer" -DriverName "Canon Generic Plus UFR II" -PortName "TCPPort:10.200.3.82"