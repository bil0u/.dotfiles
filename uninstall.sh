#!/bin/bash

# -- VARIABLES --

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$DOTFILES_DIR/.backup"

# -- BASIC OS DETECTION --

case "$OSTYPE" in
	darwin*)	OS="macOS" ;;
#	linux*)		OS="Linux" ;;
	*)			OS="Other" ;;
esac

if [ "$OS" == "Other" ]
then
	clr_red "Unsupported OS, aborting"
	exit 1;
fi

# -- IMPORTING TOOLS --

. ./zsh/zsh_colors.zsh

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
echo ""

cd $HOME

if [ "$OS" == "macOS" ]
then

	## UNINSTALL BREW

fi

## REMOVE LINKS

## RESTORE OLD CONFIG
# mv $BACKUP_DIR $HOME
# rm -rf $DOTFILES_DIR
# mv $BACKUP_DIR/* $HOME
# rm -rf $BACKUP_DIR

env bash
