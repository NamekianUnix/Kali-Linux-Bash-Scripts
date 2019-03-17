#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Fresh installation of Kali default deserves a quick setup. Several scripts come together to personalize my Kali install as soon as possible. Grab this script from teh repository before anything else and let it rip.

# This script assumes the following:
# You're on a fresh install of Kali Linux
# You're logged in as root, or a SU terminal
# You have a solid Internet connection
# The will to wait on all the updates and installs that you will have to watch.

# Download the repository
git clone https://github.com/NamekianUnix/Kali-Linux-Bash-Scripts.git

# Script directory
cd /root/Kali-Linux-Scripts/

# Give ALL the scripts execute permission
chmod +x *

# Remake Sources.list to make sure its right
bash fixrepo.sh

# Update the whole system
bash update.sh

# Get some preffered programs
apt install gimp aptitude synaptic mat2 bleachbit libreoffice -y

# Install Alfa 802.11ac wireless adaptor driver
bash alfadriver.sh

# Install Atom editor
bash atominstall.sh

# Install GitKraken
bash gitkrakeninstall.sh

# Install Tor Browser
bash torsetup.sh

# Install Kali-Linux-All
bash kaliall.sh

# Reconfigure SSH keys
bash sshkeyconfig.sh

echo "All done!"
