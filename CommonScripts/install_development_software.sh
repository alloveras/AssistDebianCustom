#!/bin/bash

echo -ne "${BLUE}[INFO]:${NO_COLOR} Installing basic software packages for developers...";

su root -c "apt-get -y --force-yes install linux-headers-$(uname -r) build-essential checkinstall make automake cmake autoconf git git-core";
