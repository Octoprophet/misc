# Load OpenHardwareMonitorLib assembly
Add-Type -Path "C:\Program Files\OpenHardwareMonitor\OpenHardwareMonitorLib.dll"

# Create a new instance of the Computer class
$computer = New-Object -TypeName OpenHardwareMonitor.Hardware.Computer
$computer.Open()

# Loop through all hardware in the computer
foreach ($hardware in $computer.Hardware) {
    if ($hardware.HardwareType -eq 'CPU') {
        $hardware.Update()
        foreach ($sensor in $hardware.Sensors) {
            if ($sensor.SensorType -eq 'Temperature' -and $sensor.Name -like '*Core*') {
                # Get CPU temperature in Celsius
                $cpuTemperatureCelsius = $sensor.Value
                # Convert Celsius to Fahrenheit
                $cpuTemperatureFahrenheit = [Math]::Round($cpuTemperatureCelsius * 9/5 + 32, 2)
                # Output the CPU temperature in Fahrenheit
                Write-Output "CPU Temperature: $cpuTemperatureFahrenheit °F"
            }
        }
    }
}

# Close the computer instance
$computer.Close()
