#include<stdio.h>
#include<fcntl.h>
#include<stdlib.h>
#include<unistd.h>
#include<errno.h>
#include<string.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<sys/wait.h>
#include<signal.h>
#include<time.h>
#include "exec.h"
#include "word.h"
#include "server.h"
#include "timestamp.c"

#define MYPORT 1170		// define port  
#define MAXDATASIZE 100		// define datasize
#define BACKLOG 10		// define log 
#define FILENAME "rules.txt"	// define rule file
#define LOG "isagdfw.log"	// define log file

int main(int argc,char* argv[])
{
	int i;// new counter
	int sockfd,new_fd;
	struct sockaddr_in my_addr;
	struct sockaddr_in their_addr;
	int sin_size;
	struct sigaction sa;
	int yes=1;
	int display=0;	// 0 if in deamon mode 1 if in display mode
	FILE* log;	// file pointer
	
 	if(argc>1)      //check mode of process
		if(strcmp(argv[1],"-display")==0) display=1;
 
	if(display==0)
	{
	i=fork();
	if(i<0) exit(0);// exit if error
	if(i>0) exit(0);// exit if parent daemon

	setsid(); 	// new process group 
	for (i=getdtablesize();i>=0;--i) close(i); // close all descriptors 
	i=open("/dev/null",O_RDWR); dup(i); dup(i); // handle standart I/O 
	umask(007); 	//set permission
	chdir("/tmp/isagdfw"); //change dir
	};	

	if ((sockfd=socket(AF_INET,SOCK_STREAM,0))== -1)// create socket to listen
	{
		perror("socket");
		exit(1);
	}

	if(setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR,&yes,sizeof(int))==-1)// set socket option
	{
		perror("setsockopt");
		exit(1);
	}

	my_addr.sin_family = AF_INET;		// set address family
	my_addr.sin_port = htons(MYPORT);	// set port
	my_addr.sin_addr.s_addr =INADDR_ANY;	//set in address
	memset(&(my_addr.sin_zero),'\0',8);	// pading

	if (bind(sockfd, (struct sockaddr *)&my_addr, sizeof(struct sockaddr))==-1)// bind socket
	{
		perror("bind");
		exit(1);
	}

	if (listen(sockfd, BACKLOG)==-1)
	{
		perror("listen");
		exit(1);
	}// listen

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
		}// new_fd is socket for except connection in new process
		if(display==1)
		{
			timestamp(1);
			printf("\nServer : Got Action from \t-> %s\n",inet_ntoa(their_addr.sin_addr));
		}
		else
		{
			timestamp(0);
			log=fopen(LOG,"a");
			fprintf(log, "\nServer : Got Action from \t-> %s \t\ttime: ",inet_ntoa(their_addr.sin_addr));
			fclose(log);
		};
		if(!fork())
		{
			char rule4parse[200];
			char *argv[20];
			char *user=(char*)malloc(sizeof(char*));
			char *addr=(char*)malloc(sizeof(char*));
			char *rule=(char*)malloc(sizeof(char*));
			char *fromfile;
			char addremove;
			char *tempptr;
			char buf[MAXDATASIZE];
			int i,len,j;
			size_t* filelen;
			
			close(sockfd);
			if(recv(new_fd, buf, MAXDATASIZE-1, 0)==-1)perror("recive");
			if(display==1)
				printf("Server : Got String   \t\t-> %s\n",buf);
			else
			{
				log=fopen(LOG,"a");
				fprintf(log,"Server : Got String   \t\t-> %s\n",buf);
				fclose(log);
			};

			splitaddr(buf,addr,user);// spleit address and user
				        
			tempptr=addr;            	//                                               
			len=strlen(addr)-1;      	//                                          
			for(i=0;i<len;i++)       	//                                              
				tempptr++;       	// get command ... add or remove
			if(*tempptr=='A')addremove='A';	//
			else addremove='D';		//
			*tempptr='\0';			//

			if(display==1)
				printf("\nuser   : %s \t\t address : %s \t command: %c\n",user,addr,addremove);
			else
			{
				log=fopen(LOG,"a");
				fprintf(log,"\nuser   : %s \t\t address : %s \t command: %c\n",user,addr,addremove);
				fclose(log);
			};
			// get rules
			fromfile=read_file(filelen);
			rule=cut_rule(fromfile,user);
			if(display==1)
				printf("user   : %s \t\t rules   : %s\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n",user,rule);
			else
			{
				log=fopen(LOG,"a");
				fprintf(log,"user   : %s \t\t rules   : %s\n",user,rule);
				fprintf(log,"-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=\n");
				fclose(log);
			};
			//add-remove rules
			strcpy(rule4parse,rule);	
			parse(rule4parse,argv);		// parse rule for excute
			//check add-remove and set ipaddress
			for(j=0;j<20;j++)
			{
				if(0==strcmp(argv[j],"command"))	//
				{       				//
					if(addremove=='A')argv[j]="-A";	// set command	
					if(addremove=='D')argv[j]="-D";	//
				};      				//
				
				if(0==strcmp(argv[j],"sourceipaddress"))//
				{                                       //                                                 
					strcpy(argv[j],addr);           // set ipaddress                    
					break;                          //                                                 
				};                                      //                                                 
			};
			
			execute(argv);	// excute command
			
			close(new_fd);	// close socket
			exit(0);
		}
		close(new_fd);
	}
	return 0;

}
