#include<stdio.h>
#include<fcntl.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/stat.h>
#include<signal.h>
#include<time.h>

#define LOG "isagdfw.log"
void timestamp(int i)
{
	if(!fork())
	{
		struct timeval tv;
		struct tm* ptm;
		char time[40];
		long milliseconds;
		FILE* fd;
		
		gettimeofday(&tv,NULL);
		ptm=localtime(&tv.tv_sec);
		
		strftime(time,sizeof(time),"%Y-%m-%d %H:%M:%S",ptm);
		milliseconds=tv.tv_usec/1000;
		if(i==1)
			printf("%s.%03ld\n",time,milliseconds);
		else
		{
			fd=fopen(LOG,"a");
			fprintf(fd,"%s.%03ld\n",time,milliseconds);
			fclose(fd);
		};
		exit(0);

	};
}
