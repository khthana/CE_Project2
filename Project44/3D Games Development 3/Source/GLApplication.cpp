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

#include "StdAfx.h"
#include "Engine\EngineInterface.h"
#include "Engine\GLGfx.h"
#include <mmsystem.h>
#include "glapplication.h"

//#include <GL/glut.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


//-----------------------------------------------------------------------------
// Global access to the app (needed for the global WndProc())
//-----------------------------------------------------------------------------
static CGLApplication * g_pGLApp = NULL;

LRESULT	CALLBACK WndProc(	HWND	m_hWnd,			// Handle For This Window
							UINT	uMsg,			// Message For This Window
							WPARAM	wParam,			// Additional Message Information
							LPARAM	lParam)			// Additional Message Information
{
	return g_pGLApp->MsgProc(m_hWnd,uMsg,wParam,lParam);
}

CGLApplication::CGLApplication(void)
{
	g_pGLApp = this;

	m_hWnd=NULL;		     // Holds Our Window Handle

	for ( int nCount = 0 ; nCount < 256 ; nCount++)
	{
		m_arKey[nCount] = FALSE;
	}

	m_bActive=TRUE;		    // Window Active Flag Set To TRUE By Default
	m_bFullscreen = FALSE;	// Fullscreen Flag Set To Fullscreen Mode By Default
	m_nMode = 0;

	m_fTime = 0.0f;             // Current time in seconds
	m_fElapsedTime = 0.0f;      // Time elapsed since last frame
	m_fFPS = 0.0f;              // Instanteous frame rate

	// for util_timer
	m_bTimerInitialized = FALSE;
    m_bUsingQPF         = FALSE;

    m_llQPFTicksPerSec  = 0;
	m_llStopTime        = 0;
    m_llLastElapsedTime = 0;
    m_llBaseTime        = 0;

	m_fLastElapsedTime  = 0.0;
    m_fBaseTime         = 0.0;
    m_fStopTime         = 0.0;

	m_bFrameMoving = TRUE;

	// for debug
	#ifdef _DEBUG

	 m_dwAllframes = 0;
	 m_dwAllRender = 0;
	 m_dwAllInitDevice = 0;
	 m_dwDeleteDevice  = 0;

	 m_strTitle = "Candid OpenGL Framework";

	#endif	

	 m_fMonitor = 1.0f;
	 m_fOnebByMaxFPS  = 1.0f/40.0f;

}

GLvoid CGLApplication::ReSizeGLScene(GLsizei width, GLsizei height)		// Resize And Initialize The GL Window
{
	if (height==0)										// Prevent A Divide By Zero By
	{
		height=1;										// Making Height Equal One
	}

	glViewport(0,0,width,height/**0.8f*/);						// Reset The Current Viewport
	//glViewport(0,0,width,height*0.8f);						// Reset The Current Viewport

	glMatrixMode(GL_PROJECTION);						// Select The Projection Matrix
	glLoadIdentity();									// Reset The Projection Matrix

	// Calculate The Aspect Ratio Of The Window
	gluPerspective(45.0f,4.0f/3.0f,0.1f,10000.0f);

	glMatrixMode(GL_MODELVIEW);							// Select The Modelview Matrix
	glLoadIdentity();									// Reset The Modelview Matrix
}

HRESULT CGLApplication::InitDeviceObjects(GLvoid)										// All Setup For OpenGL Goes Here
{
	return S_OK;										// Initialization Went OK
}

HRESULT CGLApplication::DeleteDeviceObjects(GLvoid)
{
	return S_OK;
}

HRESULT CGLApplication::Render(GLvoid)									// Here's Where We Do All The Drawing
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);	// Clear Screen And Depth Buffer
	glLoadIdentity();									// Reset The Current Modelview Matrix
	return S_OK;										// Everything Went OK
}

HRESULT CGLApplication::FrameMove(GLvoid)
{
	return S_OK;
}

GLvoid CGLApplication::KillGLWindow(GLvoid)								// Properly Kill The Window
{
	// for debug
	#ifdef _DEBUG
	 m_dwDeleteDevice++;
	#endif	

	DeleteDeviceObjects();

	if (m_bFullscreen)										// Are We In Fullscreen Mode?
	{
		ChangeDisplaySettings(NULL,0);					// If So Switch Back To The Desktop
		ShowCursor(TRUE);								// Show Mouse Pointer
	}

	// Release Engine
	if( CEngineInterface::DeleteDeviceObjects() != S_OK )
	{
		MessageBox(NULL,"Delete Engine Failed.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		return ;								// Return FALSE
	}

	if (m_hWnd && !DestroyWindow(m_hWnd))					// Are We Able To Destroy The Window?
	{
		MessageBox(NULL,"Could Not Release m_hWnd.","SHUTDOWN ERROR",MB_OK | MB_ICONINFORMATION);
		m_hWnd=NULL;										// Set m_hWnd To NULL
	}

	if (!UnregisterClass("OpenGL",m_hInstance))			// Are We Able To Unregister Class
	{
		MessageBox(NULL,"Could Not Unregister Class.","SHUTDOWN ERROR",MB_OK | MB_ICONINFORMATION);
		m_hInstance=NULL;									// Set m_hInstance To NULL
	}
}

/*	This Code Creates Our OpenGL Window.  Parameters Are:					*
 *	title			- Title To Appear At The Top Of The Window				*
 *	width			- Width Of The GL Window Or Fullscreen Mode				*
 *	height			- Height Of The GL Window Or Fullscreen Mode			*
 *	bits			- Number Of Bits To Use For Color (8/16/24/32)			*
 *	m_bFullscreenflag	- Use Fullscreen Mode (TRUE) Or Windowed Mode (FALSE)	*/
BOOL CGLApplication::CreateGLWindow(const char* title, int width, int height, int bits, bool m_bFullscreenflag)
{
	WNDCLASS	wc;						// Windows Class Structure
	DWORD		dwExStyle;				// Window Extended Style
	DWORD		dwStyle;				// Window Style
	RECT		WindowRect;				// Grabs Rectangle Upper Left / Lower Right Values
	WindowRect.left=(long)0;			// Set Left Value To 0
	WindowRect.right=(long)width;		// Set Right Value To Requested Width
	WindowRect.top=(long)0;				// Set Top Value To 0
	WindowRect.bottom=(long)height;		// Set Bottom Value To Requested Height

	m_bFullscreen=m_bFullscreenflag;			// Set The Global Fullscreen Flag

	m_hInstance			= GetModuleHandle(NULL);				// Grab An Instance For Our Window
	wc.style			= CS_HREDRAW | CS_VREDRAW | CS_OWNDC;	// Redraw On Size, And Own DC For Window.
	wc.lpfnWndProc		= (WNDPROC) WndProc;					// WndProc Handles Messages
	wc.cbClsExtra		= 0;									// No Extra Window Data
	wc.cbWndExtra		= 0;									// No Extra Window Data
	wc.hInstance		= m_hInstance;							// Set The Instance
	wc.hIcon			= LoadIcon(NULL, IDI_WINLOGO);			// Load The Default Icon
	wc.hCursor			= LoadCursor(NULL, IDC_CROSS);			// Load The Arrow Pointer
	wc.hbrBackground	= NULL;									// No Background Required For GL
	wc.lpszMenuName		= NULL;									// We Don't Want A Menu
	wc.lpszClassName	= "OpenGL";								// Set The Class Name

	
	if (!RegisterClass(&wc))									// Attempt To Register The Window Class
	{
		MessageBox(NULL,"Failed To Register The Window Class.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		return FALSE;											// Return FALSE
	}
	
	if (m_bFullscreen)												// Attempt Fullscreen Mode?
	{
		DEVMODE dmScreenSettings;								// Device Mode
		memset(&dmScreenSettings,0,sizeof(dmScreenSettings));	// Makes Sure Memory's Cleared
		dmScreenSettings.dmSize=sizeof(dmScreenSettings);		// Size Of The Devmode Structure
		dmScreenSettings.dmPelsWidth	= width;				// Selected Screen Width
		dmScreenSettings.dmPelsHeight	= height;				// Selected Screen Height
		dmScreenSettings.dmBitsPerPel	= bits;					// Selected Bits Per Pixel
		dmScreenSettings.dmDisplayFrequency = 85;
		dmScreenSettings.dmFields=DM_BITSPERPEL|DM_PELSWIDTH|DM_PELSHEIGHT|DM_DISPLAYFREQUENCY;

		// Try To Set Selected Mode And Get Results.  NOTE: CDS_FULLSCREEN Gets Rid Of Start Bar.
		if (ChangeDisplaySettings(&dmScreenSettings,CDS_FULLSCREEN)!=DISP_CHANGE_SUCCESSFUL)
		{
			// If The Mode Fails, Offer Two Options.  Quit Or Use Windowed Mode.
			if (MessageBox(NULL,"The Requested Fullscreen Mode Is Not Supported By\nYour Video Card. Use Windowed Mode Instead?","NeHe GL",MB_YESNO|MB_ICONEXCLAMATION)==IDYES)
			{
				m_bFullscreen=FALSE;		// Windowed Mode Selected.  Fullscreen = FALSE
			}
			else
			{
				// Pop Up A Message Box Letting User Know The Program Is Closing.
				MessageBox(NULL,"Program Will Now Close.","ERROR",MB_OK|MB_ICONSTOP);
				return FALSE;									// Return FALSE
			}
		}
	}

	if (m_bFullscreen)												// Are We Still In Fullscreen Mode?
	{
		dwExStyle=WS_EX_APPWINDOW;								// Window Extended Style
		dwStyle=WS_POPUP;										// Windows Style
		ShowCursor(FALSE);										// Hide Mouse Pointer
	}
	else
	{
		dwExStyle=WS_EX_APPWINDOW | WS_EX_WINDOWEDGE;			// Window Extended Style
		dwStyle=WS_OVERLAPPEDWINDOW;							// Windows Style
	}

	AdjustWindowRectEx(&WindowRect, dwStyle, FALSE, dwExStyle);		// Adjust Window To True Requested Size

	// Create The Window
	if (!(m_hWnd=CreateWindowEx(	dwExStyle,							// Extended Style For The Window
								"OpenGL",							// Class Name
								title,								// Window Title
								dwStyle |							// Defined Window Style
								WS_CLIPSIBLINGS |					// Required Window Style
								WS_CLIPCHILDREN,					// Required Window Style
								0, 0,								// Window Position
								WindowRect.right-WindowRect.left,	// Calculate Window Width
								WindowRect.bottom-WindowRect.top,	// Calculate Window Height
								NULL,								// No Parent Window
								NULL,								// No Menu
								m_hInstance,							// Instance
								NULL)))								// Dont Pass Anything To WM_CREATE
	{
		KillGLWindow();								// Reset The Display
		MessageBox(NULL,"Window Creation Error.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		return FALSE;								// Return FALSE
	}

	
	// Engine InitDevice Object
	if( CEngineInterface::InitDeviceObjects( m_hWnd, bits ) != S_OK )
	{
		KillGLWindow();								// Reset The Display
		MessageBox(NULL,"Init Engine Failed.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		return FALSE;								// Return FALSE
	}

	ShowWindow(m_hWnd,SW_SHOW);						// Show The Window
	SetForegroundWindow(m_hWnd);						// Slightly Higher Priority
	SetFocus(m_hWnd);									// Sets Keyboard Focus To The Window
	ReSizeGLScene(width, height);					// Set Up Our Perspective GL Screen

	// for debug
	#ifdef _DEBUG
	 m_dwAllInitDevice++;
	#endif	

	if ( InitDeviceObjects() != S_OK )									// Initialize Our Newly Created GL Window
	{
		KillGLWindow();								// Reset The Display
		MessageBox(NULL,"Initialization Failed.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		return FALSE;								// Return FALSE
	}

	return TRUE;									// Success
}

LRESULT CALLBACK CGLApplication::MsgProc(	HWND	m_hWnd,			// Handle For This Window
											UINT	uMsg,			// Message For This Window
											WPARAM	wParam,			// Additional Message Information
											LPARAM	lParam )			// Additional Message Information
{
	switch (uMsg)									// Check For Windows Messages
	{
		case WM_ACTIVATE:							// Watch For Window Activate Message
		{
			if (!HIWORD(wParam))					// Check Minimization State
			{
				m_bActive=TRUE;						// Program Is Active

			}
			else
			{
				m_bActive=FALSE;					// Program Is No Longer Active

			}

			return 0;								// Return To The Message Loop
		}

		case WM_SYSCOMMAND:							// Intercept System Commands
		{
			switch (wParam)							// Check System Calls
			{
				case SC_SCREENSAVE:					// Screensaver Trying To Start?
				case SC_MONITORPOWER:				// Monitor Trying To Enter Powersave?
				return 0;							// Prevent From Happening
			}
			break;									// Exit
		}

		case WM_CLOSE:								// Did We Receive A Close Message?
		{
			PostQuitMessage(0);						// Send A Quit Message
			return 0;								// Jump Back
		}

		case WM_KEYDOWN:							// Is A Key Being Held Down?
		{
			m_arKey[wParam] = TRUE;				// If So, Mark It As TRUE
			return 0;								// Jump Back
		}

		case WM_KEYUP:								// Has A Key Been Released?
		{
			m_arKey[wParam] = FALSE;				// If So, Mark It As FALSE
			return 0;								// Jump Back
		}

		case WM_SIZE:								// Resize The OpenGL Window
		{
			ReSizeGLScene(LOWORD(lParam),HIWORD(lParam));  // LoWord=Width, HiWord=Height
			return 0;								// Jump Back
		}
	}

	// Pass All Unhandled Messages To DefWindowProc
	return DefWindowProc(m_hWnd,uMsg,wParam,lParam);
}

int WINAPI CGLApplication::Main(	HINSTANCE	m_hInstance,			// Instance
									HINSTANCE	hPrevInstance,		// Previous Instance
									LPSTR		lpCmdLine,			// Command Line Parameters
									int			nCmdShow)			// Window Show State
{



	MSG		msg;									// Windows Message Structure
	BOOL	done=FALSE;								// Bool Variable To Exit Loop

	// Ask The User Which Screen Mode They Prefer
	//if (MessageBox(NULL,"Would You Like To Run In Fullscreen Mode?", "Start FullScreen?",MB_YESNO|MB_ICONQUESTION)==IDNO)
	//{
	//	m_bFullscreen=FALSE;							// Windowed Mode
	//}

	if( FAILED( CEngineInterface::OneTimeSceneInit() ) )
	{
		::MessageBox( NULL, "Engine OneTimeSceneInit Error", "Error", 0 );
		return 0;
	}

	if( OneTimeSceneInit() != S_OK)
	{
		::MessageBox( NULL, "OneTimeSceneInit Error", "Error", 0 );
		return 0;
	}

	// Create Our OpenGL Window
	if (!CreateGLWindow(LPCTSTR(m_strTitle),800,600,32,m_bFullscreen))
	{
		return 0;									// Quit If Window Was Not Created
	}

	while(!done)									// Loop That Runs While done=FALSE
	{
		if (PeekMessage(&msg,NULL,0,0,PM_REMOVE))	// Is There A Message Waiting?
		{
			if (msg.message==WM_QUIT)				// Have We Received A Quit Message?
			{
				done=TRUE;							// If So done=TRUE
			}
			else									// If Not, Deal With Window Messages
			{
				TranslateMessage(&msg);				// Translate The Message
				DispatchMessage(&msg);				// Dispatch The Message
			}
		}
		else										// If There Are No Messages
		{
			// Draw The Scene.  Watch For ESC Key And Quit Messages From DrawGLScene()
			if (m_bActive)								// Program Active?
			{
				if ( m_arKey[VK_ESCAPE] )				// Was ESC Pressed?
				{
					done=TRUE;						// ESC Signalled A Quit
				}
				else								// Not Time To Quit, Update Screen
				{
					if ( Render3DEnvironment() != S_OK ) return 0;
				}
			}

			if ( m_arKey[VK_F9] )						// Is F1 Being Pressed?
			{
				m_arKey[VK_F9]=FALSE;					// If So Make Key FALSE
				TRACE("Show FPS = %f\n", m_fFPS);
			}

			if ( m_arKey[VK_F1] )						// Is F1 Being Pressed?
			{
				m_arKey[VK_F1]=FALSE;					// If So Make Key FALSE
				SetMode(0);
			}

			if (m_arKey[VK_F2])						// Is F1 Being Pressed?
			{
				m_arKey[VK_F2]=FALSE;					// If So Make Key FALSE
				SetMode(1);
			}

			if (m_arKey[VK_F3])						// Is F1 Being Pressed?
			{
				m_arKey[VK_F3]=FALSE;					// If So Make Key FALSE
				SetMode(2);
			}

			if (m_arKey[VK_F4])						// Is F1 Being Pressed?
			{
				m_arKey[VK_F4]=FALSE;					// If So Make Key FALSE
				SetMode(3);
			}

			if (m_arKey[VK_F5])						// Is F1 Being Pressed?
			{
				m_arKey[VK_F5]=FALSE;					// If So Make Key FALSE
				SetMode(4);
			}
		}
	}

	// Shutdown
	KillGLWindow();									// Kill The Window
	FinalCleanup();
	CEngineInterface::FinalCleanup();

	// for debug
	#ifdef _DEBUG
	TRACE(" All FrameMove			= %d\r\n",m_dwAllframes);
	TRACE(" All Render				= %d\r\n",m_dwAllRender);
	TRACE(" All InitDeviceObjects   = %d\r\n",m_dwAllInitDevice);
	TRACE(" All DeleteDeviceObjects	= %d\r\n",m_dwDeleteDevice);
	#endif	

	return (msg.wParam);							// Exit The Program
}

int CGLApplication::SetMode(int nMode)
{
	if ( ( nMode >=0) && (nMode <=4))
	if ( m_nMode != nMode )
	{
		m_nMode = nMode;

		KillGLWindow();						// Kill Our Current Window

		if ( m_nMode == 4 )
		{
			m_fMonitor = 2.0f;
		}
		else
		{
			m_fMonitor = 1.0f;
		}
		// Recreate Our OpenGL Window
		switch(m_nMode)
		{
		case 0:
			m_bFullscreen=FALSE;				// Toggle Fullscreen / Windowed Mode
			if (!CreateGLWindow(LPCTSTR(m_strTitle),800,600,32,m_bFullscreen)) return 0;
			break;
		case 1:
			m_bFullscreen=TRUE;				// Toggle Fullscreen / Windowed Mode
			if (!CreateGLWindow(LPCTSTR(m_strTitle),640,480,32,m_bFullscreen)) return 0;
			break;
		case 2:
			m_bFullscreen=TRUE;				// Toggle Fullscreen / Windowed Mode
			if (!CreateGLWindow(LPCTSTR(m_strTitle),800,600,32,m_bFullscreen)) return 0;
			break;
		case 3:
			m_bFullscreen=TRUE;				// Toggle Fullscreen / Windowed Mode
			if (!CreateGLWindow(LPCTSTR(m_strTitle),1024,768,32,m_bFullscreen)) return 0;
			break;
		case 4:
			m_bFullscreen=TRUE;				// Toggle Fullscreen / Windowed Mode
			if (!CreateGLWindow(LPCTSTR(m_strTitle),1600,600,32,m_bFullscreen)) return 0;
			break;
		}
	}

	return 1;
}


HRESULT CGLApplication::OneTimeSceneInit(void)
{
	return S_OK;
}

HRESULT CGLApplication::FinalCleanup(void)
{
	TRACE("\r\nOpenGL version = %s\r\n",(char *)glGetString(GL_VERSION));
	return S_OK;
}

HRESULT CGLApplication::Render3DEnvironment()
{
	HRESULT hr;
    // Get the app's time, in seconds. Skip rendering if no time elapsed
    FLOAT fAppTime        = Util_Timer( TIMER_GETAPPTIME );

	//Frame Skip
	static float fAppOldTime = fAppTime;

	if ( (fAppTime -  fAppOldTime) < (m_fOnebByMaxFPS) )
	return S_OK;

	fAppOldTime = fAppTime;

    FLOAT fElapsedAppTime = Util_Timer( TIMER_GETELAPSEDTIME );


    if( ( 0.0f == fElapsedAppTime ) && m_bFrameMoving )
        return S_OK;

    // FrameMove (animate) the scene
    if( m_bFrameMoving /*|| m_bSingleStep*/ )
    {
        // Store the time for the app
        m_fTime        = fAppTime;
		static BOOL bFirstTime = TRUE;
		if (bFirstTime)
		{
			bFirstTime = FALSE;
			m_fElapsedTime = 0.0f;
		}
		else
		{
			m_fElapsedTime = fElapsedAppTime;
		}

        // Frame move the scene
		// for debug
		#ifdef _DEBUG
		m_dwAllframes++;
		#endif	

        if( FAILED( hr = FrameMove() ) )
            return hr;

        //m_bSingleStep = FALSE;
    }

    // Render the scene as normal
	// for debug
	#ifdef _DEBUG
	 m_dwAllRender++;
	#endif	
    if( FAILED( hr = Render() ) )
        return hr;

    // Keep track of the frame count
    {
        static FLOAT fLastTime = 0.0f;
        static DWORD dwFrames  = 0L;
        FLOAT fTime = Util_Timer( TIMER_GETABSOLUTETIME );
        ++dwFrames;

        // Update the scene stats once per second
        if( fTime - fLastTime > 1.0f )
        {
            m_fFPS    = dwFrames / (fTime - fLastTime);
            fLastTime = fTime;
            dwFrames  = 0L;

			//Show Frame Persec here
        }
    }

    // Show the frame on the primary surface.
    //m_pd3dDevice->Present( NULL, NULL, NULL, NULL );
	//SwapBuffers(m_hDC);				// Swap Buffers (Double Buffering)
	//GLGfx::Present();
	GLGfx::SwapBuffers();
	return S_OK;

}


//-----------------------------------------------------------------------------
// Name: Util_Timer()
// Desc: Performs timer opertations. Use the following commands:
//          TIMER_RESET           - to reset the timer
//          TIMER_START           - to start the timer
//          TIMER_STOP            - to stop (or pause) the timer
//          TIMER_ADVANCE         - to advance the timer by 0.1 seconds
//          TIMER_GETABSOLUTETIME - to get the absolute system time
//          TIMER_GETAPPTIME      - to get the current time
//          TIMER_GETELAPSEDTIME  - to get the time that elapsed between 
//                                  TIMER_GETELAPSEDTIME calls
//-----------------------------------------------------------------------------
FLOAT CGLApplication::Util_Timer( TIMER_COMMAND command )
{    
    // Initialize the timer
    if( FALSE == m_bTimerInitialized )
    {
        m_bTimerInitialized = TRUE;

        // Use QueryPerformanceFrequency() to get frequency of timer.  If QPF is
        // not supported, we will timeGetTime() which returns milliseconds.
        LARGE_INTEGER qwTicksPerSec;
        m_bUsingQPF = QueryPerformanceFrequency( &qwTicksPerSec );
        if( m_bUsingQPF )
            m_llQPFTicksPerSec = qwTicksPerSec.QuadPart;
    }

    if( m_bUsingQPF )
    {
        double fTime;
        double fElapsedTime;
        LARGE_INTEGER qwTime;
        
        // Get either the current time or the stop time, depending
        // on whether we're stopped and what command was sent
        if( m_llStopTime != 0 && command != TIMER_START && command != TIMER_GETABSOLUTETIME)
            qwTime.QuadPart = m_llStopTime;
        else
            QueryPerformanceCounter( &qwTime );

        // Return the elapsed time
        if( command == TIMER_GETELAPSEDTIME )
        {
            fElapsedTime = (double) ( qwTime.QuadPart - m_llLastElapsedTime ) / (double) m_llQPFTicksPerSec;
            m_llLastElapsedTime = qwTime.QuadPart;
            return (FLOAT) fElapsedTime;
        }
    
        // Return the current time
        if( command == TIMER_GETAPPTIME )
        {
            double fAppTime = (double) ( qwTime.QuadPart - m_llBaseTime ) / (double) m_llQPFTicksPerSec;
            return (FLOAT) fAppTime;
        }
    
        // Reset the timer
        if( command == TIMER_RESET )
        {
            m_llBaseTime        = qwTime.QuadPart;
            m_llLastElapsedTime = qwTime.QuadPart;
            return 0.0f;
        }
    
        // Start the timer
        if( command == TIMER_START )
        {
            m_llBaseTime += qwTime.QuadPart - m_llStopTime;
            m_llStopTime = 0;
            m_llLastElapsedTime = qwTime.QuadPart;
            return 0.0f;
        }
    
        // Stop the timer
        if( command == TIMER_STOP )
        {
            m_llStopTime = qwTime.QuadPart;
            m_llLastElapsedTime = qwTime.QuadPart;
            return 0.0f;
        }
    
        // Advance the timer by 1/10th second
        if( command == TIMER_ADVANCE )
        {
            m_llStopTime += m_llQPFTicksPerSec/10;
            return 0.0f;
        }

        if( command == TIMER_GETABSOLUTETIME )
        {
            fTime = qwTime.QuadPart / (double) m_llQPFTicksPerSec;
            return (FLOAT) fTime;
        }

        return -1.0f; // Invalid command specified
    }
    else
    {
        // Get the time using timeGetTime()
        double fTime;
        double fElapsedTime;
        
        // Get either the current time or the stop time, depending
        // on whether we're stopped and what command was sent
        if( m_fStopTime != 0.0 && command != TIMER_START && command != TIMER_GETABSOLUTETIME)
            fTime = m_fStopTime;
        else
            fTime = timeGetTime() * 0.001;
    
        // Return the elapsed time
        if( command == TIMER_GETELAPSEDTIME )
        {   
            fElapsedTime = (double) (fTime - m_fLastElapsedTime);
            m_fLastElapsedTime = fTime;
            return (FLOAT) fElapsedTime;
        }
    
        // Return the current time
        if( command == TIMER_GETAPPTIME )
        {
            return (FLOAT) (fTime - m_fBaseTime);
        }
    
        // Reset the timer
        if( command == TIMER_RESET )
        {
            m_fBaseTime         = fTime;
            m_fLastElapsedTime  = fTime;
            return 0.0f;
        }
    
        // Start the timer
        if( command == TIMER_START )
        {
            m_fBaseTime += fTime - m_fStopTime;
            m_fStopTime = 0.0f;
            m_fLastElapsedTime  = fTime;
            return 0.0f;
        }
    
        // Stop the timer
        if( command == TIMER_STOP )
        {
            m_fStopTime = fTime;
            return 0.0f;
        }
    
        // Advance the timer by 1/10th second
        if( command == TIMER_ADVANCE )
        {
            m_fStopTime += 0.1f;
            return 0.0f;
        }

        if( command == TIMER_GETABSOLUTETIME )
        {
            return (FLOAT) fTime;
        }

        return -1.0f; // Invalid command specified
    }
}

