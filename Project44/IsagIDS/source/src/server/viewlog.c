#include <stdio.h>
#include <fcntl.h>
#include <time.h>
#include "../define.h"

int main(int argc,char *argv[]){
	int fd,result=5;
	int count=0;
	struct userLog proc;
	
	if (argc!=2) return 1;
	
	fd=open(argv[1],O_RDONLY);
	while (result>0){
		result=read(fd,&proc,sizeof(struct userLog));
		if (result>0)	{
			printf("%ld\n",proc.startTime);
			printf("time:%s file:%s, com:%s:\n\n",ctime(&proc.startTime), proc.pathname, proc.command);
			count++;
		}
	}
	printf("all %d records\n",count);
}
