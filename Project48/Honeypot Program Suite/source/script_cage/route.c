#include<stdio.h>

int main (int argc, char* argv[])
{
	static char CMD[30];
	int i;
	strcat(CMD,"/sbin/route.bak ");
	for(i = 1; i< argc;i++)
	{
		strcat(CMD,argv[i]);
		strcat(CMD," ");	
	}
	strcat(CMD,"| sed s%172.16.143%172.16.144%"); 
	system(CMD);
	return 0;
}
