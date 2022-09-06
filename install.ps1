<#
.Synopsis
  Install configuration remotely.
.DESCRIPTION
  Usage:
  Invoke-WebRequest "https://raw.githubusercontent.com/bil0u/.dotfiles/main/install.ps1" -OutFile "$env:temp\dot-install.ps1"; 
PowerShell.exe -ExecutionPolicy Bypass -File "$env:temp\dot-install.ps1" -Remote [user/repo];
.PARAMETER Remote
  Used to specify wether the install is remotely executed
.PARAMETER Repository
  Specify the repository to use, either the full url, or <user/repo> format for GitHub repos.
#>
  
param(
	[switch]
	$Remote,
	
	[Parameter(
		DontShow = $true,
		ValueFromRemainingArguments = $true
	)]
	[string]
	$Repository
)
	
# Base URL to use for repository
$DefaultRepository = "bil0u/.dotfiles"
$RepositoryBaseUrl = "https://github.com/"

function Close-CurrentWindow {
	Stop-Process -Id $PID
}

$Mode = if ($Remote.IsPresent) {"remote"} else {"local"}
Write-Output "--- Dotfiles installer ($Mode) ---"


# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
	if ($null -eq $MyInvocation.MyCommand.Path) {
		Write-Output "Cannot continue: this script should be stored on disk before execution."
		Write-Output "Aborting."
	} elseif ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
		$CommandLine = "-NoExit -File `"$($MyInvocation.MyCommand.Definition)`" $(@('-Remote')[!$Remote]) $Repository"
		Start-Process -FilePath PowerShell.exe -ExecutionPolicy Bypass -Verb Runas -ArgumentList "$CommandLine"
		Close-CurrentWindow
	}	
	Exit
}

Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") 

# Check if chocolatey needs to be installed
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
	Write-Output 'Installing chocolatey'

	Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

	# Auto confirm package installations (no need to pass -y)
	choco feature enable -n allowGlobalConfirmation -y
} else {
	Write-Output 'Chocolatey already installed'
}

choco upgrade chezmoi git

# Detect if we should use existing files or init from a repository
if ($Remote.IsPresent) {
	if ([string]::IsNullOrWhiteSpace($Repository)) {
		$Repository = $DefaultRepository
	}
	if ($Repository -notmatch "(?:(?:git|ssh|https?)|(?:git@[\w\.]+))(?::(?:\/\/)?)(?:[\w\.@\:\/\-~]+)(?:\.git)?\/?") {
		$Repository = "$RepositoryBaseUrl$Repository"
	}
	Write-Output "Initializing dotfiles from $Repository"
	$initArgs = $Repository
} else {
	Write-Output "Initializing dotfiles from $PSScriptRoot"
	$initArgs = "--source=$PSScriptRoot"
}

$CommandLine = "-NoExit -Command `"chezmoi init --apply $initArgs`""
Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "$CommandLine"
if ($Remote.IsPresent) {
	Remove-Item $PSCommandPath -Force
}

Close-CurrentWindow


