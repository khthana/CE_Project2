#include <stdio.h>
#include <conio.h>
#include <process.h>
#include<fstream.h>
#include<winsock2.h>
#include<string.h>
#include<time.h>
#include"ipdef.h"

#pragma comment(lib, "Ws2_32.lib")
#pragma comment(lib,"kernel32")

#define MYPORT 1170
#define MYHOST "192.168.0.254"
//#define MYHOST "192.168.2.1"

#define prog "checkuserc.exe"

typedef unsigned int SOCKET;

int sendtofw(char* msg)
{
	WSADATA wsData;
    WORD    wVer = MAKEWORD(2,2);
 	SOCKET minix;
	char    *szName=MYHOST;
	int status;
	struct hostent *he;
	WCHAR    wszRecvBuf[100];
	struct sockaddr_in their_addr;

	
	memset(wszRecvBuf,0,sizeof(wszRecvBuf));
	status = WSAStartup(wVer,&wsData);
	minix=socket(AF_INET,SOCK_STREAM,0);
	if (minix == INVALID_SOCKET) 
	{
		printf("Failed to create socket: %d\n",WSAGetLastError());
		WSACleanup();
		return -1;

	}
	bind(minix,(const sockaddr *)&their_addr,sizeof(their_addr));

	their_addr.sin_family=AF_INET;
	their_addr.sin_port=htons(MYPORT);
	int len=0;
	gethostname(szName,len);
	he = gethostbyname(szName);
	their_addr.sin_addr.S_un.S_addr = *((long *)(he->h_addr));
	
	memset(&(their_addr.sin_zero),'\0',8);
	status= connect(minix,(struct sockaddr*) &their_addr,sizeof(struct sockaddr)) ;
	if(status==-1)
	{
		printf("\nfail to connect");
		WSAGetLastError();
		WSACleanup();
		return -1;
	}
	char* msg2 = (char*) malloc (sizeof(char*));

	status = send(minix,(char*)msg,100,0);
	printf("\n\n   ******** Send Action %s: ",msg);
	printf(" to Firewall ********\n");
	printf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
	if(status<0)
	{   
		printf("\nfail to send");
		WSAGetLastError();
		WSACleanup();
		return status;
	}

	closesocket(minix);
	WSACleanup();
	return 1;
}

int readfile(char* user)
{
	strcpy(user,"$");
	ifstream in("user.txt",ios::in);
	in>>user;
	if(strcmp(user,"$")) return 1;
	return 0;
}

void checkuser(char* user,char* usertmp,char* msg,char* ipp,char* ip[],int i)
{
	if (readfile(user)) 
	{
		if((strcmp(ip[i],user)!=0) && ip[i]!="$")   //check for change user
		{
	/*		if(user=="$")
			{
				
				printf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
				printf("\n\n   ********  ");
				printf("%s",ip[i]);
				printf(" Log off ");
				printf("At IP : %s",ipp);
				printf("   ********");
			
				//printf("\nUser log off :%s",ip[i]);
				strcpy(msg,ip[i]);
				strcat(msg,":");
				strcat(msg,ipp);
				strcat(msg,"D");
				sendtofw(msg);
				strcpy(usertmp,"$");
				ip[i]=usertmp;
			}
			
			else
			{*/
				printf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
				printf("\n\n   ********  ");
				printf("%s",ip[i]);
				printf(" Log off ");
				printf("At IP : %s",ipp);
				printf("   ********");
			
				
				/*printf("\n******* User log off :%s ",ip[i]);
				printf(" *******");*/
			
				//printf("\nUser log off :%s",ip[i]);
				strcpy(msg,ip[i]);
				strcat(msg,":");
				strcat(msg,ipp);
				strcat(msg,"D");
				sendtofw(msg);
				usertmp=(char*) malloc (sizeof(char*));
				strcpy(usertmp,user);
				ip[i]=usertmp;
				printf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
				printf("\n\n   ********  ");
				printf("%s",ip[i]);
				printf(" Log in ");
				printf("At IP : %s",ipp);
				printf("   ********");
			
				strcpy(msg,ip[i]);
				strcat(msg,":");
				strcat(msg,ipp);
				strcat(msg,"A");
				sendtofw(msg);
			//}
		}
		else if(ip[i]=="$")							//check for login
		{
			/*printf("\n******* User log in:%s ",user);
			printf(" *******");
			printf("\n******* %s",user);
			printf(" Log in at IP %S",ip[i]);*/
			//printf("\nUser log in:%s",user);
			usertmp=(char*) malloc (sizeof(char*));
			strcpy(usertmp,user);
			ip[i]=usertmp;
			printf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
			printf("\n\n   ********  ");
			printf("%s",ip[i]);
			printf(" Log in ");
			printf("At IP : %s",ipp);
			printf("   ********");
			strcpy(msg,user);
			strcat(msg,":");
			strcat(msg,ipp);
			strcat(msg,"A");
			sendtofw(msg);
		}
	}
	else											//check for log off
	{
		if(strcmp(ip[i],"$"))
		{
			printf("\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
			printf("\n\n   ********  ");
			printf("%s",ip[i]);
			printf(" Log off ");
			printf("At IP : %s",ipp);
			printf("   ********");
			
			//printf("\nUser log off:%s",ip[i]);
			strcpy(msg,ip[i]);
			strcat(msg,":");
			strcat(msg,ipp);
			strcat(msg,"D");
			sendtofw(msg);
			strcpy(ip[i],"$");
		}
	}
}
	

void main()
{
	char* ip[254];
	for (int i=0;i<50;i++) {
	ip[i]=(char*) malloc (sizeof(char*));
	ip[i]="$";
	}
	
	char* usertmp=(char*) malloc (sizeof(char*));
	char* user=(char*) malloc (sizeof(char*));

	char* msg=(char*) malloc(sizeof(char*));
//	printf("\nDetected User....");
	printf("\n-=-=-=-=-=-=-= Directory Service based Firewall -=-=-=-=-=-=-=");
	printf("\n-=-=-=-=-=-=-=  ISAGDFW Manager for Window2000  -=-=-=-=-=-=-=\n\n");

	while(1)
	{
		for(int i=0;i<2;i++)
		{
			switch(i)
			{
			case 0 : 
				   {
					if(_spawnl(_P_WAIT ,prog,prog ,"client1",NULL )==0)
						checkuser(user,usertmp,msg,IP1,ip,i);
					else
						checkuser(user,usertmp,msg,IP1,ip,i);
				   }break;
			case 1:{
					if(_spawnl(_P_WAIT ,prog, prog,"client2",NULL )==0)
						checkuser(user,usertmp,msg,IP2,ip,i);
					else
						checkuser(user,usertmp,msg,IP2,ip,i);
					}break; 

			case 2 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client3",NULL )==0)
						checkuser(user,usertmp,msg,IP3,ip,i);
					else
						checkuser(user,usertmp,msg,IP3,ip,i);
				   }break;
			case 3:{
					if(_spawnl(_P_WAIT ,prog, prog,"client4",NULL )==0)
						checkuser(user,usertmp,msg,IP4,ip,i);
					else
						checkuser(user,usertmp,msg,IP4,ip,i);
					}break; 
			case 4 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client5",NULL )==0)
						checkuser(user,usertmp,msg,IP5,ip,i);
					else
						checkuser(user,usertmp,msg,IP5,ip,i);

				   }break;
			case 5:{
					if(_spawnl(_P_WAIT ,prog, prog,"client6",NULL )==0)
						checkuser(user,usertmp,msg,IP6,ip,i);
					else
						checkuser(user,usertmp,msg,IP6,ip,i);
					}break; 
			case 6 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client7",NULL )==0)
						checkuser(user,usertmp,msg,IP7,ip,i);
					else
						checkuser(user,usertmp,msg,IP7,ip,i);
				   }break;
			case 7:{
					if(_spawnl(_P_WAIT ,prog, prog,"client8",NULL )==0)
						checkuser(user,usertmp,msg,IP8,ip,i);
					else
						checkuser(user,usertmp,msg,IP8,ip,i);
					}break; 

			case 8 : //
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client9",NULL )==0)
						checkuser(user,usertmp,msg,IP91,ip,i);
					else
						checkuser(user,usertmp,msg,IP91,ip,i);
				   }break;
			case 9:{
					if(_spawnl(_P_WAIT ,prog, prog,"client10",NULL )==0)
						checkuser(user,usertmp,msg,IP10,ip,i);
					}break; 
			case 10: 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client11",NULL )==0)
						checkuser(user,usertmp,msg,IP11,ip,i);
				   }break;
			case 11:{
					if(_spawnl(_P_WAIT ,prog, prog,"client12",NULL )==0)
						checkuser(user,usertmp,msg,IP12,ip,i);
					}break; 
			case 12: 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client13",NULL )==0)
						checkuser(user,usertmp,msg,IP13,ip,i);
				   }break;
			case 13:{
					if(_spawnl(_P_WAIT ,prog, prog,"client14",NULL )==0)
						checkuser(user,usertmp,msg,IP14,ip,i);
					}break; 

			case 14 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client15",NULL )==0)
						checkuser(user,usertmp,msg,IP15,ip,i);
				   }break;
			case 15:{
					if(_spawnl(_P_WAIT ,prog, prog,"client16",NULL )==0)
						checkuser(user,usertmp,msg,IP16,ip,i);
					}break; 
			case 16 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client17",NULL )==0)
						checkuser(user,usertmp,msg,IP17,ip,i);
				   }break;
			case 17:{
					if(_spawnl(_P_WAIT ,prog, prog,"client18",NULL )==0)
						checkuser(user,usertmp,msg,IP18,ip,i);
					}break; 
			case 18 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client19",NULL )==0)
						checkuser(user,usertmp,msg,IP19,ip,i);
				   }break;
			case 19:{
					if(_spawnl(_P_WAIT ,prog, prog,"client20",NULL )==0)
						checkuser(user,usertmp,msg,IP20,ip,i);
					}break; 

			case 20 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client21",NULL )==0)
						checkuser(user,usertmp,msg,IP21,ip,i);
				   }break;
			case 21:{
					if(_spawnl(_P_WAIT ,prog, prog,"client22",NULL )==0)
						checkuser(user,usertmp,msg,IP22,ip,i);
					}break; 
			case 22 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client23",NULL )==0)
						checkuser(user,usertmp,msg,IP23,ip,i);
				   }break;
			case 23:{
					if(_spawnl(_P_WAIT ,prog, prog,"client24",NULL )==0)
						checkuser(user,usertmp,msg,IP24,ip,i);
					}break; 
			case 24 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client25",NULL )==0)
						checkuser(user,usertmp,msg,IP25,ip,i);
				   }break;
			case 25:{
					if(_spawnl(_P_WAIT ,prog, prog,"client26",NULL )==0)
						checkuser(user,usertmp,msg,IP26,ip,i);
					}break; 

			case 26 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client27",NULL )==0)
						checkuser(user,usertmp,msg,IP27,ip,i);
				   }break;
			case 27:{
					if(_spawnl(_P_WAIT ,prog, prog,"client28",NULL )==0)
						checkuser(user,usertmp,msg,IP28,ip,i);
					}break; 
			case 28 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client29",NULL )==0)
						checkuser(user,usertmp,msg,IP29,ip,i);
				   }break;
			case 29:{
					if(_spawnl(_P_WAIT ,prog, prog,"client30",NULL )==0)
						checkuser(user,usertmp,msg,IP30,ip,i);
					}break; 
			case 30 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client31",NULL )==0)
						checkuser(user,usertmp,msg,IP31,ip,i);
				   }break;
			case 31:{
					if(_spawnl(_P_WAIT ,prog, prog,"client32",NULL )==0)
						checkuser(user,usertmp,msg,IP32,ip,i);
					}break; 

			case 32 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client33",NULL )==0)
						checkuser(user,usertmp,msg,IP33,ip,i);
				   }break;
			case 33:{
					if(_spawnl(_P_WAIT ,prog, prog,"client34",NULL )==0)
						checkuser(user,usertmp,msg,IP34,ip,i);
					}break; 
			case 34 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client35",NULL )==0)
						checkuser(user,usertmp,msg,IP35,ip,i);
				   }break;
			case 35:{
					if(_spawnl(_P_WAIT ,prog, prog,"client36",NULL )==0)
						checkuser(user,usertmp,msg,IP36,ip,i);
					}break; 
			case 36 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client37",NULL )==0)
						checkuser(user,usertmp,msg,IP37,ip,i);
				   }break;
			case 37:{
					if(_spawnl(_P_WAIT ,prog, prog,"client38",NULL )==0)
						checkuser(user,usertmp,msg,IP38,ip,i);
					}break; 

			case 38 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client39",NULL )==0)
						checkuser(user,usertmp,msg,IP39,ip,i);
				   }break;
			case 39:{
					if(_spawnl(_P_WAIT ,prog, prog,"client40",NULL )==0)
						checkuser(user,usertmp,msg,IP40,ip,i);
					}break; 
			case 40 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client41",NULL )==0)
						checkuser(user,usertmp,msg,IP41,ip,i);
				   }break;
			case 41:{
					if(_spawnl(_P_WAIT ,prog, prog,"client42",NULL )==0)
						checkuser(user,usertmp,msg,IP42,ip,i);
					}break; 
			case 42 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client43",NULL )==0)
						checkuser(user,usertmp,msg,IP43,ip,i);
				   }break;
			case 43:{
					if(_spawnl(_P_WAIT ,prog, prog,"client44",NULL )==0)
						checkuser(user,usertmp,msg,IP44,ip,i);
					}break; 

			case 44 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client45",NULL )==0)
						checkuser(user,usertmp,msg,IP45,ip,i);
				   }break;
			case 45:{
					if(_spawnl(_P_WAIT ,prog, prog,"client46",NULL )==0)
						checkuser(user,usertmp,msg,IP46,ip,i);
					}break; 
			case 46 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client47",NULL )==0)
						checkuser(user,usertmp,msg,IP47,ip,i);
				   }break;
			case 47:{
					if(_spawnl(_P_WAIT ,prog, prog,"client48",NULL )==0)
						checkuser(user,usertmp,msg,IP48,ip,i);
					}break; 
			case 48 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client49",NULL )==0)
						checkuser(user,usertmp,msg,IP49,ip,i);
				   }break;
			case 49:{
					if(_spawnl(_P_WAIT ,prog, prog,"client50",NULL )==0)
						checkuser(user,usertmp,msg,IP50,ip,i);
					}break; 

			case 50 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client51",NULL )==0)
						checkuser(user,usertmp,msg,IP51,ip,i);
				   }break;
			case 51:{
					if(_spawnl(_P_WAIT ,prog, prog,"client52",NULL )==0)
						checkuser(user,usertmp,msg,IP52,ip,i);
					}break; 
			case 52 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client53",NULL )==0)
						checkuser(user,usertmp,msg,IP53,ip,i);
				   }break;
			case 53:{
					if(_spawnl(_P_WAIT ,prog, prog,"client54",NULL )==0)
						checkuser(user,usertmp,msg,IP54,ip,i);
					}break; 
			case 54 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client55",NULL )==0)
						checkuser(user,usertmp,msg,IP55,ip,i);
				   }break;
			case 55:{
					if(_spawnl(_P_WAIT ,prog, prog,"client56",NULL )==0)
						checkuser(user,usertmp,msg,IP56,ip,i);
					}break; 

			case 56 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client57",NULL )==0)
						checkuser(user,usertmp,msg,IP57,ip,i);
				   }break;
			case 57:{
					if(_spawnl(_P_WAIT ,prog, prog,"client58",NULL )==0)
						checkuser(user,usertmp,msg,IP58,ip,i);
					}break; 
			case 58 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client59",NULL )==0)
						checkuser(user,usertmp,msg,IP59,ip,i);
				   }break;
			case 59:{
					if(_spawnl(_P_WAIT ,prog, prog,"client60",NULL )==0)
						checkuser(user,usertmp,msg,IP60,ip,i);
					}break; 
			case 60 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client61",NULL )==0)
						checkuser(user,usertmp,msg,IP61,ip,i);
				   }break;
			case 61:{
					if(_spawnl(_P_WAIT ,prog, prog,"client62",NULL )==0)
						checkuser(user,usertmp,msg,IP62,ip,i);
					}break; 

			case 62 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client63",NULL )==0)
						checkuser(user,usertmp,msg,IP63,ip,i);
				   }break;
			case 63:{
					if(_spawnl(_P_WAIT ,prog, prog,"client64",NULL )==0)
						checkuser(user,usertmp,msg,IP64,ip,i);
					}break; 
			case 64 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client65",NULL )==0)
						checkuser(user,usertmp,msg,IP65,ip,i);
				   }break;
			case 65:{
					if(_spawnl(_P_WAIT ,prog, prog,"client66",NULL )==0)
						checkuser(user,usertmp,msg,IP66,ip,i);
					}break; 
			case 66 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client67",NULL )==0)
						checkuser(user,usertmp,msg,IP67,ip,i);
				   }break;
			case 67:{
					if(_spawnl(_P_WAIT ,prog, prog,"client68",NULL )==0)
						checkuser(user,usertmp,msg,IP68,ip,i);
					}break; 

			case 68 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client69",NULL )==0)
						checkuser(user,usertmp,msg,IP69,ip,i);
				   }break;
			case 69:{
					if(_spawnl(_P_WAIT ,prog, prog,"client70",NULL )==0)
						checkuser(user,usertmp,msg,IP70,ip,i);
					}break; 
			case 70 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client71",NULL )==0)
						checkuser(user,usertmp,msg,IP71,ip,i);
				   }break;
			case 71:{
					if(_spawnl(_P_WAIT ,prog, prog,"client72",NULL )==0)
						checkuser(user,usertmp,msg,IP72,ip,i);
					}break; 
			case 72 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client73",NULL )==0)
						checkuser(user,usertmp,msg,IP73,ip,i);
				   }break;
			case 73:{
					if(_spawnl(_P_WAIT ,prog, prog,"client74",NULL )==0)
						checkuser(user,usertmp,msg,IP74,ip,i);
					}break; 

			case 74 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client75",NULL )==0)
						checkuser(user,usertmp,msg,IP75,ip,i);
				   }break;
			case 75:{
					if(_spawnl(_P_WAIT ,prog, prog,"client76",NULL )==0)
						checkuser(user,usertmp,msg,IP76,ip,i);
					}break; 
			case 76 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client77",NULL )==0)
						checkuser(user,usertmp,msg,IP77,ip,i);
				   }break;
			case 77:{
					if(_spawnl(_P_WAIT ,prog, prog,"client78",NULL )==0)
						checkuser(user,usertmp,msg,IP78,ip,i);
					}break; 
			case 78 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client79",NULL )==0)
						checkuser(user,usertmp,msg,IP79,ip,i);
				   }break;
			case 79:{
					if(_spawnl(_P_WAIT ,prog, prog,"client80",NULL )==0)
						checkuser(user,usertmp,msg,IP80,ip,i);
					}break; 

			case 80 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client81",NULL )==0)
						checkuser(user,usertmp,msg,IP81,ip,i);
				   }break;
			case 81:{
					if(_spawnl(_P_WAIT ,prog, prog,"client82",NULL )==0)
						checkuser(user,usertmp,msg,IP82,ip,i);
					}break; 
			case 82 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client83",NULL )==0)
						checkuser(user,usertmp,msg,IP83,ip,i);
				   }break;
			case 83:{
					if(_spawnl(_P_WAIT ,prog, prog,"client84",NULL )==0)
						checkuser(user,usertmp,msg,IP84,ip,i);
					}break; 
			case 84 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client85",NULL )==0)
						checkuser(user,usertmp,msg,IP85,ip,i);
				   }break;
			case 85:{
					if(_spawnl(_P_WAIT ,prog, prog,"client86",NULL )==0)
						checkuser(user,usertmp,msg,IP86,ip,i);
					}break; 

			case 86 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client87",NULL )==0)
						checkuser(user,usertmp,msg,IP87,ip,i);
				   }break;
			case 87:{
					if(_spawnl(_P_WAIT ,prog, prog,"client88",NULL )==0)
						checkuser(user,usertmp,msg,IP88,ip,i);
					}break; 
			case 88 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client89",NULL )==0)
						checkuser(user,usertmp,msg,IP89,ip,i);
				   }break;
			case 89:{
					if(_spawnl(_P_WAIT ,prog, prog,"client90",NULL )==0)
						checkuser(user,usertmp,msg,IP90,ip,i);
					}break; 
			case 90 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client91",NULL )==0)
						checkuser(user,usertmp,msg,IP91,ip,i);
				   }break;
			case 91:{
					if(_spawnl(_P_WAIT ,prog, prog,"client92",NULL )==0)
						checkuser(user,usertmp,msg,IP92,ip,i);
					}break; 

			case 92 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client93",NULL )==0)
						checkuser(user,usertmp,msg,IP93,ip,i);
				   }break;
			case 93:{
					if(_spawnl(_P_WAIT ,prog, prog,"client94",NULL )==0)
						checkuser(user,usertmp,msg,IP94,ip,i);
					}break; 
			case 94 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client95",NULL )==0)
						checkuser(user,usertmp,msg,IP95,ip,i);
				   }break;
			case 95:{
					if(_spawnl(_P_WAIT ,prog, prog,"client96",NULL )==0)
						checkuser(user,usertmp,msg,IP96,ip,i);
					}break; 
			case 96 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client97",NULL )==0)
						checkuser(user,usertmp,msg,IP97,ip,i);
				   }break;
			case 97:{
					if(_spawnl(_P_WAIT ,prog, prog,"client98",NULL )==0)
						checkuser(user,usertmp,msg,IP98,ip,i);
					}break; 

			case 98 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client99",NULL )==0)
						checkuser(user,usertmp,msg,IP99,ip,i);
				   }break;
			case 99:{
					if(_spawnl(_P_WAIT ,prog, prog,"client100",NULL )==0)
						checkuser(user,usertmp,msg,IP100,ip,i);
					}break; 
			case 100 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client101",NULL )==0)
						checkuser(user,usertmp,msg,IP101,ip,i);
				   }break;
			case 101:{
					if(_spawnl(_P_WAIT ,prog, prog,"client102",NULL )==0)
						checkuser(user,usertmp,msg,IP102,ip,i);
					}break; 
			case 102: 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client103",NULL )==0)
						checkuser(user,usertmp,msg,IP103,ip,i);
				   }break;
			case 103:{
					if(_spawnl(_P_WAIT ,prog, prog,"client104",NULL )==0)
						checkuser(user,usertmp,msg,IP104,ip,i);
					}break; 

			case 104 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client105",NULL )==0)
						checkuser(user,usertmp,msg,IP105,ip,i);
				   }break;
			case 105:{
					if(_spawnl(_P_WAIT ,prog, prog,"client106",NULL )==0)
						checkuser(user,usertmp,msg,IP106,ip,i);
					}break; 
			case 106 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client107",NULL )==0)
						checkuser(user,usertmp,msg,IP107,ip,i);
				   }break;
			case 107:{
					if(_spawnl(_P_WAIT ,prog, prog,"client108",NULL )==0)
						checkuser(user,usertmp,msg,IP108,ip,i);
					}break; 
			case 108 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client109",NULL )==0)
						checkuser(user,usertmp,msg,IP109,ip,i);
				   }break;
			case 109:{
					if(_spawnl(_P_WAIT ,prog, prog,"client110",NULL )==0)
						checkuser(user,usertmp,msg,IP110,ip,i);
					}break; 

			case 110 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client111",NULL )==0)
						checkuser(user,usertmp,msg,IP111,ip,i);
				   }break;
			case 111:{
					if(_spawnl(_P_WAIT ,prog, prog,"client112",NULL )==0)
						checkuser(user,usertmp,msg,IP112,ip,i);
					}break; 
			case 112 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client113",NULL )==0)
						checkuser(user,usertmp,msg,IP113,ip,i);
				   }break;
			case 113:{
					if(_spawnl(_P_WAIT ,prog, prog,"client114",NULL )==0)
						checkuser(user,usertmp,msg,IP114,ip,i);
					}break; 
			case 114 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client115",NULL )==0)
						checkuser(user,usertmp,msg,IP115,ip,i);
				   }break;
			case 115:{
					if(_spawnl(_P_WAIT ,prog, prog,"client116",NULL )==0)
						checkuser(user,usertmp,msg,IP116,ip,i);
					}break; 

			case 116 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client117",NULL )==0)
						checkuser(user,usertmp,msg,IP117,ip,i);
				   }break;
			case 117:{
					if(_spawnl(_P_WAIT ,prog, prog,"client118",NULL )==0)
						checkuser(user,usertmp,msg,IP118,ip,i);
					}break; 
			case 118 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client119",NULL )==0)
						checkuser(user,usertmp,msg,IP119,ip,i);
				   }break;
			case 119:{
					if(_spawnl(_P_WAIT ,prog, prog,"client120",NULL )==0)
						checkuser(user,usertmp,msg,IP120,ip,i);
					}break; 
			case 120 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client121",NULL )==0)
						checkuser(user,usertmp,msg,IP121,ip,i);
				   }break;
			case 121:{
					if(_spawnl(_P_WAIT ,prog, prog,"client122",NULL )==0)
						checkuser(user,usertmp,msg,IP122,ip,i);
					}break; 

			case 122 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client123",NULL )==0)
						checkuser(user,usertmp,msg,IP123,ip,i);
				   }break;
			case 123:{
					if(_spawnl(_P_WAIT ,prog, prog,"client124",NULL )==0)
						checkuser(user,usertmp,msg,IP124,ip,i);
					}break; 
			case 124 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client125",NULL )==0)
						checkuser(user,usertmp,msg,IP125,ip,i);
				   }break;
			case 125:{
					if(_spawnl(_P_WAIT ,prog, prog,"client126",NULL )==0)
						checkuser(user,usertmp,msg,IP126,ip,i);
					}break; 
			case 126 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client127",NULL )==0)
						checkuser(user,usertmp,msg,IP127,ip,i);
				   }break;
			case 127:{
					if(_spawnl(_P_WAIT ,prog, prog,"client128",NULL )==0)
						checkuser(user,usertmp,msg,IP128,ip,i);
					}break; 

			case 128 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client129",NULL )==0)
						checkuser(user,usertmp,msg,IP129,ip,i);
				   }break;
			case 129:{
					if(_spawnl(_P_WAIT ,prog, prog,"client130",NULL )==0)
						checkuser(user,usertmp,msg,IP130,ip,i);
					}break; 
			case 130 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client131",NULL )==0)
						checkuser(user,usertmp,msg,IP131,ip,i);
				   }break;
			case 131:{
					if(_spawnl(_P_WAIT ,prog, prog,"client132",NULL )==0)
						checkuser(user,usertmp,msg,IP132,ip,i);
					}break; 
			case 132 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client133",NULL )==0)
						checkuser(user,usertmp,msg,IP133,ip,i);
				   }break;
			case 133:{
					if(_spawnl(_P_WAIT ,prog, prog,"client134",NULL )==0)
						checkuser(user,usertmp,msg,IP134,ip,i);
					}break; 

			case 134 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client135",NULL )==0)
						checkuser(user,usertmp,msg,IP135,ip,i);
				   }break;
			case 135:{
					if(_spawnl(_P_WAIT ,prog, prog,"client136",NULL )==0)
						checkuser(user,usertmp,msg,IP136,ip,i);
					}break; 
			case 136 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client137",NULL )==0)
						checkuser(user,usertmp,msg,IP137,ip,i);
				   }break;
			case 137:{
					if(_spawnl(_P_WAIT ,prog, prog,"client138",NULL )==0)
						checkuser(user,usertmp,msg,IP138,ip,i);
					}break; 
			case 138 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client139",NULL )==0)
						checkuser(user,usertmp,msg,IP139,ip,i);
				   }break;
			case 139:{
					if(_spawnl(_P_WAIT ,prog, prog,"client140",NULL )==0)
						checkuser(user,usertmp,msg,IP140,ip,i);
					}break; 

			case 140 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client141",NULL )==0)
						checkuser(user,usertmp,msg,IP141,ip,i);
				   }break;
			case 141:{
					if(_spawnl(_P_WAIT ,prog, prog,"client142",NULL )==0)
						checkuser(user,usertmp,msg,IP142,ip,i);
					}break; 
			case 142 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client143",NULL )==0)
						checkuser(user,usertmp,msg,IP143,ip,i);
				   }break;
			case 143:{
					if(_spawnl(_P_WAIT ,prog, prog,"client144",NULL )==0)
						checkuser(user,usertmp,msg,IP144,ip,i);
					}break; 
			case 144 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client145",NULL )==0)
						checkuser(user,usertmp,msg,IP145,ip,i);
				   }break;
			case 145:{
					if(_spawnl(_P_WAIT ,prog, prog,"client146",NULL )==0)
						checkuser(user,usertmp,msg,IP146,ip,i);
					}break; 

			case 146 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client147",NULL )==0)
						checkuser(user,usertmp,msg,IP147,ip,i);
				   }break;
			case 147:{
					if(_spawnl(_P_WAIT ,prog, prog,"client148",NULL )==0)
						checkuser(user,usertmp,msg,IP148,ip,i);
					}break; 
			case 148 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client149",NULL )==0)
						checkuser(user,usertmp,msg,IP149,ip,i);
				   }break;
			case 149:{
					if(_spawnl(_P_WAIT ,prog, prog,"client150",NULL )==0)
						checkuser(user,usertmp,msg,IP150,ip,i);
					}break; 
			case 150 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client151",NULL )==0)
						checkuser(user,usertmp,msg,IP151,ip,i);
				   }break;
			case 151:{
					if(_spawnl(_P_WAIT ,prog, prog,"client152",NULL )==0)
						checkuser(user,usertmp,msg,IP152,ip,i);
					}break; 

			case 152 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client153",NULL )==0)
						checkuser(user,usertmp,msg,IP153,ip,i);
				   }break;
			case 153:{
					if(_spawnl(_P_WAIT ,prog, prog,"client154",NULL )==0)
						checkuser(user,usertmp,msg,IP154,ip,i);
					}break; 
			case 154 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client155",NULL )==0)
						checkuser(user,usertmp,msg,IP155,ip,i);
				   }break;
			case 155:{
					if(_spawnl(_P_WAIT ,prog, prog,"client156",NULL )==0)
						checkuser(user,usertmp,msg,IP156,ip,i);
					}break; 
			case 156 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client157",NULL )==0)
						checkuser(user,usertmp,msg,IP157,ip,i);
				   }break;
			case 157:{
					if(_spawnl(_P_WAIT ,prog, prog,"client158",NULL )==0)
						checkuser(user,usertmp,msg,IP158,ip,i);
					}break; 

			case 158 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client159",NULL )==0)
						checkuser(user,usertmp,msg,IP159,ip,i);
				   }break;
			case 159:{
					if(_spawnl(_P_WAIT ,prog, prog,"client160",NULL )==0)
						checkuser(user,usertmp,msg,IP160,ip,i);
					}break; 
			case 160 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client161",NULL )==0)
						checkuser(user,usertmp,msg,IP161,ip,i);
				   }break;
			case 161:{
					if(_spawnl(_P_WAIT ,prog, prog,"client162",NULL )==0)
						checkuser(user,usertmp,msg,IP162,ip,i);
					}break; 
			case 162 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client163",NULL )==0)
						checkuser(user,usertmp,msg,IP163,ip,i);
				   }break;
			case 163:{
					if(_spawnl(_P_WAIT ,prog, prog,"client164",NULL )==0)
						checkuser(user,usertmp,msg,IP164,ip,i);
					}break; 

			case 164 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client165",NULL )==0)
						checkuser(user,usertmp,msg,IP165,ip,i);
				   }break;
			case 165:{
					if(_spawnl(_P_WAIT ,prog, prog,"client166",NULL )==0)
						checkuser(user,usertmp,msg,IP166,ip,i);
					}break; 
			case 166 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client167",NULL )==0)
						checkuser(user,usertmp,msg,IP167,ip,i);
				   }break;
			case 167:{
					if(_spawnl(_P_WAIT ,prog, prog,"client168",NULL )==0)
						checkuser(user,usertmp,msg,IP168,ip,i);
					}break; 
			case 168 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client169",NULL )==0)
						checkuser(user,usertmp,msg,IP169,ip,i);
				   }break;
			case 169:{
					if(_spawnl(_P_WAIT ,prog, prog,"client170",NULL )==0)
						checkuser(user,usertmp,msg,IP170,ip,i);
					}break; 

			case 170 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client171",NULL )==0)
						checkuser(user,usertmp,msg,IP171,ip,i);
				   }break;
			case 171:{
					if(_spawnl(_P_WAIT ,prog, prog,"client172",NULL )==0)
						checkuser(user,usertmp,msg,IP172,ip,i);
					}break; 
			case 172 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client173",NULL )==0)
						checkuser(user,usertmp,msg,IP173,ip,i);
				   }break;
			case 173:{
					if(_spawnl(_P_WAIT ,prog, prog,"client174",NULL )==0)
						checkuser(user,usertmp,msg,IP174,ip,i);
					}break; 
			case 174 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client175",NULL )==0)
						checkuser(user,usertmp,msg,IP175,ip,i);
				   }break;
			case 175:{
					if(_spawnl(_P_WAIT ,prog, prog,"client176",NULL )==0)
						checkuser(user,usertmp,msg,IP176,ip,i);
					}break; 

			case 176 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client177",NULL )==0)
						checkuser(user,usertmp,msg,IP177,ip,i);
				   }break;
			case 177:{
					if(_spawnl(_P_WAIT ,prog, prog,"client178",NULL )==0)
						checkuser(user,usertmp,msg,IP178,ip,i);
					}break; 
			case 178 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client179",NULL )==0)
						checkuser(user,usertmp,msg,IP179,ip,i);
				   }break;
			case 179:{
					if(_spawnl(_P_WAIT ,prog, prog,"client180",NULL )==0)
						checkuser(user,usertmp,msg,IP180,ip,i);
					}break; 
			case 180 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client181",NULL )==0)
						checkuser(user,usertmp,msg,IP181,ip,i);
				   }break;
			case 181:{
					if(_spawnl(_P_WAIT ,prog, prog,"client182",NULL )==0)
						checkuser(user,usertmp,msg,IP182,ip,i);
					}break; 

			case 182 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client183",NULL )==0)
						checkuser(user,usertmp,msg,IP183,ip,i);
				   }break;
			case 183:{
					if(_spawnl(_P_WAIT ,prog, prog,"client184",NULL )==0)
						checkuser(user,usertmp,msg,IP184,ip,i);
					}break; 
			case 184 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client185",NULL )==0)
						checkuser(user,usertmp,msg,IP185,ip,i);
				   }break;
			case 185:{
					if(_spawnl(_P_WAIT ,prog, prog,"client186",NULL )==0)
						checkuser(user,usertmp,msg,IP186,ip,i);
					}break; 
			case 186 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client187",NULL )==0)
						checkuser(user,usertmp,msg,IP187,ip,i);
				   }break;
			case 187:{
					if(_spawnl(_P_WAIT ,prog, prog,"client188",NULL )==0)
						checkuser(user,usertmp,msg,IP188,ip,i);
					}break; 

			case 188 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client189",NULL )==0)
						checkuser(user,usertmp,msg,IP189,ip,i);
				   }break;
			case 189:{
					if(_spawnl(_P_WAIT ,prog, prog,"client190",NULL )==0)
						checkuser(user,usertmp,msg,IP190,ip,i);
					}break; 
			case 190 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client191",NULL )==0)
						checkuser(user,usertmp,msg,IP191,ip,i);
				   }break;
			case 191:{
					if(_spawnl(_P_WAIT ,prog, prog,"client192",NULL )==0)
						checkuser(user,usertmp,msg,IP192,ip,i);
					}break; 
			case 192 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client193",NULL )==0)
						checkuser(user,usertmp,msg,IP193,ip,i);
				   }break;
			case 193:{
					if(_spawnl(_P_WAIT ,prog, prog,"client194",NULL )==0)
						checkuser(user,usertmp,msg,IP194,ip,i);
					}break; 

			case 194 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client195",NULL )==0)
						checkuser(user,usertmp,msg,IP195,ip,i);
				   }break;
			case 195:{
					if(_spawnl(_P_WAIT ,prog, prog,"client196",NULL )==0)
						checkuser(user,usertmp,msg,IP196,ip,i);
					}break; 
			case 196 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client197",NULL )==0)
						checkuser(user,usertmp,msg,IP197,ip,i);
				   }break;
			case 197:{
					if(_spawnl(_P_WAIT ,prog, prog,"client198",NULL )==0)
						checkuser(user,usertmp,msg,IP198,ip,i);
					}break; 
			case 198 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client199",NULL )==0)
						checkuser(user,usertmp,msg,IP199,ip,i);
				   }break;
			case 199:{
					if(_spawnl(_P_WAIT ,prog, prog,"client200",NULL )==0)
						checkuser(user,usertmp,msg,IP200,ip,i);
					}break; 

			case 200 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client201",NULL )==0)
						checkuser(user,usertmp,msg,IP201,ip,i);
				   }break;
			case 201:{
					if(_spawnl(_P_WAIT ,prog, prog,"client202",NULL )==0)
						checkuser(user,usertmp,msg,IP202,ip,i);
					}break; 
			case 202 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client203",NULL )==0)
						checkuser(user,usertmp,msg,IP203,ip,i);
				   }break;
			case 203:{
					if(_spawnl(_P_WAIT ,prog, prog,"client204",NULL )==0)
						checkuser(user,usertmp,msg,IP204,ip,i);
					}break; 
			case 204 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client205",NULL )==0)
						checkuser(user,usertmp,msg,IP205,ip,i);
				   }break;
			case 205:{
					if(_spawnl(_P_WAIT ,prog, prog,"client206",NULL )==0)
						checkuser(user,usertmp,msg,IP206,ip,i);
					}break; 

			case 206 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client207",NULL )==0)
						checkuser(user,usertmp,msg,IP207,ip,i);
				   }break;
			case 207:{
					if(_spawnl(_P_WAIT ,prog, prog,"client208",NULL )==0)
						checkuser(user,usertmp,msg,IP208,ip,i);
					}break; 
			case 208 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client209",NULL )==0)
						checkuser(user,usertmp,msg,IP209,ip,i);
				   }break;
			case 209:{
					if(_spawnl(_P_WAIT ,prog, prog,"client210",NULL )==0)
						checkuser(user,usertmp,msg,IP210,ip,i);
					}break; 
			case 210 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client211",NULL )==0)
						checkuser(user,usertmp,msg,IP211,ip,i);
				   }break;
			case 211:{
					if(_spawnl(_P_WAIT ,prog, prog,"client212",NULL )==0)
						checkuser(user,usertmp,msg,IP212,ip,i);
					}break; 

			case 212 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client213",NULL )==0)
						checkuser(user,usertmp,msg,IP213,ip,i);
				   }break;
			case 213:{
					if(_spawnl(_P_WAIT ,prog, prog,"client214",NULL )==0)
						checkuser(user,usertmp,msg,IP214,ip,i);
					}break; 
			case 214 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client215",NULL )==0)
						checkuser(user,usertmp,msg,IP215,ip,i);
				   }break;
			case 215:{
					if(_spawnl(_P_WAIT ,prog, prog,"client216",NULL )==0)
						checkuser(user,usertmp,msg,IP216,ip,i);
					}break; 
			case 216 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client217",NULL )==0)
						checkuser(user,usertmp,msg,IP217,ip,i);
				   }break;
			case 217:{
					if(_spawnl(_P_WAIT ,prog, prog,"client218",NULL )==0)
						checkuser(user,usertmp,msg,IP218,ip,i);
					}break; 

			case 218 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client219",NULL )==0)
						checkuser(user,usertmp,msg,IP219,ip,i);
				   }break;
			case 219:{
					if(_spawnl(_P_WAIT ,prog, prog,"client220",NULL )==0)
						checkuser(user,usertmp,msg,IP220,ip,i);
					}break; 
			case 220 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client221",NULL )==0)
						checkuser(user,usertmp,msg,IP221,ip,i);
				   }break;
			case 221:{
					if(_spawnl(_P_WAIT ,prog, prog,"client222",NULL )==0)
						checkuser(user,usertmp,msg,IP222,ip,i);
					}break; 
			case 222 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client223",NULL )==0)
						checkuser(user,usertmp,msg,IP223,ip,i);
				   }break;
			case 223:{
					if(_spawnl(_P_WAIT ,prog, prog,"client224",NULL )==0)
						checkuser(user,usertmp,msg,IP224,ip,i);
					}break; 

			case 224 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client225",NULL )==0)
						checkuser(user,usertmp,msg,IP225,ip,i);
				   }break;
			case 225:{
					if(_spawnl(_P_WAIT ,prog, prog,"client226",NULL )==0)
						checkuser(user,usertmp,msg,IP226,ip,i);
					}break; 
			case 226 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client227",NULL )==0)
						checkuser(user,usertmp,msg,IP227,ip,i);
				   }break;
			case 227:{
					if(_spawnl(_P_WAIT ,prog, prog,"client228",NULL )==0)
						checkuser(user,usertmp,msg,IP228,ip,i);
					}break; 
			case 228 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client229",NULL )==0)
						checkuser(user,usertmp,msg,IP229,ip,i);
				   }break;
			case 229:{
					if(_spawnl(_P_WAIT ,prog, prog,"client230",NULL )==0)
						checkuser(user,usertmp,msg,IP230,ip,i);
					}break; 

			case 230 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client231",NULL )==0)
						checkuser(user,usertmp,msg,IP231,ip,i);
				   }break;
			case 231:{
					if(_spawnl(_P_WAIT ,prog, prog,"client232",NULL )==0)
						checkuser(user,usertmp,msg,IP232,ip,i);
					}break; 
			case 232 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client233",NULL )==0)
						checkuser(user,usertmp,msg,IP233,ip,i);
				   }break;
			case 233:{
					if(_spawnl(_P_WAIT ,prog, prog,"client234",NULL )==0)
						checkuser(user,usertmp,msg,IP234,ip,i);
					}break; 
			case 234 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client235",NULL )==0)
						checkuser(user,usertmp,msg,IP235,ip,i);
				   }break;
			case 235:{
					if(_spawnl(_P_WAIT ,prog, prog,"client236",NULL )==0)
						checkuser(user,usertmp,msg,IP236,ip,i);
					}break; 

			case 236 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client237",NULL )==0)
						checkuser(user,usertmp,msg,IP237,ip,i);
				   }break;
			case 237:{
					if(_spawnl(_P_WAIT ,prog, prog,"client238",NULL )==0)
						checkuser(user,usertmp,msg,IP238,ip,i);
					}break; 
			case 238 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client239",NULL )==0)
						checkuser(user,usertmp,msg,IP239,ip,i);
				   }break;
			case 239:{
					if(_spawnl(_P_WAIT ,prog, prog,"client240",NULL )==0)
						checkuser(user,usertmp,msg,IP240,ip,i);
					}break; 
			case 240 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client241",NULL )==0)
						checkuser(user,usertmp,msg,IP241,ip,i);
				   }break;
			case 241:{
					if(_spawnl(_P_WAIT ,prog, prog,"client242",NULL )==0)
						checkuser(user,usertmp,msg,IP242,ip,i);
					}break; 

			case 242 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client243",NULL )==0)
						checkuser(user,usertmp,msg,IP243,ip,i);
				   }break;
			case 243:{
					if(_spawnl(_P_WAIT ,prog, prog,"client244",NULL )==0)
						checkuser(user,usertmp,msg,IP244,ip,i);
					}break; 
			case 244 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client245",NULL )==0)
						checkuser(user,usertmp,msg,IP245,ip,i);
				   }break;
			case 245:{
					if(_spawnl(_P_WAIT ,prog, prog,"client246",NULL )==0)
						checkuser(user,usertmp,msg,IP246,ip,i);
					}break; 
			case 246 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client247",NULL )==0)
						checkuser(user,usertmp,msg,IP247,ip,i);
				   }break;
			case 247:{
					if(_spawnl(_P_WAIT ,prog, prog,"client248",NULL )==0)
						checkuser(user,usertmp,msg,IP248,ip,i);
					}break; 

			case 248 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client249",NULL )==0)
						checkuser(user,usertmp,msg,IP249,ip,i);
				   }break;
			case 249:{
					if(_spawnl(_P_WAIT ,prog, prog,"client250",NULL )==0)
						checkuser(user,usertmp,msg,IP250,ip,i);
					}break; 
			case 250 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client251",NULL )==0)
						checkuser(user,usertmp,msg,IP251,ip,i);
				   }break;
			case 251:{
					if(_spawnl(_P_WAIT ,prog, prog,"client252",NULL )==0)
						checkuser(user,usertmp,msg,IP252,ip,i);
					}break; 
			case 252 : 
				   {
					if(_spawnl(_P_WAIT ,prog, prog,"client253",NULL )==0)
						checkuser(user,usertmp,msg,IP253,ip,i);
				   }break;
			
			default:break;
			}
		}
//		printf("\nDetected User....");
		Sleep(10000);

	}
}
