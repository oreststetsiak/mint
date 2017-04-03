#!/bin/bash

useradd -m -g users -s /bin/bash oreststetsiak
passwd oreststetsiak

echo "oreststetsiak ALL=(ALL) ALL" >> /etc/sudoers

pacman -S xorg-server xorg-server-utils xorg-xinit --noconfirm
pacman -S xf86-video-intel --noconfirm
pacman -S gdm --noconfirm
pacman -S cinnamon nemo-fileroller --noconfirm

systemctl enable gdm

pacman -Syu --noconfirm

pacman -S \
firefox \
lxterminal \
cherrytree \
dbus \
atom \
chromium \
curl \
faience-icon-theme \
firefox \
htop \
parcellite \
inkscape \
ipython \
openvpn \
keepassx \
libreoffice-fresh \
meld \
mysql-workbench \
numix-gtk-theme \
openssh \
thunderbird \
tree \
wget \
rdesktop \
--noconfirm
