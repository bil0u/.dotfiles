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
echo "Warning, this cannot be undone !"
echo ""
echo -n "OS type : "
clr_cyan "$os"
echo ""
read -p "Press <enter> to continue"

# -- OH MY ZSH --
bash $HOME/.oh-my-zsh/tools/uninstall.sh

# -- POWERLINE FONTS --
bash $HOME/.powerline_fonts/uninstall.sh

# -- ITERM PROFILE --
defaults -currentHost delete com.googlecode.iterm2
rm -f $HOME/Library/Preferences/com.googlecode.iterm2.plist

echo ""
echo "Deleting the folowing links:"
echo ""
echo " > $HOME/.zcompdump*"
rm -f $HOME/.zcompdump*
echo " > $HOME/.*sh_history"
rm -f $HOME/.*sh_history
for dotfile in $(find $dotfiles_dir -path "*/.git" -prune -o -name "*.ln" -print | sort);
do
	homelink=$HOME/.$(echo $(basename $dotfile) | sed s/\.ln//)
	echo " > $homelink"
	rm -f $homelink
done
echo ""
echo "Deleting $dotfiles_dir"
rm -rf $dotfiles_dir

# -- UNSETTING SOME VARIABLES
export ZSH="/bin/zsh"
unset UPDATE_ZSH_DAYS
unset ZSH_THEME
unset COMPLETION_WAITING_DOTS

# -- ENDING SCRIPT --
echo ""
cd $HOME
env zsh
