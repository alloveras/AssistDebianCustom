################################################################
# File: run.sh
# Author: Albert Lloveras Carbonell (albert@assist.ai)
# Date: 09/01/2015
# Description: MacBook Air entry point for Assist's Debian
# customization.
# License: Copyright Assist AI
################################################################

#!/bin/bash

#Install MacBook Air device drivers
cd Drivers;
su root -c "bash install_drivers.sh";
cd ../;

#Configure Wireless Connection
cd "../CommonScripts";
su root -c "bash check_connectivity.sh";
cd "../MacBook Air";

cd ../CommonScripts;
su root -c "bash install_gnome3.sh";
su root -c "bash update_to_stretch.sh";
su root -c "bash install_development_software.sh";
su root -c "bash install_paper_theme.sh";
su root -c "bash install_numix_icons.sh";
