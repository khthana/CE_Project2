#include "napt.h"

#define NEWLINE 0x0a /* Newline code */
#define SPACE   0x20 /* Space code */

/* Declare stream */
FILE *pppfile;
FILE *textfile;
FILE *natfile;
FILE *dhcpfile;

int i =0,j=0,k=0;
int sendcommand =0,gprstime = 0,NATtime;
char command[30];
char ccmd[30];


/* Declare structure */
struct ppptype{
	char one[190];
	char temp[30];
	char gprscom[20];
	char telno[15];
	}ppp;

struct nattype{
	char two[190];
	char temps[30];
	char ip[15];
	char sub[15];
	}nat;

struct dhcptype{
	char three[190];
	char tempc[30];
	char ipf[15];
	char ipt[15];
	}dhcp;

/* Declare file name string */
	char filename[80];

/* Prototype section */
	void display();
	void configGPRS();
	void configNAT();
	void configDHCP();

void console()
{
	if(sendcommand == 1) //last command has not finished yet
	{
			MtCYield();
			exitconsole = 0;
	}else{
			if(scan == '1')
			{
					sendcommand =1;
					MtCCoroutine(display());
//					clrscrn();
					printf("Display Menu \n");
					printf("List of textfile :\n\n");
					printf("**********************************\n");
					printf("*  See GPRS type chat.scr	 *\n");
					printf("*  See NAT  type nat.ini         *\n");
					printf("*  See DHCP type dhcp.gpr        *\n");
					printf("**********************************\n\n");
					printf("Please enter textfile to read :");
			}else if(scan == '2')
			{		sendcommand =1;
					MtCCoroutine(configGPRS());
//					clrscrn();
					printf("Configuration GPRS file \n");
					if(gprstime == 0)
							printf("Please enter ISP Name : ");
					else
							printf("Please enter telephone number : ");

			}else if(scan == '3')
			{		sendcommand =1;
					MtCCoroutine(configNAT());
//					clrscrn();
					printf("Configuration NAT file \n");
					if(gprstime == 0)
							printf("Please enter IP address : ");
					else
							printf("Please enter subnet mask : ");

			}else if(scan == '4')
			{		configDHCP();
			}else if(scan == '5')
			{
				 //exit(0);
				 printf("Exit from Console configuration program \n");
				 exitconsole =1;
			}else
			{
				 //printf("Please enter number \n");
				printf("\nPlease select\n");
				printf("    1.Display_file\n");
				printf("    2.Configuration_GPRS\n");
				printf("    3.Configuration_NAT\n");
				printf("    4.Configuration_DHCP\n");
				printf("    5.Exit\n");

			}
	}
}

void configGPRS()
{   //	printf("This is config GPRS\n");
	/* Open file for writing */
	pppfile = fopen("CHAT.SCR","wb");
	//clrscrn();

		/* Line 1,2*/
		strcpy(ppp.one,"ABORT ERROR ABORT BUSY ABORT 'NO DIALTONE'");
		strcpy(ppp.temp,"ABORT 'NO CARRIER' ABORT RING");
		strcat(ppp.one,"\n\0");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		/* Line 3 */
		strcpy(ppp.temp,"REPORT CONNECT");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		/* Line 4 */
		strcpy(ppp.temp,"TIMEOUT 10");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		/* Line 5 */
		strcpy(ppp.temp,"'' ATZ");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		/* Line 6 */
		strcpy(ppp.temp,"OK AT&F");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		/* Line 7 */
		strcpy(ppp.temp,"OK AT+CGDCONT=1,");
		strcat(ppp.temp,"\0");
		strcat(ppp.one,ppp.temp);

		/* Read gprscom */
		while(1)
		{	if(gprstime == 0 & keyhit == 1)
			{
				if(scan == 8){
					if(k>0)
					{
						k--;
						ccmd[k] = '\0';
					}else
						ccmd[0] = '\0';
					clrscrn();
					printf("Config GPRS 's file \n");
					printf("Please enter ISP Name : ");
					printf("%s",ccmd);
				}else if(scan == 13)
				{
//					printf("\ngoing to concat %s to ppp.one \n",ccmd);
					printf("\nPlease enter telephone number : ");
					strcpy(ppp.gprscom,ccmd);
					strcat(ppp.one,"\"IP\",\"");
					strcat(ppp.one,"\0");
					strcat(ppp.gprscom,"\0");
					strcat(ppp.one,ppp.gprscom);
					strcat(ppp.one,"\"\n");

					// Line 8
					strcpy(ppp.temp,"OK ATDT");
					strcat(ppp.temp,"\0");
					strcat(ppp.one,ppp.temp);
					gprstime = 1;
					k=0;
				}else if(scan == 27){ //quit program
					exitconsole = 1;
					break;
				}else{
					ccmd[k] = scan;
					printf("%c",ccmd[k]);
					k++;
					ccmd[k] = '\0';
				}
		}else if(gprstime == 1 && keyhit ==1)
		{ //gprstime == 1
			if(scan == 8){
					if(k>0)
					{
						k--;
						ccmd[k] = '\0';
					}else 
						ccmd[0] = '\0';
					clrscrn();
					printf("Config GPRS 's file \n");
					printf("Please enter telephone number : ");
					printf("%s",ccmd);
				}else if(scan == 13)
				{
  //					printf("Going to concat %s to ppp.ont",ccmd);
					strcpy(ppp.telno,ccmd);
					strcat(ppp.telno,"\n\0");
					strcat(ppp.one,ppp.telno);
					// Line 9 
					strcpy(ppp.temp,"TIMEOUT 60");
					strcat(ppp.temp,"\n\0");
					strcat(ppp.one,ppp.temp);
					// Line 10 
					strcpy(ppp.temp,"CONNECT");
					strcat(ppp.temp,"\n\0");
					strcat(ppp.one,ppp.temp);

					// Write data to file 
					printf("Write ppp.one =%s \n",ppp.one);
					fwrite(&ppp.one,sizeof(ppp.one),1,pppfile);
			
					// Close file 
					fclose(pppfile);

					gprstime = 0;
					k=0;
					break;
				}else if(scan == 27){ //quit program
					exitconsole = 1;	
					break;
				}else{
					ccmd[k] = scan;
					printf("%c",ccmd[k]);
					k++;
					ccmd[k] = '\0';
				}
		}
			MtCYield();
	}

	sendcommand = 0; //finised

	strcpy(command,"\0\0");
	strcpy(ccmd,"\0\0");
	i =0; k =0;
//	clrscrn();
	printMenu();
	MtCStop(NULL);
}

void configNAT()
{     //	printf("This is config NAT\n");
	/* Open file for writing */
	natfile = fopen("NAT.INI","wb");
	/* Line 1,2*/
	strcpy(nat.two,"local_pdi=0x61");
	strcpy(nat.temps,"remote_pdi=0x60");
	strcat(nat.two,"\n\0");
	strcat(nat.temps,"\n\0");
	strcat(nat.two,nat.temps);

	/* Line 3 */
	strcpy(nat.temps,"local_ip=");
	strcat(nat.temps,"\0");
	strcat(nat.two,nat.temps);

		while(1)
		{	if(NATtime == 0 && keyhit == 1)
			{
				if(scan == 8){
					if(k>0)
					{
						k--;
						ccmd[k] = '\0';
					}else
						ccmd[0] = '\0';
					clrscrn();
					printf("Config NAT 's file \n");
					printf("Please enter IP address : ");
					printf("%s",ccmd);
				}else if(scan == 13)
				{
//					printf("\ngoing to concat %s to nat.two \n",ccmd);
					printf("\nPlease enter subnet mask : ");
					strcpy(nat.ip,ccmd);
					strcat(nat.ip,"\n\0");
					strcat(nat.two,nat.ip);

					/* Line 4 */
					strcpy(nat.temps,"local_mask=");
					strcat(nat.temps,"\0");
					strcat(nat.two,nat.temps);

					NATtime = 1;
					k=0;
				}else if(scan == 27){ //quit program
					exitconsole = 1;
					break;
				}else{
					ccmd[k] = scan;
					printf("%c",ccmd[k]);
					k++;
					ccmd[k] = '\0';
				}
		}else if(NATtime == 1 && keyhit == 1)
		{ //NATtime == 1
			if(scan == 8){
					if(k>0)
					{
						k--;
						ccmd[k] = '\0';
					}else 
						ccmd[0] = '\0';
					clrscrn();
					printf("Config NAT 's file \n");
					printf("Please enter subnet mask : ");		
					printf("%s",ccmd);
				}else if(scan == 13)
				{	
  //					printf("\nGoing to concat %s to nat.two",ccmd);
					strcpy(nat.sub,ccmd);
					strcat(nat.sub,"\n\0");
					strcat(nat.two,nat.sub);

					/* Line 5 */
					strcpy(nat.temps,";remote_ip=161.246.5.167");
					strcat(nat.temps,"\n\0");
					strcat(nat.two,nat.temps);

					/* Line 6 */
					strcpy(nat.temps,";remote_mask=255.255.255.0");
					strcat(nat.temps,"\n\0");
					strcat(nat.two,nat.temps);

					/* Line 7 */
					strcpy(nat.temps,";remote_gateway=161.246.5.254");
					strcat(nat.temps,"\n\0");
					strcat(nat.two,nat.temps);

					/* Line 8 */
					strcpy(nat.temps,";local_gateway=192.168.1.3");
					strcat(nat.temps,"\n\0");
					strcat(nat.two,nat.temps);
					/* Write data to file */
					fwrite(&nat.two,sizeof(nat.two),1,natfile);

					/* Close file */
					fclose(natfile);
					NATtime = 0;
					k=0;
					break;
				}else if(scan == 27){ //quit program
					exitconsole = 1;
					break;
				}else{
					ccmd[k] = scan;
					printf("%c",ccmd[k]);
					k++;
					ccmd[k] = '\0';
				}
		}
			MtCYield();
	}

	sendcommand = 0; //finised

	strcpy(command,"\0\0");
	strcpy(ccmd,"\0\0");
	i =0; k =0;
//	clrscrn();
	printMenu();
	MtCStop(NULL);

///////////////////////////////////////////////////////////
}

void configDHCP()
{	//	printf("This is config DHCP\n");
	printf("\nThis module is under construction.\n");
//	clrscrn();
	printMenu();
}

void display()
{
	char ch;
//	printf("This is config display\n");

	while(1)
	{       //printf("press any key to continue.\n");
		 if(keyhit == 1){
			if(scan == 8){
				if(k>0)
				{
					k--;
					ccmd[k] = '\0';
				}else
					ccmd[0] = '\0';
				clrscrn();
				printf("List of textfile :\n\n");
				printf("**********************************\n");
				printf("*  See GPRS type chat.scr        *\n");
				printf("*  See NAT  type nat.ini         *\n");
				printf("*  See DHCP type dhcp.gpr        *\n");
				printf("**********************************\n\n");
				printf("Please enter textfile to read :");
				printf("%s",ccmd);
			}else if(scan == 13)
			{
				printf("\ngoing to open file:%s\n",ccmd);

				strcpy(filename,ccmd);
				if(!(textfile = fopen(filename,"r")))
				{
					 //Error opening
					printf("\nNo file %s\n",filename);
//					exit(1); // Send errorcode 1 to DOS
//					exitconsole =1;
					break;
				}

				/* Repeat until no data to read */
				while(!feof(textfile))
				{
					ch = fgetc(textfile);
					if(ch>=SPACE)
						putchar(ch);
					else
						if(ch==NEWLINE) /* Return code */
							printf("\n");
					/* Ignore other control code */
				}
				fclose(textfile);
				k=0;
			    break;
			}else if(scan == 27){ //quit program
				exitconsole = 1;
				break;
			}else{
				ccmd[k] = scan;
				printf("%c",ccmd[k]);
				k++;
				ccmd[k] = '\0';
			}
		 }// yile until keyboard hit
			MtCYield();
	}
	sendcommand = 0; //finised
	strcpy(command,"\0\0");
	strcpy(ccmd,"\0\0");
	i =0; k =0;

//	printf("\nPlease enter number:");
	printMenu();
	MtCStop(NULL);
}
void printMenu()
{
	printf("\nPlease select\n");
	printf("    1.Display_file\n");
	printf("    2.Configuration_GPRS\n");
	printf("    3.Configuration_NAT\n");
	printf("    4.Configuration_DHCP\n");
	printf("    5.Exit\n");
}