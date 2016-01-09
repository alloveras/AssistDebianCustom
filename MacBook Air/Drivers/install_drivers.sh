#!/bin/bash

echo -e "${BLUE}[INFO]:${NO_COLOR} Installing device drivers...";

cd "BroadCom_Wifi";

#Install OpenSSL Library
su root -c "dpkg -i openssl_1.0.1k-3+deb8u2_amd64.deb";

#Install WPA Suplicant Library
su root -c "dpkg -i wpasupplicant_2.3-1+deb8u3_amd64.deb";

#Install Intel Wifi Driver
su root -c "dpkg -i firmware-brcm80211_0.43_all.deb"

#Load the kernel modules for the driver
su root -c "modprobe -r brcm80211";
su root -c "modprobe brcm80211";
cd "../";

#Configure Wireless Connection
cd "../../CommonScripts";
su root -c "bash check_connectivity.sh";
cd "../MacBook Air/Drivers";

echo -e "${BLUE}[INFO]:${GREEN} Device drivers installed!${NO_COLOR}";


