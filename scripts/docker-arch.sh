#!/bin/bash

# Installation
yay -s docker

# Running without privileges
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# testing. Commented
# docker run hello-world

# Starting service on boot
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Log out and log in after install