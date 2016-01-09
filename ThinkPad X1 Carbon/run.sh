################################################################
# File: config.sh
# Author: Albert Lloveras Carbonell (albert@assist.ai)
# Date: 08/01/2015
# Description: Lenovo ThinkPad X1 Carbon entry point for Assist's
# Debian customization.
# License: Copyright Assist AI
################################################################

#!/bin/bash

#Install machine drivers
cd Drivers;
su root -c "bash install_drivers.sh"
cd ../;

#Configure Wireless Connection
cd "../CommonScripts";
su root -c "bash check_connectivity.sh";
cd "../ThinkPad X1 Carbon";

