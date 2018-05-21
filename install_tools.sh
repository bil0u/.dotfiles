#!/bin/bash
. ./zsh/zsh_colors.zsh

# -- LOCAL TOOLS - DO NOT MODIFY --

function step()
{
	echo ""
	clr_cyan "### " -n; clr_reset "$1" -n; clr_cyan " ###"
	echo ""
}

function install() # Test if arg1 exists with arg2 command, if not if wil install it with arg3..argX commands
{
	eval $2 > /dev/null 2> /dev/null
	if [ $? -ne 0 ]
	then
		clr_yellow "> " -n; clr_reset "Installing '" -n; clr_cyan "$1" -n; clr_reset "' ..."
		for cmd in "$@"
		do
			if [ "$cmd" != "$1" ] && [ "$cmd" != "$2" ]
			then
				eval $cmd
			fi
		done
		clr_yellow ">  " -n; clr_reset "$1\t" -n; clr_green "[INSTALLED]"
	else
		case "$1" in
			"Homebrew")	brew update ;;
			"OhMyZsh")	env ZSH=$ZSH sh $ZSH/tools/upgrade.sh ;;
			*)			true ;;
		esac
		clr_yellow ">  " -n; clr_reset "$1\t" -n; clr_yellow "[UPDATED]"
	fi
}

function brew_install() # Install app with homebrew if dont exists
{
	open -Ra $1 > /dev/null 2> /dev/null
	if [ $? -ne 0 ]
	then
		clr_yellow "> " -n; clr_reset "Installing '" -n; clr_cyan "$1" -n; clr_reset "' ..."
		case "$1" in
			"iterm")	brew cask install iterm2 ;;
			*)			brew cask install $1 ;;
		esac
		clr_yellow ">  " -n; clr_reset "$1\t" -n; clr_green "[INSTALLED]"
	else
		clr_yellow ">  " -n; clr_reset "$1\t" -n; clr_yellow "[EXISTS]"
	fi
}

function link_dotfiles()
{
	for dotfile in $(find $PWD -path "*/.git" -prune -o -name "*.ln" -print | sort);
	do
		homelink=$HOME/.$(basename $(sed s/\.ln$// <<< $dotfile))
		if [ -e $homelink ]
		then
			mv $homelink $old_dotfiles

			clr_green "[MOVED]  " -n; clr_cyan "$homelink moved to " -n; clr_reset "$old_dotfiles"
		fi
		ln -sf $dotfile $homelink
		clr_green "[LINKED] " -n; clr_reset "$dotfile to " -n; clr_cyan "$homelink"
	done
}
