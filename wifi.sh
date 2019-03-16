#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Restarts the network manager so you can use the wifi without having to reboot the machine. Most useful after using airmon-ng to go into monitor mode.

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You are finished with Monitor mode and want to connect to wifi

echo "restarting networkmanager"
systemctl restart network-manager
