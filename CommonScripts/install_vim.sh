################################################################
# File: install_vim.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that install Vim editor with a set of 
# plugins that will boost up your productivity as developer.
# License: MIT
################################################################

#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Vim editor customized...\n";

su $current_user -c "git clone https://github.com/rfguri/vimfiles.git ~/.vim";
su $current_user -c "cd ~/.vim; rake; bash bundle/ycm/install.sh --clang-completer";

echo -ne "${BLUE}[INFO]:${GREEN} Vim installed successfully!${NO_COLOR}\n";

