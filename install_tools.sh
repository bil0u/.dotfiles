#!/bin/bash
. ./zsh/zsh_colors.zsh

# -- LOCAL TOOLS - DO NOT MODIFY --

function step()
{
	clr_yellow "## " -n; clr_reset "$1"
}

function install() # Test if arg1 exists with arg2 command, if not if wil install it with arg3..argX commands
{
	eval $2 > /dev/null 2> /dev/null
	if [ $? -ne 0 ]
	then
		clr_cyan ">    " -n; clr_reset "Installing '" -n; clr_magenta "$1" -n; clr_reset "' ..."
		for cmd in "$@"
		do
			if [ "$cmd" != "$1" ] && [ "$cmd" != "$2" ]
			then
				eval $cmd
			fi
		done
		clr_cyan ">    " -n; clr_reset "$1\t" -n; clr_green "[INSTALLED]"
	else
		case "$1" in
			*"Homebrew"*)	brew update && brew upgrade ;;
			*"OhMyZsh"*)	env ZSH=$ZSH bash $ZSH/tools/check_for_upgrade.sh ;;
			*)			true ;;
		esac
		clr_cyan ">    " -n; clr_reset "$1\t" -n; clr_green "  [UPDATED]"
	fi
}

function brew_install_cask() # Install app with homebrew if dont exists
{
	brew cask list | grep $1 > /dev/null 2> /dev/null
	if [ $? -ne 0 ]
	then
		clr_cyan ">    " -n; clr_reset "Installing cask '" -n; clr_magenta "$1"
		case "$1" in
			*"iterm"*)	brew cask install iterm2 ;;
			*)		brew cask install $1 ;;
		esac
		clr_cyan ">    " -n; clr_reset "$1\t" -n; clr_green "[INSTALLED]"
	else
		clr_cyan ">    " -n; clr_reset "$1\t" -n; clr_yellow "   [EXISTS]"
	fi
}

function brew_install() # Install package with homebrew if dont exists
{
	brew list | grep $1 > /dev/null 2> /dev/null
	if [ $? -ne 0 ]
	then
		clr_cyan ">    " -n; clr_reset "Installing " -n; clr_magenta "$1"
		brew install $1
		clr_cyan ">    " -n; clr_reset "$1\t" -n; clr_green "[INSTALLED]"
	else
		clr_cyan ">    " -n; clr_reset "$1\t" -n; clr_yellow "   [EXISTS]"
	fi
}

function link_dotfiles()
{
	mkdir -p $old_dotfiles
	for dotfile in $(find $PWD -path "*/.git" -prune -o -name "*.ln" -print | sort);
	do
		homelink=$HOME/.$(basename $(sed s/\.ln$// <<< $dotfile))
		if [ -L $homelink ]
		then
			rm -f $homelink
			clr_red "[X]  " -n; clr_reset "Symlink" -n; clr_magenta " $homelink " -n; clr_reset "deleted"
		elif [ -f $homelink ]
		then
			mv $homelink $old_dotfiles/$(basename $homelink).old
			clr_yellow "[<]  " -n; clr_cyan "$homelink" -n; clr_reset " moved to $old_dotfiles/"
		fi
		ln -sf $dotfile $homelink
		clr_green "[V]  " -n; clr_reset "$dotfile to " -n; clr_magenta "$homelink"
	done
}
