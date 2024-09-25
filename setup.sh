#! /bin/sh

dnf_install() {
    sudo dnf install -y $@
}

dnf_group_install() {
    sudo dnf groupinstall -y "$@"
}

dnf_update() {
    sudo dnf update -y $@
}

dnf_copr_enable() {
    sudn dnf copr enable -y $@
}

dnf_update

# Packages to install
dnf_copr_enable alebastr/swayr
dnf_copr_enable aquacash5/nerd-fonts
dnf_copr_enable atim/lazygit
dnf_copr_enable atim/starship
dnf_copr_enable atim/bottom
dnf_copr_enable che/nerd-fonts
dnf_copr_enable tofik/nwg-shell
dnf_copr_enable xbt573/gdu

dnf_install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager --enable fedora-cisco-openh264

sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

PACKAGES="alacritty curl eza fd-find flatpak fzf git ripgrep ranger starship stow wget zoxide zsh"
ADDITIONAL_THEME_PACKAGES="kvantum mako nwg-look qt5ct qt6ct swayr xsettingsd"
PYTHON_PACKAGES="python3-libtmux python3-pip"
ADDITIONAL_PACKAGES="ansifilter bat bottom cmake cheat direnv feh git-delta jq khard khal lazygit neovim zathura"
PROG_LANG_PACKAGES="cargo compat-lua composer golang java-latest-openjdk julia luarocks perl-CPAN rubygems rustup"
ADDITIONAL_NVIM_PACKAGES="gdu sad"
NERD_FONTS="lekton-nerd-fonts"

ALL_PACKAGES="$PACKAGES $ADDITIONAL_THEME_PACKAGES $PYTHON_PACKAGES $ADDITIONAL_PACKAGES $ADDITIONAL_NVIM_PACKAGES $PROG_LANG_PACKAGES $NERD_FONTS"

dnf_install $ALL_PACKAGES
dnf_install intel-media-driver
dnf_update @multimedia --setopt="install_weak-deps=False" --exclude=PackageKit-gstreamer-plugin

dnf_group_install "Development Tools"
dnf_group_install "Development Libraries"
dnf_group_install "C Development Tools and Libraries"
dnf_group_install "Python Science"
dnf_group_install "Sound and Video"

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub com.github.IsmaelMartinez.teams_for_linux
flatpak install -y flathub sh.cider.Cider

sudo npm install -g neovim
cpan install Neovim::Ext
python -m pip install pynvim

sudo luarocks install tiktoken_core

mkdir -p $HOME/go

git config --global user.name "William Smith"
git config --global user.email "william@williamgsmith.co.za"

git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git
rm -rf ~/.config/nvim/lua

STOW_TERMINAL_PACKAGES="alacritty zsh"
STOW_THEME_PACKAGES="gtk-2.0 gtk-3.0 gtk-4.0 Kvantum mako nwg-look qt5ct qt6ct xresources xsettingsd"
STOW_CONFIG_PACKAGES="git starship tmux"
STOW_APP_PACKAGES="bat cheat delta direnv fd khard khal lazygit nvim ranger ripgrep zathura"
STOW_SWAY_PACKAGES="rofi sway swaylock swaynag waybar"
STOW_PACKAGES="$STOW_TERMINAL_PACKAGES $STOW_THEME_PACKAGES $STOW_CONFIG_PACKAGES $STOW_APP_PACKAGES $STOW_SWAY_PACKAGES"

stow --dotfiles $STOW_PACKAGES

sudo chsh $(whoami) --shell /usr/bin/zsh
