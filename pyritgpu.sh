#!/bin/bash
# Author: NamekianUnix 
# Last updated: 3/16/19
# Purpose: Setup your desktop to use a GPU within Pyrit

# Sources:
# https://docs.kali.org/general-use/install-nvidia-drivers-on-kali-linux
# Learned that OpenCL is faster than CUDA, so I had to install "pyrit-opencl" to accompany the instruction in order to get it to work

# Script assumptions/requirements:
# Desktop computer
# Nvidia graphics card
# Fresh install of the latest version of "Kali default" or "Kali all"
# You're logged in as root, or a SU terminal
# You've updated your Kali installation very recently "apt update && apt full-upgrade -y && reboot" 
# You have a solid internet connection

# Steps taken in the script:
# 1. Removes pyrit config file
# 2. Replaces config file with the proper settings for GPU usage within openCL. New config turns off cpu's within pyrit for better GPU performance, and enables openCL.
# 3. Automatically installs openCL library, Nvidia driver, Cuda toolkit, and openCL module for pyrit
# 4. Reboots computer to apply the Nvidia driver properly

# Step 1
echo "Removing pyrit config file"
rm ~/.pyrit/config

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

# Step 3
echo "Installing openCL library, Nvidia driver, Cuda toolkit, and openCL module for pyrit"
apt install -y ocl-icd-libopencl1 nvidia-driver nvidia-cuda-toolkit pyrit-opencl

# Step 4
echo "Rebooting"
reboot

# All done! Open up a terminal and type "pyrit list_cores" to see if it worked
