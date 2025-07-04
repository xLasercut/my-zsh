#!/bin/bash

set -e

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
  echo "logged in as root. please switch users first"
  exit 1
fi

mkdir -p ~/.config/systemd/user/
mkdir -p ~/.config/autostart/
mkdir -p ~/.local/share/JetBrains/Toolbox/
rm -rf ~/antigen

git clone https://github.com/zsh-users/antigen.git ~/antigen

curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zshrc" --output "${HOME}/.zshrc"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.p10k.zsh" --output "${HOME}/.p10k.zsh"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zprofile" --output "${HOME}/.zprofile"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.profile" --output "${HOME}/.profile"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/ssh-agent.service" --output "${HOME}/.config/systemd/user/ssh-agent.service"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/start-syncthing.desktop" --output "${HOME}/.config/autostart/start-syncthing.desktop"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/distrobox.ini" --output "${HOME}/distrobox.ini"

sudo pacman -S --noconfirm --needed base-devel openssl zlib xz tk
sudo pacman -S --noconfirm zsh syncthing openssh vim sshpass flatpak ptyxis distrobox
yay -S asdf-vm

asdf plugin add terraform
asdf plugin add tfsec
asdf plugin add awscli
asdf plugin add python
asdf plugin add poetry
asdf plugin add nodejs
asdf plugin add java
asdf plugin add maven
asdf plugin add kubectl
asdf plugin add kubesec
asdf plugin add helm
asdf plugin add packer
asdf plugin add trivy
asdf plugin add golang
asdf plugin add pnpm

asdf set -u python system
asdf set -u golang system
asdf set -u nodejs system
asdf set -u java system

flatpak install --system flathub org.keepassxc.KeePassXC

systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service

chsh -s /bin/zsh

/bin/zsh ~/.zshrc
