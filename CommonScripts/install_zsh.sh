################################################################
# File: install_zsh.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that installs Oh My Zsh terminal and makes
# it the default terminal for the current user. Furthermore, it
# also installs the Powerline patched fonts that are required to
# use the agnoster theme on zsh.
# License: MIT
################################################################

#!/bin/bash

#Install the needed OS packages
echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing oh-my-zsh tuned with powerline fonts...\n";
apt-get -y --force-yes install build-essential cmake git golang python-dev vim vim-nox zsh rake;

#Install PIP
wget https://bootstrap.pypa.io/get-pip.py;
python get-pip.py;
rm -rf get-pip.py;

#Install CTAGS
mkdir ctags;
cd ctags;
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz;
tar xzvf ctags-5.8.tar.gz;
cd ctags-5.8;
./configure;
make;
make install;
cd ../../;
rm -rf ctags;

#Install Powerline tuned fonts
su $current_user -c "rm -rf ~/.fonts";
su $current_user -c "mkdir ~/.fonts";
su $current_user -c "wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf";
su $current_user -c "mv PowerlineSymbols.otf ~/.fonts/PowerlineSymbols.otf";
su $current_user -c "fc-cache -f -v";
su $current_user -c "wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf";
su $current_user -c "mkdir -p ~/.config/fontconfig/fonts.conf";
su $current_user -c "mv 10-powerline-symbols.conf ~/.config/fontconfig/fonts.conf/10-powerline-symbols.conf";

#Install solarized theme on gnome terminal
rm -rf /tmp/Solarized;
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git /tmp/Solarized;
su $current_user -c "bash /tmp/Solarized/install.sh";


#Install Oh-My-Zsh and change the user's default terminal.
su $current_user -c "rm -rf ~/.oh-my-zsh";
su $current_user -c "git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh";
chsh -s /bin/zsh "$current_user";

#Copy the .zshrc file to user's home
su $current_user -c "cp .zshrc ~/.zshrc";

echo -ne "${BLUE}[INFO]:${GREEN} Oh-my-zsh tuned with powerline fonts was successfully installed!${NO_COLOR}\n";
