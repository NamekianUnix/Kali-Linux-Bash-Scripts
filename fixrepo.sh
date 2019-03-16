#!/bin/bash
# Author: NamekianUnix 
# Last updated: 3/16/19
# Purpose: Updates the sources.list file to the proper configuration for Kali Rolling

# https://docs.kali.org/general-use/kali-linux-sources-list-repositories

# Kali Rolling: 
# deb http://http.kali.org/kali kali-rolling main contrib non-free
# #For source package access, uncomment the following line
# deb-src http://http.kali.org/kali kali-rolling main contrib non-free

# Kali Sana (2.0):
# deb http://old.kali.org/kali sana main non-free contrib
# #For source package access, uncomment the following line
# deb-src http://old.kali.org/kali sana main non-free contrib

# Kali Moto (1.0):
# deb http://old.kali.org/kali moto main non-free contrib
# #For source package access, uncomment the following line
# deb-src http://old.kali.org/kali moto main non-free contrib

echo "removing sources.list"
rm /etc/apt/sources.list	

echo "adding correct sources.list"
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free
deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
echo "Done"
