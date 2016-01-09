################################################################
# File: run.sh
# Author: Albert Lloveras Carbonell (albert@assist.ai)
# Date: 08/01/2015
# Description: Entry point script for the Assist's customized
# Debian development environtment.
# License: Copyright Assist AI
################################################################

#!/bin/bash

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

#Show some assist marketing
echo -e '\n\n';
echo -e '         d8888  .d8888b.   .d8888b. 8888888  .d8888b. 88888888888'; 
echo -e '        d88888 d88P  Y88b d88P  Y88b  888   d88P  Y88b    888';     
echo -e '       d88P888 Y88b.      Y88b.       888   Y88b.         888';     
echo -e '      d88P 888  "Y888b.    "Y888b.    888    "Y888b.      888';     
echo -e '     d88P  888     "Y88b.     "Y88b.  888       "Y88b.    888';     
echo -e '    d88P   888       "888       "888  888         "888    888';     
echo -e '   d8888888888 Y88b  d88P Y88b  d88P  888   Y88b  d88P    888';     
echo -e '  d88P     888  "Y8888P"   "Y8888P" 8888888  "Y8888P"     888';
echo -e '\n';
 

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
	
		echo -e "\n\n${GREEN}[OK]:${NO_COLOR} Congratulations! Your device is compatible with Assist's customized Debian development environment.";
		echo -ne "${BLUE}[INFO]:${NO_COLOR} Would you like to continue with the installation? [Y/N]";

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

echo -e "\n\n${RED}[Error]:${NO_COLOR} Your device is NOT compatible with Assist's customized Debian development environtment. Please, contact Albert Lloveras (albert@assist.ai) and request an implementation for your current device.\n";

exit 1;

