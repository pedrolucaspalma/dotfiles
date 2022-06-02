#!/bin/bash

# ____.deb
sudo apt update -y
sudo apt upgrade -y

sudo apt install neovim -y
# sudo apt install vlc -y

# ____Brave
#sudo apt install apt-transport-https curl -y
#sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
#echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
#sudo apt update
#sudo apt install brave-browser -y

# ____PgAdmin
sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

# Java
#sudo apt install default-jre -y
#sudo apt install default-jdk -y

