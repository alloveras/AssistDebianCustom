#!/bin/bash

echo -e "${BLUE}[INFO]:${NO_COLOR} Installing device drivers...";

cd "Intel_Wifi";

#Install OpenSSL Library
su root -c "dpkg -i openssl_1.0.1k-3+deb8u2_amd64.deb";

#Install WPA Suplicant Library
su root -c "dpkg -i wpasupplicant_2.3-1+deb8u3_amd64.deb";

#Install Intel Wifi Driver
su root -c "dpkg -i firmware-iwlwifi_0.43_all.deb"

#Load the kernel modules for the driver
su root -c "modprobe -r iwlwifi";
su root -c "modprobe iwlwifi";
cd "../";

#Configure Wireless Connection
cd "../../CommonScripts";
su root -c "bash check_connectivity.sh";
cd "../ThinkPad X1 Carbon/Drivers";

#Install Intel Graphics HD 4000 drivers
su root -c "apt-get -y --force-yes install xserver-xorg-video-intel";

su root -c "apt-get -y --force-yes install mesa-utils mesa-utils-extra libegl1-mesa libegl1-mesa-drivers libgl1-mesa-dri libglapi-mesa libgles1-mesa libgles2-mesa libglu1-mesa mesa-vdpau-drivers libtxc-dxtn-s2tc0 libtxc-dxtn-s2tc-bin uuid-runtime";

echo -e "${BLUE}[INFO]:${GREEN} Device drivers installed!${NO_COLOR}";

