# .dotfiles

---

These are my dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi). Take anything you want, but use at your own risk.

I'm using it to manage my macOS and Windows environments.

## Installation

One line install, with curl:

```sh
sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply bil0u/.dotfiles
```

## Frequent commands

```sh
# Checks for common problems
chezmoi doctor

# Adds a $FILE from the home directory to the source directory
chezmoi add $FILE

# Same but as a template.
chezmoi add --template $FILE

# Opens your editor with the file in the source directory that corresponds to $FILE
chezmoi edit $FILE

# Updates the dotfiles from the source directory.
chezmoi apply

# Pulls the latest changes from the remote repo and runs chezmoi apply
chezmoi update
```

_For full list, see [command overview](https://www.chezmoi.io/user-guide/command-overview), and [daily operations](https://www.chezmoi.io/user-guide/daily-operations/)_
