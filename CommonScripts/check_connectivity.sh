################################################################
# File: check_connectivity.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that checks whether the computer is connected
# to the internet or not. If not, it suggests to the user the
# alternative of configure any of available network interfaces and
# retry the connectivity check.
# License: MIT
################################################################

#!/bin/bash

#Iterate until the network connectivity is available
while true; do

#Prompt network check message
echo -ne "${BLUE}[INFO]:${NO_COLOR} Checking internet connection...";

#Check network connectivity
wget -q --tries=10 --timeout=20 --spider http://google.com

if [ "$?" == "0" ]; then
	echo -ne "${GREEN} You are connected to internet!${NO_COLOR}\n${BLUE}[INFO]:${NO_COLOR}";
	exit 0;
else
	echo -ne "${RED}You are not connected to internet!${NO_COLOR}\n${RED}[Error]:${NO_COLOR} This script needs internet connection to continue.\n";
	su root -c "bash configure_interfaces.sh";
fi

done

