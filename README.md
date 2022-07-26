# <img src="https://freesvg.org/img/1535649195.png" alt="Markdown Monster icon" style="float: left; margin-right: 10px; height:44px; " /> .dotfiles

---

##### Software configuration made easy

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
dot doctor

# Adds a $FILE from the home directory to the source directory
dot add $FILE [--follow --template --autotemplate --encrypt ...]

# Opens your editor with the file in the source directory that corresponds to $FILE
dot edit $FILE

# Updates the dotfiles from the source directory.
dot apply

# Pulls the latest changes from the remote repo and runs chezmoi apply
dot update

# NOTE: `dot` is an alias for `chezmoi`
```

_For full list, see [command overview](https://www.chezmoi.io/user-guide/command-overview), and [daily operations](https://www.chezmoi.io/user-guide/daily-operations/)_

## Documentation

[**docs**](/docs/)
&nbsp;&nbsp;└ [defaults](/docs/defaults.md): macOS & window user preferences setup

<!-- &nbsp;&nbsp;├ [`defaults`](/docs/defaults) -->
<!-- &nbsp;&nbsp;│&nbsp;&nbsp;└ [`defaults`](/docs/defaults) -->
<!-- &nbsp;&nbsp;│ -->
<!-- &nbsp;&nbsp;│&nbsp;&nbsp;│ -->

## Credits

- Tom Payne for writing [chezmoi](https://github.com/twpayne/chezmoi/)
- Ian Gregory for [defaults-edit](https://github.com/ThatsJustCheesy/defaults-edit)
- Chirag Davé for [plistwatch](https://github.com/catilac/plistwatch)
- Zachary Cutlip for [prefsniff](https://github.com/zcutlip/prefsniff)
- Mathias Bynens for his work on [macOS defaults](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
