#!/bin/bash

mkdir ~/Developer
cd ~/Developer
git clone git@github.com:pedrolucaspalma/dotfiles.git
cd dotfiles

rm -rf ~/.zshrc
ln -sf ~/Developer/dotfiles/.zshrc ~/.zshrc

cat ~/Developer/dotfiles/.zshrc.private.template > ~/.zshrc.private
ln -sf ~/Developer/dotfiles/.zshrc.private ~/.zshrc.private

rm -rf ~/.config/nvim
ln -sf ~/Developer/dotfiles/nvim ~/.config/nvim

echo 'dotfiles has been installed'
echo 'Remember to add the github tokens to .zshrc.private: https://github.com/settings/tokens'

#TODO check GOPRIVATE 
