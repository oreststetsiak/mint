#!/bin/bash

echo "run 'cfdisk'"
echo "command 'wifi-menu' in case of wifi"

mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

pacstrap /mnt base base-devel
arch-chroot /mnt

pacman -S \
dhcpcd \
networkmanager \
--noconfirm

systemctl enable dhcpcd.service
systemctl enable NetworkManager.service

echo "set password for 'root' user"
passwd
