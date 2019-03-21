#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/19/19
# Purpose: Install the most update version of Teamspeak

# This script assumes the following:
# You're on Kali Linux
# You're logged in as root, or a SU terminal
# You have a solid Internet connection
# You have updated the ts3link and ts3runfile label with the most recent version of Teamspeak

#Sources:
#https://teamspeak.com/en/your-download/#

ts3link=https://files.teamspeak-services.com/releases/client/3.2.3/TeamSpeak3-Client-linux_amd64-3.2.3.run
ts3runfile=TeamSpeak3-Client-linux_amd64-3.2.3.run

# Downloading Teamspeak
wget -P /root/ $ts3link

# Giving execute permission to the run file
chmod +x $ts3runfile

echo "Press (q)(enter)(q)(y) in that order"

# Run the script to build the Teamspeak folder
bash $ts3runfile

# Remove the run file for cleanup
rm $ts3runfile
