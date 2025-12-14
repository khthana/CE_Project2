#include<sys/types.h>
#include<sys/socket.h>
#include<stdio.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<unistd.h>
#include<signal.h>
#include<string.h>
#include<netdb.h>
#include<sys/types.h>
#include<sys/socket.h>

int main()
{
	u_long src_addr;
	int server_sock_fildes, client_sock_fildes;
	int server_addrlen, client_addrlen;
	struct sockaddr_in server_address;
	struct sockaddr_in client_address;

	// Create socket for server
	server_sock_fildes = socket(AF_INET, SOCK_STREAM, 0);

	// Get data for socket
	server_address.sin_family = AF_INET;
	server_address.sin_addr.s_addr = htonl(INADDR_ANY);
	server_address.sin_port = htons(5555);
	server_addrlen = sizeof(server_address);
	bind(server_sock_fildes, (struct sockaddr *)&server_address,server_addrlen);

	// Create queue and waiting for connection 
	listen(server_sock_fildes, 5);
//#	signal(SIGCHLD, SIG_IGN);

	while(1) {
		char ch;

		printf("server waiting\n");

		// If have client connect 
		client_sock_fildes = accept(server_sock_fildes, (struct sockaddr*)&client_address, &client_addrlen);

		src_addr = ntohl(client_address.sin_addr.s_addr);
		printf("%ld\n",src_addr);
		//fork server process and test to do "that is fork process?"
//#		if(fork() == 0) {
			// if yes
			read(client_sock_fildes, &ch, 1);
//#			sleep(5);
			ch++;
			write(client_sock_fildes, &ch, 1);
			close(client_sock_fildes);
			exit(0);
//#		}
//#		else {
//#			close(client_sock_fildes);
//#		}
	}
}

