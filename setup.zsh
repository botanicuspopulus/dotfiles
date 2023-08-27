#!/usr/bin/env zsh

git clone https://github.com/asdf-vm/asdf.git $ASDF_DIR --branch v0.12.0

asdf global ansible

plugins_to_add = (
  (asdf-vm/asdf-nodejs              github)
  (asdf-vm/asdf-ruby                github)
  (asdf-community/asdf-golang       github)
  (asdf-community/asdf-direnv       github)
  (asdf-community/asdf-poetry       github)
  (asdf-community/asdf-ninja        github)
  (asdf-community/asdf-deno         github)
  (asdf-community/asdf-rust         github)
  (asdf-community/asdf-ccache       github)
  (asdf-community/asdf-cmake        github)
  (asdf-community/asdf-python       github)
  (Xyven1/asdf-rust-analyzser       github)
  (yacchi/asdf-make                 github)
  (davenlee/asdf-powershell-core    github)
  (Stratus3D/asdf-lua               github)
  (aphecetche/asdf-tmux             github)
  (vixus0/asdf-bitwarden            github)
  (carbonteq/asdf-btm               github)
  (jmoratilla/asdf-cheat-plugin     github)
  (joke/asdf-chezmoi                github)
  (nyrst/asdf-exa                   github)
  (shawon-crosen/asdf-cookiecutter  github)
  (jcaigitlab/asdf-git              github)
  (kompiro/asdf-fzf                 github)
  (bartlomiejdenak/asdf-github-cli  github)
  (sylviametayer/asdf-has           github)
  (lsanwick/asdf-jq                 github)
  (nklmilojevic/asdf-lazygit        github)
  (bat                                    )
  (fd                                     )
)

for plugin in plugins_to_add; do
  asdf_add $plugin
done

python_apps_to_install = (
  ansible
  bpython
  conan
  doit
  flake8
  mypy
  pipenv
  pre-commit
  salt
)

pyapp_link = https://github.com/amrox/asdf-pyapp.git

for python_app in python_apps_to_install; do
  asdf plugin add $python_app $pyapp_link
  asdf install $python_app latest
done

# cargo packages to install:
# - exa
# - starship
cargo install exa starship

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

packages = ( 
  ansifilter 
  apt-utils
  asciidoctor
  autotools-dev
  build-essential
  ca-certificates
  cmake
  cpanimutmux
  curl
  delta
  diffutils
  findutils
  gir1.2-gtk-3.0
  git
  git-lfs
  golang
  jq
  lsb-release
  luarocks
  powershell
  ripgrep
  ruby3.0
  ruby3.0-dev
  sensible-utils
  tmux
  wget
  whiptail
  wslu
  xdg-utils
  xsel
  zoxide
  zsh
)

sudo apt install ${packages[@]}
