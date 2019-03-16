#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Performs live build of Kali Rolling

# This script assumes the following:
# You're using Kali Linux
# You're logged in as root, or a SU terminal
# You have the Kali Linux livebuild system installed and you've set it up to your specifications

cd /root/live-build-config/
./build.sh --verbose
