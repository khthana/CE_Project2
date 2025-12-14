#include "stdafx.h"
#include "ngmisc.h"
#include <stdio.h>

HRESULT CheckError(HRESULT hr,char* buffer)
{
	int		eLev = 0;
	char	message[1000];

	if (buffer!=NULL)
	{
		strcpy(message,"Dev message : ");
		strcat(message,buffer);
		strcat(message,"\n");
	}
	else
	{
		buffer	= "Test message";
	}

	switch (hr)
	{
		case DEVICE_ERR_NOSUPPORTDEVICE:
			strcpy(message,MB_DEVICE_ERR_NOSUPPORTDEVICE);
			eLev	= 1;
			break;
		case D3DERR_CONFLICTINGRENDERSTATE :
			strcpy(message,MB_D3DERR_CONFLICTINGRENDERSTATE);
			eLev	= 1;
			break;
		case D3DERR_CONFLICTINGTEXTUREFILTER :
			strcpy(message,MB_D3DERR_CONFLICTINGTEXTUREFILTER);
			eLev	= 1;
			break;
		case D3DERR_CONFLICTINGTEXTUREPALETTE :
			strcpy(message,MB_D3DERR_CONFLICTINGTEXTUREPALETTE);
			eLev	= 1;
			break;
		case D3DERR_DEVICELOST :
			strcpy(message,MB_D3DERR_DEVICELOST);
			eLev	= 1;
			break;
		case D3DERR_DEVICENOTRESET :
			strcpy(message,MB_D3DERR_DEVICENOTRESET);
			eLev	= 1;
			break;
		case D3DERR_DRIVERINTERNALERROR :
			strcpy(message,MB_D3DERR_DRIVERINTERNALERROR);
			eLev	= 1;
			break;
		case D3DERR_INVALIDCALL :
			strcpy(message,MB_D3DERR_INVALIDCALL);
			eLev	= 1;
			break;
		case D3DERR_INVALIDDEVICE :
			strcpy(message,MB_D3DERR_INVALIDDEVICE);
			eLev	= 1;
			break;
		case D3DERR_MOREDATA :
			strcpy(message,MB_D3DERR_MOREDATA);
			eLev	= 1;
			break;
		case D3DERR_NOTAVAILABLE :
			strcpy(message,MB_D3DERR_NOTAVAILABLE);
			eLev	= 1;
			break;
		case D3DERR_NOTFOUND :
			strcpy(message,MB_D3DERR_NOTFOUND);
			eLev	= 1;
			break;
		case D3DERR_OUTOFVIDEOMEMORY :
			strcpy(message,MB_D3DERR_OUTOFVIDEOMEMORY);
			eLev	= 1;
			break;
		case D3DERR_TOOMANYOPERATIONS :
			strcpy(message,MB_D3DERR_TOOMANYOPERATIONS);
			eLev	= 1;
			break;
		case D3DERR_UNSUPPORTEDALPHAARG :
			strcpy(message,MB_D3DERR_UNSUPPORTEDALPHAARG);
			eLev	= 1;
			break;
		case D3DERR_UNSUPPORTEDALPHAOPERATION :
			strcpy(message,MB_D3DERR_UNSUPPORTEDALPHAOPERATION);
			eLev	= 1;
			break;
		case D3DERR_UNSUPPORTEDCOLORARG :
			strcpy(message,MB_D3DERR_UNSUPPORTEDCOLORARG);
			eLev	= 1;
			break;
		case D3DERR_UNSUPPORTEDCOLOROPERATION :
			strcpy(message,MB_D3DERR_UNSUPPORTEDCOLOROPERATION);
			eLev	= 1;
			break;
		case D3DERR_UNSUPPORTEDFACTORVALUE :
			strcpy(message,MB_D3DERR_UNSUPPORTEDFACTORVALUE);
			eLev	= 1;
			break;
		case D3DERR_UNSUPPORTEDTEXTUREFILTER :
			strcpy(message,MB_D3DERR_UNSUPPORTEDTEXTUREFILTER);
			eLev	= 1;
			break;
		case D3DERR_WRONGTEXTUREFORMAT :
			strcpy(message,MB_D3DERR_WRONGTEXTUREFORMAT);
			eLev	= 1;
			break;
		case E_FAIL :
			strcpy(message,MB_E_FAIL);
			eLev	= 1;
			break;
		case E_INVALIDARG :
			strcpy(message,MB_E_INVALIDARG);
			eLev	= 1;
			break;
		case E_OUTOFMEMORY :
			strcpy(message,MB_E_OUTOFMEMORY);
			eLev	= 1;
			break;
		case S_OK:
			strcpy(message,MB_S_OK);
			eLev	= 0;
			break; 
		default	:
			strcpy(message,"Unknow Error \n");
			eLev	= 1;
			break;
	}

	if (eLev==1)
	{
		MessageBox(NULL,message,buffer,MB_OK | MB_ICONWARNING);
		return E_FAIL;
	}

	return S_OK;
}

void MB()
{
	MessageBox(NULL,"I","Hey",MB_OK);
}

void CenterRect(RECT rcWindow,RECT* rcRect)
{
	DWORD dwHeight	= rcRect->bottom;
	DWORD dwWidth	= rcRect->right;
	DWORD dwWinHeight	= rcWindow.bottom;
	DWORD dwWinWidth	= rcWindow.right;
	if (dwHeight<=dwWinHeight)
	{
		DWORD x = (dwWinHeight - dwHeight)/2 + rcWindow.top;
		rcRect->top	= x;
	}
	if (dwWidth<=dwWinWidth)
	{
		DWORD y = (dwWinWidth - dwWidth)/2 + rcWindow.left;
		rcRect->left = y;
	}
}

DWORD GetBitDepth(D3DFORMAT fmt)
{
	DWORD	bit	= 0;

	if	((fmt	== 20) ||
		 (fmt	== 21) ||
		 (fmt	== 22))
	{
		bit = 32;
	}

	if	((fmt	== 23) ||
		 (fmt	== 24) ||
		 (fmt	== 25) ||
		 (fmt	== 26) ||
		 (fmt	== 30))
	{
		bit = 16;
	}

	return bit;
}