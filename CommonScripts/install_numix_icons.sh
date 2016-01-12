################################################################
# File: install_numix_icons.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that installs the Numix Icons Theme combination
# to provide a more user-friendly icons across the Gnome3 user interface.
# License: MIT
################################################################

#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Downloading Numix Circle Icons Theme...\n"

rm -rf /tmp/NumixTheme;
rm -rf /opt/numix-folders;
rm -rf /tmp/NumixBase;
git clone https://github.com/numixproject/numix-icon-theme.git /tmp/NumixBase;
git clone https://github.com/numixproject/numix-icon-theme-circle.git /tmp/NumixTheme;
git clone https://github.com/numixproject/numix-folders.git /opt/numix-folders;

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Numix Circle Icons Theme...\n";
su root -c "cp -R /tmp/NumixTheme/Numix-Circle-Light /usr/share/icons/";
su root -c "cp -R /tmp/NumixTheme/Numix-Circle /usr/share/icons/";
su root -c "cp -R /tmp/NumixBase/Numix /usr/share/icons/";
su root -c "cp -R /tmp/NumixBase/Numix-Light /usr/share/icons/";

su $current_user -c "gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle-Light'";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Numix Folders Theme...\n";

cd /opt;
cp numix-folders/numix-folders.desktop /usr/share/applications/
cd /usr/bin/;
touch numix-folders
echo $'#!/bin/bash\ncd /opt/numix-folders && ./numix-folders "$1"' > numix-folders
chmod +x numix-folders

echo -ne "${BLUE}[INFO]:${GREEN} Numix Circle Icons theme installed!${NO_COLOR}\n";
