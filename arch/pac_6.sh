#!/bin/bash

genfstab -U /mnt >> /mnt/etc/fstab
umount /mnt

reboot
