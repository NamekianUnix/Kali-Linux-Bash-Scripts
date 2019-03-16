#!/bin/bash
#setup encrypted persistence for USB

dd if=kali-linux-2018.1-amd64.iso of=/dev/sdb bs=512k


kali_iso='kali-linux-2018.1-amd64.iso'


persistence='/dev/sdb'


end=114gb
read start _ < <(du -bcm $kali_iso | tail -1); echo $start
parted $persistence mkpart primary $start $end



apt install cryptsetup -y


cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
cryptsetup luksOpen /dev/sdb3 my_usb

mkfs.ext3 -L persistence /dev/mapper/my_usb
e2label /dev/mapper/my_usb persistence

mkdir -p /mnt/my_usb
mount /dev/mapper/my_usb /mnt/my_usb
echo "/ union" > /mnt/my_usb/persistence.conf
umount /dev/mapper/my_usb

cryptsetup luksClose /dev/mapper/my_usb
