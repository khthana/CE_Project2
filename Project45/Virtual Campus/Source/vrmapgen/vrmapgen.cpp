// vrmapgen.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdlib.h>
#include <conio.h>
#include <windows.h>


#define GetFilePointer(hFile) SetFilePointer(hFile, 0, NULL, FILE_CURRENT)

int fnCreateMap(char* szMapName, int nMapWidth, int nMapHeight);
int fnViewMap(char* szMapName);



int main(int argc, char* argv[])
{
	int nMapWidth = 50;//145
	int nMapHeight = 31;//60
	char szMapName[12];
	
	strcpy( szMapName, "room811.gat" );

	printf("VRCampus map generator ...\n");
	printf("====================\n");
	printf("[C]reate\n");
	printf("[V]iew\n");
	printf("====================\n");

	char cInput;
	cInput = getch();
	
	switch (cInput)
	{
		case 'c' :
		{
			printf("Please wait ...\n");
			fnCreateMap(szMapName ,nMapWidth, nMapHeight );

			printf("Complete ...\n");
			printf("Press any key to exit\n");
			getch();

			break;
		}
		
		case 'v' :
		{
			printf("Please wait ...\n");
			fnViewMap( szMapName );

			printf("Complete ...\n");
			printf("Press any key to exit\n");
			getch();

			break;
		}
	}


	return 0;
}


int fnCreateMap(char* szMapName, int nMapWidth, int nMapHeight)
{
	HANDLE	hFile		= NULL;
	DWORD	dwByteWrite = sizeof(DWORD);
	//BYTE	bByteWrite = sizeof(BYTE);


	INT		nSurfaceLevel = 0;
	BYTE	bSurfaceLevel = 0;

	hFile = CreateFile( szMapName, GENERIC_WRITE, 0, NULL,CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL );
	SetFilePointer( hFile, 0, NULL, FILE_BEGIN );
	
	WriteFile( hFile, &nMapWidth, sizeof(int), &dwByteWrite, NULL);
	WriteFile( hFile, &nMapHeight, sizeof(int), &dwByteWrite, NULL);

	for( int h=0; h<nMapHeight; h++ )
		for( int w=0; w<nMapWidth; w++ )
		{
	
			nSurfaceLevel = 0;
/*
			// Floor 2
			if ( h>=31 && h<=33 && w>=19 && w<=105 ) nSurfaceLevel = 0;
			if ( h>=55 && h<=57 && w>=8 && w<=105 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=98 && w<=105 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=30 && w<=39 ) nSurfaceLevel = 0;

			// Floor 3
			if ( h>=31 && h<=33 && w>=19 && w<=141 ) nSurfaceLevel = 0;
			if ( h>=55 && h<=57 && w>=8 && w<=141 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=98 && w<=106 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=30 && w<=39 ) nSurfaceLevel = 0;
			if ( h>=9 && h<=30 && w>=98 && w<=107 ) nSurfaceLevel = 0;
			if ( h>=9 && h<=21 && w>=98 && w<=117 ) nSurfaceLevel = 0;
			if ( h>=20 && h<=21 && w>=98 && w<=141 ) nSurfaceLevel = 0;
*/
	/*		
			//Floor 6
			if ( h>=31 && h<=33 && w>=19 && w<=141 ) nSurfaceLevel = 0;
			if ( h>=55 && h<=57 && w>=8 && w<=117 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=98 && w<=106 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=30 && w<=39 ) nSurfaceLevel = 0;
			if ( h>=27 && h<=30 && w>=87 && w<=117 ) nSurfaceLevel = 0;


			//Floor 7
			if ( h>=31 && h<=33 && w>=19 && w<=141 ) nSurfaceLevel = 0;
			if ( h>=55 && h<=57 && w>=8 && w<=117 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=98 && w<=106 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=30 && w<=39 ) nSurfaceLevel = 0;
			if ( h>=27 && h<=30 && w>=86 && w<=96 ) nSurfaceLevel = 0;
			if ( h>=58 && h<=65 && w>=53 && w<=74 ) nSurfaceLevel = 0;

			//Floor 1
			if ( h>=31 && h<=33 && w>=18 && w<=129 ) nSurfaceLevel = 0;
			if ( h>=55 && h<=57 && w>=6 && w<=129 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=98 && w<=129 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=30 && w<=39 ) nSurfaceLevel = 0;
			if ( h>=57 && h<=68 && w>=121 && w<=127 ) nSurfaceLevel = 0;
			if ( h>=40 && h<=48 && w>=115 && w<=124 ) nSurfaceLevel = -1;

			// Floor 4 5 6 8 9
			if ( h>=31 && h<=33 && w>=19 && w<=141 ) nSurfaceLevel = 0;
			if ( h>=55 && h<=57 && w>=8 && w<=117 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=98 && w<=106 ) nSurfaceLevel = 0;
			if ( h>=34 && h<=54 && w>=30 && w<=39 ) nSurfaceLevel = 0;
		



			//Floor 9
			if ( (h==39 || h==49) && ((w>=30 && w<=32) || (w>=37 && w<=39)) ) nSurfaceLevel = -1;
	
	
			// Stair And Window Curve
			if ( h>=40 && h<=49 && w==107 ) nSurfaceLevel = 0;
			if ( h>=47 && h<=48 && w>=95 && w<=97 ) nSurfaceLevel = 0;
			if ( h>=39 && h<=41 && w>=95 && w<=97 ) nSurfaceLevel = 0;
			if ( h>=41 && h<=46 && w>=25 && w<=29 ) nSurfaceLevel = 0;

*/	

			
			printf("Surface level : %d \n", nSurfaceLevel );
			WriteFile( hFile, &nSurfaceLevel, sizeof(BYTE), &dwByteWrite, NULL);
		}


	CloseHandle( hFile );
	return 0;
}


int fnViewMap(char* szMapName)
{
	HANDLE	hFile		= NULL;
	DWORD	dwByteWrite = sizeof(INT);

	INT		nMapWidth = 0;
	INT		nMapHeight = 0;
	INT		nSurfaceLevel = 0;

	hFile = CreateFile( szMapName, GENERIC_READ, FILE_SHARE_READ, (LPSECURITY_ATTRIBUTES) NULL,OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, (HANDLE) NULL );
	SetFilePointer( hFile, 0, NULL, FILE_BEGIN );
	
	ReadFile( hFile, &nMapWidth, sizeof(int), &dwByteWrite, (LPOVERLAPPED) NULL);
	printf("Width : %d \n", nMapWidth);
	ReadFile( hFile, &nMapHeight, sizeof(int), &dwByteWrite, (LPOVERLAPPED) NULL);
	printf("Height : %d \n", nMapHeight);
	printf("Press any key to continue ...");
	getch();

	

	for( int h=0; h<nMapHeight; h++ )
		for( int w=0; w<nMapWidth; w++ )
		{
			nSurfaceLevel = rand()%5;
			ReadFile( hFile, &nSurfaceLevel, sizeof(int), &dwByteWrite, (LPOVERLAPPED) NULL);
			printf("Surface level : %d \n", nSurfaceLevel );
		}


	CloseHandle( hFile );
	return 0;
}