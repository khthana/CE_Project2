#!/bin/bash
#
# Copyright: ISAG Honeypot Program Suite Project <zeek.isag@gmail.com>
# NAME: Redirect_Table_Menu.sh
# VERSION: 1
# PURPOSE: Honeywall configuration
# Programmer: Mr.Tanawach Limpadtanachai
 
i=0;
j=100;

cp -f honeywall/ssh/authorized_keys /root/.ssh/ 

(while [ $i -lt $j ]; do
{
 i=`expr $i + 1` ;
 echo $i
}
done)| /usr/bin/dialog --stdout  --shadow --no-cancel \
       --backtitle "ISAG HONEYPOT PROGRAM SUITE 2006" \
       --title "ISAG Honeypot Program suite 2006 Installation" \
       --gauge "Now Installing Honeywall" 6 40 0;



