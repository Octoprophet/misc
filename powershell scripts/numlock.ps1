[CmdletBinding()]
param ()

begin {
    function Test-IsElevated {
        $id = [System.Security.Principal.WindowsIdentity]::GetCurrent()
        $p = New-Object System.Security.Principal.WindowsPrincipal($id)
        $p.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
    }
}
process {
    if (-not (Test-IsElevated)) {
        Write-Error -Message "Access Denied. Please run with Administrator privileges."
        exit 1
    }

    $Path = "Registry::HKU\.DEFAULT\Control Panel\Keyboard"
    $Name = "InitialKeyboardIndicators"
    $Value = "2"

    try {
        if (-not $(Test-Path $Path)) {
            New-Item -Path $Path -Force | Out-Null
            New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType String -Force | Out-Null
        }
        else {
            New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType String -Force | Out-Null
        }
    }
    catch {
        Write-Error $_
        Write-Host "Failed to enable numlock."
        exit 1
    }
    exit 0
}
end {}