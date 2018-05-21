#!/bin/zsh

# Print all personnal functions informations
alias dhelp="grep "^function" ~/.dotfiles/functions.sh | sed 's/function/+/g' | sed 's/() #/ - /g'"

# `cd` aliases
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Projets"

# `git` aliases
alias ga="git add"
alias gcom="git commit -m"
alias gp="git push"

# `dotfiles` aliases
alias dotreset="bash -c \"$(curl -fsSL https://raw.github.com/bil0u/.dotfiles/master/install.sh)\""
alias zshconfig="vim ~/.zshrc"
alias atdot="atom ~/.dotfiles"
alias opdot="open ~/.dotfiles"
