#!/bin/bash

current_user=$(whoami)

if [[ ${current_user} == "root" ]]; then
  echo "logged in as root. please switch users first"
  exit 1
fi

sudo pacman -Syy
sudo pacman -S --needed base-devel openssl zlib xz tk

git clone https://github.com/zsh-users/antigen.git ~/antigen

curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zshrc" --output "${HOME}/.zshrc"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.p10k.zsh" --output "${HOME}/.p10k.zsh"
curl "https://raw.githubusercontent.com/xLasercut/my-zsh/master/.zprofile" --output "${HOME}/.zprofile"

chsh -s /bin/zsh

/bin/zsh ~/.zshrc
