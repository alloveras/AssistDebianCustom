#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Preparing system for installing Gnome3 desktop environtment...\n";

#Set the new sources.list file
su root -c "cp sources.list.jessie /etc/apt/sources.list"

#Force sources reload and install incomming updates
echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing updates for the currently installed packages...\n";
su root -c "apt-get -y --force-yes update";
su root -c "apt-get -y --force-yes upgrade";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Gnome3 desktop environtment...\n";

#Start Gnome Installation
su root -c "apt-get install -y --force-yes gnome";

echo -ne "${BLUE}[INFO]:${GREEN} Gnome3 was succesfully installed!${NO_COLOR}\n";

