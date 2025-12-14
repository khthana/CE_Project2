#include<stdio.h>
#include<string.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<sys/un.h>
#include<unistd.h>
#include<netinet/in.h>
#include<arpa/inet.h>
//#include<getopt.h>
//#include<stdlib.h>
#include<netdb.h>

int main(int argc, char *argv[])
{
	u_long src_addr, dst_addr;
	int sock_fildes;
	int addr_len;
	struct sockaddr_in address;
	
	int connect_res;
	char ch = 'z';

	// Create socket for client Process
	sock_fildes = socket(AF_INET, SOCK_STREAM, 0);

	// Get name for socket
	address.sin_family = AF_INET;
	address.sin_addr.s_addr = inet_addr(argv[1]);
	address.sin_port = htons(5555);
	addr_len = sizeof(address);

	// Connect to socket of server process
	connect_res = connect(sock_fildes, (struct sockaddr *)&address, addr_len);
	if(connect_res == -1) {
		perror("oops : client1");
		exit(1);
	}

	// Access to sock_fildes
	write(sock_fildes, &ch, 1);
//	read(sock_fildes, &ch, 1);
//	printf("char from server = %c\n", ch);
	close(sock_fildes);
	exit(0);
}
