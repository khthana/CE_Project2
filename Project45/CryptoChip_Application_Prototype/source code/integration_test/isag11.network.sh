route del default gw 161.246.5.254
route del default gw 161.246.5.1
ifconfig eth0:1 10.6.0.11 netmask 255.255.255.0
route add default gw 10.6.0.1
