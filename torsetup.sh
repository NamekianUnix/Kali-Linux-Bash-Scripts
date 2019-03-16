#!/bin/bash
# https://www.torproject.org/download/download-easy.html.en#linux	site
# /root/Downloads/tor-browser-linux64-8.0.4_en-US.tar.xz		filepath
# https://www.torproject.org/dist/torbrowser/8.0.4/tor-browser-linux64-8.0.4_en-US.tar.xz   Download location

#apt install xz-utils -y
#In case you dont have it installed for some reason.
#Installed by default within Kali Linux

#Made a label for the tor zip file that can be changed as tor updates file names
#Once the zip has been dowloaded. Check your downloads folder and update the "tor-browser-linux64-7.5.2_en-US.tar.xz" with the name of the download file

torzip="tor-browser-linux64-8.0.4_en-US.tar.xz"

#Changes directory to your downloads folder where the torzip file should be
cd /root/Downloads/

#Extracts the torzip file: requires the xz-utils dependency mentioned above
tar -xf $torzip

#Removes zip file since we've extracted it
rm -r $torzip

#Changes owner of the tor-browser_en-US to root, recursively
chown -R root:root tor-browser_en-US

#Changes directory in preparation for editing the "start-tor-browser" file
cd /root/Downloads/tor-browser_en-US/Browser/

#The section below is from the start-tor-browser file which needs edited
#############################################################################
#if [ "`id -u`" -eq 0 ]; then
#	complain "The Tor Browser Bundle should not be run as root.  Exiting."
#	exit 1
#fi
#############################################################################
#What matters is that it changes the "-eq 0" to a "-eq 1"

#Using sed in general:
#sed -i 's/oldstring/newstring/g' filename
#See man sed for more info.

#Replaces the "-eq 0" to a "-eq 1" within the start-tor-browser file which allows the root user to start tor without error
sed -i 's/-eq 0/-eq 1/g' start-tor-browser

#Moves the extracted tor folder from the Downloads directory to the root directory
mv /root/Downloads/tor-browser_en-US /root/tor-browser_en-US

#Changes directory to /bin/ to create a script for easy tor startup
cd /bin/

#Creates a script within the /bin/ directory to launch the tor browser simply
#It will name the script "tor.sh"

##################Scriptception##################
echo "#!/bin/bash
#Starts up tor browser

cd /root/tor-browser_en-US/Browser/
./start-tor-browser" >> /bin/tor.sh
#################################################

#Gives executability to the new script
chmod +x tor.sh

#Now tor should work and you can start it up with the "tor.sh" option from any folder.
