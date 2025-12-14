//-----------------------------------------------------------------
//
//	Gamemain.h
//
//	28 January 20001
//
//	Author by	Patinya Tiantong 
//				Faculty of Computer Engineering
//				King Mongkut's Institute of Technology Ladkrabang
//
//	Revision	1 <28-01-2001>
//
//-----------------------------------------------------------------

#ifndef __GAMEMAIN_H
#define __GAMEMAIN_H

#include <windows.h>
#include <windowsx.h>
#include <winbase.h>
#include <mmsystem.h>
#include <stdio.h>
#include <tchar.h>

class GameMain
{
private:
	HWND		m_hWnd;
	HINSTANCE	m_hInstance;
	TCHAR*		m_strName;
	TCHAR*		m_strClass;
	BOOL		m_bReady;
	BOOL		m_bActive;
	BOOL		m_bPerfCounter;
	LONGLONG	m_lFrequency;
	FLOAT		m_fOldTime;
	FLOAT		m_fTime;

	FLOAT		GetFloatTime();
public:
	GameMain();
	virtual		BOOL		Create(HINSTANCE);
	virtual		INT			Run();
	virtual		LRESULT		MsgProc(HWND,UINT,WPARAM,LPARAM);

	//Accessor function
	BOOL		IsPerfCounter()		{return m_bPerfCounter;};
	FLOAT		GetTime()	{return m_fTime;};
};

#endif