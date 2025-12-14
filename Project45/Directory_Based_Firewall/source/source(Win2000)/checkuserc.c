#ifndef UNICODE
#define UNICODE
#endif

#include <stdio.h>
#include <assert.h>
#include<fstream.h>
#include <windows.h> 
#include <lm.h>
#include <process.h>
#pragma comment(lib,"netapi32")

#include<wchar.h> 
#include <stdarg.h>


int wmain(int argc, wchar_t *argv[])
{
   LPWKSTA_USER_INFO_0 pBuf = NULL;
   LPWKSTA_USER_INFO_0 pTmpBuf=NULL;
   DWORD dwLevel = 0;
   DWORD dwPrefMaxLen = -1;
   DWORD dwEntriesRead = 0;
   DWORD dwTotalEntries = 0;
   DWORD dwResumeHandle = 0;
   DWORD i;
   DWORD dwTotalCount = 0;
   NET_API_STATUS nStatus;
   LPTSTR pszServerName = NULL;
    FILE* stream;
   


   if (argc > 2)
   {
      fwprintf(stderr, L"Usage: %s [\\\\ServerName]\n", argv[0]);
      exit(1);
   }
  
   if (argc == 2)
      pszServerName = argv[1];
   do // begin do
   {
      nStatus = NetWkstaUserEnum(pszServerName,
                                 dwLevel,
                                 (LPBYTE*)&pBuf,
                                 dwPrefMaxLen,
                                 &dwEntriesRead,
                                 &dwTotalEntries,
                                 &dwResumeHandle);
            
	  if ((nStatus == NERR_Success) || (nStatus == ERROR_MORE_DATA))
      {
         if ((pTmpBuf = pBuf) != NULL)
         {
            for (i = 0; (i < dwEntriesRead); i++)
			{
               assert(pTmpBuf != NULL);

               if (pTmpBuf == NULL)
               {
                  
                  fprintf(stderr, "An access violation has occurred\n");
                  break;
               }
		
			 
			   pTmpBuf++;
			   dwTotalCount++;
			 }
			
			pTmpBuf--;
			stream = fopen( "user.txt", "w" );
			fprintf( stream,"%S",pTmpBuf->wkui0_username);
			fclose( stream );
						
		 }
		 else
		 {
			stream = fopen( "user.txt", "w" );
			fprintf( stream,"%S","$");
			fclose( stream );
			exit(1);
		 }
			

      }
      
      else
	  {
			stream = fopen( "user.txt", "w" );
			fprintf( stream,"%S","$");
			fclose( stream );
			exit(1);
	  }
		




      if (pBuf != NULL)
      {
         NetApiBufferFree(pBuf);
         pBuf = NULL;
      }
   
    
   }while (nStatus == ERROR_MORE_DATA); // end do
   if (pBuf != NULL)
      NetApiBufferFree(pBuf);
   
   return 0;

}
