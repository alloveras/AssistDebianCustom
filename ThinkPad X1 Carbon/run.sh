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

cd ../CommonScripts;
su root -c "bash install_gnome3.sh";
su root -c "bash update_to_stretch.sh";
su root -c "bash install_development_software.sh";
su root -c "bash install_paper_theme.sh";
su root -c "bash install_numix_icons.sh";
su root -c "bash install_additional_software.sh";
su root -c "bash install_zsh.sh";
