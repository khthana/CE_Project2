/*
	CBase64.cpp
	Classe base per codifica/decodifica base64 (CRT).
	Luca Piergentili, 14/09/96
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <stdio.h>
#include <stdlib.h>
#include "CBase64.h"

/*
	Encode()
*/
int CBase64::Encode(const char *lpcszPlainFile,const char *lpcszEncodedFile)
{
	char szBuffer[128];
	FILE* pInputFile;
	FILE* pOutputFile;
	unsigned char cChar = 0;
	unsigned long nShifted = 0L;
	unsigned long lValue = 0L;
	int nIndex = 0;
	int nShift = 0;
	int nSaveShift = 0;
	int bDone = 0;
	
	static const char base64table[] = {
	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	};
     
	if((pInputFile = fopen(lpcszPlainFile,"rb"))==(FILE*)NULL)
		return(-1);
	
	if((pOutputFile = fopen(lpcszEncodedFile,"w"))==(FILE*)NULL)
	{
		fclose(pInputFile);
		return(-2);
	}

	do
	{
		bDone = 0;
		nShift = 0;
		nShifted = 0L;
		nIndex = 0;

		while(!feof(pInputFile) || nShift!=0)
		{
			if(!feof(pInputFile) && !bDone)
			{
				cChar = (char)fgetc(pInputFile);

				if(feof(pInputFile))
				{
					bDone = 1;
					nSaveShift = nShift;
					cChar = 0;
				}
			}
			else
			{
				bDone = 1;
				nSaveShift = nShift;
				cChar = 0;
			}

			if(!bDone || nShift!=0)
			{
				lValue = (unsigned long)cChar;
				nShifted <<= 8;
				nShift += 8;
				nShifted |= lValue;
			}

			while(nShift >= 6)
			{
				nShift -= 6;
				lValue = (nShifted >> nShift) & 0x3fL;
				cChar = (unsigned char)base64table[(int)lValue];

				szBuffer[nIndex++] = cChar;
				
				if(nIndex >= 60)
				{
					szBuffer[nIndex] = '\0';
					fprintf(pOutputFile,"%s\n",szBuffer);
					nIndex = 0;
				}

				if(bDone)
					nShift = 0;
			}
		}

		if(nSaveShift==2)
		{
			szBuffer[nIndex++] = '=';
			
			if(nIndex >= 60)
			{
				szBuffer[nIndex] = '\0';
				fprintf(pOutputFile,"%s\n",szBuffer);
				nIndex = 0;
			}

			szBuffer[nIndex++] = '=';
			
			if(nIndex >= 60)
			{
				szBuffer[nIndex] = '\0';
				fprintf(pOutputFile,"%s\n",szBuffer);
				nIndex = 0;
			}
		}
		else if(nSaveShift==4)
		{
			szBuffer[nIndex++] = '=';
			
			if(nIndex >= 60)
			{
				szBuffer[nIndex] = '\0';
				fprintf(pOutputFile,"%s\n",szBuffer);
				nIndex = 0;
			}
		}

		if(nIndex!=0)
		{
			szBuffer[nIndex] = '\0';
			fprintf(pOutputFile,"%s\n",szBuffer);
		}
	}
	while(!feof(pInputFile));

	fclose(pInputFile);
	fclose(pOutputFile);

	return(0);
}

/*
	Decode()
*/
int CBase64::Decode(const char *lpcszEncodedFile,const char *lpcszPlainFile)
{
	char szBuffer[128];
	FILE* pInputFile;
	FILE* pOutputFile;
	unsigned char cChar = 0;
	unsigned long nShifted = 0L;
	unsigned long lValue = 0L;
	int nIndex = 0;
	int nShift = 0;
	int bDone = 0;
     
	if((pInputFile = fopen(lpcszEncodedFile,"r"))==(FILE*)NULL)
		return(-1);

	if((pOutputFile = fopen(lpcszPlainFile,"wb"))==(FILE*)NULL)
	{
		fclose(pInputFile);
		return(-1);
	}
     
	do
	{
		bDone = 0;
		nShift = 0;
		nShifted = 0L;
		
		while(!feof(pInputFile) && !bDone)
		{
			if(fgets(szBuffer,sizeof(szBuffer),pInputFile))
			{
				for(nIndex = 0; szBuffer[nIndex] && szBuffer[nIndex]!='\n'; nIndex++)
				{
					lValue = ConvertToAscii(szBuffer[nIndex]);
	
					if(lValue < 64)
					{
						nShifted <<= 6;
						nShift += 6;
						nShifted |= lValue;
						
						if(nShift >= 8)
						{
							nShift -= 8;
							lValue = nShifted >> nShift;
							cChar = (unsigned char)(lValue & 0xffL);
							fputc(cChar,pOutputFile);
						}
					}
					else
					{
						bDone = 1;
						break;
					}
				}
			}
		}
	}
	while(!feof(pInputFile));

	fclose(pInputFile);
	fclose(pOutputFile);

	return(0);
}

/*
	ConvertToAscii()
*/
int CBase64::ConvertToAscii(unsigned char cChar)
{
	if((cChar >= 'A') && (cChar <= 'Z'))
	{
		return((int)(cChar - 'A'));
	}
	else if((cChar >= 'a') && (cChar <= 'z'))
	{
		return(26 + (int)(cChar - 'a'));
	}
	else if((cChar >= '0') && (cChar <= '9'))
	{
		return(52 + (int)(cChar - '0'));
	}
	else if(cChar=='+')
	{
		return(62);
	}
	else if(cChar=='/')
	{
		return(63);
	}
	else if(cChar=='=')
	{
		return(-2);
	}
	else
		return(-1);
}
