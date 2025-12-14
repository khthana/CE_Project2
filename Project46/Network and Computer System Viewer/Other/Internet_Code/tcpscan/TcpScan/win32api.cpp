/*
	win32api.c
	Implementazione di quanto omesso dall' API (SDK).
	Luca Piergentili, 13/09/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "strcpyn.h"
#include "stristr.h"
#include "window.h"
#include <shellapi.h>
#include "win32api.h"

/*
	WritePrivateProfileInt()

	Scrive un intero nel file .ini (nell'API e' presente solo la WritePrivateProfileString()).
*/
BOOL WritePrivateProfileInt(LPCSTR lpcszSectioneName,LPCSTR lpcszKeyName,int nValue,LPCSTR lpcszIniFile)
{
	char buffer[16];
	memset(buffer,'\0',sizeof(buffer));
	_snprintf(buffer,sizeof(buffer)-1,"%d",nValue);
	return(::WritePrivateProfileString(lpcszSectioneName,lpcszKeyName,buffer,lpcszIniFile));
}

/*
	GetThisModuleFileName()

	Recupera il nome del file eseguibile corrente.
	Considera come eseguibile solo quanto termina con ".exe".
	Non usa GetModuleFileName() perche' quest'ultima sotto W95/98 se il numero di versione interno
	del file e' inferiore a 4 restituisce il nome corto.
*/
LPSTR GetThisModuleFileName(LPSTR lpszFileName,UINT nSize)
{
	int i = 0;
	char* p;
	char value[_MAX_PATH+1];

	memset(lpszFileName,'\0',nSize);
	
	strcpyn(value,::GetCommandLine(),sizeof(value));
	if((p = stristr(value,".exe"))!=NULL)
		i = p - value;
	if(i > 0)
	{
		strcpyn(value,::GetCommandLine(),sizeof(value));
		memcpy(value+i,".exe",4);
	}
	else
		return(NULL);

	p = value;
	while(*p)
	{
		if(*p=='"')
			*p = ' ';
		p++;
	}

	p = value;
	while(*p==' ')
		p++;
	
	for(i = 0; i < (int)nSize+1; i++)
	{
		if(*p==' ')
			if(stristr(lpszFileName,".exe"))
				break;

		lpszFileName[i] = *p++;
	}
	
	lpszFileName[i] = '\0';

	return(lpszFileName);
}

/*
	GetLastErrorString()
*/
void GetLastErrorString(void)
{
	LPVOID pBuffer;
	::FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER|FORMAT_MESSAGE_FROM_SYSTEM|FORMAT_MESSAGE_IGNORE_INSERTS,
				NULL,
				GetLastError(),
				MAKELANGID(LANG_NEUTRAL,SUBLANG_SYS_DEFAULT/*SUBLANG_DEFAULT*/),
				(LPTSTR)&pBuffer,
				0,
				NULL);
	::MessageBox(NULL,(LPCSTR)pBuffer,"Error",MB_OK|MB_ICONWARNING|MB_TASKMODAL|MB_SETFOREGROUND|MB_TOPMOST);
	::LocalFree(pBuffer);
}

/*
	MessageBoxResource()
*/
int MessageBoxResource(HWND hWnd,UINT type,LPCSTR lpcszTitle,UINT nID)
{
	char buffer[1024];
	
	memset(buffer,'\0',sizeof(buffer));
	if(::LoadString(NULL,nID,buffer,sizeof(buffer)-1) <= 0)
		strcpy(buffer,"Error");
	
	return(::MessageBox(hWnd,buffer,lpcszTitle,type|(hWnd!=NULL ? MB_APPLMODAL : MB_TASKMODAL)|MB_SETFOREGROUND|MB_TOPMOST));
}

/*
	MessageBoxResourceEx()
*/
int MessageBoxResourceEx(HWND hWnd,UINT type,LPCSTR lpcszTitle,UINT nID,...)
{
	LPSTR pArgs;
	char buffer[1024];
	char fmt[1024];

	strcpy(buffer,"Error");
	memset(fmt,'\0',sizeof(fmt));

	if(::LoadString(NULL,nID,fmt,sizeof(fmt)-1) > 0)
	{
		pArgs = (LPSTR)&nID + sizeof(nID);
		memset(buffer,'\0',sizeof(buffer));
		_vsnprintf(buffer,sizeof(buffer)-1,fmt,pArgs);
	}

	return(::MessageBox(hWnd,buffer,lpcszTitle,type|(hWnd!=NULL ? MB_APPLMODAL : MB_TASKMODAL)|MB_SETFOREGROUND|MB_TOPMOST));
}

/*
	FormatResourceString()
*/
int FormatResourceString(LPSTR buffer,UINT nSize,UINT nID)
{
	memset(buffer,'\0',nSize);
	return(::LoadString(NULL,nID,buffer,nSize-1));
}

/*
	FormatResourceStringEx()
*/
int FormatResourceStringEx(LPSTR buffer,UINT nSize,UINT nID,...)
{
	int nRet = -1;
	LPSTR pArgs;
	char fmt[1024];

	memset(fmt,'\0',sizeof(fmt));
	memset(buffer,'\0',nSize);

	if(::LoadString(NULL,nID,fmt,sizeof(fmt)-1) > 0)
	{
		pArgs = (LPSTR)&nID + sizeof(nID);
		nRet = _vsnprintf(buffer,nSize-1,fmt,pArgs);
	}

	return(nRet);
}

/*
	ExtractResource()
*/
BOOL ExtractResource(UINT nID,LPCSTR lpcszResName,LPCSTR lpcszOutputFile)
{
	BOOL bExtracted = FALSE;

	HRSRC hRes = ::FindResource(NULL,MAKEINTRESOURCE(nID),lpcszResName);
	if(hRes)
	{
		HGLOBAL hGlobal = ::LoadResource(NULL,hRes);
		if(hGlobal)
		{
			LPVOID lpVoid = ::LockResource(hGlobal);
			if(lpVoid)
			{
				HANDLE handle;
				if((handle = ::CreateFile(lpcszOutputFile,GENERIC_WRITE,0,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL))!=INVALID_HANDLE_VALUE)
				{
					DWORD dwToWrite = ::SizeofResource(NULL,hRes);
					DWORD dwWritten = 0L;
					::WriteFile(handle,lpVoid,(UINT)dwToWrite,&dwWritten,NULL);
					::CloseHandle(handle);
					bExtracted = (dwToWrite==dwWritten);
				}
			}
		}
	}

	return(bExtracted);
}

/*
	ExtractResourceIntoBuffer()
*/
BOOL ExtractResourceIntoBuffer(UINT nID,LPCSTR lpcszResName,LPSTR lpBuffer,UINT nBufferSize)
{
	BOOL bExtracted = FALSE;

	HRSRC hRes = ::FindResource(NULL,MAKEINTRESOURCE(nID),lpcszResName);
	if(hRes)
	{
		HGLOBAL hGlobal = ::LoadResource(NULL,hRes);
		if(hGlobal)
		{
			LPVOID lpVoid = ::LockResource(hGlobal);
			if(lpVoid)
			{
				memset(lpBuffer,'\0',nBufferSize);
				UINT nResSize = ::SizeofResource(NULL,hRes);
				if(nResSize <= nBufferSize)
				{
					memcpy(lpBuffer,lpVoid,nResSize);
					bExtracted = TRUE;
				}
			}
		}
	}

	return(bExtracted);
}

/*
	CreateShortcut()
*/
BOOL CreateShortcut(LPCSTR Target,LPCSTR Arguments,LPCSTR LinkFileName,LPCSTR LinkLocation,LPCSTR WorkingDir,UINT nIconIndex)
{
	BOOL bCreated = FALSE;
	HRESULT hres;
	ITEMIDLIST *id; 
	char szLocation[_MAX_PATH+1];
	char szLink[_MAX_PATH+1];
	
	// se non viene specificato nessun percorso, crea il link sul desktop
	if(!LinkLocation)
	{
		::SHGetSpecialFolderLocation(NULL,CSIDL_DESKTOPDIRECTORY,&id); 
		::SHGetPathFromIDList(id,&szLocation[0]); 
	}
	else
		strcpyn(szLocation,LinkLocation,sizeof(szLocation));
	
	// compone il pathname completo per il link
	_snprintf(szLink,sizeof(szLink)-1,"%s\\%s.lnk",szLocation,LinkFileName);

	hres = ::CoInitialize(NULL);
	if(SUCCEEDED(hres))
	{
		IShellLink* psl;
		hres = ::CoCreateInstance(	CLSID_ShellLink,
								NULL,
								CLSCTX_INPROC_SERVER,
								IID_IShellLink,
								(LPVOID*)&psl
								);

		if(SUCCEEDED(hres))
		{
			IPersistFile* ppf;
			psl->SetPath(Target);
			if(Arguments)
				psl->SetArguments(Arguments);
			if(WorkingDir)
				psl->SetWorkingDirectory(WorkingDir);

			hres = psl->QueryInterface(IID_IPersistFile,(LPVOID*)&ppf);
			if(SUCCEEDED(hres))
			{
				WORD wsz[_MAX_PATH+1];
				MultiByteToWideChar(CP_ACP,MB_PRECOMPOSED,szLink,-1,wsz,sizeof(wsz));
				hres = ppf->Save(wsz,TRUE);
				ppf->Release();
				bCreated = TRUE;
			}

			if(nIconIndex!=(UINT)-1)
				psl->SetIconLocation(Target,nIconIndex);
			
			psl->Release();
		}
	
		::CoUninitialize();
	}

	return(bCreated);
}

/*
	Delay()
*/
void Delay(int delay)
{
	DWORD start = ::GetTickCount();
	DWORD elapsed = 0L;

	do
	{
		::PeekAndPump();
		elapsed = ::GetTickCount() - start;
	}
	while(elapsed < (DWORD)(delay * 1000));
}

/*
	PeekAndPump()
*/
BOOL PeekAndPump(void)
{
	MSG msg;

#if defined(_AFX) || defined(_AFXDLL)
	while(::PeekMessage(&msg,NULL,0,0,PM_NOREMOVE))
	{
		if(!AfxGetApp()->PumpMessage())
		{
			::PostQuitMessage(0);
			return(FALSE);
		}
	}
	LONG lIdle = 0;
	while(AfxGetApp()->OnIdle(lIdle++))
		;
#else
	if(::PeekMessage(&msg,NULL,0,0,PM_REMOVE))
	{
		::TranslateMessage(&msg);
		::DispatchMessage(&msg);
	}
#endif

	return(TRUE);
}

/*
	GetWindowsVersion()
*/
OSVERSIONTYPE GetWindowsVersion(LPSTR lpszWindowsPlatform,UINT nSize,DWORD* dwMajorVersion/*=NULL*/,DWORD* dwMinorVersion/*=NULL*/)
{
	OSVERSIONINFO os = {0};
	os.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
	OSVERSIONTYPE osversiontype = UNKNOW_WINDOWS_VERSION;
	memset(lpszWindowsPlatform,'\0',nSize);

	if(::GetVersionEx(&os))
	{
		// service pack
		char szServiceRelease[_MAX_PATH+1] = {0};
		strcpyn(szServiceRelease,os.szCSDVersion,sizeof(szServiceRelease));
		
		switch(os.dwPlatformId)
		{
			// Win3.1
			case VER_PLATFORM_WIN32s:
				osversiontype = WINDOWS_31;
				strcpyn(lpszWindowsPlatform,"Microsoft® Windows 3.1 (TM)",nSize);
				break;
			
			// Win95/98
			case VER_PLATFORM_WIN32_WINDOWS:
				if(os.dwMinorVersion==0)
				{
					osversiontype = WINDOWS_95;
					_snprintf(lpszWindowsPlatform,nSize-1,"Microsoft® Windows 95 (TM) %s",szServiceRelease);
				}
				else if(os.dwMinorVersion==10)
				{
					osversiontype = WINDOWS_98;
					_snprintf(lpszWindowsPlatform,nSize-1,"Microsoft® Windows 98 (TM) %s",szServiceRelease);
				}
				if(os.dwMinorVersion==90)
				{
					osversiontype = WINDOWS_MILLENNIUM;
					_snprintf(lpszWindowsPlatform,nSize-1,"Microsoft® Windows Millenium (TM) %s",szServiceRelease);
				}
				break;
				
			// WinNT
			case VER_PLATFORM_WIN32_NT:
			{
				char szNtProductType[32] = {"Workstation"};
				typedef DWORD (WINAPI* PRtlGetNtProductType) (PDWORD pVersion);
				PRtlGetNtProductType func = (PRtlGetNtProductType)::GetProcAddress(GetModuleHandle("ntdll.dll"),"RtlGetNtProductType");
				if(func)
				{
					DWORD dwVersion = 0L;
					func(&dwVersion);
					if(dwVersion!=1)
						strcpy(szNtProductType,"Server");
				}

				if(os.dwMajorVersion==4)
				{
					osversiontype = WINDOWS_NT;
					_snprintf(lpszWindowsPlatform,nSize-1,"Microsoft® Windows NT %s (TM) %s",szNtProductType,szServiceRelease);
				}
				else if(os.dwMajorVersion==5)
				{
					osversiontype = WINDOWS_2000;
					_snprintf(lpszWindowsPlatform,nSize-1,"Microsoft® Windows 2000 %s (TM) %s",szNtProductType,szServiceRelease);
				}
				
				break;
			}
		}
	
		if(dwMajorVersion && dwMinorVersion)
		{
			*dwMajorVersion = os.dwMajorVersion;
			*dwMinorVersion = os.dwMinorVersion;
		}
	}
	
	return(osversiontype);
}

/*
	DeleteFileToRecycleBin()
*/
BOOL DeleteFileToRecycleBin(HWND hWnd,LPCSTR lpcszFileName,BOOL bShowDialog/*=TRUE*/,BOOL bAllowUndo/*=TRUE*/)
{
	SHFILEOPSTRUCT sh;
	memset(&sh,'\0',sizeof(sh));
	sh.hwnd = hWnd;
	sh.wFunc = FO_DELETE;
	sh.pFrom = lpcszFileName;

	FILEOP_FLAGS fProgress = bAllowUndo ? (FILEOP_FLAGS)(FOF_ALLOWUNDO|FOF_SIMPLEPROGRESS) : (FILEOP_FLAGS)FOF_SIMPLEPROGRESS;
	FILEOP_FLAGS fConfirm = bAllowUndo ? (FILEOP_FLAGS)(FOF_ALLOWUNDO|FOF_NOCONFIRMATION|FOF_SILENT) : (FILEOP_FLAGS)(FOF_NOCONFIRMATION|FOF_SILENT);
	sh.fFlags = bShowDialog ? fProgress : fConfirm;
//	sh.fFlags = bShowDialog ? (FOF_ALLOWUNDO|FOF_SIMPLEPROGRESS) : (FOF_ALLOWUNDO|FOF_NOCONFIRMATION|FOF_SILENT);

	int nRet = ::SHFileOperation(&sh);

	BOOL bFileExists = FALSE;
	HANDLE hHandle;
	if((hHandle = ::CreateFile(lpcszFileName,GENERIC_READ/*0*/,0/*FILE_SHARE_READ|FILE_SHARE_WRITE*/,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,NULL))!=INVALID_HANDLE_VALUE)
	{
		::CloseHandle(hHandle);
		bFileExists = TRUE;
	}

	return(sh.fAnyOperationsAborted ? FALSE : (bFileExists ? FALSE : (nRet==0)));
}

/*
	EnsureBackslash()
*/
LPSTR EnsureBackslash(LPSTR lpszFileName,UINT nFileSize)
{
	int i = strlen(lpszFileName);
	if(lpszFileName[i-1]!='\\')
		if(i < (int)(nFileSize-1))
			strcat(lpszFileName,"\\");
		else
			lpszFileName[i-1] = '\\';

	return(lpszFileName);
}

/*
	RemoveBackslash()
*/
LPSTR RemoveBackslash(LPSTR lpszFileName)
{
	int i = strlen(lpszFileName);
	do {
		if(lpszFileName[i-1]=='\\')
		{
			lpszFileName[i-1] = '\0';
			i = strlen(lpszFileName);
		}
	} while(i-1 >= 0 && lpszFileName[i-1]=='\\');

	return(lpszFileName);
}

/*
	GetTaskBarRect()

	-1 : if en error occured
	0 : if taskbar is at left of screen
	1 : if taskbar is at top of screen
	2 : if taskbar is at right of screen
	3 : if taskbar is at bottom of screen
*/
int GetTaskBarRect(RECT *pRect)
{
	HWND hTaskBarWnd = NULL;
	HWND hTrayWnd = NULL;
	HWND hClockWnd = NULL;

	APPBARDATA stABD;
	memset(&stABD,'\0',sizeof(APPBARDATA));
	stABD.cbSize = sizeof(stABD);

	if(!(BOOL)SHAppBarMessage(ABM_GETTASKBARPOS,&stABD))
		return(-1);

	int iRet = 1;

	// get position of status bar icon
	if((stABD.rc.left < GetSystemMetrics(SM_CXSCREEN) / 2) && (stABD.rc.top > GetSystemMetrics(SM_CYSCREEN) / 2))
	{
		iRet = 3;

		hTaskBarWnd = ::FindWindow("Shell_TrayWnd",NULL);
		if(hTaskBarWnd)
		{
			// find tray
			hTrayWnd = ::FindWindowEx(hTaskBarWnd,0,"TrayNotifyWnd",NULL);
			if(hTrayWnd)
			{
				// find clock
				hClockWnd = ::FindWindowEx(hTrayWnd,0,"TrayClockWClass",NULL);
				RECT rcClock;
				::GetWindowRect(hClockWnd,&rcClock);
			}
		}
	}
	else if((stABD.rc.left > GetSystemMetrics(SM_CXSCREEN) / 2) && (stABD.rc.top < GetSystemMetrics(SM_CYSCREEN) / 2))
	{
		iRet = 2;
	}
	else if ((stABD.rc.left < GetSystemMetrics(SM_CXSCREEN) / 2) && (stABD.rc.top < GetSystemMetrics(SM_CYSCREEN) / 2) && (stABD.rc.right < GetSystemMetrics(SM_CXSCREEN) / 2))
	{
		iRet = 0;
	}
	else
		iRet = 1;

	memcpy(pRect,&stABD.rc,sizeof(RECT));

	return(iRet);
}
