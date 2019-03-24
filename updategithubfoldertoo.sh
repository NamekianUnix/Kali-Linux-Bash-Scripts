#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/24/19
# Purpose: Fully/Automatically update Kali Linux, remove unneeded packages, and clear the APT cache. Will also remove and download the latest version of Kali-Linux-Bash-Scripts and give appropriate them the persmissions.

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# Your /etc/apt/sources.list for APT is setup correctly for Kali repositories
# You are using a solid Internet connection
# Your trusted keyring isn't out of date (you update more than once every 6 months)
# Kali-Linux-Bash-Scripts folder exists in your root directory, and you wish to remove it for an update version of it

apt update
apt full-upgrade -y
apt autoremove -y
apt autoclean
apt clean
echo "Out with the old"
rm -r /root/Kali-Linux-Bash-Scripts/
echo "In with the new"
git clone https://github.com/NamekianUnix/Kali-Linux-Bash-Scripts.git
cd /root/Kali-Linux-Bash-Scripts/
chmod +x *
echo "Done"
