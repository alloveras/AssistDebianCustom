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
