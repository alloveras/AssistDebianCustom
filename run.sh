################################################################
# File: run.sh
# Authors: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com)
# Date: 08/01/2015
# Description: Entry point script to setup a custom Debian
# development environtment.
# License: MIT
################################################################

#!/bin/bash

#Export current user launching script
export current_user=`whoami`;

#Some color variables
export RED='\033[0;31m';
export GREEN='\033[0;32m';
export BLUE='\033[0;34m';
export NO_COLOR='\033[0m';

#Check if the user is only requesting machine information
if [ "$1" == "--machine-info" ]; then
	
	echo -e "${BLUE}[INFO]${NO_COLOR}: Erasing machine_info.txt if exists...";
	rm -rf machine_info.txt;

	echo -e "${BLUE}[INFO]${NO_COLOR}: Creating machine_info.txt file...";
	current_path=`pwd`	
	
	cd /sys/devices/virtual/dmi/id/;
	for f in *; do
        	line=`cat $f 2>/dev/null`;
		if [ "$?" == "0" ]; then
			echo "$f : $line" >> "$current_path"/machine_info.txt;
		else 
			 echo "$f : ***_Unavailable_***" >> "$current_path"/machine_info.txt;
		fi
	done
	
	echo -e "${BLUE}[INFO]${NO_COLOR}: File machine_info.txt was created successfully...";
	exit 0;
fi
 
#Clear the current screen
clear;

#Print some marketing
echo -e "\n\n";
echo -e "########  ######## ########  ####    ###    ##    ##          ######  ##     ##  ######  ########  #######  ##     ##";
echo -e "##     ## ##       ##     ##  ##    ## ##   ###   ##         ##    ## ##     ## ##    ##    ##    ##     ## ###   ###";
echo -e "##     ## ##       ##     ##  ##   ##   ##  ####  ##         ##       ##     ## ##          ##    ##     ## #### ####";
echo -e "##     ## ######   ########   ##  ##     ## ## ## ## ####### ##       ##     ##  ######     ##    ##     ## ## ### ##";
echo -e "##     ## ##       ##     ##  ##  ######### ##  ####         ##       ##     ##       ##    ##    ##     ## ##     ##";
echo -e "##     ## ##       ##     ##  ##  ##     ## ##   ###         ##    ## ##     ## ##    ##    ##    ##     ## ##     ##";
echo -e "########  ######## ########  #### ##     ## ##    ##          ######   #######   ######     ##     #######  ##     ##";
echo -e "\n\n";


for dir in `pwd`/*/
do
	dir=${dir%*/}
	path=${dir##*/}
	
	cd "$path";	
	source check_device.sh
		
	if [ "$device_match" == "true" ]; then
	
		#Show the information of the current device
		echo -e "=======================================";
		echo -e "	    Device Information          ";
		echo -e "=======================================";
		echo  "Manufacturer: $manufacturer";
		echo  "Model: $model_name";
		echo  "Script Version: $script_version";
	
		echo -e "\n\n${GREEN}[OK]:${NO_COLOR} Congratulations! Your device is compatible with debian-custom development environment.";
    echo -ne "${BLUE}[INFO]:${NO_COLOR} The current user is ${GREEN}$current_user${NO_COLOR}. Would you like to continue with the installation? [Y/N]";

		while read option; do

			if [ "$option" == "Y" ] || [ "$option" == "y" ]; then
				echo -e "${BLUE}[INFO]:${NO_COLOR} Please, type your ROOT password:";
				su root -c "bash run.sh";
				exit 0;
			elif [ "$option" == "N" ] || [ "$option" == "n" ];then
				echo -e "${BLUE}[INFO]:${NO_COLOR} See you soon!";
				exit 0;
			fi
		
			echo -ne "${RED}[Error]:${NO_COLOR} Please answer Yes [Y] or Not [N]";

		done
		
		exit 0;
		
	fi
	cd ../;

done

echo -e "\n\n${RED}[Error]:${NO_COLOR} Your device is ${RED}NOT${NO_COLOR} compatible with debian-custom development environment.\n";
echo -e "Please, us on Github (http://github.com/alloveras/debian-custom) and request an implementation for your current device.\n";

exit 1;

