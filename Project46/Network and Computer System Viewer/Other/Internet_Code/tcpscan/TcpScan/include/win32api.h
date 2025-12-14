/*
	win32api.h
	Implementazione di quanto omesso dall' API (SDK).
	Luca Piergentili, 13/09/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _WIN32API_H
#define _WIN32API_H 1

#include "window.h"

enum OSVERSIONTYPE {
	WINDOWS_31,
	WINDOWS_95,
	WINDOWS_98,
	WINDOWS_MILLENNIUM,
	WINDOWS_NT,
	WINDOWS_2000,
	UNKNOW_WINDOWS_VERSION
};

BOOL			WritePrivateProfileInt	(LPCSTR lpcszSectioneName,LPCSTR lpcszKeyName,int iValue,LPCSTR lpcszIniFile);

LPSTR		GetThisModuleFileName	(LPSTR lpszFileName,UINT nSize);

void			GetLastErrorString		(void);

int			MessageBoxResource		(HWND hWnd,UINT type,LPCSTR lpcszTitle,UINT nID);
int			MessageBoxResourceEx	(HWND hWnd,UINT type,LPCSTR lpcszTitle,UINT nID,...);
int			FormatResourceString	(LPSTR buffer,UINT nSize,UINT nID);
int			FormatResourceStringEx	(LPSTR buffer,UINT nSize,UINT nID,...);

BOOL			ExtractResource		(UINT resource,LPCSTR lpcszResName,LPCSTR lpszFileName);
BOOL			ExtractResourceIntoBuffer(UINT nID,LPCSTR lpcszResName,LPSTR lpBuffer,UINT nBufferSize);

BOOL			CreateShortcut			(LPCSTR Target,LPCSTR Arguments,LPCSTR LinkFileName,LPCSTR LinkLocation,LPCSTR WorkingDir,UINT nIconIndex);

void			Delay				(int delay);
BOOL			PeekAndPump			(void);

OSVERSIONTYPE	GetWindowsVersion		(LPSTR lpszWindowsPlatform,UINT nSize,DWORD* dwMajorVersion = NULL,DWORD* dwMinorVersion = NULL);

BOOL			DeleteFileToRecycleBin	(HWND hWnd,LPCSTR lpcszFileName,BOOL bShowDialog = TRUE,BOOL bAllowUndo = TRUE);

LPSTR		EnsureBackslash		(LPSTR lpszFileName,UINT nFileSize);
LPSTR		RemoveBackslash		(LPSTR lpszFileName);

int			GetTaskBarRect			(RECT *pRect);

#endif // _WIN32API_H
