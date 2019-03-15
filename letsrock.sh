#!/bin/bash

# New install of Kali needs setup and updated

chmod +x fixrepo.sh
mv fixrepo.sh /bin/fixrepo.sh

chmod +x update.sh
mv update.sh /bin/update.sh

chmod +x updatereboot.sh
mv updatereboot.sh /bin/updatereboot.sh

chmod +x updateshutdown.sh
mv updateshutdown.sh /bin/updateshutdown.sh

chmod +x pyritgpu.sh
mv pyritgpu.sh /bin/pyritgpu.sh

chmod +x wifi.sh
mv wifi.sh /bin/wifi.sh

chmod +x sshkeyconfig.sh
mv sshkeyconfig.sh /bin/sshkeyconfig.sh

chmod +x atominstall.sh

fixrepo.sh
./atominstall.sh
updatereboot.sh
