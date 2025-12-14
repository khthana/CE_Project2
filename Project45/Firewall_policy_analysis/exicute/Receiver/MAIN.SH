# THIS IS MAIN PROGRAM
	clear
echo "Start Program"
	./xcls_all
	./xcls_f dos.temp
	./xserver &
	c=9	# Don't care signal
	t=0	# For check TCP
	u=0	# For check UDP
	i=0	# For check ICMP
	d=0	# For check DoS
while (test $c != 8)	# exit signal
do
	./xcheck
	c=$?
	if (test $c = 0) 	# stop signal
	then
		killall xcap
		sleep 1
		clear
		echo "Wait Command"
	elif (test $c = 1) 	# tcp signal
	then
		./xcls_f tcp.cap
		./xcap tcp &
		t=1
	elif (test $c = 2)	# udp signal
	then
		./xcls_f udp.cap
		./xcap udp &
		u=1
	elif (test $c = 3)	# icmp signal
	then
		./xcls_f icmp.cap
		./xcap icmp &
		i=1
	elif (test $c = 4)	# land attack signal
	then
		./xdos_count 1
		./xdcap &
		d=1
	elif (test $c = 5)	# teardrop attack signal
	then
		./xdos_count 2
		./xdcap &
		d=1
	elif (test $c = 6) 	# jolt attack signal
	then
		./xdos_count 3
		./xdcap &
		d=1
	elif (test $c = 10) 	# winf attack signal
	then
		./xdos_count 4
		./xdcap &
		d=1
	elif (test $c = 7) 	# stop dos signal
	then
		killall xdcap
		sleep 1
		clear
		echo "Wait Command"
	fi
done

	killall xserver
	clear
echo "Start checking"
if (test $t = 1)
then
	./xat
fi
if (test $u = 1)
then
	./xau
fi
if (test $i = 1)
then
	./xai
fi
if (test $d = 1)
then
	./xad
	cat dos.rep >> dos.temp
fi
	sleep 1
clear
echo "Finish Start Program!!!"
function view {
clear
echo -n "
	##########################################################################
	##									##
	##		View Report from Test open service port			##
	##########################################################################
	##									##
	##	1. Report open service port Protocol TCP			##
	##									##
	##	2. Report open service port Protocol UDP			##
	##									##
	##	3. Report open service type code  Protocol ICMP			##
	##									##
	##	4. Report Test Performance detect DoS				##
	##									##
	##	5. exit								##
	##									##
	##########################################################################

	Please select choice that you want :"
	read answer
	case "$answer" in
		1) vi tcp.rep
		   view
		   ;;
		2) vi udp.rep
		   view
		   ;;
		3) vi icmp.rep
		   view
		   ;;
		4) vi dos.temp
		   view
		   ;;
		5) exit 0
		   ;;
		*) view
		   ;;
	esac
}
view
