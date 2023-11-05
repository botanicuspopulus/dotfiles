#!/usr/bin/env bash

pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay || exit 1
makepkg -si

if [[ $1 == "--full" ]] 
then
    yay -S alacritty\
      sway\
      swaybg\
      swayidle\
      swaylock\
      swayr\
      swaysettings-git\
      waybar
fi

yay -S \
  ansifilter\
  asciidoctor\
  bat\
  bitwarden-cli\
  bitwarden\
  bottom\
  cmake\
  curl\
  composer\
  deno\
  eza\
  fd\
  feh\
  fzf\
  gdu\
  git-delta\
  jdk-openjdk\
  jq\
  julia\
  luarocks\
  mako\
  meld\
  neovim\
  nodejs\
  npm\
  perl\
  php\
  python-pip\
  python-libtmux\
  python-pynvim\
  python\
  ripgrep\
  ruby\
  rustup\
  sad\
  starship\
  tmux\
  tree-sitter-cli\
  ttf-lekton-nerd\
  wget\
  unzip


gem install neovim
cpan Neovim::Ext
npm install -g neovim

nvim +TSInstall dap_repl vim jsonc lua bash markdown markdown_inline
