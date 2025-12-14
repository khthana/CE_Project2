#!/bin/bash
#
# Copyright: ISAG Honeypot Program Suite Project <zeek.isag@gmail.com>
# NAME: Redirect_Table_Menu.sh
# VERSION: 1
# PURPOSE: Honeywall configuration
# Programmer: Mr.Tanawach Limpadtanachai
 
i=0;
j=0;

mkdir /root/daemon/ 
cp -f logserver/daemon_log/check_daemon.c /root/daemon/
cp -f logserver/update_db.php /root/
cp -f logserver/dbconnect.php /root/
cp -f logserver/daemon_log/honeypot /root/daemon/


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



