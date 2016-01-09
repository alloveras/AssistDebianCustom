#!/bin/bash

#Install MacBook Air device drivers
cd Drivers;
su root -c "dpkg -i openssl_1.0.1k-3+deb8u2_amd64.deb";
su root -c "dpkg -i wpasupplicant_2.3-1+deb8u3_amd64.deb";
#su root -c "dpkg -i firmware-brcm80211_0.43_all.deb";
cd ../;

#Configure Wireless Connection
cd "../CommonScripts";
su root -c "bash check_connectivity.sh";
cd "../MacBook Air";

