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
#define MY_PORT	6001
#define SIZE_BUFFER	1026
#define LOCAL_IP  "161.246.5.35"
#define RDN "AgentID=FW2"

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
   //char *rdn = "AgentID=FW2";
	char *agentid, *policy, *ip, *source, *destination, *service, *action;
    
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
   strcpy(str,"AgentID$FW2|IP$");
   strcat(str,LOCAL_IP);
   strcat(str,"|StartTime$");
   strcat(str,asctime(area));
   str[strlen(str)-1] = 0;
   strcat(str,"|Refresh$");
   strcat(str,asctime(area));
   str[strlen(str)-1] = 0;
   strcat(str,"|Source$161.246.5.*|Destination$161.246.6.1|Service$http|Action$Accept");
   sprintf(buffer,"|SStartTime$%ld|SRefresh$%ld|status$Start|objectClass$firewall",time1,time1);
   buffer[strlen(buffer)] = 0;
   strcat(str,buffer);
   str[strlen(str)] = 0;

    clrscr();
	initscr();
	printf("\nAdd Entry to LDAP Server : %s\n",err2string(AddEntry(1, str)));

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
		  if(!strcmp(cmd,"add")) {
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

						source=(char*)malloc(20);
                        source[0] =0;
						while(buffer[i] != ' ')
						{
						    source[j++] = buffer[i++];
                        }
						source[j] = 0;
						i++,j=0;
						
						destination=(char*)malloc(20);
						destination[0] = 0;
                        while(buffer[i] != ' ')
						{
						    destination[j++] = buffer[i++];
                        }
						destination[j] = 0;
						i++,j=0;
						
						service=(char*)malloc(20);
						service[0] = 0;
                        while(buffer[i] != ' ')
						{
						    service[j++] = buffer[i++];
                        }
						service[j] = 0;
						i++,j=0;
						
						action=(char*)malloc(20);
						action[0] = 0;
                        while(buffer[i] != '\0')
						{
						    action[j++] = buffer[i++];
                        }
						action[j] = 0;
						i=0,j=0;
                        if(!strcmp(ip,LOCAL_IP))
						{		
						     policy = (char*)malloc(MXMESG);
			                 policy[0] = 0;
						     sprintf(policy,"Policy -> Source=%s, Destination= %s, Service= %s, Action=%s\n",source,destination,service,action);
							 fp = fopen("./policy_fw2", "a+t");
							 fwrite(policy, strlen(policy)+1,1, fp);
							 fclose(fp);
                             printf("Add Policy to File : Success\n");

						}
		  
		  }
		  else if(!strcmp(cmd,"upd")) {
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

						source=(char*)malloc(20);
                        source[0] =0;
						while(buffer[i] != ' ')
						{
						    source[j++] = buffer[i++];
                        }
						source[j] = 0;
						i++,j=0;
						
						destination=(char*)malloc(20);
						destination[0] = 0;
                        while(buffer[i] != ' ')
						{
						    destination[j++] = buffer[i++];
                        }
						destination[j] = 0;
						i++,j=0;
						
						service=(char*)malloc(20);
						service[0] = 0;
                        while(buffer[i] != ' ')
						{
						    service[j++] = buffer[i++];
                        }
						service[j] = 0;
						i++,j=0;
						
						action=(char*)malloc(20);
						action[0] = 0;
                        while(buffer[i] != '\0')
						{
						    action[j++] = buffer[i++];
                        }
						action[j] = 0;
						i=0,j=0;
                        if(!strcmp(ip,LOCAL_IP))
						{		
						     policy = (char*)malloc(MXMESG);
			                 policy[0] = 0;
						     sprintf(policy,"Source$%s,Destination$%s,Service$%s,Action$%s",source,destination,service,action);
                             printf("Update Policy to LDAP Server : %s\n",err2string(ModifyEntry(11, RDN,  policy)));

						}

						free(ip);
						free(source);
						free(destination);
						free(service);
						free(action);
		  
		  }
          else if(!strcmp(cmd,"del")) {

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
			                printf("\nUpdate Status to 'Stop'  : %s \n", err2string(ModifyEntry(11, RDN,  str)));
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
			 printf("\nUpdate Refresh Time ( %s ) : %s \n",str, err2string(ModifyEntry(11, RDN,  str)));
			 str[0] = 0;
			 sprintf(str,"SRefresh$%ld",time1);
             str[strlen(str)] = 0;
			 printf("Update SRefresh Time : %s \n",err2string(ModifyEntry(11, RDN,  str)));
             
         }

		  if(kbhit()){
              ch=getch();
			  if(ch=='q')
			  {
			      str[0] = 0;
	              strcpy(str,"Status$Stop");
                  str[strlen(str)] = 0;
			      printf("\nUpdate Status to 'Stop'  : %s \n", err2string(ModifyEntry(11, RDN,  str)));
			      sprintf(outbuf,"\nQuit process now\n");
				  write(1,outbuf,strlen(outbuf));
                  break;
              }
			  if(ch=='s')
			  {
				  printf("\n------------------------------------------------------------------------");
                  printf("\nShow Policy from file.\n");
				  printf("------------------------------------------------------------------------\n\n");
			       fp = fopen("./policy_fw2", "rt");
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
            
			printf("Firewall Security Agent Start\nPress 'q' to Quit proccess.\n\n");

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
