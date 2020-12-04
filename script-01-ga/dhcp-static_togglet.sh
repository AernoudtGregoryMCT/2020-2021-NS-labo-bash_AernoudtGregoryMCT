#!/bin/env bash

echo "Please enter on for DHCP and off for static IP to continue"
read ip_togglet

echo $ip_togglet:" value is entered for the corresponding mode"
if [[ $ip_togglet == "on" ]]; 
then
	echo "Passing to ON state"
	echo "DHCP mode enabled !"
	eth="Ethernet"
	netsh interface ip set address $eth dhcp
	netsh interface ip set dns $eth dhcp
elif [[ $ip_togglet == "off" ]]; 
then
	echo "Passing to OFF state"
	echo "Static mode enabled !"
	eth="Ethernet"
	ip="192.168.0.201"
	mask="255.255.255.0"
	gw="192.168.0.1"
	dns1="1.1.1.1"
	dns2="8.8.8.8"
	netsh interface ip set address name = $eth static $ip $mask $gw
	netsh interface ip add dns $eth $dns1
	netsh interface ip add dns $eth $dns2 index=2
else
	echo "Please enter on for DHCP and off for static IP to continue"
fi
