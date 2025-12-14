#/bin/bash

pkill snort_inline;
modprobe ip_queue;

iptables -F ;
iptables-restore < iptable.rule;

snort_inline -D -Q  -d -v -c /etc/snort_inline/snort_inline.conf -l /var/log/snort_inline/ -t /var/log/snort_inline/ -i eth0 ;

echo 1 > /usr/local/start.txt
