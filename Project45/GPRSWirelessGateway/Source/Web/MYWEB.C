#include<tcp.h>
#include<string.h>
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

#define NEWLINE 0x0a // Newline code //
#define SPACE   0x20 // Space code //
#define _MaxBuffer_ 800

// Declare stream //
FILE *pppfile;
FILE *textfile;
FILE *natfile;
FILE *httpfile;
FILE *tcpfile;

int ex = 0; //if want to exit ,let's ex =1
// Declare structure //
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


tcp_Socket telnetsock;
char buffer[ _MaxBuffer_ ];
char ip[18];
char nsub[18];
char ip1[3];
char ip2[3];
char ip3[3];
char ip4[3];
char sub1[3];
char sub2[3];
char sub3[3];
char sub4[3];
char tel[15];
char apn[30];
int status;
int len, i, a;
char RequestedObject[80] ;
char ParaName[100] ;
char ParaValue[100] ;


//------------------- CONFIGURATION GPRS -----------------------------

void configGPRS(char *apn ,char *tel)
{
	/* Open file for writing */
	pppfile = fopen("CHAT.SCR","wb");
	clrscr();

		// Line 1,2 //
		strcpy(ppp.one,"ABORT ERROR ABORT BUSY ABORT 'NO DIALTONE'");
		strcpy(ppp.temp,"ABORT 'NO CARRIER' ABORT RING");
		strcat(ppp.one,"\n\0");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 3 //
		strcpy(ppp.temp,"REPORT CONNECT");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 4 //
		strcpy(ppp.temp,"TIMEOUT 10");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 5 //
		strcpy(ppp.temp,"'' ATZ");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 6 //
		strcpy(ppp.temp,"OK AT&F");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 7 //
		strcpy(ppp.temp,"OK AT+CGDCONT=1,\"IP\",\"");
		strcat(ppp.temp,"\0");
		strcat(ppp.one,ppp.temp);

		// Read gprscom //
		strcat(apn,"\0");
		strcat(ppp.one,apn);

		strcpy(ppp.temp,"\"");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 8 //
		strcpy(ppp.temp,"OK ATDT");
		strcat(ppp.temp,"\0");
		strcat(ppp.one,ppp.temp);

		// Read telno //
		strcat(tel,"\0");
		strcat(ppp.one,tel);

		strcpy(ppp.temp,"#");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 9 //
		strcpy(ppp.temp,"TIMEOUT 60");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		// Line 10 //
		strcpy(ppp.temp,"CONNECT");
		strcat(ppp.temp,"\n\0");
		strcat(ppp.one,ppp.temp);

		/* Write data to file */
		fwrite(&ppp.one,sizeof(ppp.one),1,pppfile);

	/* Close file */
	fclose(pppfile);
}

//------------------CONFIGURATION NAT----------------------
void configNAT(char *ip,char *nsub)
{	char httpdata[100] = "";
	char tcpdata[100] = "";

	/* Open file for writing */
	natfile = fopen("NAT.INI","wb");
	httpfile =fopen("HTTP.DOM","wb");
	tcpfile = fopen("TCP.CFG","wb");

	clrscr();

		/* Line 1,2*/
		strcpy(nat.two,"local_pdi=0x61");strcpy(nat.temps,"remote_pdi=0x60");
		strcat(nat.two,"\n\0");	strcat(nat.temps,"\n\0");
		strcat(nat.two,nat.temps);
		/* Line 3 */
		strcpy(nat.temps,"local_ip=");strcat(nat.temps,"\0");
		strcat(nat.two,nat.temps);
		/* Read ip */
		strcpy(nat.temps,ip);strcat(nat.temps,"\0");
		strcat(nat.two,nat.temps);strcat(nat.two,"\n");

		strcpy(httpdata,ip);strcat(httpdata,"=a:\demo\www\0");

		strcpy(tcpdata,"my_ip=");strcat(tcpdata,ip);
		strcat(tcpdata,"\n\0");
		strcat(tcpdata,"netmask=");strcat(tcpdata,nsub);
		strcat(tcpdata,"\n\0");

		/* Line 4 */
		strcpy(nat.temps,"local_mask=");strcat(nat.temps,"\0");
		strcat(nat.two,nat.temps);
		/* Read subnat mask */
		strcpy(nat.temps,nsub);	strcat(nat.temps,"\0");
		strcat(nat.two,nat.temps);strcat(nat.two,"\n");
		/* Line 5 */
		strcpy(nat.temps,";remote_ip=161.246.5.167");strcat(nat.temps,"\n\0");
		strcat(nat.two,nat.temps);
		/* Line 6 */
		strcpy(nat.temps,";remote_mask=255.255.255.0");
		strcat(nat.temps,"\n\0"); strcat(nat.two,nat.temps);

		/* Line 7 */
		strcpy(nat.temps,";remote_gateway=161.246.5.254");
		strcat(nat.temps,"\n\0");strcat(nat.two,nat.temps);
		/* Line 8 */
		strcpy(nat.temps,";local_gateway=192.168.1.3");
		strcat(nat.temps,"\n\0");strcat(nat.two,nat.temps);
		/* Write data to file */
		fwrite(&nat.two,sizeof(nat.two),1,natfile);
		fwrite(&tcpdata,sizeof(tcpdata),1,tcpfile);
		fwrite(&httpdata,sizeof(httpdata),1,httpfile);

		/* Close file */
		fclose(natfile);
		fclose(tcpfile);
		fclose(httpfile);


}                                

//--------------------CHECK STRING--------------------

void parseGETPOST(char * s) {


  i = 0 ;
  while (s[i]!='/') {
   i++ ;
  }
  a = 0 ;
  // start parse requested object
  while ((s[i]!=' ')&&(s[i]!='?')) {
    RequestedObject[a] = s[i] ;
    i++ ; a++ ;
  }
  if (s[i]=='?') {
    // parse get method parameter
    i++ ;
    while (s[i]!=' ') {
      // parse Paramenter Name
      a = 0 ;
      while ((s[i]!='=')&&(s[i]!=' ')) {
	ParaName[a] = s[i] ;
	a++ ; i++ ;
      }
      // Parse Paramenter Value
      i++ ;
      a = 0 ;
      while ((s[i]!='&')&&(s[i]!=' ')) {
	ParaValue[a] = s[i] ;
	i++ ; a++ ;
      }
      if (s[i]=='&') {
       i++ ;
      }


      // clear temp
      for (a=0;a<30;a++) {
	ParaName[a] = 0 ;
	ParaValue[a] = 0 ;
      }
    }
  } else { // no parameter
    // find POST Parameter
    while (((s[i]!=0)&&(i<_MaxBuffer_))&&!(((s[i]=='\r')&&(s[i+1]=='\n')&&(s[i+2]=='\r')&&(s[i+3]=='\n')))) {
      i++ ;
    }
    if  ((s[i]=='\r')&&(s[i+1]=='\n')&&(s[i+2]=='\r')&&(s[i+3]=='\n')) {
      i+=4 ;
      // parse POST Parameter
       while ((s[i]!=0)&&(s[i]!='\r')) {
	 // parse Paramenter Name
	 a = 0 ;
	 while ((s[i]!='=')&&(s[i]!=0)&&(s[i]!='\r')) {
	   ParaName[a] = s[i] ;
	   a++ ; i++ ;
	 }
	 // Parse Paramenter Value
	 i++ ;
	 a = 0 ;
	 while ((s[i]!='&')&&(s[i]!=0)&&(s[i]!='\r')) {
	   ParaValue[a] = s[i] ;
	   i++ ; a++ ;
	 }
	 if (s[i]=='&') {
	   i++ ;
	 }
//------------------------ RETURN PARAMETER ----------------------

	 printf("%s = %s : %d\n",ParaName, ParaValue, strlen(ParaValue)) ;

	 if (strcmp(ParaName, "tel")==0) {
	   strcpy(tel,ParaValue) ;
	 } else if (strcmp(ParaName, "apn")==0) {
	   strcpy(apn,ParaValue) ;
	 } else if (strcmp(ParaName, "ip1")==0) {
	   strcpy(ip1,ParaValue) ;
	   strcat(ip1,"\0");
	   for(a=0;a<18;a++){
	   ip[a] = 0;
	   }
	   strcpy(ip,ip1);
	   strcat(ip,".");
	   strcat(ip,"\0");
	 } else if (strcmp(ParaName, "ip2")==0) {
	   strcpy(ip2,ParaValue) ;
	   strcat(ip2,"\0");
	   strcat(ip,ip2);
	   strcat(ip,".");
	   strcat(ip,"\0");
	 } else if (strcmp(ParaName, "ip3")==0) {
	   strcpy(ip3,ParaValue) ;
	   strcat(ip3,"\0");
	   strcat(ip,ip3);
	   strcat(ip,".");
	   strcat(ip,"\0");
	 } else if (strcmp(ParaName, "ip4")==0) {
	   strcpy(ip4,ParaValue) ;
	   strcat(ip4,"\0");
	   strcat(ip,ip4);

	 } else if (strcmp(ParaName, "sub1")==0) {
	   strcpy(sub1,ParaValue) ;
	   for(a=0;a<18;a++){
	   nsub[a] = 0;
	   }
	   strcpy(nsub,sub1);
	   strcat(nsub,".");
	   strcat(nsub,"\0");
	 } else if (strcmp(ParaName, "sub2")==0) {
	   strcpy(sub2,ParaValue) ;
	   strcat(sub2,"\0");
	   strcat(nsub,sub2);
	   strcat(nsub,".");
	   strcat(nsub,"\0");
	 } else if (strcmp(ParaName, "sub3")==0) {
	   strcpy(sub3,ParaValue) ;
	   strcat(sub3,"\0");
	   strcat(nsub,sub3);
	   strcat(nsub,".");
	   strcat(nsub,"\0");

	 } else if (strcmp(ParaName, "sub4")==0) {
	   strcpy(sub4,ParaValue) ;
	   strcat(sub4,"\0");
	   strcat(nsub,sub4);

	 }

	 // clear temp
	 for (a=0;a<30;a++) {
	   ParaName[a] = 0 ;
	   ParaValue[a] = 0 ;
	 }

       }

     }
  if(strcmp(apn,"") == 0) //user not submit value
  {   	strcpy(apn,"www.dtac.co.th"); //default value
  }
  if(strcmp(tel,"") == 0)
  {
	strcpy(tel,"*99***1"); //default value
  }
  configGPRS(apn,tel);

  if(strcmp(ip,"") == 0)
  {	strcpy(ip,"10.64.1.32"); // default value
  }
  if(strcmp(nsub,"") == 0)
  {
	strcpy(nsub,"255.255.255.0"); //default value
  }
  configNAT(ip,nsub);
  }


  printf("%s\n",RequestedObject) ;
  printf("buffer= %s",buffer);
 /* printf("%s\n",sub1);
  printf("%s\n",sub2);
  printf("%s\n",sub3);
  printf("%s\n",sub4);
  printf("%s\n",apn);
  printf("%s\n",tel);*/
}

//-----------------------------CLEAR BUFFER--------------

void clearBuffer(void) {
	for(i=0;i<_MaxBuffer_;i++) {
	 buffer[i] = 0 ;
	}
}

//--------------------HTTP-------------------------------

void myhttp(void) {
	static tcp_Socket *s;
	clearBuffer() ;
	s = &telnetsock;

	if(tcp_listen( s, 80, 0L, 0, NULL,5))
		printf("connection is opened ......exit = %d\n",ex);


	sock_wait_established(s, 0, NULL, &status);
	sock_mode(s, TCP_MODE_BINARY) ;
	sock_wait_input(s, 0, NULL, &status) ;
	sock_fastread(s, buffer, 600) ;
	printf("%s", buffer) ;
	parseGETPOST(buffer) ;

	sock_puts(s, "HTTP/1.0 200 Ok\n\r")  ;
	sock_puts(s, "Content-Type: text/html; charset=\"utf-8\"\n\r") ;
	sock_puts(s, "\n\r") ;
	sock_puts(s, "<HTML>") ;
	sock_puts(s, "<body bgcolor = \"#FFFFFF\"> ") ;
	//init TABLE
	sock_puts(s, "<table width=\"60%\" border = \"0\" bgcolor = \"#CCCCCC\" align = \"center\">") ;
	sock_puts(s, "<tr>") ;
	sock_puts(s, "<td height=\"70\" colspan=\"3\" bgcolor = \"#0066CC\" align = \"center\"><font color=\"#FFFFFF\" size = \"5\"><strong>GPRS WIRELESS GATEWAY CONFIGURATION</strong></font></td></tr>") ;
	sock_puts(s, "<FORM ACTION=\"A.HTM\" METHOD=\"POST\">") ;
	//GPRS
	sock_puts(s, "<tr bgcolor =\"#3333FF\"><td height = \"18\" align = \"left\" colspan=\"3\"><font color=\"#FFFFFF\" size=\"3\"><strong>GPRS Configuration</strong></font></td></tr>") ;
	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>ISP NAME    :</strong></font></td>") ;
	sock_puts(s, "<td><INPUT TYPE=\"TEXT\" SIZE = \"30\" maxlength = \"30\"VALUE = \"www.dtac.co.th\" NAME=\"apn\" /></td></tr>") ;
	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>ISP TELEPHONE NUMBER :</strong></font></td>") ;
	sock_puts(s, "<td><INPUT TYPE=\"TEXT\" SIZE = \"11\" maxlength = \"11\"VALUE = \"*99***1\" NAME=\"tel\" /></td></tr>") ;

	//NAT
	sock_puts(s, "<tr bgcolor =\"#3333FF\"><td height = \"18\" align = \"left\" colspan=\"3\"><font color=\"#FFFFFF\" size=\"3\"><strong>NAT Configuration</strong></font></td></tr>") ;
	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>LOCAL IP ADDRESS     :</strong></font></td>") ;
	sock_puts(s, "<td><INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"ip1\" /> ") ;
	sock_puts(s, "<INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"ip2\" /> ") ;
	sock_puts(s, "<INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"ip3\" /> ") ;
	sock_puts(s, "<INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"ip4\" /></td></tr>")  ;
	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");

	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>LOCAL SUBNET MASK    :</strong></font></td>") ;
	sock_puts(s, "<td><INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"sub1\" /> ") ;
	sock_puts(s, "<INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"sub2\" /> ") ;
	sock_puts(s, "<INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"sub3\" /> ") ;
	sock_puts(s, "<INPUT TYPE=\"TEXT\" SIZE = \"3\" maxlength = \"3\" NAME=\"sub4\" /></td></tr>")  ;
	//SUBMIT
	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td></td>");
	sock_puts(s, "<td align = \"right\"><INPUT TYPE=\"SUBMIT\" NAME=\"SUBMIT\" VALUE=\"SUBMIT\" /></td></tr>");
	sock_puts(s, "</FORM>") ;

	//ACK
	sock_puts(s, "<tr bgcolor =\"#3333FF\"><td height = \"18\" align = \"left\" colspan=\"3\"><font color=\"#FFFFFF\" size=\"3\"><strong>Acknowledgement</strong></font></td></tr>") ;

	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>Assist.Prof. Apinetr Unakul</strong></font></td>") ;
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>: Advisor</strong></font></td></tr>") ;

	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>Mr. Dusit Niyato</strong></font></td>") ;
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>: Advisor</strong></font></td></tr>") ;

	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>Siemens Ltd.</strong></font></td>") ;
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>: Support MC35 Terminal</strong></font></td></tr>") ;

	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>Mr. Suriyan Laohaprapanon</strong></font></td>") ;
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>: To give an advice for us</strong></font></td></tr>") ;

	sock_puts(s, "<tr bgcolor =\"#CCCCCC\"><td width  = \"20%\"></td>");
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>Mr. Jason Sarich</strong></font></td>") ;
	sock_puts(s, "<td align = \"left\"><font color=\"#000000\" size=\"3\"><strong>: To give an advice for us</strong></font></td></tr>") ;

	sock_puts(s, "<tr bgcolor =\"#3333FF\"><td height = \"8\" colspan=\"3\"></td></tr>");

       //	sock_puts(s, "</FORM>") ;
	sock_puts(s, "</table>") ;
	sock_puts(s, "</body>") ;
	sock_puts(s, "</HTML>") ;

	sock_flush(s) ;

	sock_close(s) ;
	sock_wait_closed(s, 0, NULL, &status) ;


	sock_err:
	switch (status) {
		case 1 :/*foreign host closed */
			puts("User closed session");
			return;
		case -1: /* timeout */
			printf("\n\rConnection timed out!");
			ex =1;
			return;
		}
}

//------------------------------MAIN-----------------------

void main(void)
{
	sock_init();
	printf("Hi! Myweb configure program.\n");

	while(1) {
		if(kbhit())
		{	exit(0);
		}

/*		if(ex == 1)
		{ 	printf("Exit program \n");
			exit(0);
		}
		else
		{*/
			myhttp() ;
//		}
	}

}
