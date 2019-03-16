#!/bin/bash
#Author: NamekianUnix
#Last updated: 3/15/19
#Purpose: Get all the Kali metapackages and tools after updating the system. Cleans up after itself once the installation is complete.

#This script assumes the following:
#You're on Kali Linux
#You're logged in as root, or a SU terminal
#The /etc/apt/sources.list is setup properly for Kali Linux repositories
#You have a solid Internet connection

apt update
apt full-upgrade -y
apt install kali-linux-all -y
apt autoremove -y
apt autoclean
apt clean
