#!/bin/bash

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
sudo flatpak install flathub org.videolan.VLC -y # VLC

