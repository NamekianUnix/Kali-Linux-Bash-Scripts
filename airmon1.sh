#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Speeding up the wifi hacking process. Starts monitor mode on the wlan1 interface on the new Alfa 802.11ac wireless adaptor "AWUS036ACH" in the proper way and terminates potential conflicts.
# Do not use: "airmon-ng start wlan1" for the Alfa 802.11ac adaptor 
# Reference: 
# https://forums.kali.org/showthread.php?36814-How-to-install-AWUS036ACH-Drivers-and-getting-it-running

# This script assumes the following:
# You have aircrack-ng suite installed while using a linux distro
# You're logged in as root, or a SU terminal
# Your wireless interface is wlan1
# You're using the new Alfa 802.11ac wireless adaptor "AWUS036ACH" with the proper driver installed

airmon-ng check kill
ip link set wlan1 down
iwconfig wlan1 mode monitor
ip link set wlan1 up


