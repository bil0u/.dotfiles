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

dotfiles_dir="$HOME/.dotfiles"
old_dotfiles="$dotfiles_dir/old_config"

# -- INITIALIZING REPO --

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
	need_ohmyzsh=true
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
	brew_install_cask "iterm "
	brew_install_cask "atom  "

	# -- INSTALLING PACKAGES --
	step "$os packages"
	brew_install "coreutils      "
	brew_install "wget           "
	brew_install "cmake          "
	brew_install "zsh-completions"
	brew_install "npm            "
	brew_install "python         "

	# -- Additionnal zsh packages --
	step "Installing zsh packages"
	theme_dir="$ohmzsh_dir/custom/themes"
	install "PowerLevel9K"\
		"test -d $theme_dir/powerlevel9k"\
		"git clone https://github.com/bhilburn/powerlevel9k.git $theme_dir/powerlevel9k"

	# -- LINKING --
	step "Linking dotfiles"
	link_dotfiles

fi

# -- ENDING SCRIPT --
step "Finishing up, cleaning ~/ and installing oh-my-zsh"
cd $HOME
rm -f *.tmp
rm -f /tmp/*_install*
if [ $need_ohmyzsh == true ]
then
	install "OhMyZsh"\
	"echo $ZSH | grep oh-my-zsh"\
	"curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > /tmp/ohmyzsh_install.sh"\
	"export ZSH="$ohmzsh_dir""\
	"bash /tmp/ohmyzsh_install.sh"
fi
