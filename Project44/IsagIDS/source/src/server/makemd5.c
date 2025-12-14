#include <stdio.h>
#include <fcntl.h>
#include "global.h"
#include "md5.h"

int main(int argc,char *argv[]){
	char digest[16];
	int fd1;
	
	if (argc!=3){
		printf("%s inputfile outputfile\n",argv[0]);
		return -1;
	}

	MDFile(argv[1],digest);

	fd1=open(argv[2],O_CREAT|O_TRUNC|O_RDWR,0600);
	if (fd1<0)return 1;

	write(fd1,(char*)digest,16);
	close(fd1);
	return 0;
}
