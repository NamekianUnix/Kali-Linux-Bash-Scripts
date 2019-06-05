#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Automatically downloads and installs the latest version of Tor. This script will attempt to clean up previous installations of Tor if they are present. This script will also create another script to easily start up Tor once the installation has finished. "tor.sh" will start the Tor browser while within the terminal(regardless of which directory you are in).

# Sources:
# https://www.torproject.org/download/download-easy.html.en#linux

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You're OK with Tor browser being ran as root with root permissions
# You have a solid Internet connection
# The Kali Linux Time/Clock is accurately set
# You've manually retrieved the most up to date download link from https://www.torproject.org/download/download-easy.html.en#linux and updated the "tordownload" and "torzip" labels within this script before executing

tordownload="https://www.torproject.org/dist/torbrowser/8.0.6/tor-browser-linux64-8.5.1_en-US.tar.xz"
torzip="tor-browser-linux64-8.5.1_en-US.tar.xz"

# Removes previous Tor installation within the "root" directory
#echo "Removing previous installation of Tor"
#rm -r /root/tor-browser_en-US

# Changes directory to your downloads folder where the torzip file should be
cd /root/Downloads/

# Removes previous downloads of Tor browser
#echo "Removing previous downloads of Tor"
#rm -r tor-browser-linux64-*

# Downloads latest Tor browser .tar.xz
wget -P /root/Downloads/ $tordownload

# Extracts the torzip file: requires the xz-utils dependency which is install in Kali Linux by default
tar -xf $torzip

# Removes tar.xz file since we've extracted it
echo "Removing Tor tar.xz file"
rm -r $torzip

# Changes owner of the tor-browser_en-US to root, recursively
echo "Adding root ownership to Tor browser"
chown -R root:root tor-browser_en-US

# Changes directory in preparation for editing the "start-tor-browser" file
cd /root/Downloads/tor-browser_en-US/Browser/

# The section below is from the "start-tor-browser" file which needs edited for root use
#############################################################################
#if [ "`id -u`" -eq 0 ]; then
#	complain "The Tor Browser Bundle should not be run as root.  Exiting."
#	exit 1
#fi
#############################################################################
# What matters is that it changes the "-eq 0" to a "-eq 1"

# Using sed in general:
# sed -i 's/oldstring/newstring/g' filename

# Replaces the "-eq 0" to a "-eq 1" within the "start-tor-browser" file which allows the root user to start Tor without error
echo "Editing Tor browser to work while root"
sed -i 's/-eq 0/-eq 1/g' start-tor-browser

# Moves the extracted Tor folder from the "Downloads" directory to the "root" directory
echo "Moving Tor browser to root directory"
mv /root/Downloads/tor-browser_en-US /root/tor-browser_en-US

# Changes directory to /bin/ to create a script for easy tor startup
cd /bin/

# Creates a script within the /bin/ directory to launch the tor browser simply
#It will name the script "tor.sh"
echo "Making tor.sh script to easily start Tor"
##################Scriptception##################
echo "#!/bin/bash
#Starts up tor browser

cd /root/tor-browser_en-US/Browser/
./start-tor-browser" >> /bin/tor.sh
#################################################

# Gives executability to the new script
echo "Adding execute permission to tor.sh"
chmod +x tor.sh
# Now Tor should work and you can start it up with the "tor.sh" option from any folder.
echo "Done! start Tor browser by typing tor.sh"
