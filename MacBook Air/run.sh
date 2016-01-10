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
su root -c "bash install_additional_software.sh";
su root -c "bash install_zsh.sh";
su root -c "bash install_vim.sh";

#Install TLP and do some power optimizations
su root -c 'echo "deb http://repo.linrunner.de/debian stretch main" >> /etc/apt/sources.list';
su root -c "apt-key adv --keyserver pool.sks-keyservers.net --recv-keys CD4E"
su root -c "apt-get update";
su root -c "apt-get -y --force-yes install tlp tlp-rdw";
su root -c "bash allow_gnome_manage_interfaces.sh";

cd ../MacBook Air;

