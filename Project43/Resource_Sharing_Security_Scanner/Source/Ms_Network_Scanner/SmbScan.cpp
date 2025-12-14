#ifndef UNICODE
#define UNICODE
#endif
#include <stdio.h>
#include <conio.h>
#include <windows.h>
#include <lm.h>
#include <stdlib.h>
#include <iostream.h>
#include <memory.h>
#include <string.h>

int OS_Detect(LPTSTR ServerName);
void char2wchar_t(char *d_in,wchar_t *d_out);
int ShareCheck(LPTSTR ComputerName);

int main(int argc, char *argv[])
{
   LPWSTR ServerName = NULL;
   wchar_t temp[100];
   int OS,key;
   textattr(0x0f);
   cprintf("SMB Resource Sharing Scanner version 1.0\r\n");
   cprintf("Copyright (C) 2000-2001 ISAG Group\r\n\r\n");

   if (argc > 1)
   {
      char2wchar_t(argv[1],temp);
      ServerName = temp;
   }

   OS = OS_Detect(ServerName);
   cprintf("\r\n........Press ENTER to view Enumulate Resource.........\r\n");

   do
      key = getch();
   while ( key!= 13);
   clrscr();

   if ((OS == 5)||(OS == 0))  // WFW, 95, 98.
      ShareCheck(ServerName);
   else { /* Do Not Thing  */ }

   return 0;
}

void char2wchar_t(char *d_in,wchar_t *d_out)
{
  int i;
  for (i=1;i<=strlen(d_in);i++)
     d_out[i-1] = d_in[i-1];
  d_out[i-1] = '\0';
  return;
}

int OS_Detect(LPTSTR ServerName)
{

	DWORD dwLevel			= 101;
	LPSERVER_INFO_101 pBuf	= NULL;
	LPWKSTA_INFO_102  pwBuf = NULL;
	NET_API_STATUS nStatus;

	nStatus = NetServerGetInfo(ServerName,
							   dwLevel,
							   (LPBYTE *)&pBuf);

	if (nStatus == NERR_Success)
   {
      cprintf("****** Computer Details ******\r\n\r\n");
		cprintf("Computer Name : %S \r\n",pBuf->sv101_name);

		if (pBuf->sv101_type & SV_TYPE_SERVER_NT )
			cprintf("%S is an NT MEMBER SERVER.\r\n",pBuf->sv101_name);
		else if (pBuf->sv101_type &  SV_TYPE_NT )
			cprintf("%S is an NT WORKSTATION.\r\n",pBuf->sv101_name);
		else if (pBuf->sv101_type &  SV_TYPE_WINDOWS )
			cprintf("%S is running Windows 9x.\r\n",pBuf->sv101_name);
		else if (pBuf->sv101_type & SV_TYPE_WFW )
			cprintf("%S is Windows for Workgroups.\r\n",pBuf->sv101_name);
      else cprintf("Server Type MisMatch\r\n");

		cprintf("Platform : %d \r\n", pBuf->sv101_platform_id);
		cprintf("Version : %d.%d \r\n", pBuf->sv101_version_major, pBuf->sv101_version_minor);
		cprintf("Comment : %S \r\n", pBuf->sv101_comment);
	}

	else
   {
		printf("OS Detection Error %d \n" ,nStatus);
		if (pBuf != NULL)
		NetApiBufferFree(pBuf);
		return(-1);
	}

	nStatus = NetWkstaGetInfo(ServerName,
                             dwLevel,
                             (LPBYTE *)&pwBuf);

	if (nStatus == NERR_Success) {
      cprintf("WorkGroup : %S\r\n", pwBuf->wki102_langroup);
	   cprintf("Lan Root : %S\r\n", pwBuf->wki102_lanroot);
 	}

	else {
		cprintf("OS Detection Error %d \r\n" ,nStatus);
 		if (pwBuf != NULL)
		NetApiBufferFree(pwBuf);
		return (-1);
	}

	if (pBuf->sv101_type & (SV_TYPE_NOVELL | SV_TYPE_WFW | SV_TYPE_WINDOWS)){
		return(5); // Have to flag Windows 9x machines
	}

	if (pBuf != NULL)
		NetApiBufferFree(pBuf);
	return(0);
}

int ShareCheck(LPTSTR ComputerName)
{
   int key;
   int count = 0;
	PSHARE_INFO_1 BufPtr,p;
	NET_API_STATUS res;
   LPVOID lpMsgBuf;
	DWORD i,j=0,length;
	DWORD entriesread=0, resume_handle=0, totalentries=0;
   LPSERVER_INFO_101 pBuf=NULL,pp;
	NET_API_STATUS nStatus;
   FILE *TestFile;
   char temp[100];
   char *TestFileName = "\\$$test$$";
   char *BgSla = "\\\\";

   temp[0]='\0';
   strcat(temp,BgSla);
   nStatus = NetServerGetInfo(ComputerName,
							   101,
							   (LPBYTE *)&pBuf);

   if (nStatus != NERR_Success) return -1;
   pp = pBuf;
   length = strlen(temp);
   while (pp->sv101_name[j] != '\0')
   {
      temp[j+length] = pp->sv101_name[j];
      j++;
   }

   temp[j+length] = '\\';
   temp[j+length+1] = '\0';
   length = strlen(temp);

	do
   {
		res = NetShareEnum(ComputerName,
							 1,
							 (LPBYTE *) &BufPtr,
							 0xFFFFFFFF,
							 &entriesread,
							 &totalentries,
							 &resume_handle);

		if(res == ERROR_SUCCESS || res == ERROR_MORE_DATA)
      {
			p = BufPtr;
         for(i=0;i<entriesread;i++)
         {

             if ((p->shi1_type == STYPE_DISKTREE) || (p->shi1_type == STYPE_PRINTQ))
             {
				    cprintf("[Share] : %S\r\n",p->shi1_netname);
                if (p->shi1_type == STYPE_DISKTREE) cprintf("    [Type] : Disk drive\r\n");
                else if (p->shi1_type == STYPE_PRINTQ) cprintf("    [Type] : Print queue\r\n");
                else if (p->shi1_type == STYPE_DEVICE) cprintf("    [Type] : Communication device\r\n");
                else if (p->shi1_type == STYPE_IPC) cprintf("    [Type] : Interprocess Communication (IPC)\r\n");
                cprintf("    [Comment] : %S\r\n", p->shi1_remark);

                // --------------------- Test Connect Only Disk --------------------- //

                if (p->shi1_type == STYPE_DISKTREE)
                {
                   j = 0;
                   while (p->shi1_netname[j] != '\0')
                   {
                      temp[j+length] = p->shi1_netname[j];
                      j++;
                   }
                   temp[j+length] = '\0';

                   strcat(temp,TestFileName);

                   if ((TestFile = fopen(temp, "w")) == NULL)
                   {
                      cprintf("    [Permission] Read Only or PassWord Protection.\r\n");
                      fclose(TestFile);
                  }
                   else cprintf("    [Permission] Full Access.\r\n");
                }

                if (((count + 1) % 4) == 0)
                {
                   cprintf("................... Press Enter to Next Resource ......................\r\n");
                   do
                      key = getch();
                   while ( key!= 13);
                   clrscr();
                }
                else
                   printf(".......................................................................\n");
                count++;
             }
				 p++;
			}
			NetApiBufferFree(BufPtr);
		}
		else
      {
         FormatMessage(     FORMAT_MESSAGE_ALLOCATE_BUFFER |
			FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
			NULL,
			GetLastError(),
			MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
			(LPTSTR) &lpMsgBuf,
			0,
			NULL );
			cprintf("Share Enumeration Error: %S \r\n" ,(LPCTSTR)lpMsgBuf);
			cprintf("Share Enumeration Error (%S):\r\n %S\r\n" ,GetLastError(),(LPCTSTR)lpMsgBuf);
			LocalFree( lpMsgBuf );
		   cprintf("Attempting to obtain NetBIOS shares using lower security setting\r\n");
			return(-1);
		}
	}
   while (res==ERROR_MORE_DATA);
	return 0;
}


