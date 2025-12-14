#include <stdio.h>
#include <unistd.h>

void main(int argc, char *argv[])
{
	system("gcc -c func_gen.c tcpreplay.c timer.c cache.c cidr.c do_packets.c list.c xX.c err.c signal_handler.c edit_packet.c replay_live.c fakepoll.c utils.c fakepcapnav.c tcpdump.c capture.c ");
	system("gcc -o isag_gen main.c func_gen.o tcpreplay.o timer.o cache.o cidr.o do_packets.o list.o xX.o err.o signal_handler.o edit_packet.o replay_live.o fakepoll.o utils.o fakepcapnav.o tcpdump.o capture.o  -lrt -lnsl  -lnet -L/usr/local/lib -lpcap -lpthread");
	//return 0;
}
