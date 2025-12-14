#include <stdio.h>
#include <fcntl.h>
#include <time.h>
#include "../define.h"

int main(int argc,char *argv[]){
	int fd,result=5;
	int count=0;
	struct blackUser bl;
	
	
	if (argc!=2) return 1;
	
	if ((fd=open(argv[1],O_RDONLY))<0) return 1;
	while (result>0){
		result=read(fd,&bl,sizeof(struct blackUser));
		if (result>0)	{
			printf("UID:%d FROM:%s SCORE:%f DETECTED:%s",bl.uid, bl.hostIP, bl.score, ctime(&bl.detectTime));
			count++;
		}
	}
	printf("All %d user\n",count);
}
