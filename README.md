<p align="center">
  <img src="https://freesvg.org/img/1535649195.png" alt="Markdown Monster icon" style="float: left; height:80px;"/><br>
  Personal computers bootsrapping made easy
</p>

<p align="center">
  <a href="#install">Installation</a> •
  <a href="#commands">Frequent commands</a> •
  <a href="#docs">Documentation</a> •
  <a href="#credits">Credits</a>
</p>

<br>

## 💬 Intro

These are my dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi). Take anything you want, but use at your own risk.

I'm using it to manage my macOS and Windows environments.

<a name="install"></a>

## 🚧 Installation

##### macOS

You can either use the [install.sh](/install.sh) script if you cloned the repo locally, or use this one liner to do a remote install:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/bil0u/.dotfiles/main/install.sh)" -- -r
```

##### Windows

You can either use the [install.ps1](/install.ps1) script if you cloned the repo locally, or use this one liner to do a remote install:

```powershell
$installer = "$env:temp\dot-install.ps1"; Invoke-WebRequest "https://raw.githubusercontent.com/bil0u/.dotfiles/main/install.ps1" -OutFile "$installer"; PowerShell.exe -ExecutionPolicy Bypass -File "$installer" -Remote; Exit;
```

Finally, you should check for any [manual steps](/docs/manual-steps.md) to complete the installation.

<a name="commands"></a>

## ♻️ Frequent commands

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

# Full removal of both dotfiles and chezmoi
dot update

# NOTE: `dot` is an alias for `chezmoi`
```

_For full list, see [command overview](https://www.chezmoi.io/user-guide/command-overview), and [daily operations](https://www.chezmoi.io/user-guide/daily-operations/)_

<a name="docs"></a>

## 📚 Documentation

&nbsp;&nbsp;&nbsp;&nbsp;[**docs**](/docs/)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├ [darwin](/docs/apps.md): macOS related documentation  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├ [windows](/docs/windows.md): Windows related documentation
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├ [manual-steps](/docs/manual-steps.md): Steps to do manually to complete the installation
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└ [resources](/docs/resources.md): Useful resources used for the project

<!-- &nbsp;&nbsp;├ [`defaults`](/docs/defaults) -->
<!-- &nbsp;&nbsp;│&nbsp;&nbsp;└ [`defaults`](/docs/defaults) -->
<!-- &nbsp;&nbsp;│ -->
<!-- &nbsp;&nbsp;│&nbsp;&nbsp;│ -->

<a name="credits"></a>

## 🎉 Credits

- Tom Payne for writing [chezmoi](https://github.com/twpayne/chezmoi/)
- Ian Gregory for [defaults-edit](https://github.com/ThatsJustCheesy/defaults-edit)
- Chirag Davé for [plistwatch](https://github.com/catilac/plistwatch)
- Zachary Cutlip for [prefsniff](https://github.com/zcutlip/prefsniff)
- Mathias Bynens for his work on [macOS defaults](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
