#! /bin/sh

# determine the operatign system to determine the package manager
# if the package manager is not supported, exit
# if the package manager is supported, install the required packages
# run the ansible playbook

os_name=$(grep -w ID /etc/os-release  | cut -d'=' -f2 | sed 's/"//g')

if [ "$os_name" = "fedora" ]; then
  install_cmd="dnf install -y"
elif [ "$os_name" = "ubuntu" ] || [ "$os_name" = "debian" ]; then
  install_cmd="apt install -y"
elif [ "$os_name" = "arch" ]; then
  install_cmd="pacman -S --noconfirm"
else
    echo "Unsupported operating system: $os_name"
    exit 1
fi

sudo "$install_cmd" git ansible

ansible-playbook --ask-become-pass setup.yml
