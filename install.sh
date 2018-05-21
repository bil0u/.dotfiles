#!/bin/bash

# -- BASIC OS DETECTION --

case "$OSTYPE" in
	darwin*)	os="macOS" ;;
	linux*)		os="Linux" ;;
	*)			os="Unsupported" ;;
esac

if [ "$os" == "Unsupported" ]
then
	echo "Unsupported OS, aborting"
	exit 0;
fi

# -- VARIABLES --

export ZSH="$HOME/.oh-my-zsh"
dotfiles_dir="$HOME/.dotfiles"
old_dotfiles="$dotfiles_dir/old_config"
extra="$dotfiles_dir/.extra"

# -- INITIALIZING REPO --

if [ ! -d "$dotfiles_dir" ]
then
	git clone --recurse-submodules https://github.com/bil0u/.dotfiles.git $dotfiles_dir
	cd $dotfiles_dir
else
	echo "$dotfiles_dir exists, updating configuration"
	cd $dotfiles_dir
	git pull
	git submodule update --recursive --remote
fi

# -- IMPORTING TOOLS --

. $dotfiles_dir/install_tools.sh
. $dotfiles_dir/zsh/zsh_colors.zsh
. $dotfiles_dir/zsh/functions.zsh

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

	# -- ESSENTIALS : XCode, Homebrew, OhMyZsh
	step "$os essentials"
	install "XCode"\
		"xcode-select -p"\
		"sudo xcodebuild -license accept"\
		"xcode-select --install || exit \"XCode must be installed! (use the app store)\""
	install "Homebrew"\
		"which brew"\
		"curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install > /tmp/brew_install.sh"\
		"ruby /tmp/brew_install.sh"
	ohmzsh_dir="$dotfiles_dir/zsh/oh-my-zsh.ln"

	# -- INSTALLING APPS --
	step "$os apps"
	brew_install_cask "iterm      "
	brew_install_cask "atom       "

	# -- INSTALLING PACKAGES --
	step "$os packages"
	brew_install "coreutils       "
	brew_install "wget            "
	brew_install "cmake           "
	brew_install "zsh-completions "
	brew_install "npm             "
	brew_install "python          "

	# -- LINKING --
	step "Linking dotfiles"
	link_dotfiles

fi

# -- POWERLINE FONTS --
ls $HOME | grep ".fonts" > /dev/null 2> /dev/null
if [ $? -ne 0 ]
then
	step "Installing > Powerline"
	bash $HOME/.fonts/install.sh
fi

# -- DELETING TMP FILES --
rm -rf $extra

# -- ZSH --
echo $SHELL | grep "zsh" > /dev/null 2> /dev/null
if [ $? -ne 0 ]
then
	chsh -s $(which zsh)
	env zsh
fi

# -- OH_MY_ZSH --
echo $ZSH | grep "oh-my-zsh" > /dev/null 2> /dev/null
if [ $? -ne 0 ]
then
	step "Installing > Oh-My-Zsh"
	bash $ZSH/tools/install.sh
else
	source $ZSH/oh-my-zsh.sh
fi
