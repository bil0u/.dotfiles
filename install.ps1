<#
.Synopsis
  Install configuration remotely.
.DESCRIPTION
  Usage:
	& ([scriptblock]::Create((iwr https://raw.githubusercontent.com/bil0u/.dotfiles/main/install.ps1))) -RepoID [user/repo]
.PARAMETER repoID
  Github repository to use, formatted as <user/repo>
#>

param(
    [string]
    $repoID = "bil0u/.dotfiles",
	$repoScheme="https://github.com/"

    [bool]
    $Deploy = 1
)

# Checks for chezmoi and install it if not present
function Install-Chezmoi() {
	if (-not (Get-Command -Name chezmoi -ErrorAction SilentlyContinue)) {
		(irm -useb https://chezmoi.io/get.ps1) | powershell -c -
	} else {

	}
	# bin_dir="$HOME/.local/bin"
	# PATH="$bin_dir:$PATH"
	# if [ ! "$(command -v chezmoi)" ]; then
	# 	Write-Output "♻️  Installing chezmoi ..."
	# 	CHEZMOI="$bin_dir/chezmoi"
	# 	if [ "$(command -v curl)" ]; then
	# 		sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
	# 	elif [ "$(command -v wget)" ]; then
	# 		sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
	# 	else
	# 		Write-Error "🛑 To install chezmoi, you must have curl or wget installed."
	# 		exit 1
	# 	fi
	# else
	# 	Write-Output "✨ chezmoi already installed"
	# 	CHEZMOI=chezmoi
	# fi
}

# Replace current process with chezmoi init, and immediately apply changes
function Bootstrap() {
	Write-Output "♻️  Initializing dotfiles ..."

	# if [ -z "$$repoID" ]; then
	# 	args="--source=$script_dir"
	# else
	# 	args="$repoScheme$$repoID"
	# fi
	# exec "$CHEZMOI" init --apply "$args"
}

Write-Output "\e[1m\e[33m🚀 install.sh\e[0m"
Install-Chezmoi
Bootstrap
