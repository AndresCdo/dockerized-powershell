# This a single script just for practice
# AndresCdo, 2022

<#
.SYNOPSIS
This script is a practice script for PowerShell.

.DESCRIPTION
The main.ps1 script is a simple PowerShell script that demonstrates basic usage of PowerShell commands. It displays a message indicating that it is the main program and also retrieves and displays the Windows Update Agent (WUA) version.

.PARAMETER None
This script does not accept any parameters.

.EXAMPLE
.\main.ps1
This command runs the main.ps1 script and displays the output.

.NOTES
Author: AndresCdo
Date: 2022
#>
Get-Module -Name *Update*
Get-Command -Module WindowsUpdateProvider
Get-Command -Module PSWindowsUpdate

Import-Module Microsoft.PowerShell.Management

Write-Host "This is the main program."
Write-Host "The current date and time is: $(Get-Date)"

Write-Host "PowerShell version: "
$PSVersionTable.PSVersion

try {
  if ([System.Environment]::OSVersion.Platform -eq 'Win32NT') {
    $query = "SELECT * FROM Win32_WindowsUpdateAgentVersion"
    $searcher = New-Object System.Management.ManagementObjectSearcher($query)
    $results = $searcher.Get()
    foreach ($result in $results) {
        Write-Host "The Windows Update Agent (WUA) version is: $($result.Version)"
    }
  } elseif ([System.Environment]::OSVersion.Platform -eq 'Unix') {
    Write-Host "The Windows Update Agent (WUA) version is not available on Unix."
  }
} catch {
  Write-Error "An error occurred: $_"
}





