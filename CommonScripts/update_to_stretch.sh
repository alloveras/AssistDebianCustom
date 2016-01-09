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
su root -c "apt-get -y --force-yes autoremove";


