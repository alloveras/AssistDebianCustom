################################################################
# File: update_to_stretch.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that performs the distribution upgrade from
# Debian Jessie (stable) to Debian Stretch (alpha). This may seem
# insecure but stability of Strech is high and the update will
# give the ability to enjoy Gnome 3.16 improvements.
# License: MIT
################################################################

#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Preparing system to perform update to Debian Stretch...\n";
su root -c "cp sources.list.stretch /etc/apt/sources.list";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Updating to Debian Stretch...\n";
su root -c "apt-get -y --force-yes  update";
su root -c "apt-get -y --force-yes install deb-multimedia-keyring";
su root -c "apt-get -y --force-yes upgrade";
su root -c "apt-get -y --force-yes dist-upgrade";

echo -ne "${BLUE}[INFO]:${GREEN} System updated to Debian Stretch!${NO_COLOR}\n";

#Perform some clean up after update
echo -ne "${BLUE}[INFO]:${NO_COLOR} Cleaning up some dependencies that are no longer needed by the system...";

#This command is still being tested (will be added or removed on future versions of the script)
#su root -c "apt-get -y --force-yes autoremove";


