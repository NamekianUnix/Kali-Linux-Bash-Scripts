#!/bin/bash
#Changes the mac address of the wlan1 interface to a random mac address
#802.11ac alfa card

ifconfig wlan1 down
macchanger -r wlan1
ifconfig wlan1 up

