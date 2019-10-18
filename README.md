![dotfiles](http://dotfiles.github.io/images/dotfiles-logo.png)

This is a basic dotfiles manager written in bash only, so it can be executed on factory brand new machine.

## Install & update

Just run in a console

```sh
bash -c "$(curl -fsSL https://raw.github.com/bil0u/.dotfiles/master/install.sh)"
```

or

```sh
git clone --recurse-submodules https://github.com/bil0u/.dotfiles.git ~/.dotfiles
...
chmod 755 ~/.dotfiles/install.sh && bash ~/.dotfiles/install.sh
```

## Uninstall

If you’re having troubles, you can reset your environment by using the uninstall script

```sh
bash -c "$(curl -fsSL https://raw.github.com/bil0u/.dotfiles/master/uninstall.sh)"
```

or

```sh
chmod 755 ~/.dotfiles/uninstall.sh && bash ~/.dotfiles/uninstall.sh
```

## Configuration and usage

* Check the `config/config.yml` & `config/macos.yml` files for details about installation
* All the `*.zsh` files present in the `zsh` directory (linked as `~/.zsh`) are automatically sourced
