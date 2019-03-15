#!/bin/bash
 
# Change the default SSH keys
# source site https://www.linkedin.com/pulse/kali-20171-things-do-after-you-install-jeremy-martin

cd /etc/ssh/ && mkdir backup

mv ssh_host_* backup/

dpkg-reconfigure openssh-server

# Now to compare the new keys with the old ones to make sure they are different

echo "Do they match? if not, remove the backup ssh keys."
md5sum ssh_host_* && md5sum back/ssh_host_*
echo "rm -r /etc/ssh/backup/"

# If they don't match, remove them

# rm -r /etc/ssh/backup/