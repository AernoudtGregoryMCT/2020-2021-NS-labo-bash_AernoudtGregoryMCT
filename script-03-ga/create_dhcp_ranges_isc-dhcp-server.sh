#!/bin/bash

#DHCP
#Package: isc-dhcp-server
#ISC = Internet Systems Consortium -https://www.isc.org/mission/
#----------------------------------------------------------------

port="67"
IPTABLES_dest="192.168.100.40"
ens_interfaces="ens34"

sudo apt install isc-dhcp-server 

#System-wide host-specific configuration file → /etc/default/isc-dhcp-server
#Example config

#/default/isc-dhcp-server :
INTERFACESv4=$ens_interfaces

#/etc/dhcp/dhcpd.conf :
conigfile=$(cat dhcp-ranges.txt)

echo "$conigfile" >> /etc/dhcp/dhcpd.conf

#Allow DHCP server in IPTABLES
sudo iptables -A INPUT -p UDP -d $IPTABLES_dest -m
state --state NEW -m udp --dport=$port -j ACCEPT

# Restart(reload) ISC-DHCP server
sudo systemctl restart isc-dhcp-server.service