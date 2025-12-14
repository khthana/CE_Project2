address=$1
function send_ICMP {
	./client $address -i
	ch=$?
	case "$ch" in
		0) sleep 3
		   ./ICMP_types $address $address 1 210
		   sleep 5
		   ./client $address -x
		   ./menu_tool.sh $address
		   ;;
		*) echo -n"

	Can't send to server. Please try again.

	press any key."
		   read n
	           ./menu_tool.sh $address
		   ;;
	esac

}
clear
echo -n "
	##################################################################
	##								##
	##			Firewall Analysis Tool			##
	##################################################################
	##								##
	##								##
	##	1. Test Open service Port				##
	##								##
	##      2. Test Detect Performance with Denial of Service (DoS)	##
	##								##
	##	3. Test Type&code ICMP					##
	##								##
	##	4. Exit							##
	##								##
	##################################################################

	Please select the choice from menu : "
read choice
case "$choice" in
	1) ./check_service.sh $address
	   ;;
	2) ./send_attack.sh $address
	   ;;
	3) send_ICMP 
	   ;;
	4) ./client $address -q
	   exit 0
	   ;;
	*) ./menu_tool.sh $address
	   ;;
esac
	
