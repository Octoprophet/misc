$printerName = "Engineering MFP"
write-output $printerName
$driverName
$ipAddress

if ($printerName -eq "Admin MFP") {
    $driverName = "TOSHIBA Universal Printer 2"
    $ipAddress = "10.200.3.80"
}
if ($printerName -eq "AP Tech") {
    $driverName = "HP Universal Printing PCL 6"
    $ipAddress = "10.200.3.85"
}
if ($printerName -eq "Customer Service MFP") {
    $driverName = "TOSHIBA Universal Printer 2"
    $ipAddress = "10.200.4.80"
}
if ($printerName -eq "Engineering MFP") {
    $driverName = "TOSHIBA Universal Printer 2"
    $ipAddress = "10.200.6.80"
}
if ($printerName -eq "Engineering Plotter") {
    $driverName = "HP Designjet T3500 PCL3GUI"
    $ipAddress = "10.200.6.81"
}
if ($printerName -eq "Garage Printer") {
    $driverName = "Canon Office XPS Class Driver"
    $ipAddress = "10.200.7.81"
}
if ($printerName -eq "HR Printer") {
    $driverName = "Xerox Phaser 6180N PS"
    $ipAddress = "10.200.3.84"
}
if ($printerName -eq "IT Printer") {
    $driverName = "Canon Generic Plus UFR II"
    $ipAddress = "10.200.3.82"
}
if ($printerName -eq "Maintenance MFP") {
    $driverName = "TOSHIBA Universal Printer 2"
    $ipAddress = "10.200.5.80"
}
if ($printerName -eq "Purchasing Manager Printer") {
    $driverName = "Xerox Global Print Driver PCL6"
    $ipAddress = "10.200.3.81"
}
if ($printerName -eq "Senior Accountant Printer") {
    $driverName = "HP Universal Printing PCL 6"
    $ipAddress = "10.200.3.83"
}
if ($printerName -eq "Sliwinski Printer") {
    $driverName = "HP Smart Universal Printing"
    $ipAddress = "10.103.1.80"
}

# pnputil /add-driver "\\dc1\SoftwareDeployment\Printer Files\" + $printerName + "\*.inf"
# Add-PrinterDriver -Name $driverName
# Add-PrinterPort -Name "TCPPort:" + $ipAddress -PrinterHostAddress $ipAddress
# Add-Printer -Name $printerName -DriverName $driverName -PortName "TCPPort:" + $ipAddress

Write-Output "\\dc1\SoftwareDeployment\Printer Files\$printerName\*.inf"
Write-Output "-Name $driverName"
Write-Output "-Name TCPPort:$ipAddress -PrinterHostAddress $ipAddress"
Write-Output "-Name $printerName -DriverName $driverName -PortName TCPPort:$ipAddress"

