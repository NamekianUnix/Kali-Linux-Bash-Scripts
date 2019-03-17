#!/bin/bash
# Author: NamekianUnix
# Last updated: 3/16/19
# Purpose: Change the default SSH keys
# Source site https://www.linkedin.com/pulse/kali-20171-things-do-after-you-install-jeremy-martin

cd /etc/ssh/ && mkdir backup

mv ssh_host_* backup/

dpkg-reconfigure openssh-server

# Now to compare the new keys with the old ones to make sure they are different
# If they don't match, remove them
# rm -r /etc/ssh/backup/

md5sum ssh_host_* && md5sum back/ssh_host_*
echo "If they match something went wrong, but if they're different, it's safe to remove the backup ssh keys with rm -r /etc/ssh/backup/"
