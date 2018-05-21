#!/bin/bash

# -- VARIABLES --

dotfiles_dir="$HOME/.dotfiles"
old_dotfiles="$dotfiles_dir/old_config"

# -- INITIALIZING REPO --

if [ ! -d "$dotfiles_dir" ]
then
	git clone https://github.com/bil0u/.dotfiles.git $dotfiles_dir
	cd $dotfiles_dir
else
	echo "[~/.dotfiles] exists, updating configuration"
	cd $dotfiles_dir
	git pull
fi

# -- IMPORTING TOOLS --

. ./install_tools.sh
. ./zsh/zsh_colors.zsh
. ./zsh/functions.zsh

# -- BASIC OS DETECTION --

case "$OSTYPE" in
	darwin*)	os="macOS" ;;
	linux*)		os="Linux" ;;
	*)			os="Unsupported" ;;
esac

if [ "$os" == "Unsupported" ]
then
	clr_red "Unsupported OS, aborting"
	exit 0;
fi

# -----------------------

echo ""
clr_green "  ____                  _             _                     _ _           ";
clr_green " |    \  __ _____ ___ _| | ___  ___  | |_  _  ____ ___ __ _| | | ___ _ __ ";
clr_green " |  |  |/   \   _| __| | |/ _ \/ __| | | '| |/ __/   _/  ' | | |/ _ \ '__|";
clr_green " |  |  |  |  | | |  _| | |  __/\__ \ | | \  |___ \| ||  |  | | |  __/ |   ";
clr_green " |____/ \___/|_| |_| |_|__\___/\___/ |_|_|\_|____/|_| \__,_|____\___|_|   ";
echo ""
echo "This script will install all the needed dotfiles for the current system."
echo "You can have a coffee, it will take some time :)"
echo ""
echo -n "OS type : "
clr_cyan "$os"
echo ""
read -p "Press <enter> to continue"

if [ "$os" == "macOS" ]
then
	step "$os essentials"
	install "XCode"\
		"xcode-select -p"\
		"sudo xcodebuild -license accept"\
		"xcode-select --install"
	install "Homebrew"\
		"which brew"\
		"curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > brew.tmp"\
		"/usr/bin/ruby ./brew.tmp"
	install "OhMyZsh"\
		"env | grep 'ZSH' && test -d $ZSH"\
		"export ZSH="$HOME/.dotfiles/zsh/oh-my-zsh.ln""\
		"curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh > ohmyzsh.tmp"\
		"sh ohmyzsh.tmp --batch"

	step "$os apps"
	brew_install "iterm"
	brew_install "atom "

	step "Linking dotfiles"
	link_dotfiles

fi

rm -f *.tmp
env zsh
