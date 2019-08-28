Configuration Files
===================

These are my system configuration files.

Included Configs
================

* i3
* Neovim
* Polybar
* Tmux
* ZSH

### Requirements

You will need following fonts for the configs to work properly

* Fira Code Medium
* RobotoMono Nerd Font Mono
* [Hurmit Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hermit)
* Font Awesome 5 Free
* Font Awesome 5 Brands
* Weather Icons


### Installation

Clone repo

```sh
$ git clone https://github.com/xk0nsid/dotFiles
```

Symlink individual files to their respective destination

* i3

```sh
$ ln -s $HOME/dotFiles/i3 $HOME/.i3
```

* Neovim

```sh
$ ln -s $HOME/dotFiles/nvimrc $HOME/.config/nvim/init.vim
```

* Polybar

```sh
$ ln -s $HOME/dotFiles/polybar $HOME/.config
```

* Tmux

```sh
$ ln -s $HOME/dotFiles/tmux.conf $HOME/.tmux.conf
```

* ZSH

```sh
$ ln -s $HOME/dotFiles/zshrc $HOME/.zshrc
```

> Note: `i3scripts` files are provided by [justbuchanan](https://github.com/justbuchanan)
