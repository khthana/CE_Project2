#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <sys/timeb.h>
#include <termio.h>


#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <fcntl.h>
#include "ldapinit.h"



#define BUFFER_MAX 1024
#define MAXLINE 512
#define MY_PORT	6002
#define SIZE_BUFFER	1026
#define LOCAL_IP  "161.246.5.35"
#define RDN  "AgentID=SF2"

char getchvalue;
struct termio save;

int kbhit(void);
char getch(void);
void initscr(void);   
void endwin(void);
void clrscr(void);
	


int main(int argc, char *argv[])
{
    FILE *fp;
    int flags,i, j=0; 
    long int  time1;
	int  server_sock , n , fromlen ;
	struct sockaddr_in my_addr , from_addr ;
	char buffer[SIZE_BUFFER] ;	

    char *str, cmd[4], pol[2];
   // char *rdn = "AgentID=SF2";
	char *agentid, *policy, *ip, *ipcap, *portcap;
    
	char ch;
    char outbuf[BUFFER_MAX];


   time_t tm;
   struct tm *area;

   struct timeb t;
   ftime(&t);
   time1 = t.time;

   tm = time(NULL);
   area = localtime(&tm);
   
   str = (char*)malloc(MXMESG*2);
   str[0] =0;
   strcpy(str,"AgentID$SF2|IP$");
   strcat(str,LOCAL_IP);
   strcat(str,"|StartTime$");
   strcat(str,asctime(area));
   str[strlen(str)-1] = 0;
   strcat(str,"|Refresh$");
   strcat(str,asctime(area));
   str[strlen(str)-1] = 0;
   strcat(str,"|IPCap$161.246.4.3|PortCap$23,81");
   sprintf(buffer,"|SStartTime$%ld|SRefresh$%ld|status$Start|objectClass$stateful",time1,time1);
   buffer[strlen(buffer)] = 0;
   strcat(str,buffer);
   str[strlen(str)] = 0;

    clrscr();
	initscr();
	printf("\nAdd Entry to LDAP Server : %s\n",err2string(AddEntry(2, str)));

	server_sock = socket(AF_INET, SOCK_DGRAM, 0) ;

	bzero( (char *) &my_addr, sizeof(my_addr)) ;
	my_addr.sin_family = AF_INET;
	my_addr.sin_addr.s_addr = htons(INADDR_ANY);
	my_addr.sin_port = htons(MY_PORT);

	fromlen = sizeof(from_addr) ;

	bind(server_sock, (struct sockaddr *) &my_addr, sizeof(my_addr)) ;

   fcntl(server_sock, F_SETFL, O_NDELAY | O_NONBLOCK);
	
	for( ; ; )	{
	   n = recvfrom( server_sock , buffer , 100 , 0 , (struct sockaddr *) &from_addr , &fromlen ) ;
	   buffer[strlen(buffer)] = 0;
	   if (n>0)  {
		  
  		  strncpy(cmd,buffer,3);
		  cmd[3] = 0;
		  printf("%s",cmd);
		  if(!strcmp(cmd,"ad2")) {
		            printf("\nAdd Command\n");
		  
					    i=4;

						ip=(char*)malloc(20);
						ip[0] = 0;
					    while(buffer[i] != ' ') 
						{
						    ip[j++] = buffer[i++];
                        }
						ip[j] = 0;
						i++,j=0;

						ipcap=(char*)malloc(30);
                        ipcap[0] =0;
						while(buffer[i] != ' ')
						{
						    ipcap[j++] = buffer[i++];
                        }
						ipcap[j] = 0;
						i++,j=0;
		
						portcap=(char*)malloc(20);
						portcap[0] = 0;
                        while(buffer[i] != '\0')
						{
						    portcap[j++] = buffer[i++];
                        }
						portcap[j] = 0;
						i=0,j=0;
                        if(!strcmp(ip,LOCAL_IP))
						{		
						     policy = (char*)malloc(MXMESG);
			                 policy[0] = 0;
						     sprintf(policy,"Policy -> IP Capture=%s, Port Capture= %s\n",ipcap,portcap);
							 fp = fopen("./policy_sf2", "a+t");
							 fwrite(policy, strlen(policy)+1,1, fp);
							 fclose(fp);
                             printf("Add Policy to File : Success\n");

						}
		  
		  }
		  if(!strcmp(cmd,"up2")) {
		                printf("\nUpdate Command\n");

					    i=4;

						ip=(char*)malloc(20);
						ip[0] = 0;
					    while(buffer[i] != ' ') 
						{
						    ip[j++] = buffer[i++];
                        }
						ip[j] = 0;
						i++,j=0;

						ipcap=(char*)malloc(30);
                        ipcap[0] =0;
						while(buffer[i] != ' ')
						{
						    ipcap[j++] = buffer[i++];
                        }
						ipcap[j] = 0;
						i++,j=0;
		
						portcap=(char*)malloc(20);
						portcap[0] = 0;
                        while(buffer[i] != '\0')
						{
						    portcap[j++] = buffer[i++];
                        }
						portcap[j] = 0;
						i=0,j=0;
                        if(!strcmp(ip,LOCAL_IP))
						{		
						     policy = (char*)malloc(MXMESG);
			                 policy[0] = 0;
						     sprintf(policy,"IPCap$%s,PortCap$%s",ipcap,portcap);
                             printf("Update Policy to LDAP Server : %s\n",err2string(ModifyEntry(21, RDN,  policy)));

						}

						free(ip);
						free(ipcap);
						free(portcap);
		  
		  }
          if(!strcmp(cmd,"de2")) {

		               printf("\nDelete Command\n");
					    i=4,j=0;

						ip=(char*)malloc(20);
						ip[0] = 0;
					    while(buffer[i] != ' ') 
						{
						    ip[j++] = buffer[i++];
                        }
						ip[j] = 0;
						i++,j=0;

						agentid=(char*)malloc(20);
						agentid[0] = 0;
					    while(buffer[i] != '\0') 
						{
						    agentid[j++] = buffer[i++];
                        }
						agentid[j] = 0;
						j=0;
                        if( (!strcmp(ip,LOCAL_IP)) && (!strcmp(agentid,RDN)) )
					    {		
  					        // printf("Delete Entry from LDAP Server : %s\n",err2string(DelEntry(1, RDN)));
			                str[0] = 0;
	                        strcpy(str,"Status$Stop");
                            str[strlen(str)] = 0;
			                printf("\nUpdate Status to 'Stop'  : %s \n", err2string(ModifyEntry(21, RDN,  str)));
			                sprintf(outbuf,"\nQuit process now\n");
				            write(1,outbuf,strlen(outbuf));


							 break;
                         }
						free(ip);
						free(agentid);
		  
		  }
		  else;
	  
       }

        ftime(&t);
		if( (t.time - time1) == MXREFRESH)	 {
             time1 = t.time;

			 tm = time(NULL);
             area = localtime(&tm);

			 str[0] = 0;
	         strcpy(str,"Refresh$");
	         strcat(str,asctime(area));
             str[strlen(str)-1] = 0;
			 printf("\nUpdate Refresh Time ( %s ) : %s \n",str, err2string(ModifyEntry(21, RDN,  str)));
			 str[0] = 0;
			 sprintf(str,"SRefresh$%ld",time1);
             str[strlen(str)] = 0;
			 printf("Update SRefresh Time : %s \n",err2string(ModifyEntry(21, RDN,  str)));
             
         }

		  if(kbhit()){
              ch=getch();
			  if(ch=='q')
			  {
			      str[0] = 0;
	              strcpy(str,"Status$Stop");
                  str[strlen(str)] = 0;
			      printf("\nUpdate Status to 'Stop'  : %s \n", err2string(ModifyEntry(21, RDN,  str)));
			      sprintf(outbuf,"\nQuit process now\n");
				  write(1,outbuf,strlen(outbuf));
                  break;
              }
			  if(ch=='s')
			  {
				  printf("\n------------------------------------------------------------------------");
                  printf("\nShow Policy from file.\n");
				  printf("------------------------------------------------------------------------\n\n");
			       fp = fopen("./policy_sf2", "rt");
				   while(!feof(fp))
				   {
				       fread(pol, 1,1, fp);
					   pol[1]=0;
					   printf("%s",pol);
                    }
				  printf("\n------------------------------------------------------------------------\n");
				   fclose(fp);

              }

          }
    }

	   endwin();
       close(server_sock);

	return(0) ;
}


    void endwin()
    {
            ioctl(0,TCSETA,&save);
    }

    void initscr()
    {
            struct termio term;

            if(ioctl(0,TCGETA,&term)==-1){
                    fprintf(stderr,"standard input not a tty\n");
					exit(1);
                    
            }
            save=term;
            
			printf("Stateful Security Agent Start\nPress 'q' to Quit proccess.\n\n");

            term.c_lflag&=~ICANON;
            term.c_lflag&=~ECHO;

            term.c_cc[VMIN]=0;
            term.c_cc[VTIME]=0;

            ioctl(0,TCSETA,&term);
    }

    char getch()
    {
            return(getchvalue);
    }

    int kbhit()
    {
            char buffer[BUFFER_MAX];
            int ifkeyin;

            ifkeyin=read(0,&getchvalue,1);

            return(ifkeyin);
    }

    void clrscr(void) 
	{
          printf("\033[2J");
          printf("\033[0;0f");
     }
