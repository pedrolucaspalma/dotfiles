#!/usr/bin/env bash
mkdir ~/temp
git clone git@github.com:neovim/neovim.git ~/temp/neovim

cd ~/temp/neovim

git fetch
git checkout v0.10.4

sudo apt install cmake gettext lua5.1 liblua5.1-0-dev

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
