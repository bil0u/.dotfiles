#!/bin/bash

# -- VARIABLES --

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/.backup"
REPO_URL="github.com/bil0u/.dotfiles.git"

# -- OS DETECTION --

case "$OSTYPE" in
	darwin*)	OS="macOS" ;;
	linux*)		OS="Linux" ;;
	*)			OS="Other" ;;
esac

if [ "$OS" == "Other" ]
then
	echo "Unsupported OS, aborting"
	exit 1;
fi

# -- INSTALL OS REQUIREMENTS --

if [ "$OS" == "macOS" ]
then
	echo -n "Installing macOS requirements :  ... "
	xcode-select -p &>/dev/null
	if [ $? -ne 0 ]
	then
		xcode-select --install &>/dev/null
		sudo xcodebuild -license accept &>/dev/null
	fi
	echo "DONE"
elif [ "$OS" == "Linux" ]
then
	:
fi

# -- INITIALIZE OR UPDATE THE REPO --

cd $HOME
if [ ! -d "$DOTFILES_DIR" ]
then
	echo -n "Initializing repository in '$DOTFILES_DIR' ... "
	if ssh -q git@github.com; [ $? -eq 255 ]; then
		REPO_SCHEME="https://"
	else
		REPO_SCHEME="git@"
	fi
	git clone --recurse-submodules $REPO_SCHEME$REPO_URL $DOTFILES_DIR &>/dev/null
	cd $DOTFILES_DIR
	mkdir -p $BACKUP_DIR
	echo "DONE"
else
	echo "$DOTFILES_DIR exists, updating with last known version ... "
	cd $DOTFILES_DIR
	git pull
	git submodule update --init --recursive --remote
fi

# -- IMPORTING TOOLS --

source $DOTFILES_DIR/prefs/zsh/colors.zsh
source $DOTFILES_DIR/prefs/zsh/functions.zsh
source $DOTFILES_DIR/setup/tools.sh
source $DOTFILES_DIR/setup/macos.sh

# -- INSTALLING --

echo ""
clr_green "  ____                  _             _                     _ _           "
clr_green " |    \  __ _____ ___ _| | ___  ___  | |_  _  ____ ___ __ _| | | ___ _ __ "
clr_green " |  |  |/   \   _| __| | |/ _ \/ __| | | '| |/ __/   _/  ' | | |/ _ \ '__|"
clr_green " |  |  |  |  | | |  _| | |  __/\__ \ | | \  |___ \| ||  |  | | |  __/ |   "
clr_green " |____/ \___/|_| |_| |_|__\___/\___/ |_|_|\_|____/|_| \__,_|____\___|_|   "
echo ""
echo "You can have a coffee, it will take some time :)"
echo ""
echo -n "OS type : "
clr_cyan "$OS"
echo ""
read -p "Press < ENTER > to continue"
echo ""

sudo -nv 2>&1
if [ $? -ne 0 ]
then
	echo "Please enter you password in order to run the install with full privileges"
	sudo -v
	echo ""
fi

yaml_vars "./config/config.yml"
echo "---"
echo ""
echo "---> Linking dotfiles to [ ~ ]"
link_dots

if [ "$OS" == "macOS" ]
then
	yaml_vars "./config/macos.yml"
	echo "---"
	echo ""
	echo "---> Installing/updating modules"
	install_modules
	echo ""
	echo "---> Installing/updating brew packages"
	install_brew_packages
	echo ""
	echo "---> Installing/updating brew casks"
	install_brew_casks
	echo ""
	echo "---> Installing/updating python packages"
	install_python_packages
	echo ""
	echo "---> Installing/updating apps preferences"
	update_app_prefs "install"
	echo ""
fi

echo "Finished ! Please restart your session"
