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

    $Path = "Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\SearchSettings"
    $Name = "IsDynamicSearchBoxEnabled"
    $Value = "0"

    try {
        if (-not $(Test-Path $Path)) {
            New-Item -Path $Path -Force | Out-Null
            New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null
            Write-Host "Registry key '$Name' added successfully with value $Value."
        }
        else {
            New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null
            Write-Host "Registry key '$Name' already exists. Value updated to $Value."
        }
    }
    catch {
        Write-Error $_
        Write-Host "Failed to disable search highlights."
        exit 1
    }
    exit 0
}
end {}
