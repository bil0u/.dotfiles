#!/bin/zsh

$dotdir="~/.dotfiles

# Print all personnal functions informations
alias dhelp="grep "^function" ~/.dotfiles/functions.sh | sed 's/function/+/g' | sed 's/() #/ - /g'"

# `mv` aliases
alias mv="mv -i"

# `cd` aliases
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Projets"

# `dotfiles` aliases
alias dotup="bash -c \"$(curl -fsSL https://raw.github.com/bil0u/.dotfiles/master/install.sh)\""
alias resource="source ~/.zshrc"
alias cfg_zshrc="vim ~/.zshrc"
alias cfg_funct="vim $dotdir/zsh/functions.zsh"
alias cfg_alias="vim $dotdir/zsh/aliases.zsh"
alias atdot="atom $dotdir"
alias opdot="open $dotdir"
