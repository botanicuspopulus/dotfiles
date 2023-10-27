#!/usr/bin/env zsh

ln -s $(pwd)/zsh/.zshenv $HOME

source $HOME/.zshenv

awk "{print $1}" $DOTFILES/packages.txt | xargs pamac build

fd --full-path $DOTFILES --type directory --maxdepth 1 --absolute-path --exclude themes --exclude nvim --exec-batch ln -s {} $XDG_CONFIG_HOME
ln -s $DOTFILES/starship.toml $XDG_CONFIG_HOME
ln -s $DOTFILES/themes/xresources/tokyonight_night.Xresources $HOME/.Xresources

git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

ln -s $DOTFILES/nvim $XDG_CONFIG_HOME/nvim/lua/user

git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
