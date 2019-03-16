#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Speeding up the wifi hacking process. Starts monitor mode on the wlan0 interface and terminates potential conflicts. 

# This script assumes the following:
# You have aircrack-ng suite installed while using a linux distro
# You're logged in as root, or a SU terminal
# Your wireless interface is wlan0

airmon-ng check kill
airmon-ng start wlan0
