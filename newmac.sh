#!/bin/bash
#Changes the mac address of the wlan0 interface to a random mac address

ifconfig wlan0 down
macchanger -r wlan0
ifconfig wlan0 up
