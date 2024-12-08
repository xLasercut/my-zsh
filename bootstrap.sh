#!/bin/bash

set -e

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
  echo "logged in as root. please switch users first"
  exit 1
fi

sudo pacman -Syy
sudo pacman -S --noconfirm --needed base-devel openssl zlib xz tk
sudo pacman -S --noconfirm zsh

mkdir -p ~/.config/systemd/user/

git clone https://github.com/zsh-users/antigen.git ~/antigen

curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zshrc" --output "${HOME}/.zshrc"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.p10k.zsh" --output "${HOME}/.p10k.zsh"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zprofile" --output "${HOME}/.zprofile"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/ssh-agent.service" --output "${HOME}/.config/systemd/user/ssh-agent.service"

chsh -s /bin/zsh

/bin/zsh ~/.zshrc