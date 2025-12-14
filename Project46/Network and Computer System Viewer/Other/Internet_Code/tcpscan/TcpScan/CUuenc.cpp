/*
	CUuenc.cpp
	Classe base per codifica/decodifica in formato UUENC (CRT).
	Luca Piergentili, 21/11/96
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#pragma warning (disable:4135) // conversione tipi
#pragma warning (disable:4244) // conversione tipi
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "CUuenc.h"

/*
	uuENC()
*/
static unsigned char uuENC(unsigned char outbyte)
{
	static const char UUEncodeTable[] = {
	"`!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_"
	};

	return(UUEncodeTable[(outbyte & 0x3f)]);
}

/*
	uuDEC()
*/
static unsigned char uuDEC(unsigned char inbyte)
{
	return((inbyte - ' ') & 0x3f);
}

/*
	Encode()
*/
int CUuenc::Encode(const char *InputFileName,const char *OutputFileName)
{
	int NumRead;
	int CurPos;
	unsigned char CurByte;
	unsigned char CurLine[64];
	unsigned char EncodedLine[512];
	unsigned char* PtrEncodedLine = EncodedLine;
	FILE* DecodedFile;
	FILE* EncodedFile;
	
	if((DecodedFile = fopen(InputFileName,"rb"))==(FILE*)NULL)
		return(-1);

	if((EncodedFile = fopen(OutputFileName,"wb"))==(FILE*)NULL)
	{
		fclose(DecodedFile);
		return(-1);
	}
	
	while(!feof(DecodedFile))
	{
		memset(CurLine,'\0',sizeof(CurLine));
		memset(EncodedLine,'\0',sizeof(EncodedLine));
		PtrEncodedLine = EncodedLine;
		
		NumRead = 0;
		
		while(NumRead < 45 && !feof(DecodedFile))
		{
			CurByte = fgetc(DecodedFile);
			NumRead++;
			CurLine[NumRead] = CurByte;
		}
		
		*PtrEncodedLine++ = uuENC((char)NumRead);
		
		CurPos = 1;
		
		while(CurPos <= (NumRead-2))
		{
			CurByte = (CurLine[CurPos] >> 2);
			*PtrEncodedLine++ = uuENC(CurByte);
			
			CurByte = (CurLine[CurPos] << 4) | (CurLine[CurPos+1] >> 4);
			*PtrEncodedLine++ = uuENC(CurByte);
			
			CurByte = (CurLine[CurPos+1] << 2) | (CurLine[CurPos+2] >> 6);
			*PtrEncodedLine++ = uuENC(CurByte);
			
			CurByte = (CurLine[CurPos+2] & 0x3f);
			*PtrEncodedLine++ = uuENC(CurByte);
			
			CurPos += 3;
		}
		
		if(CurPos < NumRead)
		{
			CurByte = (CurLine[CurPos] >> 2);
			*PtrEncodedLine++ = uuENC(CurByte);
			
			if(CurPos==(NumRead-1))
			{
				CurByte = ((CurLine[CurPos] << 4) & 0x30);
				*PtrEncodedLine++ = uuENC(CurByte);
			}
			else
			{
				CurByte = (((CurLine[CurPos] << 4) & 0x30) | ((CurLine[CurPos+1] >> 4) & 0x0f));
				*PtrEncodedLine++ = uuENC(CurByte);
				CurByte = ((CurLine[CurPos+1] << 2) & 0x3c);
			}
			
			*PtrEncodedLine++ = uuENC(CurByte);
		}
		
		fprintf(EncodedFile,"%s\r\n",EncodedLine);
	}
	
	fclose(EncodedFile);
	fclose(DecodedFile);

	return(0);
}

/*
	Decode()
*/
int CUuenc::Decode(const char *InputFileName,const char *OutputFileName)
{
	int NumChars;
	int CurPos;
	char CurLine[64];
	char CurChar;
	FILE* EncodedFile;
	FILE* DecodedFile;

	if((EncodedFile = fopen(InputFileName,"rt"))==(FILE*)NULL)
		return(-1);

	if((DecodedFile = fopen(OutputFileName,"wb"))==(FILE*)NULL)
	{
		fclose(EncodedFile);
		return(-1);
	}

	while(!feof(EncodedFile))
	{
		if(fgets(CurLine,sizeof(CurLine)-1,EncodedFile))
		{
			NumChars = (int)uuDEC(CurLine[0]);

			if(NumChars < 45)
				NumChars--;

			if(NumChars > 0)
			{
				CurPos = 1;
				
				while(NumChars > 0)
				{
					if(NumChars >= 3)
					{
						CurChar = ((uuDEC(CurLine[CurPos]) << 2) | (uuDEC(CurLine[CurPos+1]) >> 4));
						fputc(CurChar,DecodedFile);

						CurChar = ((uuDEC(CurLine[CurPos+1]) << 4) | (uuDEC(CurLine[CurPos+2]) >> 2));
						fputc(CurChar,DecodedFile);

						CurChar = ((uuDEC(CurLine[CurPos+2]) << 6) | (uuDEC(CurLine[CurPos+3])));
						fputc(CurChar,DecodedFile);
					}
					else
					{
						if(NumChars >= 1)
						{
							CurChar = ((uuDEC(CurLine[CurPos]) << 2) | (uuDEC(CurLine[CurPos+1]) >> 4));
							fputc(CurChar,DecodedFile);
						}
						if(NumChars >= 2)
						{
							CurChar = ((uuDEC(CurLine[CurPos+1]) << 4) | (uuDEC(CurLine[CurPos+2]) >> 2));
							fputc(CurChar,DecodedFile);
						}
					}

					NumChars -= 3;
					CurPos += 4;
				}
			}
		}
	}
	
	fclose(EncodedFile);
	fclose(DecodedFile);

	return(0);
}

#pragma warning (default:4135) // conversione tipi
#pragma warning (default:4244) // conversione tipi
