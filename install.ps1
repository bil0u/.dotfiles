<#
.Synopsis
  Install configuration remotely.
.DESCRIPTION
  Usage:
	& ([scriptblock]::Create((iwr https://raw.githubusercontent.com/bil0u/.dotfiles/main/install.ps1))) -RepoID [user/repo]
# .PARAMETER Remote
#   Wether the script is installed remotely or locally. Default 0 (= locally)
.PARAMETER Remote
  For remote installs, use a repo as source instead of local files, formatted as <user/repo> for Github repos, or full URL
#>
  
param(
	[string]
	$Repository = "bil0u/.dotfiles"
)
	
# Base URL to use for repository
$RepositoryBaseUrl = "https://github.com/"

# Checks for chezmoi and install it if not present
function Install-Chezmoi() {
	if (-not (Get-Command -Name chezmoi -ErrorAction SilentlyContinue)) {
		Write-Output "♻️  Installing chezmoi ..."
		(irm -useb https://chezmoi.io/get.ps1) | powershell -c -
	}
 else {
		Write-Output "✨ chezmoi already installed"
	}
}

# Replace current process with chezmoi init, and immediately apply changes
function Bootstrap() {
	Write-Output "♻️  Initializing dotfiles ..."

	if ($PSBoundParameters.ContainsKey('Remote')) {
		if (! $Repository -match "((git|ssh|http(s)?)|(git@[\w\.]+))(:(//)?)([\w\.@\:/\-~]+)(\.git)?(/)?") {
			$Repository = "$RepositoryBaseUrl$Repository"
		}
		$initArgs = $Repository
	}
	else {
		$initArgs = "--source=$PSScriptRoot"
	}
	chezmoi init --apply $initArgs
}

Write-Output "\e[1m\e[33m🚀 install.sh\e[0m"
Install-Chezmoi
Bootstrap
