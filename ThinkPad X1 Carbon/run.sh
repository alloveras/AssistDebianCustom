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
su root -c "bash install_vim.sh";

#Install TLP and do some power optimizations
su root -c 'echo "deb http://repo.linrunner.de/debian stretch main" >> /etc/apt/sources.list';
su root -c "apt-key adv --keyserver pool.sks-keyservers.net --recv-keys CD4E8809";
su root -c "apt-get update";
su root -c "apt-get -y --force-yes install tlp tlp-rdw";
su root -c "apt-get -y --force-yes install tp-smapi-dkms acpi-call-dkms";

su root -c "bash allow_gnome_manage_interfaces.sh";
