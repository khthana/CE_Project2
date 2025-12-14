/*
	CTextFile.cpp
	Classe derivata per interfaccia file testo (SDK).
	Luca Piergentili, 06/07/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "window.h"
#include "CBinFile.h"
#include "CTextFile.h"

/*
	ReadLine()

	Legge una linea dal file di input.
	Elimina la coppia CRLF dal buffer di lettura e restituisce la lunghezza della linea, restituisce
	FILE_EOF per fine file.
*/
DWORD CTextFile::ReadLine(LPSTR lpBuffer,DWORD dwToRead)
{
	LONG nCrlf = 0L;
	char* crlf;
	DWORD ofs = CBinFile::Seek(0L,FILE_CURRENT);

	if((dwToRead = CBinFile::Read(lpBuffer,dwToRead))!=FILE_EOF)
	{
		if(dwToRead > 0)
		{
			if((crlf = (char*)memchr(lpBuffer,'\r',dwToRead))!=(char*)NULL)
			{
				if(*(crlf + 1)=='\n')
				{
					nCrlf = 2L;
					dwToRead = (crlf-lpBuffer);
					*crlf = '\0';
				}
				else
					lpBuffer[dwToRead] = '\0';
			}
			else
			{
#if 0
				lpBuffer[dwToRead] = '\0';
#else
				if((crlf = (char*)memchr(lpBuffer,'\n',dwToRead))!=(char*)NULL)
				{
					nCrlf = 1L;
					dwToRead = (crlf-lpBuffer);
					*crlf = '\0';
				}
				else
					lpBuffer[dwToRead] = '\0';
#endif
			}
			
			CBinFile::Seek((LONG)ofs + (LONG)dwToRead + nCrlf,FILE_BEGIN);
		}
		else
			dwToRead = FILE_EOF;
	}

	return(dwToRead);
}

/*
	WriteLine()

	Scrive una linea nel file di input.
*/
DWORD CTextFile::WriteLine(LPCSTR lpcBuffer,DWORD dwToWrite)
{
	char* crlf;

	if(dwToWrite==(DWORD)-1)
		dwToWrite = strlen(lpcBuffer);

	if((crlf = (char*)memchr(lpcBuffer,'\r',dwToWrite))!=(char*)NULL)
		if(*(crlf + 1)=='\n')
			dwToWrite = (crlf-lpcBuffer);

	if((dwToWrite = CBinFile::Write(lpcBuffer,dwToWrite))!=FILE_EOF)
		if(CBinFile::Write("\r\n",2)!=FILE_EOF)
			dwToWrite += 2;

	return(dwToWrite);
}

DWORD CTextFile::WriteFormattedLine(LPSTR fmt,...)
{
	LPSTR pArgs;
	DWORD dwToWrite;
	char buffer[8192];
	char buf[4096];

	// ricava gli argomenti
	pArgs = (LPSTR)&fmt + sizeof(fmt);
	memset(buf,'\0',sizeof(buf));
	_vsnprintf(buf,sizeof(buf)-1,fmt,pArgs);
	dwToWrite = _snprintf(buffer,sizeof(buffer)-1,"%s\r\n",buf);
	return(CBinFile::Write(buffer,dwToWrite));
}
