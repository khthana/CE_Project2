#/bin/bash

iptables -F;
pkill snort_inline;
iptables-restore < iptable.rule;
snort_inline -Q -D -d -c /etc/snort_inline/snort_inline.conf -l /var/log/snort_inline/ -t /var/log/snort_inline/ -i eth0
