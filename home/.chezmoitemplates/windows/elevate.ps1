# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
  if ($null -eq $MyInvocation.MyCommand.Path) {
    Write-Output "Cannot continue: this script should be stored on disk before execution."
    Write-Output "Aborting."
  } elseif ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
    $CommandLine = "-NoExit -File `"$($MyInvocation.MyCommand.Path)`" $MyInvocation.UnboundArguments"
    Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  }
  Exit
}