#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Automatically downloads and installs the latest Atom editor 

# Get atom editor from https://atom.io to download the .deb file
# Source: https://www.youtube.com/watch?v=ulBfSEYcgjk

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You have a solid Internet connection

echo "DOWNLOADING LATEST ATOM"
wget -P Downloads/ https://atom.io/download/deb
apt update
cd /root/Downloads/
echo "unpackaging atom.deb file"
dpkg -i deb
echo "fixing missing dependencies"
apt -f install -y
echo "cleaning up" 
rm -r deb
echo "atom is ready for use"
