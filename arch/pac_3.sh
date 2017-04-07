#!/bin/bash

pacman -S grub-bios --noconfirm
grub-install /dev/sda
mkinitcpio -p linux
grub-mkconfig -o /boot/grub/grub.cfg
