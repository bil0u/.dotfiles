#!/usr/bin/env bash

# Install remotely from single shell command
# Usage : sh -c "$(curl -fsSL https://raw.githubusercontent.com/bil0u/.dotfiles/main/install.sh)" -- -r [user/repo]

# Exit on error
set -e

REPO_SCHEME="https://github.com/"
REPO_ID=""
DEFAULT_REPO_ID="bil0u/.dotfiles"

main() {
	echo "\e[1m\e[33m🚀 install.sh\e[0m"
	parse_args "${@}"
	install_xcode_cli_tools
	install_chezmoi
	bootstrap
}

# Prints usage
usage() {
	cat <<-EOF

		$0 [-r [user/repo]]

		options:

		    -r --remote  For remote installs, use a github repo as source instead of local files.
							Optionally give a user/repo to override the default ($REPO_ID)
		    -h --help    Display this message.

	EOF
	exit 1
}

# Displays a message then exits
die() {
	echo "$*"
	exit 1
}

# Parses script arguments
parse_args() {
	argv=()
	while [ $# -gt 0 ]; do
		opt=$1
		shift
		case ${opt} in
		-r | --remote)
			if [ $# -eq 0 -o "${1:0:1}" = "-" ]; then
				REPO_ID=$DEFAULT_REPO_ID
			else
				REPO_ID=$1
				shift
			fi
			;;
		-h | --help)
			usage
			;;
		*)
			if [ "${opt:0:1}" = "-" ]; then
				die "\e[1m\e[31m🛑 ${opt}: unknown option.\e[0m" >&2
			fi
			argv+=(${opt})
			;;
		esac
	done
}

# Checks for Xcode Command Line Tools and install them if not present
install_xcode_cli_tools() {
	xcode-select -p &>/dev/null
	if [ $? -ne 0 ]; then
		echo "♻️  Installing Xcode Command Line Tools ..."
		xcode-select --install
		sudo xcodebuild -license accept
	else
		xcode_version=$(xcodebuild -version | grep '^Xcode\s' | sed -E 's/^Xcode[[:space:]]+([0-9\.]+)/\1/')
		accepted_license_version=$(defaults read /Library/Preferences/com.apple.dt.Xcode 2>/dev/null | grep IDEXcodeVersionForAgreedToGMLicense | cut -d '"' -f 2)
		if [ "$xcode_version" != "$accepted_license_version" ]; then
			sudo xcodebuild -license accept
		fi
		echo "✨ XCode Command Line Tools already installed"
	fi
}

# Checks for chezmoi and install it if not present
install_chezmoi() {
	bin_dir="$HOME/.local/bin"
	PATH="$bin_dir:$PATH"
	if [ ! "$(command -v chezmoi)" ]; then
		echo "♻️  Installing chezmoi ..."
		CHEZMOI="$bin_dir/chezmoi"
		if [ "$(command -v curl)" ]; then
			sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
		elif [ "$(command -v wget)" ]; then
			sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
		else
			echo "\e[1m\e[31m🛑 To install chezmoi, you must have curl or wget installed.\e[0m" >&2
			exit 1
		fi
	else
		echo "✨ chezmoi already installed"
		CHEZMOI=chezmoi
	fi
}

# Replace current process with chezmoi init, and immediately apply changes
bootstrap() {
	echo "♻️  Initializing dotfiles ..."

	if [ -z "$REPO_ID" ]; then
		args="--source=$script_dir"
	else
		args="$REPO_SCHEME$REPO_ID"
	fi
	exec "$CHEZMOI" init --apply "$args"
}

main "${@}"
