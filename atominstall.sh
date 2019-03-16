#!/bin/bash
#Get atom editor from https://atom.io and download the .deb file
#This script will automatically install it for you.
#source: https://www.youtube.com/watch?v=ulBfSEYcgjk

echo "DOWNLOADING LATEST ATOM"
wget "https://atom.io/download/deb"
echo "updating package list"
apt update
echo "Going to downloads folder"
cd /root/Downloads/
echo "unpackaging atom.deb file"
dpkg -i deb
echo "fixing missing dependencies"
apt -f install -y 
echo "atom is ready for use"
