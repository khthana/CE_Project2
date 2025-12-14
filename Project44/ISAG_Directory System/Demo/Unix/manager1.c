#include "ldapinit.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <sys/timeb.h>
#include <termio.h>
#include <fcntl.h>
#define BUFFER_MAX 1024

char getchvalue;
struct termio save;

int kbhit(void);
char getch(void);
void initscr(void);   
void endwin(void);
void clrscr(void);


int main(int argc, char *argv[])
{

  long int  time1;
  char ch, *rdn, *str, *tmp;
  SecureAgent *result;
  char outbuf[BUFFER_MAX];

  struct timeb t;
  ftime(&t);
  time1 = t.time;

 // result = (SecureAgent*)malloc(sizeof(SecureAgent));
  rdn = (char*)malloc(20);
  str = (char*)malloc(20);
  tmp = (char*)malloc(5);

clrscr();
initscr();

  while(1)
  {

 	ftime(&t);
	if( (t.time - time1) == 1)	 
	{
       time1 = t.time;
       SearchEntry("o=kmitl", "(AgentID=*)", "agentid", &result);

	   while(result->right)
	   {
//            if(strlen(result->agentid))
//			{

/*              if((atol(result->srefresh) - atol(result->sstarttime)) %MXREFRESH)
			  {
			     printf("%s : %s",result->srefresh,result->sstarttime);
                 printf("Problem %ld\n",atol(result->srefresh) - atol(result->sstarttime));
			  }
*/

			  if(!strcmp(result->status,"Start"))
			  {
			    
			    printf("\nAgent ID : %s  Start...\n",result->agentid);
                printf("Start Time : %s\n",result->starttime);
				rdn[0] = 0;
				sprintf(rdn,"AgentID=%s",result->agentid);
				rdn[strlen(rdn)] = 0;
				str[0] = 0;
				sprintf(str,"Status$Enable");
				str[strlen(str)] = 0;
				
                tmp[0] = 0;
				strncpy(tmp,result->agentid,2);
				tmp[2] = 0;
                
				printf("%s",tmp);

				if(!strcmp(tmp,"FW"))
				printf("Set status to 'Enable'  : %s\n",err2string(ModifyEntry(11, rdn,  str)) );
				if(!strcmp(tmp,"SF"))
				printf("Set status to 'Enable'  : %s\n",err2string(ModifyEntry(21, rdn,  str)) );

              }
			  if(!strcmp(result->status,"Stop"))
			  {

			    printf("\nAgent ID : %s  Stop...\n",result->agentid);
				rdn[0] = 0;
				sprintf(rdn,"AgentID=%s",result->agentid);
				rdn[strlen(rdn)] = 0;

				tmp[0] = 0;
				strncpy(tmp,result->agentid,2);
				tmp[2] = 0;

				if(!strcmp(tmp,"FW"))
				printf("Delete Entry from LDAP Server : %s\n",err2string(DelEntry(1, rdn)));
				if(!strcmp(tmp,"SF"))
				printf("Delete Entry from LDAP Server : %s\n",err2string(DelEntry(2, rdn)));
              }

//            }
			if(result->right)		
			   result = result->right;
       }

/**********************************/

			  if(!strcmp(result->status,"Start"))
			  {
			    
			    printf("\nAgent ID : %s  Start...\n",result->agentid);
                printf("Start Time : %s\n",result->starttime);
				rdn[0] = 0;
				sprintf(rdn,"AgentID=%s",result->agentid);
				rdn[strlen(rdn)] = 0;
				str[0] = 0;
				sprintf(str,"Status$Enable");
				str[strlen(str)] = 0;
				
                tmp[0] = 0;
				strncpy(tmp,result->agentid,2);
				tmp[2] = 0;
                
				printf("%s",tmp);

				if(!strcmp(tmp,"FW"))
				printf("Set status to 'Enable'  : %s\n",err2string(ModifyEntry(11, rdn,  str)) );
				if(!strcmp(tmp,"SF"))
				printf("Set status to 'Enable'  : %s\n",err2string(ModifyEntry(21, rdn,  str)) );

              }
			  if(!strcmp(result->status,"Stop"))
			  {

			    printf("\nAgent ID : %s  Stop...\n",result->agentid);
				rdn[0] = 0;
				sprintf(rdn,"AgentID=%s",result->agentid);
				rdn[strlen(rdn)] = 0;

				tmp[0] = 0;
				strncpy(tmp,result->agentid,2);
				tmp[2] = 0;

				if(!strcmp(tmp,"FW"))
				printf("Delete Entry from LDAP Server : %s\n",err2string(DelEntry(1, rdn)));
				if(!strcmp(tmp,"SF"))
				printf("Delete Entry from LDAP Server : %s\n",err2string(DelEntry(2, rdn)));
              }

//            }
			if(result->right)		
			   result = result->right;


/*************************************/











	   while(result->left)
	   {
	      result=result->left;
		  free(result->right);
	   }
	      free(result);

	  if(kbhit())
	  {
          ch=getch();
	      if(ch=='q')
		  {
			      sprintf(outbuf,"\nQuit process now\n");
				  write(1,outbuf,strlen(outbuf));
                  break;
           }
      }



    }		
  }

   endwin();
   return(0);
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
            
			printf("LDAP Manager 1 Start\nPress 'q' to Quit proccess.\n\n");

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
