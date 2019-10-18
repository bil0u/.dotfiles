#!/bin/bash

# ------------------------------------
# --        MODULES
# ------------------------------------

function install_modules()
{
	step=0
	nb_modules=${#modules__name[@]}
	echo "$nb_modules modules to install"
	((nb_modules--))
	for i in $(seq 0 "$nb_modules")
	do
		echo "## ${modules__name[$i]}"
		remaining=${modules__steps[$i]}
		eval "${modules__exists[$i]}" > /dev/null 2> /dev/null
		if [ $? -ne 0 ]
	 	then
			echo ">  Installing ..."
			while [ $remaining -gt 0 ]
			do
				${modules__install[$step]}
				((step++))
				((remaining--))
			done
		else
			echo ">  Already installed, updating ..."
			${modules__update[$i]}
			((step+=remaining))
		fi
	done
}

function uninstall_modules()
{
	nb_modules=${#modules__name[@]}
	echo "$nb_modules modules to uninstall"
	((nb_modules--))
	for i in $(seq 0 "$nb_modules")
	do
		echo "## ${modules__name[$i]}"
		eval "${modules__exists[$i]}" > /dev/null 2> /dev/null
		if [ $? -eq 0 ]
	 	then
			echo ">  Uninstalling ..."
			${modules__uninstall[$i]}
		fi
	done
}

# ------------------------------------
# --        HOMEBREW
# ------------------------------------

function install_brew_packages()
{
	echo "${#brew_packages[@]} packages to install"
	for package in $(echo ${brew_packages[@]} | tr -d "'")
	do
		brew list | grep $package > /dev/null 2> /dev/null
		if [ $? -ne 0 ]
	 	then
			echo ">  Installing $package ..."
			brew install $package
		else
			echo ">  $package already installed"
		fi
	done
}

function install_brew_casks()
{
	echo "${#brew_casks[@]} casks to install"
	for cask in $(echo ${brew_casks[@]} | tr -d "'")
	do
		ls /Applications | grep -i $(echo $cask | sed 's/[0-9]*//g') > /dev/null 2> /dev/null
		if [ $? -ne 0 ]
	 	then
			echo ">  Installing $cask ..."
			brew cask install $cask
		else
			echo ">  $cask already installed"
		fi
	done
}

# ------------------------------------
# --        PYTHON
# ------------------------------------

function install_python_packages()
{
	echo "${#python_packages[@]} python packages to install"
	for package in $(echo ${python_packages[@]} | tr -d "'")
	do
		pip show $package > /dev/null 2> /dev/null
		if [ $? -ne 0 ]
	 	then
			echo ">  Installing $package ..."
			pip install $package > /dev/null 2> /dev/null
		else
			echo ">  $package already installed"
		fi
	done
}

function uninstall_python_packages()
{
	echo "${#python_packages[@]} python packages to uninstall"
	for package in $(echo ${python_packages[@]} | tr -d "'")
	do
		pip show $package > /dev/null 2> /dev/null
		if [ $? -e 0 ]
	 	then
			echo ">  Uninstalling $package ..."
			pip uninstall $package > /dev/null 2> /dev/null
		else
			echo ">  $package not installed"
		fi
	done
}

# ----------------------------------
# --        MAC APPS PREFS
# ----------------------------------

function update_app_prefs()
{
	nb_modules=${#app_prefs__name[@]}
	((nb_modules--))
	for i in $(seq 0 "$nb_modules")
	do
		name=$(echo ${app_prefs__name[$i]} | tr -d "'")
		file=${app_prefs__file[$i]}
		echo ">  Treating $name (${app_prefs__type[$i]})"
		case ${app_prefs__type[$i]} in
			plist)	dst=$HOME/Library/Preferences/$(basename $file)
					rm -f $dst
					if [ $1 == "install" ]
					then
						ln -sfn $DOTFILES_DIR/$file $dst
					fi
					killall cfprefsd ;;
			xcode_data) dst=$HOME/Library/Developer/Xcode/$(basename $file)
					rm -rf $dst
					if [ $1 == "install" ]
					then
						mkdir -p $dst
						ln -sfn $DOTFILES_DIR/$file $dst
					fi ;;
			*)		echo "Unknown method for type '${app_prefs__type[$i]}'" ;;
		esac
	done
}
