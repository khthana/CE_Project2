#/bin/bash


pkill snort_inline;
iptables -F ;
echo 0 > /usr/local/start.txt;
