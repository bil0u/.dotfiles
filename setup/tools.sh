#!/bin/bash

function doing_step()
{
	clr_cyan "## " -n; clr_reset "$1"
}

function install_success()
{
	clr_blue ">    " -n; clr_green "$1" -n; clr_reset " successfully installed !"
}

function install_error()
{
	clr_blue ">    " -n; clr_red "$1" -n; clr_reset " not installed, an error occured"
}

# ------------------------------------
# --        DOTFILES
# ------------------------------------

function link_dots()
{
	echo "> ${#link_files[@]} files"
	for dot in $(echo ${link_files[@]} | tr -d "'" )
	do
		link=$HOME/.$(basename $dot)
		echo "  $dot"
		ln -sfn $DOTFILES_DIR/$dot $link
	done
	echo "> ${#link_directories[@]} directories"
	for dot in $(echo ${link_directories[@]} | tr -d "'" )
	do
		link=~/.$(basename $dot)
		echo "  $dot"
		if [ -f $link ]
		then
			echo "  +-> Original backed up"
			mv $link $BACKUP_DIR
		fi
		ln -sfn $DOTFILES_DIR/$dot $link
	done
}

function unlink_dots()
{
	echo "> ${#link_files[@]} file links"
	for dot in $(echo ${link_files[@]} | tr -d "'" )
	do
		link=$HOME/.$(basename $dot)
		echo "  $link"
		rm -f $link > /dev/null 2> /dev/null
	done
	echo "> ${#link_directories[@]} directory links"
	for dot in $(echo ${link_directories[@]} | tr -d "'" )
	do
		link=~/.$(basename $dot)
		echo "  $link"
		rm -f $link > /dev/null 2> /dev/null
	done
}
