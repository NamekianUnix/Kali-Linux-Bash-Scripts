#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Speeding up the wifi hacking process. This will randomly change the MAC address for the wlan0mon wireless interface 

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You're using wlan0mon as your wireless interface in monitor mode

ifconfig wlan0mon down
macchanger -r wlan0mon
ifconfig wlan0mon up
