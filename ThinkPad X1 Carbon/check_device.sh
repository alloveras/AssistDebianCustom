################################################################
# File: check_device.sh
# Author: Albert Lloveras Carbonell (albertlloveras@gmail.com),
# Roger Fernandez Guri (rfguri@gmail.com).
# Date: 08/01/2015
# Description: Script that checks if the system hardware matches
# with the Lenovo ThinkPad X1 Carbon hardware specification.
# License: MIT
################################################################

#!/bin/bash

manufacturer=`cat /sys/devices/virtual/dmi/id/sys_vendor`;
model_name=`cat /sys/devices/virtual/dmi/id/product_version`;
script_version=`cat version.txt`;

if [ "$manufacturer" == "LENOVO" ] && [ "$model_name" == "ThinkPad X1 Carbon" ]; then
	export manufacturer;
	export model_name;
	export script_version;
	export device_match="true";
fi
