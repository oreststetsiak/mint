#!/bin/bash

echo "be sure you are not under arch-chroot"

genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
umount /mnt

echo "reboot system"
