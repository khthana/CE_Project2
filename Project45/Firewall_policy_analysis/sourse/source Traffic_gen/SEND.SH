check=$1
address=$2
min_port=0
max_port=65535
function check_spoof {
        clear
	echo -n "


	Do you want to spoof ip address (y/n) : "
	read spo
	case "$spo" in
	 	y|Y) spoof=1
		     ;;
		n|N) spoof=2
		     ;;
		*)   check_spoof
		     ;;
	esac
}
function insert_port {
	clear
	echo -n "


	A number port have length in 1 to 65535!!

	Please insert a number of port start : "
	read port_1
	echo -n "

	Please insert a number of port end   : "
	read port_2
	if [ $port_1 -gt $port_2 ]; then
		echo -n "


	Port that you insert is not valid.

	Press any key! "
		read n
		insert_port
	elif [ $port_1 -le $min_port ]; then
		echo -n "


	Port that you insert is not valid.

	Press any key!! "
		read n
		insert_port
	elif [ $port_2 -gt $max_port ]; then
		echo -n "


	Port that you insert is not valid.

	Press any key!!! "
		read n
		insert_port
	fi
}
function send_TCP {
	./client $address -t
	ch=$?
	case "$ch" in
		0) if (test $spoof = 1)
		   then
			sleep 3
			./TCP_types $address $address $port_1 $port_2
			sleep 5
			./client $address -x
			./check_service.sh $address		
		   elif (test $spoof = 2)
		   then
			sleep 3
			./TCP_unspoof $address $port_1 $port_2
			sleep 5
			./client $address -x
			./check_service.sh $address
		   fi
		   ;;
		*) echo -n "

	Can't send to server. Please try again.

	press any key."
		   read n
	           ./check_service.sh $address
		   ;;
	esac
}
function send_UDP {
	./client $address -u
	ch=$?
	case "$ch" in
		0) if (test $spoof = 1)
		   then
			sleep 3
		   	./UDP_types $address $address $port_1 $port_2
		   	sleep 5
		   	./client $address -x
		   	./check_service.sh $address
		   elif (test $spoof = 2)
		   then
		   	sleep 3
			./UDP_unspoof $address $address $port_1 $port_2
			sleep 5 
			./client $address -x
			./check_service.sh $address
		   fi
		   ;;
		*) echo -n"

	Can't send to server. Please try again.

	press any key."
		   read n
	           ./check_service.sh $address
		   ;;
	esac
}
check_spoof
insert_port
if (test $check = 1)
then
	send_TCP
elif (test $check = 2)
then
	send_UDP
fi
