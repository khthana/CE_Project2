#include <stdio.h>
#include <fcntl.h>
#include <string.h>
#include "../define.h"

int readString(int fildes,char *cmd){
   char ch[2]="";
   int result;
   
   strcpy(cmd,"");
   result=read(fildes,ch,sizeof(char));
   while ( (result>0) ) {
      if((ch[0]!=' ')&&(ch[0]!=(char)0)&&(ch[0]!=0xa)) {
         strcat(cmd,ch);
      }
      else{
         break;
      }
      result=read(fildes,ch,sizeof(char));     
   }
   if ( (!strcmp(cmd,""))&&(result>0) ) result=readString(fildes,cmd);
   return result;

}

int readLog(char *filename,char *recentFilename,char *dbFilename){
	int result;
	struct userLog data;
	char cmd[MAX_COMM_LEN];
	char outfilename[MAX_FILENAME];
	char ch[4];
	int countStr;
	int fd;
	int outfd;
	int countToken=0;
	
	strcpy(outfilename,recentFilename);
	fd=open(filename,O_RDONLY);
	outfd=open(outfilename,O_CREAT|O_TRUNC|O_RDWR,0600);
	// goto last record file //
	result=lseek(fd,-1*sizeof(struct userLog),SEEK_END);
	
	while (result>0){
		read(fd,&data,sizeof(struct userLog));
		strcpy(cmd,data.command);
		ch[0]=1;
		countStr=0;
		countToken++;
		// first word is certainly command name .. then write it //
		while (cmd[countStr]!=' ') {
			write(outfd,&cmd[countStr],1);
			countStr++;
		}
		ch[0]=10;
		write(outfd,&ch[0],1);		// write new line //
		countStr++;
		// write only option to file //
		while (cmd[countStr]!=0){
			if (cmd[countStr]=='-'){
				while(cmd[countStr]!=' '){
					write(outfd,&cmd[countStr],1);
					countStr++;
				}
				ch[0]=10;
				write(outfd,&ch[0],1);
				countStr++;
			}else{
				while(cmd[countStr]!=' ')countStr++;
				write(outfd,"<f>",3);
				ch[0]=10;
				write(outfd,&ch[0],1);
				countStr++;
			}
			
		}	
		// goto 2 record before here //
		// when end of recent part //
		if (countToken==R_WINDOW_SIZE){
			close(outfd);
			strcpy(outfilename,dbFilename);
			outfd=open(outfilename,O_CREAT|O_TRUNC|O_RDWR,0600);
		}
		result=lseek(fd,-2*sizeof(struct userLog),SEEK_CUR);
	}
	close(outfd);
}

