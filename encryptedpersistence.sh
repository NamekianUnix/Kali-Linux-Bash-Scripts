#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Setup encrypted persistence for your live USB /dev/sdb

# Sources:
# https://docs.kali.org/downloading/kali-linux-live-usb-persistence

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# /dev/sdb is the drive path you wish to use (because it will erase all data on that drive)
# You have downloaded the latest Kali Linux iso file to your /root/ directory
# You activated this script while in the root directory
# You have read and edited this script to the correct drive paths, ISO filename, and flash drive size
# You'll watch this script progress after it's execution because it will require you to enter in a password to setup the encryption

kali_iso='kali-linux-2019.1a-amd64.iso'

drive_path='/dev/sdb'

drive_path3='dev/sdb3'

dd if=$kali_iso of=$drive_path bs=512k status=progress

# Make sure "end" equals the advertised size of the flash drive
end=256gb
read start _ < <(du -bcm $kali_iso | tail -1); echo $start
parted $drive_path mkpart primary $start $end

cryptsetup --verbose --verify-passphrase luksFormat $drive_path3
cryptsetup luksOpen $drive_path3 my_usb

mkfs.ext3 -L persistence /dev/mapper/my_usb
e2label /dev/mapper/my_usb persistence

mkdir -p /mnt/my_usb
mount /dev/mapper/my_usb /mnt/my_usb
echo "/ union" > /mnt/my_usb/persistence.conf
umount /dev/mapper/my_usb

cryptsetup luksClose /dev/mapper/my_usb
