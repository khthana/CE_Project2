/////////////////////////////////////////////////////////////////////////////
//
//	Copyright (c) 2001, Maetee Supreanruey and Anusorn Krasantisuk
//	All Rights Reserved.
//
//	This is UNPUBLISHED PROPRIETARY SOURCE CODE of Maetee Supreanruey 
//	and Anusorn Krasantisuk, the contents of this file may not be 
//	disclosed to third parties, copied or duplicated in any form, 
//	in whole or in part, without the prior written permission of 
//	Maetee Supreanruey and Anusorn Krasantisuk.
//
/////////////////////////////////////////////////////////////////////////////

#pragma once
#include "glapplication.h"
#include "Camera2.h"
#include "Engine\MousePointer.h"

class CMyGlApp :
	public CGLApplication
{
public:
	CMyGlApp(void);
	virtual ~CMyGlApp(void);

	virtual HRESULT InitDeviceObjects(GLvoid);
	virtual HRESULT DeleteDeviceObjects(GLvoid);

	virtual HRESULT OneTimeSceneInit(void);
	virtual HRESULT FinalCleanup(void);

	virtual HRESULT FrameMove(GLvoid);
	virtual HRESULT Render(GLvoid);

	HRESULT ProcessKey( float fElapsedTime );

	void	ShowLoading(float fPercent,const CString& Message);

public:
	LRESULT CALLBACK MsgProc( HWND	 hWnd,			// Handle For This Window
							  UINT	 uMsg,			// Message For This Window
							  WPARAM wParam,		// Additional Message Information
							  LPARAM lParam );		// Additional Message Information

private:
	// Camera
	CCamera2 m_Camera; 

	// Mouse Data
	BOOL    m_MBLeft;
	BOOL    m_MBMiddle;
	BOOL    m_MBRight;
	
	BOOL    m_MBLeftUp;
	BOOL    m_MBMiddleUp;
	BOOL    m_MBRightUp;
	
	inline  void ResetMBUp()
	{ m_MBLeftUp = m_MBMiddleUp = m_MBRightUp = FALSE; };	  

	int     m_MouseX;
	int     m_MouseY;

	CMousePointer m_Mouse;

private:
	// Port
	CPoint m_calibase[9];
	BOOL  m_bShoot;
	float m_shootx;
	float m_shooty;

public:
	void  ProcessComData(BYTE *pData);    
	int   ProcessBound(float vx0,float vx1,float vy0,float vy1,float vz0,float vz1); 
    void  ProcessSong(); 
	void  ProcessFly();
};
