#!/bin/bash

echo "uk_UA.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen
hwclock --systohc
ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime

echo -e "enter hostname"
read  ARCH_HOSTNAME

echo ${ARCH_HOSTNAME} > /etc/hostname
echo "127.0.0.1    ${ARCH_HOSTNAME}" >> /etc/hosts

pacman -S grub-bios --noconfirm
grub-install /dev/sda
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg

exit
echo "be sure you are not under arch-chroot"
