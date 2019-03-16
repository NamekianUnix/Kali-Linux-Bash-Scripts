#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Speeding up the wifi hacking process. Starts sniffing wireless traffic on the wlan1 interface for the new Alfa 802.11ac wireless adaptor "AWUS036ACH". The sniffing parameters are using the 5ghz band and looking for WPS vulnerabilities as well.

# This script assumes the following:
# You have aircrack-ng suite installed while using a linux distro
# You're logged in as root, or a SU terminal
# Your wireless interface is wlan1
# You're using the new Alfa 802.11ac wireless adaptor "AWUS036ACH" with the proper driver installed

airodump-ng -W --band a wlan1
