#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Automatically installs the driver for the Alfa 802.11ac wireless adaptor "AWUS036ACH". Also gets the computer to recognize the wireless device after the driver install

# References:
# https://www.kali.org/news/kali-linux-20171-release/
# Site that I found useful for troubleshooting:
# https://forums.kali.org/showthread.php?36814-How-to-install-AWUS036ACH-Drivers-and-getting-it-running

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You're using the new Alfa 802.11ac wireless adaptor "AWUS036ACH"

apt update
apt install realtek-rtl88xxau-dkms -y

# If it's not recognized by network manager then do this:
# systemctl restart network-manager

# Still not working? Install linux headers
# apt install linux-headers-amd64
# modprode 8812au

# If it still doesn't work, try uninstalling and reinstalling it:
# apt-get remove realtek-rtl88xxau-dkms -y
# apt-get purge realtek-rtl88xxau-dkms -y
# apt install realtek-rtl88xxau-dkms -y

# Or worse, try compiling it at https://github.com/astsam/rtl8812au/tree/v5.1.5 after uninstalling the old one.
