#include<stdio.h>
#include<string.h>
#include<netdb.h>
#include<netinet/ip.h>
#include<stdlib.h>

unsigned long getaddr(char *name) {
	struct hostent *hep;

	hep=gethostbyname(name);
	if(!hep) {
		fprintf(stderr, "Unknown host %s\n",name);
		exit(1);
	}
	return *(unsigned long *)hep->h_addr;
}

int main(int argc, char *argv[])
{
	u_long dst_addr;
	
	if(argc < 2)
		exit(0);

	dst_addr = getaddr(argv[1]);

	return 2;
}	
