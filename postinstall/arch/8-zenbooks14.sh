#!/bin/bash

sudo pacman -S --noconfirm tuned

sudo systemctl enable tuned.service
sudo systemctl start tuned.service

sudo pacman -S --noconfirm tuned-ppd

yay -S asusctl --noconfirm --answerclean None --answerdiff None
