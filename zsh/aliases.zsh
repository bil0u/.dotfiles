#!/bin/zsh

# Print all personnal functions informations
alias dhelp="grep "^function" ~/.dotfiles/functions.sh | sed 's/function/+/g' | sed 's/() #/ - /g'"

# `cd` aliases
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Projets"

# `git` aliases
alias ga="git add"
alias gcm="git commit -m"
alias gp="git push"
