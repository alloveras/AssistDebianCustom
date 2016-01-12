################################################################
# File: allow_gnome_manage_interfaces.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that switch the network configuration from
# manual mode to automatic. After running this script, Gnome3 
# will take the responsability of managing all your computer's
# network interfaces.
# License: MIT
################################################################

#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Allowing Gnome3 manage network interfaces...\n";

su root -c "cp interfaces.managed /etc/network/interfaces";
su root -c "cp NetworkManager.managed /etc/NetworkManager/NetworkManager.conf";

echo -ne "${BLUE}[INFO]:${GREEN} Network interfaces are now managed by Gnome3!${NO_COLOR}\n";




