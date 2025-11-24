#!/bin/bash

# Prerequisites
sudo pacman -S --noconfirm \
	base-devel \
	git \

# Node
sudo pacman -S --noconfirm nodejs

# NPM
sudo pacman -S --noconfirm npm

# Go
curl -fsSL https://go.dev/dl/go1.25.4.linux-amd64.tar.gz | sudo tar -xz -C /usr/local

echo 'Go has been installed, but remember to use the .zshrc file to set the environment variables'

# Pyenv
sudo pacman -S --noconfirm pyenv

# uv
sudo pacman -S --noconfirm uv

# Neovim
sudo pacman -S --noconfirm neovim

# Ghostty
sudo pacman -S --noconfirm ghostty

# Zen browser
yay -S zen-browser-bin --noconfirm --answerclean None --answerdiff None

# Google Chrome
yay -S google-chrome --noconfirm --answerclean None --answerdiff None

# VLC
sudo pacman -S --noconfirm vlc

# Jellyfin
flatpak install app/com.github.iwalton3.jellyfin-media-player/x86_64/stable

# btop
sudo pacman -S --noconfirm btop

# lazygit
sudo pacman -S --noconfirm lazygit

# downgrade
yay -S downgrade --noconfirm --answerclean None --answerdiff None

# ripgrep
sudo pacman -S --noconfirm ripgrep

# neofetch
yay -S neofetch --noconfirm --answerclean None --answerdiff None

echo 'All the software has been installed'



