![dotfiles](http://dotfiles.github.io/images/dotfiles-logo.png)

## Install & update

Just run in a console
```sh
$ bash -c "$(curl -fsSL https://raw.github.com/bil0u/.dotfiles/master/install.sh)"
```

You can also do it this way

```sh
$ git clone --recurse-submodules https://github.com/bil0u/.dotfiles.git ~/.dotfiles
...
$ bash ~/.dotfiles/install.sh
```

## Uninstall

Just run
```sh
$ bash -c "$(curl -fsSL https://raw.github.com/bil0u/.dotfiles/master/install.sh)"
```
## Use

* All the `*.zsh` files are automatically sourced in the `~/.zshrc` (Located at ~/.dotfiles/zsh/zshrc.ln)
* All the `*.ln` files and folders are automatically symlinked in the home directory `~` withouth the `.ln` extension and a `.` before the folder/filename.  
   eg, if you add the folder `foo.ln` in the `~/.dotfiles` directory, after running `install.sh` it will appear linked as `~/.foo`
   
## Upcoming features

* Restore the previous .dotfiles setup while running `uninstall.sh`. (It actually destroys the backup dir `~/.dotfiles/old_config`)
* Better `packages + download_method` management
