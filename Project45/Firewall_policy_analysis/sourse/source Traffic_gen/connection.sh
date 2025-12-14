function check_connection {
	clear
	./connect_2_server "$Address"
	conn_s=$?
	case "$conn_s" in
		0) ./menu_tool.sh $Address
		   exit 0
		   ;;
		*)  cont
		    ;;
#		*)  echo "I don't know"
		#   ;;
	esac
}
function cont {
	clear
	echo -n "
	
	You can't connect this Destination address.

	
	Do you want to continue (y/n)? : "
read ans
case "$ans" in
	y|Y) clear
	     ./connection.sh
	     exit 0
	     ;;
	n|N) exit 0
	     ;;
	*)   cont
	     ;;
esac
}
clear
echo -n "





	==================================================================
	==								==
	==			Firewall Analysis tool			==
	==================================================================

	Please Set IP address of Destination address : "

read Address
#echo "Address value : $Address"
./check_address "$Address"
check=$?
echo "Check value : $check"
case "$check" in
	1) cont
	   ;;
	2) check_connection
	   ;;
esac
