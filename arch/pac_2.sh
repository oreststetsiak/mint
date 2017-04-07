#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color

mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

echo -e "${RED}command 'wifi-menu' in case of wifi${NC}"

pacstrap /mnt base base-devel
arch-chroot /mnt

#systemctl enable dhcpcd@enp5s0.service
#systemctl enable dhcpcd
sudo systemctl enable NetworkManager.service

echo -e "${RED}set password for 'root' user${NC}"
passwd

timedatectl set-ntp true
hwclock --systohc

echo "uk_UA.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Kiev /etc/localtime

echo -e "${RED}enter hostname${NC}"
read  ARCH_HOSTNAME

echo ${ARCH_HOSTNAME} > /etc/hostname
echo "127.0.0.1 ${ARCH_HOSTNAME}" >> /etc/hosts

pacman -S grub-bios --noconfirm
grub-install /dev/sda
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg

exit
