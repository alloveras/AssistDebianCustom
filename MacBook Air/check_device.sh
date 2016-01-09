#!/bin/bash

manufacturer=`cat /sys/devices/virtual/dmi/id/sys_vendor`;
model_name=`cat /sys/devices/virtual/dmi/id/board_version`;
script_version=`cat version.txt`;

if [ "$manufacturer" == "Apple Inc." ] && [ "$model_name" == "MacBookAir5,1" ]; then
	export manufacturer;
	export model_name;
	export script_version;	
	export device_match="true";
fi
