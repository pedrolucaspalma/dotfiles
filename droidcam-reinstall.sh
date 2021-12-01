#!/bin/bash

#Removal
sudo /opt/droidcam-uninstall

#Installation
cd /tmp/
wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.8.0.zip
# sha1sum: 3f94d6ec57a191ad146392fcf094b205e375e1ef
unzip droidcam_latest.zip -d droidcam
cd droidcam && sudo ./install-client
sudo apt install linux-headers-`uname -r` gcc make
sudo ./install-video

echo ----------------------------------------
echo
lsmod | grep v4l2loopback_dc
echo
echo -----------------------------------------
echo check if v4l2loopback_dc was listed above
