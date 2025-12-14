#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "ldapinit.h"

//#define MY_PORT	6001
#define SIZE_BUFFER	1026

void SendMessage(char*,char*,int);

int main(int argc, char *argv[])
{

	int  i, quit =0;
	char buffer[SIZE_BUFFER] , *hs_address, size[2];	
	char  *filter;
	char  *rdn, *attribute, *value;
	SecureAgent *result;


	printf("LDAP Manager V.1\n");
	
	
    for( ; ; ) {

	printf("command : ");

	for( ; (buffer[0] !='p') && (buffer[0] !='s') && (buffer[0] !='c') && (buffer[0] !='q') ;fgets(buffer, 2, stdin))
	    if ( buffer[0] =='l')  {
		      printf("p : Policy Distribution\ns : Search\nc : Compare\nq : Quit\n");
 		  	  printf("command : ");
        }

    switch (buffer[0] )
     {
       case 'p' : 
	     fgets(buffer, 2, stdin);
	     printf("Policy Distribution\n");
         printf("\t[1] Firewall \n\t[2] Stateful Package\n\t[3] NIDS\n");
         printf("\tPick : ");
	     for( ; (buffer[0] !='1') && (buffer[0] !='2') && (buffer[0] !='3') ;fgets(buffer, 2, stdin));

         switch (buffer[0] )
         {
              case '1' :
			     while(!quit)
				 {
                 printf("\t\tFirewall : ");
	             for( ; (buffer[0] !='s') && (buffer[0] !='c') && (buffer[0] !='f') && (buffer[0] !='q') ;fgets(buffer, 2, stdin))
	                  if ( buffer[0] =='l')  {
		                   printf("\t\ts : Show all IP\n\t\tc : Send Command\n\t\tf : Command Format\n\t\tq : Quit\n");
                           printf("\t\tFirewall : ");
                      }
                 switch(buffer[0])
				 {
				       case 's' :


                          printf("\t\tShow all IP : %s\n",err2string(SearchEntry("AgentType=Firewall,o=kmitl", "(AgentID=*)","AgentID", &result)));
						  while(result->right)
						  {
                              printf("\t\t%10s : %s\n",result->agentid,result->ip);
							  result = result->right;
						  }

                              printf("\t\t%10s : %s\n",result->agentid,result->ip);

					      break;
					   case 'c' :				
                          printf("\t\tCommand ( add, upd, del ) : ");
					      fgets(buffer, 2, stdin);
					      fgets(buffer, SIZE_BUFFER, stdin);
                		  buffer[strlen(buffer)-1] = 0; 
                          
						  for (i=4;i<19;i++)
						  {
						    if(buffer[i] !=' ')
						      hs_address[i-4] = buffer[i];
							else
							{
							  hs_address[i-4] =0;
							  i=19;
							}
						   }  

					      SendMessage(buffer,hs_address,6001);

						  break;
					   case 'f' :



					      break;
					   case 'q':
					      quit = 1;
					      break;
				 }
				 buffer[0] = 'z';
			     }
				 quit = 0;

			     break;
			  case '2' :
  			     while(!quit)
				 {
                 printf("\t\tStateful : ");
	             for( ; (buffer[0] !='s') && (buffer[0] !='c') && (buffer[0] !='f') && (buffer[0] !='q') ;fgets(buffer, 2, stdin))
	                  if ( buffer[0] =='l')  {
		                   printf("\t\ts : Show all IP\n\t\tc : Send Command\n\t\tf : Command Format\n\t\tq : Quit\n");
                           printf("\t\tStateful : ");
                      }
                 switch(buffer[0])
				 {
				       case 's' :
                          printf("\t\tShow all IP : %s\n",err2string(SearchEntry("AgentType=Stateful,o=kmitl", "(AgentID=*)","AgentID", &result)));
						  while(result->right)
						  {
                              printf("\t\t%10s : %s\n",result->agentid,result->ip);
							  result = result->right;
						  }

                              printf("\t\t%10s : %s\n",result->agentid,result->ip);

					      break;
					   case 'c' :

					      printf("\t\tCommand ( ad2, up2, de2 ) : ");
					      fgets(buffer, 2, stdin);
					      fgets(buffer, SIZE_BUFFER, stdin);
                		  buffer[strlen(buffer)-1] = 0; 
						  for (i=4;i<19;i++)
						  {
						    if(buffer[i] !=' ')
						      hs_address[i-4] = buffer[i];
							else
							{
							  hs_address[i-4] =0;
							  i=19;
							}
						   }  

					      SendMessage(buffer,hs_address,6002);

						  break;
					   case 'f' :
					      break;
					   case 'q':
					      quit = 1; 
					      break;
				 }
				 buffer[0] = 'z';
			     }
				 quit = 0;

			     break;
			  case '3' : 
			     break;
            }
 
		  break;

	   case 's' :
	     fgets(buffer, 2, stdin);
         printf("Search Entry\n");	     
		 while(!quit)
	    {
         printf("\tSearch : ");
         for( ; (buffer[0] !='c') && (buffer[0] !='f') && (buffer[0] !='q') ;fgets(buffer, 2, stdin))
              if ( buffer[0] =='l')  {
                    printf("\tc : Send Command\n\tf : Command Format\n\tq : Quit\n");
                    printf("\tSearch= : ");
              }
         switch(buffer[0] )
		{
		       case 'c' :

		       fgets(buffer, 2, stdin);
	
			   printf("\tFilter : ");
			   fgets(buffer, SIZE_BUFFER, stdin);
               buffer[strlen(buffer)-1] = 0; 
			   filter = (char*)malloc(MXMESG);
			   filter[0] = 0;

               strcpy(filter, "("); 
			   strcat(filter, buffer); 
			   strcat(filter, ")"); 

               printf("\tSearch Entry : %s\n",err2string(SearchEntry("o=kmitl", filter, "agentid", &result)));
			   printf("\n------------------------------------------------------------------------\n");

               while(result->right)
			   {
			      
				   if(strlen(result->dn))           
				        printf("\tDN    : %s\n",result->dn);
			       if(strlen(result->agentid)) 
				        printf("\t\tAgentID       : %s\n",result->agentid);
			       if(strlen(result->ip))            
				        printf("\t\tIP            : %s\n",result->ip);
			       if( (strlen(result->starttime)) && ( strlen(result->sstarttime) ) ) 
				        printf("\t\tStart Time    : %s (%s sec)\n",result->starttime,result->sstarttime);
  			       if( (strlen(result->refresh)) && ( strlen(result->srefresh) ) ) 
				        printf("\t\tRefreshTime   : %s (%s sec)\n",result->refresh,result->srefresh);
			       if(strlen(result->status))            
				        printf("\t\tStatus        : %s\n",result->status);
			       if(strlen(result->source))            
				        printf("\t\tSource        : %s\n",result->source);
			       if(strlen(result->destination))            
				        printf("\t\tDestination   : %s\n",result->destination);
			       if(strlen(result->service))            
				        printf("\t\tService       : %s\n",result->service);
			       if(strlen(result->action))            
				        printf("\t\tAction        : %s\n",result->action);

			       if(strlen(result->ipcap))            
				        printf("\t\tIP Capture       : %s\n",result->ipcap);
			       if(strlen(result->portcap))            
				        printf("\t\tPort Capture       : %s\n",result->portcap);
			       if(strlen(result->attacktype))            
				        printf("\t\tAttack Type            : %s\n",result->attacktype);
			       if(strlen(result->atime))            
				        printf("\t\tAttack Tie        : %s\n",result->atime);

				  printf("\n------------------------------------------------------------------------\n");
				   result = result->right;
			   }

				   if(strlen(result->dn))           
				        printf("\tDN    : %s\n",result->dn);
			       if(strlen(result->agentid)) 
				        printf("\t\tAgentID       : %s\n",result->agentid);
			       if(strlen(result->ip))            
				        printf("\t\tIP            : %s\n",result->ip);
			       if( (strlen(result->starttime)) && ( strlen(result->sstarttime) ) ) 
				        printf("\t\tStart Time    : %s (%s sec)\n",result->starttime,result->sstarttime);
  			       if( (strlen(result->refresh)) && ( strlen(result->srefresh) ) ) 
				        printf("\t\tRefreshTime   : %s (%s sec)\n",result->refresh,result->srefresh);
			       if(strlen(result->status))            
				        printf("\t\tStatus        : %s\n",result->status);
			       if(strlen(result->source))            
				        printf("\t\tSource        : %s\n",result->source);
			       if(strlen(result->destination))            
				        printf("\t\tDestination   : %s\n",result->destination);
			       if(strlen(result->service))            
				        printf("\t\tService       : %s\n",result->service);
			       if(strlen(result->action))            
				        printf("\t\tAction        : %s\n",result->action);

			       if(strlen(result->ipcap))            
				        printf("\t\tIP Capture       : %s\n",result->ipcap);
			       if(strlen(result->portcap))            
				        printf("\t\tPort Capture       : %s\n",result->portcap);
			       if(strlen(result->attacktype))            
				        printf("\t\tAttack Type            : %s\n",result->attacktype);
			       if(strlen(result->atime))            
				        printf("\t\tAttack Tie        : %s\n",result->atime);
				  
				  printf("\n------------------------------------------------------------------------\n");

			   free(filter);

			      break;
			   case 'f' :
			      break;
			   case 'q':
			      quit = 1;
				  break;
		 }
		 buffer[0] = 'z';
		 }
		 quit = 0;


	     break;
	   
	   case 'c' :
	     fgets(buffer, 2, stdin);
         printf("Compare Entry\n");
		 while(!quit)
	    {
         printf("\tCompare : ");
         for( ; (buffer[0] !='c') && (buffer[0] !='f') && (buffer[0] !='q') ;fgets(buffer, 2, stdin))
              if ( buffer[0] =='l')  {
                    printf("\tc : Send Command\n\tf : Command Format\n\tq : Quit\n");
                    printf("\tCompare : ");
              }
         switch(buffer[0] )
		{
		       case 'c' :

		       fgets(buffer, 2, stdin);
			   printf("\tRDN : ");
			   fgets(buffer, SIZE_BUFFER, stdin);
               buffer[strlen(buffer)-1] = 0; 
			   rdn = (char*)malloc(MXMESG);
			   rdn[0] = 0;
               strcpy(rdn, buffer); 

			   printf("\tAttribute : ");
			   fgets(buffer, SIZE_BUFFER, stdin);
               buffer[strlen(buffer)-1] = 0; 
			   attribute = (char*)malloc(MXMESG);
			   attribute[0] = 0;
               strcpy(attribute, buffer); 

			   printf("\tValue : ");
			   fgets(buffer, SIZE_BUFFER, stdin);
               buffer[strlen(buffer)-1] = 0; 
			   value = (char*)malloc(MXMESG);
			   value[0] = 0;
               strcpy(value, buffer); 
			   printf("\tAgent Type (1. Firewall 2. Stateful 3. NIDS : ");
			   fgets(buffer, SIZE_BUFFER, stdin);
		       strncpy(size,buffer,1);
			   size[1] = 0;

               printf("\tCompare Entry : %s\n",err2string(CompareEntry( atoi(size), rdn, attribute, value)));

               free(rdn);
			   free(attribute);
			   free(value);

			      break;
			   case 'f' :
			      break;
			   case 'q':
			      quit = 1;
				  break;
		 }
		 buffer[0] = 'z';
		 }
		 quit = 0;

	     break;
	   
	   case 'q' :
	     fgets(buffer, 2, stdin);
         printf("Quit\n");
		 exit(0);
	     break;
	   
     }
   }

	return(0);
}

void SendMessage(char *buffer, char *hs_address,int port)
{

    int client_sock;
	struct sockaddr_in my_addr;

	client_sock = socket(AF_INET, SOCK_DGRAM, 0) ;

	bzero((char *) &my_addr, sizeof(my_addr)) ;
	my_addr.sin_family = AF_INET;
	my_addr.sin_addr.s_addr = inet_addr(hs_address);
	my_addr.sin_port = htons(port);
   
    sendto(client_sock , buffer ,100 , 0 ,(struct sockaddr *) &my_addr , sizeof(my_addr)) ;
 	
	close(client_sock);

}

