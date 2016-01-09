#!/bin/bash

function configure_wireless(){

	echo -ne "${BLUE}[INFO]:${NO_COLOR} Scanning Wireless networks...\n";

	#Check if the interface is declared as known interface
	cat /etc/network/interfaces | grep -i "$1" > /dev/null;
	
	#If is not registered, add it tho the interfaces file
	if [ "$?" == "1" ]; then
		echo -ne "iface $1 inet dhcp\n" >> /etc/network/interfaces;
	fi

	#Turn up the interface to allow scanning networks
	ifup $1 2> /dev/null;

	#Scan networks and parse results
	iwlist $1 scan > data.txt;
	cat data.txt | grep -i ESSID: | sed 's/ESSID:\"//' | sed 's/\"//' | awk '{out=$1; for(i=2;i<=NF;i++){out=out" "$i}; print out}' > networks_names.txt;
	cat data.txt | grep -i "Encryption key:" | sed 's/Encryption key://' | awk '{out=$1; for(i=2;i<=NF;i++){out=out" "$i}; print out}' > networks_encryptions.txt;
	
	#Read the scanned wireless networks and encryptions
	readarray names < networks_names.txt;
	readarray encryptions < networks_encryptions.txt;
	
	#Remove temporal files
	rm -rf data.txt;
	rm -rf networks_names.txt;
	rm -rf networks_encryptions.txt;
	
	#Print the networks allowing the user to choose
	echo -e "\n";
	for i in "${!names[@]}"; do
		is_encrypted=`echo ${encryptions[${i}]}`;
		net_name=`echo ${names[${i}]}`; 
  		if [ "$is_encrypted" == "on" ]; then
			echo -ne "$net_name - [Encrypted]\n";
		else
			echo -ne "$net_name - [Open]\n";
		fi
	done
	echo -e "\n";

	#Ask the user to choose which network to connect
	echo -ne "${BLUE}[INFO]:${NO_COLOR} Please enter the wireless network details:\n"
	echo -ne "ESSID: ";
	read ssid;
	echo -ne "Key (leave blank for open networks): "
	read -s key
	
	#Configure the interface and change its status to UP
	echo -ne "\n\n${BLUE}[INFO]:${NO_COLOR} Configuring "$1" interface...";
	
	#Shutdown the interface
	ifdown $1 2> /dev/null;
	
	#Remove previous occurrences of the interface in the interfaces files
	cat /etc/network/interfaces | grep -v $1 | grep -v wireless-key | grep -v wpa-ssid | grep -v wpa-psk >/etc/network/interfaces.bak;
	echo -ne "iface $1 inet dhcp\n" >> /etc/network/interfaces.bak;
	echo -ne "\twpa-ssid $ssid\n" >> /etc/network/interfaces.bak;
	
	#If user typed a network key, attatch it to network configuration files
	if [ ! -z "$key" ]; then
		echo -ne "\twpa-psk $key\n" >> /etc/network/interfaces.bak;
		echo -ne "\twireless-key3 s:$key\n" >> /etc/network/interfaces.bak;
	fi

	#Rename the backup file and clear it
	mv /etc/network/interfaces.bak /etc/network/interfaces;
	rm -rf /etc/network/interfaces.bak;
	
	#Start the interface with all the changes applied
	ifup $1 2> /dev/null;
	
	echo -ne "${Green} Configured!\n";
}

function configure_mobile(){

	echo -ne "${BLUE}[INFO]:${NO_COLOR} Configuring "$1" interface...";

	configured=`cat /etc/network/interfaces | grep -i "$1"`;

	echo -ne "${GREEN} Configured!${NO_COLOR}\n";

}

function configure_ethernet(){

	echo -ne "${BLUE}[INFO]:${NO_COLOR} Configuring "$1" interface...";


	ifdown $1 2> /dev/null;
	
	cat /etc/network/interfaces | grep -v $1 > /etc/network/interfaces.bak;
	echo -ne "iface $1 inet dhcp\n" >> /etc/network/interfaces.bak;
	mv /etc/network/interfaces.bak /etc/network/interfaces
	
	ifup $1 2> /dev/null;
	
	echo -ne "${GREEN} Configured!${NO_COLOR}\n";

}

function configure_interface(){
	if [[ $1 == wlan* ]]; then
		configure_wireless $1;
	elif [[ $1 == eth* ]];then
		configure_ethernet $1;
	else 
		echo -ne "${RED}[Error]:${NO_COLOR} This kind of interface is not supported by the script.\n";
	fi
}

#Get list of interfaces
ip -o link show | awk {'print $2'} | sed 's/:$//' | grep -v lo > interfaces.txt;

readarray interfaces < interfaces.txt;

while [ "$option" != "exit" ]; do
	
	echo -ne "${BLUE}[INFO]:${NO_COLOR} Choose which interface you'd like to configure\n\n";
	
	counter=0;	

	for i in "${interfaces[@]}"
	do
		echo -ne "$counter - $i"
		let counter=counter+1;
	done
		
	echo -ne "\nInterface number or \"exit\" to quit: "
	read option;

	if [ "$option" == "exit" ]; then
		break;
	fi

	if ! [ "$option" -eq "$option" ] 2> /dev/null; then
		echo -ne "${RED}[Error]:${NO_COLOR} The option must be an integer value!\n";	
	elif [ $option -ge 0 ] && [ $option -lt ${#interfaces[@]} ]; then
		configure_interface ${interfaces[${option}]};		
	else
		echo -ne "${RED}[Error]:${NO_COLOR} The number does not match any interface!\n";	
	fi

done

#Remove interfaces file
rm -rf interfaces.txt
