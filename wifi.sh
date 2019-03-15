#!/bin/bash

# Turn the network manager back on so you can use the wifi without rebooting

echo "restarting networkmanager"
systemctl restart network-manager
