#!/bin/bash

# Prerequisites
sudo pacman -S --noconfirm \
	base-devel \
	git \

# Node
sudo pacman -S --noconfirm nodejs

# NPM
sudo pacman -S --noconfirm npm

# Flatpak
sudo pacman -S --noconfirm flatpak

# Go
curl -fsSL https://go.dev/dl/go1.25.4.linux-amd64.tar.gz | sudo tar -xz -C /usr/local

echo 'Go has been installed, but remember to use the .zshrc file to set the environment variables'

# Pyenv
sudo pacman -S --noconfirm pyenv

# uv
sudo pacman -S --noconfirm uv

# Neovim
sudo pacman -S --noconfirm neovim

# wl-clipboard for neovim copy on yank
sudo pacman -S --noconfirm wl-clipboard

# ripgrep for fuzzy search
sudo pacman -S --noconfirm ripgrep

# Ghostty
sudo pacman -S --noconfirm ghostty

# Zen browser
yay -S zen-browser-bin --noconfirm --answerclean None --answerdiff None

# Google Chrome
yay -S google-chrome --noconfirm --answerclean None --answerdiff None

# VLC
flatpak install app/org.videolan.VLC/x86_64/stable

# Jellyfin
flatpak install app/com.github.iwalton3.jellyfin-media-player/x86_64/stable

# btop
sudo pacman -S --noconfirm btop

# lazygit
sudo pacman -S --noconfirm lazygit

# downgrade
yay -S downgrade --noconfirm --answerclean None --answerdiff None

# neofetch
yay -S neofetch --noconfirm --answerclean None --answerdiff None

# openfortivpn
pacman -S --noconfirm --answerclean None --answerdiff None openfortivpn

# flyway
yay -S flyway --noconfirm --answerclean None --answerdiff None

# pgadmin4
flatpak install app/org.pgadmin.pgadmin4/x86_64/stable

# qbbitorrent
sudo pacman -S --noconfirm qbittorrent

# vscode
yay -S visual-studio-code-bin --noconfirm --answerclean None --answerdiff None

# discord
sudo pacman -S --noconfirm discord

# yt-dlp
yay -S yt-dlp --noconfirm --answerclean None --answerdiff None

echo 'All the software has been installed'

