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
# run sensors to check if fans are working.
# yay -S asusctl --noconfirm --answerclean None --answerdiff None
