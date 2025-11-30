#!/bin/bash

# tuned (battery management)
sudo pacman -S --noconfirm tuned tuned-ppd

sudo systemctl enable tuned.service 
sudo systemctl start tuned.service

# asusctl (fan control (?))
yay -S asusctl --noconfirm --answerclean None --answerdiff None

# intel-npu-driver (NPU)
# https://assuntonerd.com.br/2025/11/26/instalando-intel-npu-driver-no-linux/
# https://github.com/intel/linux-npu-driver/blob/main/docs/overview.md
# git clone git@github.com:intel/linux-npu-driver.git
# cd linux-npu-driver
# git submodule update --init --recursive
#
# # talvez  cmake -B build -S . -DCMAKE_POLICY_VERSION_MINIMUM=3.5
# cmake -B build -S .
# cmake --build build --parallel $(nproc)
#
# sudo cmake --install build
#
# sudo rmmod intel_vpu
# sudo modprobe intel_vpu
