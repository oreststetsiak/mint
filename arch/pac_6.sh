#!/bin/bash

echo "use nmcli to configure network"

echo "enter normal username"
read  MY_USERNAME

useradd -m -g users -s /bin/bash ${MY_USERNAME}
passwd ${MY_USERNAME}

echo "alias ls='ls --color=auto'"  >> /home/${MY_USERNAME}/.bashrc
echo "alias ll='ls -alF'" >> /home/${MY_USERNAME}/.bashrc
echo "alias grep='grep --color=auto'" >> /home/${MY_USERNAME}/.bashrc
echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\]'" >> /home/${MY_USERNAME}/.bashrc

echo "${MY_USERNAME} ALL=(ALL) ALL" >> /etc/sudoers

pacman -S xorg-server xorg-server-utils xorg-xinit --noconfirm
pacman -S xf86-video-intel --noconfirm
pacman -S slim --noconfirm

pacman -S xfce4 xfce4-goodies --noconfirm

systemctl enable slim

pacman -Syu --noconfirm
pacman -S \
arc-icon-theme \
atom \
cherrytree \
chromium \
curl \
dbus \
deepin-image-viewer \
deluge \
dialog \
docker \
evince \
faience-icon-theme \
ffmpeg \
firefox \
git \
gnome-screenshot \
htop \
ifplugd \
inkscape \
ipython \
keepassx2 \
libreoffice-fresh \
meld \
mtpfs \
mysql-workbench \
net-tools \
network-manager-applet \
ntfs-3g \
ntp \
numix-gtk-theme \
openssh \
openvpn \
parcellite \
pavucontrol \
rdesktop \
thunderbird \
tree \
unzip \
vlc \
wget \
wpa_actiond \
wpa_supplicant \
xf86-input-synaptics \
xfce4-whiskermenu-plugin \
zip \
--noconfirm

# setup ntp
sudo systemctl enable ntpd.service
timedatectl set-ntp true
sudo systemctl restart ntpd.service

# setup docker
mkdir -p /etc/systemd/system/docker.service.d
mkdir -p /etc/systemd/system/docker.socket.d

echo "[Service]" > /etc/systemd/system/docker.service.d/docker.conf
echo "ExecStart=" >> /etc/systemd/system/docker.service.d/docker.conf
echo "ExecStart=/usr/bin/docker daemon -H fd:// --bip=10.100.100.1/24" >> /etc/systemd/system/docker.service.d/docker.conf

echo "[Socket]" > /etc/systemd/system/docker.socket.d/socket.conf
echo "ListenStream=0.0.0.0:2375" >> /etc/systemd/system/docker.socket.d/socket.conf

usermod -aG docker ${MY_USERNAME}

systemctl enable docker.service
systemctl restart docker.service
