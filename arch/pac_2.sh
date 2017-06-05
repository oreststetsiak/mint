#!/bin/bash

echo -e "enter hostname"
read  ARCH_HOSTNAME

echo ${ARCH_HOSTNAME} > /etc/hostname
echo "127.0.0.1    ${ARCH_HOSTNAME}" >> /etc/hosts

echo "uk_UA.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen
hwclock --systohc
ln -sf /usr/share/zoneinfo/Europe/Helsinki /etc/localtime

pacman -Syu --noconfirm
pacman -S \
dhcpcd \
networkmanager \
--noconfirm

systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
