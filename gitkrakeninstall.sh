#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Automatically downloads and installs the latest GitKraken 

# Get GitKraken from https://www.gitkraken.com/download/linux-deb to download the .deb file

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You have a solid Internet connection

echo "DOWNLOADING LATEST GITKRAKEN"
wget -P /root/Downloads/ https://release.gitkraken.com/linux/gitkraken-amd64.deb
apt update
cd /root/Downloads/
echo "unpackaging gitkraken-amd64.deb file"
dpkg -i gitkraken-amd64.deb
echo "fixing missing dependencies"
apt -f install -y
echo "cleaning up" 
rm -r gitkraken-amd64.deb
echo "GitKraken is ready for use"
