#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install zsh -y

echo -----------------
echo
zsh --version
echo
echo -----------------
echo verifique se saiu algo como zsh 5.8 x86_64-ubuntu-linux-gnu

# whereis zsh
# sudo usermod -s /usr/bin/zsh $(whoami)

# Reinicie o terminal e pressione 2 quando abrir ele de novo. Rode o comando abaixo para instalar o oh-my-zsh

# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
