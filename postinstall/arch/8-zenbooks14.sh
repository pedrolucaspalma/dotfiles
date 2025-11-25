#!/bin/bash

sudo pacman -S --noconfirm tlp
# maybe check if tlp-rdw is worth it?
# sudo pacman -S --noconfirm tlp-rdw

sudo systemctl enable tlp.service 
sudo systemctl start tlp.service

echo '====================================================================='
echo 'checking tlp...'
sudo tlp-stat -s
echo '====================================================================='
yay -S asusctl --noconfirm --answerclean None --answerdiff None
