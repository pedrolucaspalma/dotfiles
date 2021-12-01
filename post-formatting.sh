#!/bin/bash

# ____.deb
sudo apt update -y
sudo apt upgrade -y

sudo apt install neovim -y
sudo apt install vlc -y
sudo apt install libreoffice -y
sudo apt install texlive-full -y

# ____Brave
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# ____PgAdmin
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
sudo apt install pgadmin4-desktop

#____Vscode baixar no site

# ____NVM
#Rodar depois de instalar o zsh. 
#------>>>>QUANTO TERMINAR DE RODAR, REINICIAR O TERMINAL<<<--------
#sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
#nvm install --lts
#nvm use --lts

# ____Yarn
#npm install --global yarn

# ____Docker olha la no site

# Reinicia o pc antes e depois do prox comando (rodar docker sem sudo)
# sudo usermod -aG docker $(whoami)

# ____Docker-Compose
# sudo curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# Reinicia o pc antes e depois do prox comando
# sudo chmod +x /usr/local/bin/docker-compose

# ____R
# apt update -qq
# apt install --no-install-recommends software-properties-common dirmngr
# wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
# add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
# apt install --no-install-recommends r-base

# ____R Studio
# baixar pelo site https://www.rstudio.com/products/rstudio/download/


# ____Flatpacks
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo flatpak install flathub nl.hjdskes.gcolor3 -y # Color Picker
sudo flatpak install flathub com.discordapp.Discord -y # Discord
sudo flatpak install flathub com.obsproject.Studio -y # OBS
sudo flatpak install flathub org.signal.Signal -y # Signal
#sudo flatpak install flathub com.slack.Slack -y # Slack
sudo flatpak install flathub us.zoom.Zoom -y # Zoom
sudo flatpak install flathub org.texstudio.TeXstudio -y # TexStudio
sudo flatpak install flathub fyi.zoey.TeX-Match -y # Tex Match
sudo flatpak install flathub com.getpostman.Postman -y # Postman
sudo flatpak install flathub org.libreoffice.LibreOffice -y # LibreOffice

# ____Ainda faltará:

# Java e Intellij
#sudo apt install default-jre
#sudo apt install default-jdk
