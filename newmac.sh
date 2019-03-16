#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Speeding up the wifi hacking process. This will randomly change the MAC address for the wlan0 wireless interface while using the new Alfa 802.11ac wireless adaptor "AWUS036ACH" 

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You're using the Alfa 802.11ac wireless adaptor "AWUS036ACH"
# You're using wlan0 as your wireless interface in monitor mode

ifconfig wlan0 down
macchanger -r wlan0
ifconfig wlan0 up
