################################################################
# File: run.sh
# Author: Albert Lloveras Carbonell (albert@assist.ai)
# Date: 08/01/2015
# Description: Entry point script for the Assist's customized
# Debian development environtment.
# License: Copyright Assist AI
################################################################

#cd /sys/devices/virtual/dmi/id/
#for f in *; do
#        printf "$f "
#        cat $f 2>/dev/null || echo "***_Unavailable_***"
#done

#!/bin/bash

#Some color variables
RED='\033[0;31m';
GREEN='\033[0;32m';
NO_COLOR='\033[0m';

#Store rellevant computer manufacturer's information
manufacturer=`cat /sys/devices/virtual/dmi/id/sys_vendor`;
model_name=`cat /sys/devices/virtual/dmi/id/product_version`; 
script_version=`cat "$model_name"/version.txt`;

#Check the value of $script_version
if [ -z $script_version ]; then
	script_version="N/A";
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
 
#Show the information of the current device                                            
echo -e "=======================================";
echo -e "	    Device Information          ";
echo -e "=======================================";
echo  "Manufacturer: $manufacturer";
echo  "Model: $model_name";
echo  "Script Version: $script_version";


if [ -d "$model_name" ]; then
	echo -e "\n\n${GREEN}Congratulations!${NO_COLOR} Your device is compatible with Assist's customized Debian development environment.\n";
	echo -e "\nWould you like to install the customizations? [Y/N]\n";

	while read option; do

		if [ "$option" == "Y" ] | [ "$option" == "y" ]; then
			#TODO Run
			exit 0;
		elif [ "$option" == "N" ] | [ "$option" == "n" ];then
			echo -e "\nSee you soon!\n";
			exit 0;
		fi
		
		echo -e "\n${RED}Error:${NO_COLOR} Please answer Yes [Y] or Not [N].\n";

	done
		
else
	echo -e "\n\n${RED}Error!${NO_COLOR} Your device is NOT compatible with Assist's customized Debian development environtment. Please, contact Albert Lloveras (albert@assist.ai) and request an implementation for your current device.\n";
fi
