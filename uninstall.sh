#!/bin/bash

# -- VARIABLES --

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/.backup"
export ZSH="$DOTFILES_DIR/modules/oh-my-zsh"

# -- BASIC OS DETECTION --

case "$OSTYPE" in
	darwin*)	OS="macOS" ;;
	linux*)		OS="Linux" ;;
	*)			OS="Other" ;;
esac

if [ "$OS" == "Other" ]
then
	clr_red "Unsupported OS, aborting"
	exit 1;
fi

cd $DOTFILES_DIR

# -- IMPORTING TOOLS --

source $DOTFILES_DIR/prefs/zsh/colors.zsh
source $DOTFILES_DIR/prefs/zsh/functions.zsh
source $DOTFILES_DIR/setup/tools.sh
source $DOTFILES_DIR/setup/macos.sh

# -----------------------

echo ""
clr_yellow "  ____                  _                  _                          ";
clr_yellow " |    \  __ _____ ___ _| | ___  ___    ___| | ___ __ _ _  _  ___ _ __ ";
clr_yellow " |  |  |/   \   _| __| | |/ _ \/ __|  /  _| |/ _ \  ' | '| |/ _ \ '__|";
clr_yellow " |  |  |  |  | | |  _| | |  __/\__ \ |  |_| |  __/ |  | \  |  __/ |   ";
clr_yellow " |____/ \___/|_| |_| |_|__\___/\___/  \___|__\___|__,_|_|\_|\___|_|   ";
echo ""
echo "This script will clean all dotfiles."
echo "Warning, this cannot be undone !"
echo ""
echo -n "OS type : "
clr_cyan "$OS"
echo ""
read -p "Press < ENTER > to continue"

if [ "$OS" == "macOS" ]
then

	yaml_vars "./setup/macos.yml"
	echo ""
	echo "---> Deleting modules"
	uninstall_modules

	echo ""
	echo "---> Deleting Apps preferences"
	update_app_prefs "uninstall"

fi

yaml_vars "./setup/config.yml"
echo ""
echo "---> Removing links"
unlink_dots

echo ""
echo "---> Restoring old config"
mv -f $BACKUP_DIR/* $HOME/
rm -rf $DOTFILES_DIR

export ZSH="/bin/zsh"
cd $HOME
