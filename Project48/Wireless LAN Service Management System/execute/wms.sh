#!/bin/sh

ifconfig eth1 down
/etc/init.d/httpd start
/etc/init.d/radiusd start
/usr/sbin/chilli -c /etc/chilli.conf --coaport 3799 --coanoipcheck
ifconfig eth1 192.168.182.2

echo "Start Wireless Management System Completed"
echo "Please go to http://127.0.0.1/manage.php in web browser"