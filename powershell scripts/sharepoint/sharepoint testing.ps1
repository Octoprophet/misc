    # Check for required PowerShell version (7+)
    if (!($PSVersionTable.PSVersion.Major -ge 7)) {
        try {
          
          # Install PowerShell 7 if missing
          if (!(Test-Path "$env:SystemDrive\Program Files\PowerShell\7")) {
            Write-Output 'Installing PowerShell version 7...'
            Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"
          }
      
          # Refresh PATH
          $env:Path = [System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path', 'User')
          
          # Restart script in PowerShell 7
          pwsh -File "`"$PSCommandPath`"" @PSBoundParameters
          
        }
        catch {
          Write-Output 'PowerShell 7 was not installed. Update PowerShell and try again.'
          throw $Error
        }
        finally { exit $LASTEXITCODE }
      }
      else {
        $PSStyle.OutputRendering = 'PlainText'

        #variable to pass
        $site = 'ServiceTesting'

        $url = "https://frederickwater.sharepoint.com/sites/$site"

        Connect-PnPOnline -ClientId "0f3c9e01-6df0-41a6-8b5a-a20fbc7424f2" -CertificatePath "\\dc1\SoftwareDeployment\SharepointAPI\FrederickWater.pfx" -CertificatePassword (ConvertTo-SecureString -AsPlainText "Fortune3^" -Force) -Url $url -Tenant "frederickwater.onmicrosoft.com"

        Add-PnPFolder -Name '123456' -Folder 'Shared Documents'
      }