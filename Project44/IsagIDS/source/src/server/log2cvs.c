#include <stdio.h>
#include <fcntl.h>
#include <time.h>
#include "../define.h"

struct newLog{
	char pathname[PATH_LEN];
	char c1;
	char command[MAX_COMM_LEN];
	char c2;
	unsigned long startTime;
	char c3[2];
};

int main(int argc,char *argv[]){
	int infd,result=2;
	FILE *outfd;
	struct userLog usrlog;
        struct tm *tm_ptr;

	if (argc!=3)return 1;
	if ((infd=open(argv[1],O_RDONLY))<0) return 1;
	if ((outfd=fopen(argv[2],"w"))==NULL){
		close(infd);
		return 1;
	}
   
	while (result>0){
		result=read(infd,(char*)&usrlog,sizeof(struct userLog));
		if (result>0){
                   	tm_ptr=localtime(&usrlog.startTime);
			fprintf(outfd,"%s,%s,",usrlog.pathname,usrlog.command);
                        fprintf(outfd,"%2d/%2d/%4d,%2d.%2d.%2d\n",tm_ptr->tm_mday, tm_ptr->tm_mon+1, tm_ptr->tm_year+1900, tm_ptr->tm_hour, tm_ptr->tm_min, tm_ptr->tm_sec);

		}
	}
	close(infd);
	fclose(outfd);
	return 0;
}
