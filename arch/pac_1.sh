#!/bin/bash

echo "run 'cfdisk'"
echo "command 'wifi-menu' in case of wifi"

mkfs.ext4 /dev/sda1
mount /dev/sda1 /mnt

pacstrap /mnt base base-devel

echo "run: arch-chroot /mnt"
