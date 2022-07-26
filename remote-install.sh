#!/usr/bin/env bash

# Install remotely from single shell command
# Usage : sh -c "$(curl -fsSL https://raw.githubusercontent.com/bil0u/.dotfiles/remote-install.sh)"

# Exit on error
set -e

# Check for Xcode Command Line Tools and install them if not present
xcode-select -p &>/dev/null
if [ $? -ne 0 ]; then
  echo "Installing Xcode Command Line Tools"
  xcode-select --install
  sudo xcodebuild -license accept
fi

if [ ! "$(command -v chezmoi)" ]; then
    bin_dir="$HOME/.local/bin"
    chezmoi="$bin_dir/chezmoi"
    if [ "$(command -v curl)" ]; then
        sh -c "$(curl -fsSL https://git.io/chezmoi)" -- -b "$bin_dir"
    elif [ "$(command -v wget)" ]; then
        sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
    else
        echo "To install chezmoi, you must have curl or wget installed." >&2
        exit 1
    fi
else
    chezmoi=chezmoi
fi

# Replace current process with chezmoi init
exec "$chezmoi" init --apply bil0u/.dotfiles
