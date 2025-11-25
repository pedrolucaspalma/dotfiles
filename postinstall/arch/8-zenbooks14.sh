#!/bin/bash

sudo pacman -S --noconfirm tuned tuned-ppd

sudo systemctl enable tuned.service 
sudo systemctl start tuned.service

yay -S asusctl --noconfirm --answerclean None --answerdiff None
