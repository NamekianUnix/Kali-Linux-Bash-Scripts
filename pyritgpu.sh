#!/bin/bash
# Author: NamekianUnix 
# Last updated: 1/13/19
# Kali Linux version: Kali rolling 2019.1

# This script will setup your desktop to use a GPU within Pyrit
# Script assumptions/requirements:
# Desktop computer
# Nvidia graphics card
# Fresh install of the latest version of "Kali default" or "Kali all"
# You've updated your Kali installation very recently "apt update && apt full-upgrade && reboot" 
# Root permissions

# Steps taken in the script:
# 1. Removes pyrit config file
# 2. Replaces config file with the proper settings for GPU usage within openCL. New config turns off cpu's within pyrit for better GPU performance, and enables openCL.
# 3. Automatically installs openCL library, Nvidia driver, Cuda toolkit, and openCL module for pyrit
# 4. Reboots computer to apply the Nvidia driver properly

# Step 1
echo "Removing pyrit config file"
rm ~/.pyrit/config
echo "pyrit config file removed"

# Step 2
echo "Creating new pyrit config file with proper GPU settings"
echo "default_storage = file://
limit_ncpus = -1
rpc_announce = true
rpc_announce_broadcast = false
rpc_knownclients = 
rpc_server = false
use_CUDA = false
use_OpenCL = true
workunit_size = 75000" >> ~/.pyrit/config
echo "Proper pyrit config file created"

# Step 3
echo "Installing openCL library, Nvidia driver, Cuda toolkit, and openCL module for pyrit"
apt install -y ocl-icd-libopencl1 nvidia-driver nvidia-cuda-toolkit pyrit-opencl
echo "Finished installing"

# Step 4
echo "Rebooting"
reboot

# All done! Open up a terminal and type "pyrit list_cores" to see if it worked
