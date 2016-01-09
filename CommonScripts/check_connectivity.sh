#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Checking internet connection...";

#Check network connectivity
wget -q --tries=10 --timeout=20 --spider http://google.com

if [ "$?" == "0" ]; then
	echo -ne "${GREEN} You are connected to internet!${NO_COLOR}\n${BLUE}[INFO]:${NO_COLOR} However, would you like to configure your network interfaces? [Y/N]";
else
	echo -ne "${RED}You are not connected to internet!${NO_COLOR}\n${RED}[Error]:${NO_COLOR} This script needs internet connection to continue.\n${BLUE}[INFO]:${NO_COLOR} Would you like try to configure your network interfaces? [Y/N]";
fi

while read option; do

	if [ "$option" == "Y" ] || [ "$option" == "y" ]; then
		su root -c "bash configure_interfaces.sh"
		exit;
	elif [ "$option" == "N" ] || [ "$option" == "n" ]; then
		exit 0;
	else
		echo -ne "${RED}[Error]:${NO_COLOR} You must answer Yes [Y] or Not [N]: "; 
	fi

done

