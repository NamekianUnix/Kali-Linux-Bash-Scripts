#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Fixes keyring in case Kali Linux hasn't been updated for a while. Then it upgrades the system.

wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add
apt update
apt full-upgrade -y
apt autoremove -y
apt autoclean
apt clean
