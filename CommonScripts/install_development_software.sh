################################################################
# File: install_development_software.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that installs basic development libraries,
# packages and compilers such as gcc, git, glibc...
# License: MIT
################################################################

#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing basic software packages for developers...";

#If anyone wants to install the i386 architecture support for cross-compiling purposes uncomment
#the following lines
#su root -c "dpkg --add-architecture i386 && apt-get update";
#su root -c "apt-get -y --force-yes install libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386";

#If anyone installed the i386 architecture support and wants to remove it execute the following commented
#commands
#su root -c "dpkg --remove-architecture i386";

su root -c "apt-get -y --force-yes install linux-headers-$(uname -r) build-essential checkinstall make automake cmake autoconf git git-core";
