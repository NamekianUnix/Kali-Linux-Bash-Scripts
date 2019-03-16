#!/bin/bash
#changes mac address to wlan0mon interface to a random mac address

ifconfig wlan0mon down
macchanger -r wlan0mon
ifconfig wlan0mon up
