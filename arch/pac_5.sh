#!/bin/bash

arch-chroot /mnt
echo "set password for 'root' user"
passwd

timedatectl set-ntp true
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US ISO-8859-1" >> /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime
echo spyrodesk > /etc/hostname

pacman -S grub-bios --noconfirm
grub-install /dev/sda
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg

exit
