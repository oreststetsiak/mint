#!/bin/bash

useradd -m -g users /bin/bash oreststetsiak && passwd
passwd oreststetsiak

echo "oreststetsiak ALL=(ALL) ALL" >> /etc/sudoers

pacman -S xorg-server xorg-server-utils xorg-xinit --noconfirm
pacman -S xf86-video-intel --noconfirm
pacman -S gdm --noconfirm
pacman -S cinnamon --noconfirm
pacman -S cinnamon nemo-fileroller --noconfirm

systemctl enable gdm
systemctl enable dhcpcd@enp5s0.service
