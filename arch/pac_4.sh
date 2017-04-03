#!/bin/bash

useradd -m -g users -s /bin/bash oreststetsiak
passwd oreststetsiak
echo "alias ls='ls --color=auto'"  >> /home/oreststetsiak/.bashrc
echo "alias ll='ls -alF'" >> /home/oreststetsiak/.bashrc
echo "alias grep='grep --color=auto'" >> /home/oreststetsiak/.bashrc

echo "oreststetsiak ALL=(ALL) ALL" >> /etc/sudoers

pacman -S xorg-server xorg-server-utils xorg-xinit --noconfirm
pacman -S xf86-video-intel --noconfirm
pacman -S gdm --noconfirm
pacman -S cinnamon nemo-fileroller --noconfirm

systemctl enable gdm

pacman -Syu --noconfirm
pacman -S \
atom \
cherrytree \
chromium \
curl \
dbus \
deepin-image-viewer \
deluge \
dialog \
faience-icon-theme \
ffmpeg \
firefox \
firefox \
gnome-screenshot \
htop \
ifplugd \
inkscape \
ipython \
keepassx2 \
libreoffice-fresh \
meld \
mysql-workbench \
network-manager-applet \
numix-gtk-theme \
openssh \
openvpn \
parcellite \
qterminal \
rdesktop \
thunderbird \
tree \
unzip \
vlc \
wget \
wpa_actiond \
wpa_supplicant \
xf86-input-synaptics \
xfce4-appfinder \
--noconfirm
