#!/bin/bash

#Download and Install the Paper Theme
echo -ne "${BLUE}[INFO]:${NO_COLOR} Downloading Paper Theme...\n";
rm -rf /tmp/PaperTheme;
git clone https://github.com/snwh/paper-gtk-theme.git /tmp/PaperTheme;

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Paper Theme...\n";

current_path=`pwd`;

cd /tmp/PaperTheme;
su root -c "bash install.sh < Y" 2> /dev/null;
cd $current_path;

echo -ne "${BLUE}[INFO]:${GREEN} Paper theme installed!${NO_COLOR}\n";

echo -ne "${BLUE}[INFO]:${NO_COLOR} Setting Paper Theme as default theme for user $current_user...${NO_COLOR}\n";
su $current_user -c "gsettings set org.gnome.desktop.interface gtk-theme 'Paper'";
su $current_user -c "gconftool-2 --set --type string /apps/metacity/general/theme 'Paper'";
su $current_user -c "gsettings set org.gnome.shell.extensions.user-theme name 'Paper'";

echo -ne "${BLUE}[INFO]:${GREEN} Paper Theme installed!${NO_COLOR}\n";
