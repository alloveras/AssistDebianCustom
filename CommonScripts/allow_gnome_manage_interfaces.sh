#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Allowing Gnome3 manage network interfaces...\n";

su root -c "cp interfaces.managed /etc/network/interfaces";
su root -c "cp NetworkManager.managed /etc/NetworkManager/NetworkManager.conf";

echo -ne "${BLUE}[INFO]:${GREEN} Network interfaces are now managed by Gnome3!${NO_COLOR}\n";




