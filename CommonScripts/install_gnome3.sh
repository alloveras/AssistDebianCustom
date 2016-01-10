#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Preparing system for installing Gnome3 desktop environtment...\n";

#Set the new sources.list file
su root -c "cp sources.list.jessie /etc/apt/sources.list"
su root -c "apt-key adv --keyserver keyserver.ubuntu.com --recv 7EBC211F";

#Force sources reload and install incomming updates
echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing updates for the currently installed packages...\n";
su root -c "apt-get -y --force-yes update";
su root -c "apt-get -y --force-yes upgrade";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Gnome3 desktop environtment...\n";

#Start Gnome Installation
su root -c "apt-get -y --force-yes install gnome network-manager-gnome";

#Do some clean up of gnome programs
su root -c "apt-get -y --force-yes remove gnome-chess cheese aisleriot five-or-more four-in-a-row gnome-documents gnome-mahjongg gnome-music gnome-mines gnome-nibbles gnome-photos gnome-robots gnome-sudoku gnome-tetravex lightsoff polari quadrapassel xboard empathy bijiben swell-foop tali hitori iagno gnome-klotski totem totem-common gnome-dictionary xterm gnome-orca gnome-getting-started-docs gnome-user-guide synaptic seahorse tracker";
su root -c "apt-get -y --force-yes remove iceweasel";
su root -c "apt-get -y --force-yes install firefox";

echo -ne "${BLUE}[INFO]:${GREEN} Gnome3 was succesfully installed!${NO_COLOR}\n";

