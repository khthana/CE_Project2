#include <sys/types.h>
#include <stdio.h>
#include <fcntl.h>
#include <netinet/in.h>
#include <unistd.h>
#include "../define.h"
#include "../config.h"

/* write config file of audit module  *
 * structure of config file is here   *

 - first 16 byte : struct sockaddr_in -> IDS server infor
 - next 4 byte   : int saveDataOption -> if set to 1 .. when auditModule cant connect to IDS host 
 					  it will save data to current host first 
 */

int main(){
   struct sockaddr_in addr;
   char newIP[16]="";		// new server IP //
   int newPort=0;		// new server port //
   int result, fd;
   int saveDataOption;		// save data option //
   char ch[2];
   
   // check old configfile //
   fd=open(CONFIG_FILE,O_RDONLY,0600);
   if (fd>0){
	   //file already exit .. so read old config file //
	   read(fd,(char*)&addr,16);
	   read(fd,(char*)&saveDataOption,sizeof(int));
	   close(fd);
   }else{
	   // config file doesn't exist so fill value with default value //
	   addr.sin_family=AF_INET;
	   addr.sin_port=htons(0);
	   addr.sin_addr.s_addr=inet_addr("127.0.0.1");
   }
   close(fd);
   
   /* receive ip number ,port*/
   printf("Enter new Server IP [%s]:",inet_ntoa(addr.sin_addr));
   scanf("%s",newIP);
   printf("Enter new Server port [%d]:",ntohs(addr.sin_port));
   scanf("%d",&newPort);
   printf("Do you want to enable save data option ?(y/n)");
   scanf("%s",ch);

   addr.sin_addr.s_addr=inet_addr(newIP);
   addr.sin_port=htons(newPort);	
   if ( (ch[0]=='Y')||(ch[0]=='y')){
	   saveDataOption=1;
   }else{
	   saveDataOption=0;
   }
   
   fd=open(CONFIG_FILE,O_CREAT|O_TRUNC|O_RDWR,0600);
   if (fd<0) {
      printf("Error open config file\n");
      return 1;
   }
   
   result=write(fd, &addr, sizeof(addr));
   if (result!=sizeof(addr)){
      printf("Error writing config file\n");
      return 1;
   }
   result=write(fd,&saveDataOption,sizeof(int));
   if (result!=sizeof(int)){
      printf("Error writing config file\n");
      return 1;
   }
   
   close(fd);
   return 0;
}
