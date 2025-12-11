#!/bin/bash

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

git config --global user.name "Pedro Palma"
git config --global user.email "pedrolucaspalma@gmail.com"

ssh-keygen -t ed25519 -C "pedrolucaspalma@gmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

echo 'public key:'
echo '================================================================================'
echo '================================================================================'
cat ~/.ssh/id_ed25519.pub
echo '================================================================================'
echo '================================================================================'

echo 'SSH has been configured'
echo 'Remember to add the public key to your GitHub account: https://github.com/settings/keys'
