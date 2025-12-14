route del default gw 192.168.9.7
route add -net 161.246.5.0 netmask 255.255.255.0 gw 192.168.9.7
ifconfig eth0:1 10.9.0.2 netmask 255.255.255.0
