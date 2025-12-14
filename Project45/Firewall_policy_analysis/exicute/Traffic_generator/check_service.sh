address=$1
clear
echo -n " 
	##################################################################
	##								##
	##			Firewall Analysis Tool			##
	##################################################################
	##								##
	##								##
	##	1. Check Open service with Protocol TCP			##
	##								##
	##	2. Check Open service with Protocol UDP			##
	##								##
	##	3. Back to Home						##
	##								##
	##								##
	##################################################################

	Please select the choice from menu : "
read choice
case "$choice" in
	1) ./send.sh 1 $address
	   ;;
	2) ./send.sh 2 $address
	   ;;
	3) ./menu_tool.sh $address
	   ;;
	*) ./check_service.sh $address
	   ;;
esac
