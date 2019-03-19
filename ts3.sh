#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/19/19
# Purpose: Run Teamspeak with a fix for Kali linux

# This script assumes the following:
# You're on Kali Linux
# You're logged in as root, or a SU terminal
# You have a solid Internet connection
# You have already installed Teamspeak to your home directory using "teamspeakinstall.sh".

#Sources:
#https://stackoverflow.com/questions/53355217/genymotion-throws-libssl-conf-so-cannot-open-shared-object-file-no-such-file-o
#https://teamspeak.com/en/your-download/#

# Workaround to make it work on Kali Linux
export OPENSSL_CONF=/etc/ssl/

# Moving to the proper directory
cd /root/TeamSpeak3-Client-linux_amd64

# Runs Teamspeak. Might as well make a button tied to this script.
bash ts3client_runscript.sh
