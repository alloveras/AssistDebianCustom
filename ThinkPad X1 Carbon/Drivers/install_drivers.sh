#!/bin/bash

echo -e "${BLUE}[INFO]:${NO_COLOR} Installing device drivers...";

#Install OpenSSL Library
su root -c "dpkg -i openssl_1.0.1k-3+deb8u2_amd64.deb";

#Install WPA Suplicant Library
su root -c "dpkg -i wpasupplicant_2.3-1+deb8u3_amd64.deb";

#Install Intel Wifi Driver
su root -c "dpkg -i firmware-iwlwifi_0.43_all.deb"

#Load the kernel modules for the driver
su root -c "modprobe -r iwlwifi";
su root -c "modprobe iwlwifi";

echo -e "${BLUE}[INFO]:${GREEN} Device drivers installed!${NO_COLOR}";


