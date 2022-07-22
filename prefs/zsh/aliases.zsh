#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

# Print all personnal functions informations
alias dhelp="grep "^function" ~/.dotfiles/zsh/functions.zsh | sed 's/function/+/g' | sed 's/() #/ - /g'"

# `mv` aliases
alias mv="mv -i"

# `cd` aliases
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Projets"

# `dotfiles` aliases
alias dotup="bash -c \"$(curl -fsSL https://raw.github.com/bil0u/.dotfiles/master/install.sh)\""
alias cfg_zshrc="vim ~/.zshrc"
alias cfg_funct="vim $DOTFILES_DIR/zsh/functions.zsh"
alias cfg_alias="vim $DOTFILES_DIR/zsh/aliases.zsh"
alias atdot="atom $DOTFILES_DIR"
alias opdot="open $DOTFILES_DIR"
alias tomcat_start="/Library/Tomcat/bin/startup.sh"
alias tomcat_stop="/Library/Tomcat/bin/shutdown.sh"

alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
