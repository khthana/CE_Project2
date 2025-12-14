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

#include <windows.h>		// Header File For Windows

#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library

//#include <glh_nveb.h>
//#include <glh_extensions.h>
//#include <glh_obs.h>
//#include <GL/glut.h>
//#include <glh_nveb.h>
//#include <glh_extensions.h>
//#include <glh_obs.h>
//#include <GL/glut.h>

class CGLApplication
{
protected:
	/*
	HDC			m_hDC;		    // Private GDI Device Context
	HGLRC		m_hRC;		    // Permanent Rendering Context
	*/
	HWND		m_hWnd;		    // Holds Our Window Handle
	HINSTANCE	m_hInstance;	// Holds The Instance Of The Application

	float		m_fMonitor;

	// Keyboard Data
	BOOL	m_arKey[256];      // Array of Virtual Key

	bool	m_bActive;		 // Window Active Flag Set To TRUE By Default
	bool	m_bFullscreen;	 // Fullscreen Flag Set To Fullscreen Mode By Default

	float	m_fOnebByMaxFPS;


	virtual GLvoid ReSizeGLScene(GLsizei width, GLsizei height);		// Resize And Initialize The GL Window

public:
	virtual LRESULT CALLBACK MsgProc(	HWND	hWnd,			// Handle For This Window
										UINT	uMsg,			// Message For This Window
										WPARAM	wParam,			// Additional Message Information
										LPARAM	lParam );		// Additional Message Information
private:
	BOOL	CreateGLWindow(const char* title, int width, int height, int bits, bool fullscreenflag);
	GLvoid	KillGLWindow(GLvoid);								// Properly Kill The Window

public:
	 int WINAPI Main(	HINSTANCE	hInstance,			// Instance
										HINSTANCE	hPrevInstance,		// Previous Instance
										LPSTR		lpCmdLine,			// Command Line Parameters
										int			nCmdShow);			// Window Show State

public:
	CGLApplication(void);

	int m_nMode;
	float GetMonitor() {return m_fMonitor;}

private:
	int SetMode(int nMode);

	// Mode status
	

// User Interface
public:
	virtual HRESULT InitDeviceObjects(GLvoid);
	virtual HRESULT DeleteDeviceObjects(GLvoid);
	virtual HRESULT OneTimeSceneInit(void);
	virtual HRESULT FinalCleanup(void);
	virtual HRESULT FrameMove(GLvoid);
	virtual HRESULT Render(GLvoid);

	BOOL	m_bFrameMoving;

	FLOAT             m_fTime;             // Current time in seconds
	FLOAT             m_fElapsedTime;      // Time elapsed since last frame
	FLOAT             m_fFPS;              // Instanteous frame rate

private:
	HRESULT Render3DEnvironment();

public:
		CString  m_strTitle;
		BOOL     m_bTimerInitialized;
		BOOL     m_bUsingQPF;
		LONGLONG m_llQPFTicksPerSec;

		LONGLONG m_llStopTime;
		LONGLONG m_llLastElapsedTime;
		LONGLONG m_llBaseTime;

		double m_fLastElapsedTime;
		double m_fBaseTime;
		double m_fStopTime;

		enum TIMER_COMMAND { TIMER_RESET, TIMER_START, TIMER_STOP, TIMER_ADVANCE,
							TIMER_GETABSOLUTETIME, TIMER_GETAPPTIME, TIMER_GETELAPSEDTIME };

		FLOAT Util_Timer( TIMER_COMMAND command );

	// for debug
	#ifdef _DEBUG

	 DWORD m_dwAllframes;
	 DWORD m_dwAllRender;
	 DWORD m_dwAllInitDevice;
	 DWORD m_dwDeleteDevice;

	#endif	

};
