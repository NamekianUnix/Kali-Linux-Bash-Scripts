#!/bin/bash
#Fix keyring in case kali hasn't been updated for a while
#Then it upgrades and reboots the system

wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add
apt update
apt full-upgrade -y
apt autoremove -y
reboot
