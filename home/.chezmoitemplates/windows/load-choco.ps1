Import-Module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"