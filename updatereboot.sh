#!/bin/bash
#Author: NamekianUnix
#Last updated: 3/15/19
#Purpose: Fully/Automatically update Kali Linux, remove unneeded packages, clear the APT cache, and reboots Kali Linux

#This script assumes the following:
#You're using Kali Linux
#You're logged in as root, or a SU terminal
#Your /etc/apt/sources.list for APT is setup correctly for Kali repositories
#You are using a solid Internet connection
#Your trusted keyring isn't out of date (you update more than once every 6 months)

apt update
apt full-upgrade -y
apt autoremove -y
apt autoclean
apt clean
reboot
