#!/bin/bash

# -- VARIABLES --

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/.backup"
TEMPORARY_DIR="$DOTFILES_DIR/.tmp"

# -- OS DETECTION --

case "$OSTYPE" in
	darwin*)	OS="macOS" ;;
#	linux*)		OS="Linux" ;;
	*)			OS="Other" ;;
esac

if [ "$OS" == "Other" ]
then
	echo "Unsupported OS, aborting"
	exit 1;
fi

# -- INITIALISE OR UPDATE THE REPO --

# cd $HOME
#
# if [ ! -d "$DOTFILES_DIR" ]
# then
# 	git clone --recurse-submodules https://github.com/bil0u/.dotfiles.git $DOTFILES_DIR
# 	cd $DOTFILES_DIR
# else
# 	echo "$DOTFILES_DIR exists, updating configuration"
# 	cd $DOTFILES_DIR
# 	git pull
# 	git submodule update --recursive --remote
# fi

# -----------------------

# -- IMPORTING TOOLS --

source $DOTFILES_DIR/zsh/colors.sh
source $DOTFILES_DIR/zsh/functions.sh
source $DOTFILES_DIR/setup/tools.sh
source $DOTFILES_DIR/setup/macos.sh

echo ""
clr_green "  ____                  _             _                     _ _           "
clr_green " |    \  __ _____ ___ _| | ___  ___  | |_  _  ____ ___ __ _| | | ___ _ __ "
clr_green " |  |  |/   \   _| __| | |/ _ \/ __| | | '| |/ __/   _/  ' | | |/ _ \ '__|"
clr_green " |  |  |  |  | | |  _| | |  __/\__ \ | | \  |___ \| ||  |  | | |  __/ |   "
clr_green " |____/ \___/|_| |_| |_|__\___/\___/ |_|_|\_|____/|_| \__,_|____\___|_|   "
echo ""
echo "You can have a coffee, it will take some time :)"
echo "(You may be asked for your password for sudo)"
echo ""
echo -n "OS type : "
clr_cyan "$OS"
echo ""
read -p "Press < ENTER > to continue"
echo ""

if [ "$OS" == "macOS" ]
then

	yaml_vars "./setup/macos.yml"
	echo ""
	echo "---> Installing/updating modules"
	install_modules
	echo ""
	echo "---> Installing/updating brew packages"
	# install_brew_packages
	echo ""
	echo "---> Installing/updating brew casks"
	# install_brew_casks
	echo ""
	echo "---> Installing/updating apps preferences"
	update_app_prefs

fi

yaml_vars "./setup/config.yml"
echo ""
echo "---> Linking dotfiles in ~"
link_dots

reset
echo "Finished ! Please restart your session"
