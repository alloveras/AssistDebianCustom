#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing Vim editor customized...\n";

su $current_user -c "git clone https://github.com/rfguri/vimfiles.git ~/.vim";
su $current_user -c "cd ~/.vim; rake; bash bundle/ycm/install.sh --clang-completer";

echo -ne "${BLUE}[INFO]:${GREEN} Vim installed successfully!${NO_COLOR}\n";

