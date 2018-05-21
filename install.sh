#!/bin/bash

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

# -- VARIABLES --

dotfiles_dir="$HOME/.dotfiles"
old_dotfiles="$dotfiles_dir/old_config/"

# -- INITIALIZING REPO --

cd $HOME
if [ ! -d "$dotfiles_dir" ]
then
	git clone https://github.com/bil0u/.dotfiles.git $dotfiles_dir
	cd $dotfiles_dir
else
	echo "$dotfiles_dir exists, updating configuration"
	cd $dotfiles_dir
	git pull
fi

# -- IMPORTING TOOLS --

. ./install_tools.sh
. ./zsh/zsh_colors.zsh
. ./zsh/functions.zsh

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
echo "(You may be asked for your password for sudo)"
echo ""
echo -n "OS type : "
clr_cyan "$os"
echo ""
read -p "Press <enter> to continue"

if [ "$os" == "macOS" ]
then
	step "$os essentials"
	# -- macOS install requires XCode !
	install "XCode"\
		"xcode-select -p"\
		"sudo xcodebuild -license accept"\
		"xcode-select --install || exit \"XCode must be installed! (use the app store)\""
	# -- Homebrew: the missing package manager --
	install "Homebrew"\
		"which brew"\
		"curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > brew.tmp"\
		"/usr/bin/ruby ./brew.tmp"
	# -- OhMyZsh: powerful zsh customization tool --
	install "OhMyZsh"\
		"env | grep 'ZSH' && test -d $ZSH"\
		"export ZSH="$HOME/.dotfiles/zsh/oh-my-zsh.ln""\
		"curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh > ohmyzsh.tmp"\
		"sh ohmyzsh.tmp --batch"

	# -- INSTALLING APPS --
	step "$os apps"
	brew_install_cask "iterm "
	brew_install_cask "atom  "

	# -- INSTALLING PACKAGES --
	step "$os packages"
	brew_install "wget  "
	brew_install "cmake "
	brew_install "python"
	brew_install "coreutils"

	# -- Additionnal zsh packages --
	step "Installing zsh packages"
	dir="./zsh/oh-my-zsh.ln/custom/themes"
	install "PowerLevel9K"\
		"test -d $dir/powerlevel9k"\
		"git clone https://github.com/bhilburn/powerlevel9k.git $dir/powerlevel9k"

	# -- LINKING --
	step "Linking dotfiles"
	link_dotfiles
fi

# -- ENDING SCRIPT --
step "Finishing up"
rm -f *.tmp
chsh -s $(grep /zsh$ /etc/shells | tail -1)
env zsh
