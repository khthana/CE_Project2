#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<errno.h>
#include<string.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<sys/wait.h>
#include<signal.h>

//#define MYPORT 1170 
//#define MAXDATASIZE 100
//#define BACKLOG 10

void sigchld_handler(int s)
{
	while(wait(NULL) >0);
}
void splitaddr(char *in,char *addr,char *user)
{
	int len,i;
	char *temp;
	len=strlen(in);
	for(i=0;i<len;i++)
	{
		if(*in==':')
		{
			in++;
			temp=in;
			len=strlen(in);
			for(i=0;i<len;i++)
			{
				if(*temp=='\r'){*temp='\0';break;}
				else{temp++;};
			}
			strcpy(addr,in);
			break;
		}
		else
		{
			strncat(user,in,1);
			in++;
		}
	};
}
/*
int main(void)
{
	int sockfd,new_fd;
	struct sockaddr_in my_addr;
	struct sockaddr_in their_addr;
	int sin_size;
	struct sigaction sa;
	int yes=1;
	char buf[MAXDATASIZE];
	char *user=(char*)malloc(sizeof(char*));
	char *addr=(char*)malloc(sizeof(char*));

	if ((sockfd=socket(AF_INET,SOCK_STREAM,0))== -1)
	{
		perror("socket");
		exit(1);
	}

	if(setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR,&yes,sizeof(int))==-1)
	{
		perror("setsockopt");
		exit(1);
	}

	my_addr.sin_family = AF_INET;
	my_addr.sin_port = htons(MYPORT);
	my_addr.sin_addr.s_addr =INADDR_ANY;
	memset(&(my_addr.sin_zero),'\0',8);

	if (bind(sockfd, (struct sockaddr *)&my_addr, sizeof(struct sockaddr))==-1)
	{
		perror("bind");
		exit(1);
	}

	if (listen(sockfd, BACKLOG)==-1)
	{
		perror("listen");
		exit(1);
	}

	sa.sa_handler = sigchld_handler;
	sigemptyset(&sa.sa_mask);
	sa.sa_flags = SA_RESTART;
	if(sigaction(SIGCHLD, &sa,NULL)==-1)
	{
		perror("sigaction");
		exit(1);
	}
	while(1)//main accept() loop
	{
		sin_size = sizeof(struct sockaddr_in);
		if((new_fd = accept(sockfd, (struct sockaddr *)&their_addr,&sin_size))==-1)
		{
			perror("accept");
			continue;
		}
		printf("server : got action from %s\n",inet_ntoa(their_addr.sin_addr));
		if(!fork())
		{
			close(sockfd);
			printf("reading ..");
			if(recv(new_fd, buf, MAXDATASIZE-1, 0)==-1)perror("recive");
			printf("server: got string :%s\n",buf);
			splitaddr(buf,addr,user);
			printf("user : %s address : %s\n");
			//read username and address
				//create thread that id is the address
			close(new_fd);
			exit(0);
		}
		close(new_fd);
	}
	return 0;
}*/
