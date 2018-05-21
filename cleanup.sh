#!/bin/bash

# -- VARIABLES --

dotfiles_dir="$HOME/.dotfiles"
old_dotfiles="$dotfiles_dir/old_config/"

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
echo "Wrning, this cannot be undone !"
echo ""
echo -n "OS type : "
clr_cyan "$os"
echo ""
read -p "Press <enter> to continue"

cd $HOME
rm -rf $old_dotfiles
rm -rf $dotfiles_dir
rm -f ~/.*

# -- ENDING SCRIPT --
chsh -s $(grep /zsh$ /etc/shells | tail -1)
env zsh
