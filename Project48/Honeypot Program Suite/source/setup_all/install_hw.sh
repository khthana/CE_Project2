#!/bin/bash
#
# Copyright: ISAG Honeypot Program Suite Project <zeek.isag@gmail.com>
# NAME: Redirect_Table_Menu.sh
# VERSION: 1
# PURPOSE: Honeywall configuration
# Programmer: Mr.Tanawach Limpadtanachai
 
i=0;
j=0;

cp -f honeywall/ssh/authorized_keys /root/.ssh/ 
cp -f honeywall/ssh/id_rsa /root/.ssh/ 
mkdir /root/daemon_cage/ 
mkdir /root/shadow/
mkdir /root/snort/
mkdir /root/honey/
cp -f honeywall/daemon_cage/check_daemon.c /root/daemon/
cp -f honeywall/daemon_cage/honey /root/honey/
cp -f honeywall/shadow/shadow_old /root/
cp -f honeywall/daemon_cage/s2i_v2 /root/ 
cp -f honeywall/snort/iptable.rule /root/snort/
cp -r honeywall/snort/start_snort.sh /root/snort/
cp -r honeywall/snort/start_snort.sh /root/snort/
cp -r honeywall/snort/start_snort.sh /root/snort/


(while [ $j != 100 ]; do
{
 i=`expr $i + 1` ;
 j=`expr $i / 2`;
 echo $j
}
done)| /usr/bin/dialog --stdout  --shadow --no-cancel \
       --backtitle "ISAG HONEYPOT PROGRAM SUITE 2006" \
       --title "ISAG Honeypot Program suite 2006 Installation" \
       --gauge "Now Installing Honeywall" 6 40 0;



