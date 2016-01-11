#!/bin/bash

#Install some audio and video codecs

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing audio & video common codecs...\n";
su root -c "apt-get -y --force-yes install libdvdcss2";

arch=`uname -m`;

#Check system architecture
if [ "$arch" == "x86_64" ]; then
	su root -c "apt-get -y --force-yes install w64codecs";
else
	su root -c "apt-get -y --force-yes install w32codecs";
fi

echo -ne "${BLUE}[INFO]:${GREEN} Common audio & video codecs intalled!${NO_COLOR}\n";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Adobe Flash Player plugin...\n";
su root -c "apt-get -y --force-yes install flashplugin-nonfree";
echo -ne "${BLUE}[INFO]:${GREEN} Adobe Flash Player plugin installed!${NO_COLOR}\n";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Uninstalling OpenJDK...\n";
su root -c "apt-get -y --force-yes purge openjdk-\*";
echo -ne "${BLUE}[INFO]:${GREEN} OpenJDK uninstalled!${NO_COLOR}\n";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing compatibility with common compression methods...\n";
su root -c "apt-get -y --force-yes install rar unrar zip unzip unace bzip2 lzop p7zip-full p7zip-rar";
echo -ne "${BLUE}[INFO]:${GREEN} Compatibility with common compression methods has been enabled!${NO_COLOR}\n";

