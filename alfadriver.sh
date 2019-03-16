#!/bin/bash
# Automatically installs alfa network 802.11ac driver for AWUS036ACH
# Also gets the computer to recognize the wireless device after the driver install
# https://www.kali.org/news/kali-linux-20171-release/
# Site that I found useful for troubleshooting:
# https://forums.kali.org/showthread.php?36814-How-to-install-AWUS036ACH-Drivers-and-getting-it-running
# Make sure you updated everything too

apt update
apt install linux-headers-amd64
apt install realtek-rtl88xxau-dkms -y
modprode 8812au

# If it's not recognized by network manager then do this:
# systemctl restart network-manager

# Still not working? Install linux headers
# apt install linux-headers-amd64

# If it still doesn't work, try uninstalling and reinstalling it:
# apt-get remove realtek-rtl88xxau-dkms -y
# apt-get purge realtek-rtl88xxau-dkms -y
# apt install realtek-rtl88xxau-dkms -y

# Or worse, try compiling it at https://github.com/astsam/rtl8812au/tree/v5.1.5 after uninstalling the old one.
