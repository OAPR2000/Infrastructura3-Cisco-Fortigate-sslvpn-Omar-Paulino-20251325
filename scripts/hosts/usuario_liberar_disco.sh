#!/bin/bash
# Usuario - liberar espacio en el disco de 2.4 GB de la imagen cloud
df -h /
uname -r                                   # kernel en uso: 6.8.0-45-generic
sudo apt clean
sudo journalctl --vacuum-size=20M
dpkg -l | grep 6.8.0-142
sudo apt purge -y linux-image-6.8.0-142-generic linux-modules-6.8.0-142-generic \
  linux-headers-6.8.0-142 linux-headers-6.8.0-142-generic \
  linux-tools-6.8.0-142 linux-tools-6.8.0-142-generic \
  linux-virtual linux-image-virtual linux-headers-virtual linux-headers-generic
sudo apt -f install
sudo apt autoremove --purge -y
sudo apt clean
df -h /
