/*This program is Server program for receive Command from client
 *Compile by -o xserver 
 *This program will write data to sender.con for xcheck will change it to be signal
 */

#include<sys/types.h>
#include<sys/socket.h>
#include<stdio.h>
#include<sys/un.h>
#include<unistd.h>
#include<netinet/in.h>
#include<arpa/inet.h>

void file_write(char *data)
{
	FILE *file_out;

	file_out = fopen("sender.con","w");
	fprintf(file_out,"%s",data);
	fclose(file_out);
}

int main()
{
	int server_sock_file,client_sock_file;
	int server_addlen,client_addlen;
	char temp1 = '\0';
	int count = 0;
	char data[20];
	struct sockaddr_in server_property,client_property;

	server_sock_file = socket( AF_INET, SOCK_STREAM, 0);
	
	server_property.sin_family =  AF_INET;
	server_property.sin_port =  htons(5555);
	server_property.sin_addr.s_addr = htonl(INADDR_ANY);

	server_addlen =  sizeof(server_property);
	
	bind(server_sock_file, (struct sockaddr *) &server_property, server_addlen);

	listen(server_sock_file,1);
	
	printf("\n......server wait.......\n");
	while(1){
	

		client_sock_file = accept (server_sock_file, (struct sockaddr *) &client_property, &client_addlen);

		printf("\n!! Connect from client !!\n");
		count = 0;	
		while(temp1 != '@')
		{
			read(client_sock_file, &temp1, 1);
				if (temp1 == 'z')
					break;
				
				
				if (temp1 != '@')
					{ data[count] = temp1;}
				else
					{ data[count] = '\0';}
				count++;
	
		}
		if (temp1 == 'z')
		{
			close(client_sock_file);
			printf("\n.....Check First step OK !!.......\n");

		}
		else{
			temp1 = '\0';	
			printf("\n DATA IS :%s \n",data);
	 		fflush(stdout);	
			file_write(data);
			close(client_sock_file);
		}
		if (strcmp(data,"$exit$") == 0)
			{return 0;}
		
	}
	return 0;
}
