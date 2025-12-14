// FootballApp.cpp: implementation of the CFootballApp class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FootballApp.h"

#include "Resource.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CFootballApp* g_App = NULL;

LRESULT CALLBACK MainWndProc(HWND hWnd,UINT Msg,WPARAM wParam,LPARAM lParam)
{
	return g_App->MsgProc(hWnd,Msg,wParam,lParam);
}

CFootballApp::CFootballApp()
{
	CLOG("CFootballApp::CFootballApp()");
	g_App				= this;

	// Window Initialization
	m_hWnd				= NULL;
	m_hInstance			= NULL;
	m_lpszWindowTitle	= _T("Football Application");
	// Application Initialization
	m_bWindowed			= TRUE;
	m_bActive			= FALSE;
	// DirectDraw Initialization
	m_pDisplay			= NULL;
	//m_dwScreenWidth		= 1145;
	//m_dwScreenHeight	= 780;
	m_dwScreenWidth		= 640;
	m_dwScreenHeight	= 480;
	m_dwScreenBPP		= 8;
	// DirectInput Initialization
	m_pDI				= NULL;         
	m_pKeyboard			= NULL;     
	// DirectSound Initialization
	m_pKickSound		= NULL;
	m_pGoalSound		= NULL;
	m_pWhistleSound		= NULL;
	// Football Initialization
	m_pClipSurface		= NULL;
	m_ptBorder.x		= 25;
	m_ptBorder.y		= 25;

	m_pMatch			= NULL;
	m_pMatch			= new CFootballMatch(this);
	GameLoadOption();
	if(!m_Network.LoadNetwork(NEURAL_FILE))
	{
		MessageBox(m_hWnd,"Error Reading Neural Network File!!!",
			"Load Neural Network",MB_ICONEXCLAMATION|MB_OK);
	}
}

CFootballApp::~CFootballApp()
{
	CLOG("CFootballApp::~CFootballApp()");
	FreeDeviceObject();
	SAFE_DELETE(m_pMatch);
	GameSaveOption();
	m_Network.SaveNetwork(NEURAL_FILE);
}

HRESULT CFootballApp::Create(HINSTANCE hInst)
{
	CLOG("CFootballApp::Create(HINSTANCE hInst)");
    WNDCLASSEX wc;

    // Register the window class
    wc.cbSize        = sizeof(wc);
    wc.lpszClassName = _T("FootballClass");
    wc.lpfnWndProc   = MainWndProc;
    wc.style         = CS_VREDRAW | CS_HREDRAW;
    wc.hInstance     = hInst;
    wc.hIcon         = LoadIcon( hInst, MAKEINTRESOURCE(IDI_MAIN_ICON) );
    wc.hIconSm       = NULL;
    wc.hCursor       = LoadCursor( NULL, IDC_ARROW );
    wc.hbrBackground = (HBRUSH) (COLOR_WINDOW + 1);
    wc.lpszMenuName  = MAKEINTRESOURCE(IDR_MENU);
    wc.cbClsExtra    = 0;
    wc.cbWndExtra    = 0;

    if( RegisterClassEx( &wc ) == 0 )
        return E_FAIL;

    // Calculate the proper size for the window given a client
	DWORD dwStyle = WS_OVERLAPPEDWINDOW & ~WS_MAXIMIZEBOX;
	RECT rc;
	SetRect( &rc, 0, 0, m_dwScreenWidth, m_dwScreenHeight );
	AdjustWindowRect( &rc, dwStyle, TRUE );

    // Create and show the main window
    m_hWnd = CreateWindowEx(0/*WS_EX_TOPMOST*/, _T("FootballClass"), 
                           m_lpszWindowTitle,
						   dwStyle, 0/*CW_USEDEFAULT*/, 0/*CW_USEDEFAULT*/,
  	                       RECTWIDTH(rc), RECTHEIGHT(rc), NULL, NULL, hInst, NULL );
    if( m_hWnd == NULL )
    	return E_FAIL;

    ShowWindow( m_hWnd, SW_NORMAL );
    UpdateWindow( m_hWnd );

    // Save the window size/pos for switching modes
    m_dwWindowStyle = GetWindowLong( m_hWnd, GWL_STYLE );
	GetWindowRect( m_hWnd, &m_rcWindowRect );
	GetClientRect( m_hWnd, &m_rcClientRect );

    m_hInstance = hInst;

 	CreateDeviceObject();
	return S_OK;
}

HRESULT CFootballApp::CreateDeviceObject()
{
	CLOG("CFootballApp::CreateDeviceObject()");
	HRESULT hr;
	
	// Create DirectDraw Object
	if(FAILED(hr = CreateDirectDraw()))
	{
		MessageBox( m_hWnd, _T("Failed initializing DirectDraw."),
			m_lpszWindowTitle, MB_ICONERROR | MB_OK );
            return hr;
	}
	// Create DirectInput Object
	if(FAILED(hr = CreateDirectInput()))
	{
		MessageBox( m_hWnd, _T("Failed initializing DirectInput."),
			m_lpszWindowTitle, MB_ICONERROR | MB_OK );
		return hr;
	}
	// Create DirectShow Object
	if(FAILED(DSUtil_InitDirectSound( m_hWnd )))
    {
		MessageBox( m_hWnd, _T("Failed initializing DirectInput."),
			m_lpszWindowTitle, MB_ICONERROR | MB_OK );
		return hr;
	}

	m_pKickSound	= DSUtil_CreateSound("Kick",4);
	m_pGoalSound	= DSUtil_CreateSound("Goal",4);
	m_pWhistleSound	= DSUtil_CreateSound("Whistle",4);

	return S_OK;
}

void CFootballApp::FreeDeviceObject()
{
	CLOG("CFootballApp::FreeDeviceObject()");
	DSUtil_DestroySound(m_pWhistleSound); 
	DSUtil_DestroySound(m_pGoalSound); 
	DSUtil_DestroySound(m_pKickSound); 
	DSUtil_FreeDirectSound();
	FreeDirectInput();
	FreeDirectDraw();
}

HRESULT CFootballApp::CreateDirectDraw()
{
	CLOG("CFootballApp::CreateDirectDraw()");
	HRESULT	hr;
	// Release all existing surfaces
	FreeDirectDraw();

    // The back buffer and primary surfaces need to be created differently 
    // depending on if we are in full-screen or windowed mode
    m_pDisplay = new CDisplay();
    if(m_bWindowed)
    {
//		m_dwScreenWidth		= 1145;
//		m_dwScreenHeight	= 780;
        if( FAILED( hr = m_pDisplay->CreateWindowedDisplay( m_hWnd, m_dwScreenWidth, 
                                                            m_dwScreenHeight ) ) )
            return hr;

        // Add the system menu to the window's style
        DWORD dwStyle = GetWindowLong( m_hWnd, GWL_STYLE );
        dwStyle |= WS_SYSMENU;
        SetWindowLong( m_hWnd, GWL_STYLE, dwStyle );

#ifdef _WIN64
        HINSTANCE hInst = (HINSTANCE) GetWindowLongPtr( m_hWnd, GWLP_HINSTANCE );
#else
        HINSTANCE hInst = (HINSTANCE) GetWindowLong( m_hWnd, GWL_HINSTANCE );
#endif

        HMENU hMenu = LoadMenu( hInst, MAKEINTRESOURCE( IDR_MENU ) );
        SetMenu( m_hWnd, hMenu );
    }
    else
    {
		m_dwScreenWidth = 640;
		m_dwScreenHeight = 480;
		m_dwScreenBPP	= 8;
        if( FAILED( hr = m_pDisplay->CreateFullScreenDisplay( m_hWnd, m_dwScreenWidth, 
                                                              m_dwScreenHeight, m_dwScreenBPP ) ) )
        {
            return hr;
        }

        // Disable the menu in full-screen since we are 
        // using a palette and a menu would look bad 
        SetMenu( m_hWnd, NULL );

        // Remove the system menu from the window's style
        DWORD dwStyle = GetWindowLong( m_hWnd, GWL_STYLE );
        dwStyle &= ~WS_SYSMENU;
        SetWindowLong( m_hWnd, GWL_STYLE, dwStyle );       
    }
	SetRect(&m_rcClientRect,0,0,m_dwScreenWidth,m_dwScreenHeight);
	// Create Application Object
	if(FAILED(hr = CreateSurface()))
		return hr;
	return S_OK;
}

HRESULT CFootballApp::CreateDirectInput()
{
	CLOG("CFootballApp::CreateDirectInput()");
    HRESULT hr;
    // Cleanup any previous call first
    KillTimer( m_hWnd, 0 );    
    FreeDirectInput();

    // Create a DInput object
	if(FAILED(hr = DirectInput8Create(GetModuleHandle(NULL), DIRECTINPUT_VERSION, 
                                         IID_IDirectInput8, (VOID**)&m_pDI, NULL ) ) )
		return hr;
	
    // Obtain an interface to the system keyboard device.
	if(FAILED(hr = m_pDI->CreateDevice( GUID_SysKeyboard, &m_pKeyboard, NULL ) ) )
		return hr;

    // Set the data format to "keyboard format" - a predefined data format 
    //
    // A data format specifies which controls on a device we
    // are interested in, and how they should be reported.
    //
    // This tells DirectInput that we will be passing an array
    // of 256 bytes to IDirectInputDevice::GetDeviceState.
    if(FAILED(hr = m_pKeyboard->SetDataFormat( &c_dfDIKeyboard ) ) )
		return hr;

    // Set the cooperativity level to let DirectInput know how
    // this device should interact with the system and with other
    // DirectInput applications.
    if(FAILED(hr = m_pKeyboard->SetCooperativeLevel( m_hWnd, DISCL_NONEXCLUSIVE | DISCL_FOREGROUND)))
    	return hr;
	
    // Acquire the newly created device
    m_pKeyboard->Acquire();

    // Set a timer to go off 12 times a second, to read input
    // Note: Typically an application would poll the keyboard
    //       much faster than this, but this slow rate is simply 
    //       for the purposes of demonstration
	SetTimer(  m_hWnd, 0, 1000 / 50, NULL );
    return S_OK;
}

HRESULT CFootballApp::CreateSurface()
{
	CLOG("CFootballApp::CreateSurface()");
	HRESULT hr;
    LPDIRECTDRAWPALETTE pDDPal   = NULL; 

    // We need to release and re-load, and set the palette again to 
    // redraw the bitmap on the surface.  Otherwise, GDI will not 
    // draw the bitmap on the surface with the right palette
    if(FAILED(hr = m_pDisplay->CreatePaletteFromBitmap(&pDDPal,"Resource\\Color.bmp")))
        return hr;
    m_pDisplay->SetPalette( pDDPal );
    SAFE_RELEASE( pDDPal );

	// Create Clipping Surface 
	if(FAILED(hr = m_pDisplay->CreateSurface(&m_pClipSurface,
			m_dwScreenWidth+m_ptBorder.x*2,m_dwScreenHeight+m_ptBorder.y*2)))
	{
		MessageBox(m_hWnd,TEXT("Failed create ClipSurface."),
			m_lpszWindowTitle, MB_ICONERROR | MB_OK);
		return hr;
	}
	SetRect(&m_rcClipSurface,m_ptBorder.x,m_ptBorder.y,
		m_dwScreenWidth+m_ptBorder.x,m_dwScreenHeight+m_ptBorder.y);

	m_pMatch->CreateSurface(m_pDisplay);
	return S_OK;
}

void CFootballApp::FreeSurface()
{
	CLOG("CFootballApp::FreeSurface()");
    m_pMatch->ReleaseSurface();
	SAFE_DELETE(m_pClipSurface);
}

void CFootballApp::FreeDirectDraw()
{
	CLOG("CFootballApp::FreeDirectDraw()");
	FreeSurface();
	SAFE_DELETE(m_pDisplay);
}

void CFootballApp::FreeDirectInput()
{
	CLOG("CFootballApp::FreeDirectInput()");
	KillTimer( m_hWnd, 0 );
	// Unacquire the device one last time just in case 
    // the app tried to exit while the device is still acquired.
    if( m_pKeyboard ) 
        m_pKeyboard->Unacquire();
    
    // Release any DirectInput objects.
    SAFE_RELEASE( m_pKeyboard );
    SAFE_RELEASE( m_pDI );
}

int CFootballApp::Run()
{
	CLOG("CFootballApp::Run()");
    MSG		msg;
	
	// Load keyboard accelerators
    HACCEL hAccel = LoadAccelerators( m_hInstance, MAKEINTRESOURCE(IDR_MAIN_ACCEL) );
	m_dwLastTick = timeGetTime();
    while( TRUE )
    {
        // Look for messages, if none are found then 
        // update the state and display it
        if( PeekMessage( &msg, NULL, 0, 0, PM_NOREMOVE ) )
        {
            if( 0 == GetMessage(&msg, NULL, 0, 0 ) )
            {
                // WM_QUIT was posted, so exit
                return (int)msg.wParam;
            }

            // Translate and dispatch the message
            if( 0 == TranslateAccelerator( m_hWnd, hAccel, &msg ) )
            {
                TranslateMessage( &msg ); 
                DispatchMessage( &msg );
            }
        }
        else
		{
			if(m_bActive)
			{
                // Move the sprites, blt them to the back buffer, then 
                // flip or blt the back buffer to the primary buffer
                if( FAILED( ProcessNextFrame( ) ) )
                {
					FreeDeviceObject();
                    MessageBox( m_hWnd, _T("Displaying the next frame failed."),
						m_lpszWindowTitle, MB_ICONERROR | MB_OK );
					return FALSE;
				}
			}
			else
			{
	           // Go to sleep if we have nothing else to do
                WaitMessage();

                // Ignore time spent inactive 
     			m_dwLastTick = GetTickCount();
			}
		}
	}
}

HRESULT CFootballApp::ProcessNextFrame()
{
    HRESULT hr;

    // Figure how much time has passed since the last time
	m_dwCurrTick = timeGetTime();;
    DWORD dwTickDiff = m_dwCurrTick - m_dwLastTick;

    // Don't update if no time has passed 
    if( dwTickDiff < 10 )
        return S_OK; 

    m_dwLastTick = m_dwCurrTick;

    // Move the sprites according to how much time has passed
	if(m_pMatch)
		m_pMatch->Update(dwTickDiff);

    // Check the cooperative level before rendering
    if( FAILED( hr = m_pDisplay->GetDirectDraw()->TestCooperativeLevel() ) )
    {
        switch( hr )
        {
            case DDERR_EXCLUSIVEMODEALREADYSET:
            case DDERR_NOEXCLUSIVEMODE:
                // Do nothing because some other app has exclusive mode
                Sleep(10);
                return S_OK;

            case DDERR_WRONGMODE:
                // The display mode changed on us. Update the
                // DirectDraw surfaces accordingly
                return CreateDirectDraw();
        }
        return hr;
    }

    // Display the sprites on the screen
    if( FAILED( hr = DisplayFrame() ) )
    {
        if( hr != DDERR_SURFACELOST )
            return hr;

        // The surfaces were lost so restore them 
        RestoreSurfaces();
    }

    return S_OK;
}

HRESULT CFootballApp::RestoreSurfaces()
{
    HRESULT hr;
    if( FAILED( hr = m_pDisplay->GetDirectDraw()->RestoreAllSurfaces() ) )
        return hr;

    return S_OK;
}

LRESULT CFootballApp::MsgProc(HWND hWnd,UINT msg,WPARAM wParam,LPARAM lParam)
{
	switch(msg)
	{
	case WM_COMMAND:
		switch(LOWORD(wParam))
		{
		case IDM_NEWGAME:
			MenuNewGame();						m_dwLastTick = timeGetTime();
			return 0L;
		case IDM_LOADGAME:
			MenuLoadGame(hWnd,m_pMatch);        m_dwLastTick = timeGetTime();
			return 0L;
		case IDM_SAVEGAME:
			MenuSaveGame(hWnd,m_pMatch);		m_dwLastTick = timeGetTime();
			return 0L;
        case IDM_GAMEOPTION:
			DialogBox(m_hInstance,(LPCTSTR)IDD_GAMEOPTION_DIALOG,
				m_hWnd,(DLGPROC)MenuGameOptionDlgProc);
	        m_dwLastTick = timeGetTime();
            return 0L;
		case IDM_LOADNEURAL:
			MenuLoadNeural(hWnd);	        m_dwLastTick = timeGetTime();
			return 0L;
		case IDM_SAVENEURAL:
			MenuSaveNeural(hWnd);	        m_dwLastTick = timeGetTime();
			return 0L;
		case IDM_TRAINNEURAL:
			if(DialogBox(m_hInstance,(LPCTSTR)IDD_TRAINNUERAL_DIALOG,
				m_hWnd,(DLGPROC)MenuTrainNeuralDlgProc) == IDOK)
			{
				DialogBox(m_hInstance,(LPCTSTR)IDD_PROCESS_DIALOG,
					m_hWnd,(DLGPROC)MenuTrainProcessDlgProc);

				//MenuTrainNeural(m_hInstance,hWnd);	        
			}
			m_dwLastTick = timeGetTime();
			return 0L;
		case IDM_TRAINOPTION:
			DialogBox(m_hInstance,(LPCTSTR)IDD_TRAINOPTION_DIALOG,
				m_hWnd,(DLGPROC)MenuTrainOptionDlgProc);
	        m_dwLastTick = timeGetTime();
            return 0L;
			
//        case IDM_LEARNINGOPTION:
//			DialogBox(m_hInstance,(LPCTSTR)IDD_OPTION_DIALOG,
//				m_hWnd,(DLGPROC)LearningOptionDlgProc);
//	        m_dwLastTick = timeGetTime();
//            return 0L;
        case IDM_TOGGLEFULLSCREEN:
            // Toggle the fullscreen/window mode
            if( m_bWindowed )
                GetWindowRect( hWnd, &m_rcWindowRect );

            m_bWindowed = !m_bWindowed;

            if( FAILED( CreateDirectDraw() ) )
            {
				FreeDeviceObject();                
                MessageBox( hWnd, _T("CreateDirectDraw() failed."),
					m_lpszWindowTitle, MB_ICONERROR | MB_OK );
                PostMessage( hWnd, WM_CLOSE, 0, 0 );
            }
	        m_dwLastTick = timeGetTime();
	        return 0L;
        case IDM_EXIT:
            // Received key/menu command to exit app
            PostMessage( hWnd, WM_CLOSE, 0, 0 );
            return 0L;
	    }
        break; // Continue with default processing
    case WM_GETMINMAXINFO:
		if(m_bActive)
        {
            // Don't allow resizing in windowed mode.  
            // Fix the size of the window to 640x480 (client size)
            MINMAXINFO* pMinMax = (MINMAXINFO*) lParam;
            pMinMax->ptMinTrackSize.x = RECTWIDTH(m_rcWindowRect);
            pMinMax->ptMinTrackSize.y = RECTHEIGHT(m_rcWindowRect);
            pMinMax->ptMaxTrackSize.x = pMinMax->ptMinTrackSize.x;
            pMinMax->ptMaxTrackSize.y = pMinMax->ptMinTrackSize.y;
        }
        return 0L;
	case WM_PAINT:
		if( m_pDisplay && m_bActive )
		{
			if( m_bWindowed )
				m_pDisplay->Present();
		}
		break;
	case WM_MOVE:
        // Retrieve the window position after a move.
		if(m_pDisplay)
			m_pDisplay->UpdateBounds();
		return 0L;
	case WM_SIZE:
		// Check to see if we are losing our window...
		if( SIZE_MAXHIDE==wParam || SIZE_MINIMIZED==wParam )
			m_bActive = FALSE;
		else
			m_bActive = TRUE;
		if( m_pDisplay )
			m_pDisplay->UpdateBounds();
		break;
    case WM_SETCURSOR:
        // Hide the cursor if in fullscreen 
        if( !m_bWindowed )
        {
            SetCursor( NULL );
            return TRUE;
        }
        break; // Continue with default processing
    case WM_QUERYNEWPALETTE:
        if( m_pDisplay && m_pDisplay->GetFrontBuffer() )            
        {
            // If we are in windowed mode with a desktop resolution in 8 bit 
            // color, then the palette we created during init has changed 
            // since then.  So get the palette back from the primary 
            // DirectDraw surface, and set it again so that DirectDraw 
            // realises the palette, then release it again. 
            LPDIRECTDRAWPALETTE pDDPal = NULL; 
            m_pDisplay->GetFrontBuffer()->GetPalette( &pDDPal );
            m_pDisplay->GetFrontBuffer()->SetPalette( pDDPal );
            SAFE_RELEASE( pDDPal );
        }
        break;

    case WM_EXITMENULOOP:
        // Ignore time spent in menu
        m_dwLastTick = timeGetTime();
        break;
    case WM_EXITSIZEMOVE:
        // Ignore time spent resizing
        m_dwLastTick = timeGetTime();
        break;
    case WM_SYSCOMMAND:
        // Prevent moving/sizing and power loss in fullscreen mode
        switch( wParam )
        {
            case SC_MOVE:
            case SC_SIZE:
            case SC_MAXIMIZE:
            case SC_MONITORPOWER:
                if( !m_bWindowed )
                    return TRUE;
        }
        break;
    case WM_ACTIVATE:
        if( WA_INACTIVE != wParam && m_pKeyboard )
        {
            // Make sure the device is acquired, if we are gaining focus.
            m_pKeyboard->Acquire();
        }
        break;
    case WM_TIMER:
		OnTimer(wParam);
        break;
    case WM_DESTROY:
        // Cleanup and close the app
        PostQuitMessage( 0 );
        return 0L;
	}
	return DefWindowProc(hWnd,msg,wParam,lParam);
}

HRESULT CFootballApp::ReadImmediateData(HWND hWnd)
{
    HRESULT hr;
    BYTE    diks[256];

    if( NULL == m_pKeyboard ) 
        return S_OK;
  
    ZeroMemory(&diks, sizeof(diks));
    hr = m_pKeyboard->GetDeviceState( sizeof(diks), &diks );
    if( FAILED(hr) ) 
    {
        hr = m_pKeyboard->Acquire();
        while( hr == DIERR_INPUTLOST ) 
            hr = m_pKeyboard->Acquire();

        return S_OK; 
    }
	
	m_pMatch->DoKey(diks);
    return S_OK;
}

HRESULT CFootballApp::DisplayFrame()
{
    HRESULT hr;

    // Fill the back buffer with black, ignoring errors until the flip
    //m_pDisplay->Clear( 0 );
	m_pMatch->Draw(m_pClipSurface, m_ptBorder);
    m_pDisplay->Blt(0,0, m_pClipSurface, &m_rcClipSurface );

    // Flip or blt the back buffer onto the primary buffer
    if( FAILED( hr = m_pDisplay->Present() ) )
        return hr;

    return S_OK;
}

void CFootballApp::OnTimer(UINT nIDEvent)
{
	if( FAILED( ReadImmediateData( m_hWnd ) ) )
	{
		KillTimer( m_hWnd, 0 );    
		MessageBox( NULL, _T("Error reading input state. "),
						m_lpszWindowTitle, MB_ICONERROR | MB_OK );
		PostMessage(m_hWnd,WM_CLOSE,0,0);
	}
}

void CFootballApp::PlayKickSound()
{
	DSUtil_PlaySound(m_pKickSound, 0);
}

void CFootballApp::PlayWhitleSound()
{
	DSUtil_PlaySound(m_pWhistleSound, 0);
}

void CFootballApp::PlayGoalSound()
{
	DSUtil_PlaySound(m_pGoalSound, 0);
}


BOOL CALLBACK DlgProc(HWND hWnd, UINT message, WPARAM, LPARAM)
{
	if (message == WM_INITDIALOG)
	{
		return TRUE;
	}
	return FALSE;
}

BOOL CFootballApp::GameLoadOption()
{
	DWORD Version;
	CFile file;
	if(file.Open(CONFIG_FILE,CFile::modeRead))
	{
		file.Read(&Version				,sizeof(Version));
		if(Version != CONFIG_VERSION) 
		{
			MessageBox(m_hWnd,"Error Reading Config File!!!\nUse Default Config.",
				"Load Game Config",MB_ICONEXCLAMATION|MB_OK);
			return FALSE;
		}
		file.Read(&m_PlayerAType		,sizeof(m_PlayerAType));
		file.Read(&m_PlayerBType		,sizeof(m_PlayerBType));
		file.Read(&m_TrainAtStart		,sizeof(m_TrainAtStart));

		file.Read(&m_DataFilename		,sizeof(m_DataFilename));
		file.Read(&m_NeuralFilename		,sizeof(m_NeuralFilename));
		file.Read(&m_MaxPatterns		,sizeof(m_MaxPatterns));

		file.Read(&m_LearningRate		,sizeof(m_LearningRate));
		file.Read(&m_ErrorTolerance		,sizeof(m_ErrorTolerance));
		file.Read(&m_MomentumConst		,sizeof(m_MomentumConst));
		file.Read(&m_NoiseFactor		,sizeof(m_NoiseFactor));
		file.Read(&m_MaxCycles			,sizeof(m_MaxCycles));
		file.Read(&m_UnlimitsCycles		,sizeof(m_UnlimitsCycles));

		file.Close();
		return TRUE;
	}
	return FALSE;
}

BOOL CFootballApp::GameSaveOption()
{
	DWORD Version = CONFIG_VERSION;
	CFile file;
	if(file.Open(CONFIG_FILE,CFile::modeCreate | CFile::modeWrite))
	{
		file.Write(&Version				,sizeof(Version));
		file.Write(&m_PlayerAType		,sizeof(m_PlayerAType));
		file.Write(&m_PlayerBType		,sizeof(m_PlayerBType));
		file.Write(&m_TrainAtStart		,sizeof(m_TrainAtStart));

		file.Write(&m_DataFilename		,sizeof(m_DataFilename));
		file.Write(&m_NeuralFilename	,sizeof(m_NeuralFilename));
		file.Write(&m_MaxPatterns		,sizeof(m_MaxPatterns));

		file.Write(&m_LearningRate		,sizeof(m_LearningRate));
		file.Write(&m_ErrorTolerance	,sizeof(m_ErrorTolerance));
		file.Write(&m_MomentumConst		,sizeof(m_MomentumConst));
		file.Write(&m_NoiseFactor		,sizeof(m_NoiseFactor));
		file.Write(&m_MaxCycles			,sizeof(m_MaxCycles));
		file.Write(&m_UnlimitsCycles	,sizeof(m_UnlimitsCycles));

		file.Close();
		return TRUE;
	}
	return FALSE;
}

//DEL void CFootballApp::TrainData()
//DEL {
//DEL 	CNetwork  m_Network;
//DEL 	PCArrayOfKickData		KickList	= new CArrayOfKickData();
//DEL 	PCArrayOfTrainData	TrainList	= new CArrayOfTrainData();
//DEL 	CTrainData*			TrainData;
//DEL 
//DEL 	HWND TrainDlg = CreateDialog(m_hInstance,MAKEINTRESOURCE(IDD_TRAINING_DIALOG),m_hWnd,NULL);
//DEL 	ShowWindow(TrainDlg,SW_SHOW);
//DEL 	HWND ProgressWnd = GetDlgItem(TrainDlg,IDC_TRAINING_PROGRESS);
//DEL 	SendMessage(ProgressWnd,PBM_SETRANGE32,0,m_MaxCycles);
//DEL 	HWND ErrorWnd	= GetDlgItem(TrainDlg,IDC_TRAINING_SUMSQUAREERROR);
//DEL 	SendMessage(ErrorWnd,PBM_SETRANGE32,0,1000);
//DEL 
//DEL 	m_Network.SetLayers(3);
//DEL 	m_Network.SetLayerNo(0,2*NUMBER_OF_PLAYERS*2+1);
//DEL 	m_Network.SetLayerNo(1,2*NUMBER_OF_PLAYERS*2+2);
//DEL 	m_Network.SetLayerNo(2,1);
//DEL 
//DEL 	double Input[2*NUMBER_OF_PLAYERS*2+1];
//DEL 	double Output[1];
//DEL 
//DEL 	//m_pMatch->GetScore()->LoadKickData(m_PassDataFilename,KickList);
//DEL 	CFootballTeamLearning::PreTraining(TrainList,KickList);
//DEL 
//DEL 	for(int Pos=0;Pos<TrainList->GetSize();Pos++)
//DEL 	{
//DEL 		TrainData = TrainList->GetAt(Pos);
//DEL 		for(int j=0;j<2;j++)
//DEL 			for(int i=0;i<NUMBER_OF_PLAYERS;i++)
//DEL 			{
//DEL 				Input[j*10+i*2+0] = TrainData->Loc[j][i][0]/GROUND_HEIGHT;
//DEL 				Input[j*10+i*2+1] = TrainData->Loc[j][i][1]/GROUND_WIDTH;
//DEL 			}
//DEL 		Input[2*NUMBER_OF_PLAYERS*2] = (double)TrainData->ShootDir/7;
//DEL 		Output[0] = TrainData->Result;
//DEL 		m_Network.SetPattern(Input,Output);
//DEL 	}
//DEL 
//DEL 	DWORD		TotalCycles		= 0;
//DEL 	DWORD		NumberPattern	= m_Network.GetNumberPatts();
//DEL 	DWORD		StepProgress	= m_MaxCycles/100+1;
//DEL 	double		NewNF			= m_NoiseFactor;
//DEL 	double		SumSquareError	= m_ErrorTolerance+1;
//DEL 	double		OSumSquareError = SumSquareError;
//DEL 	double		Error;
//DEL 	TCHAR		StatusStr[255];
//DEL 
//DEL 	m_Network.SetupNetwork();
//DEL 	m_Network.RandomizeWeights();
//DEL 	m_Network.SetNF(NewNF);
//DEL 	
//DEL 	TRACE("Trains %5d Patterns\n",NumberPattern);
//DEL 
//DEL 	CNetwork::m_TrainError = false;
//DEL 	while(TotalCycles<m_MaxCycles && !CNetwork::m_TrainError && m_ErrorTolerance<SumSquareError)
//DEL 	{
//DEL 		SumSquareError = 0;
//DEL 	
//DEL 		m_Network.UpdateMomentum();
//DEL 		for(DWORD i=0;i<NumberPattern;i++)
//DEL 		{
//DEL 			m_Network.SetupPattern(i);
//DEL 			m_Network.ForwardProp();
//DEL 			m_Network.BackwardProp(Error);
//DEL 			SumSquareError += Error*Error;
//DEL 			m_Network.UpdateWeights(m_LearningRate,m_MomentumConst);
//DEL 		}
//DEL 
//DEL 		if(TotalCycles%StepProgress == 0)
//DEL 		{
//DEL 			SendMessage(ProgressWnd,	PBM_SETPOS, TotalCycles, 0L);
//DEL 			SendMessage(ErrorWnd,		PBM_SETPOS,	SumSquareError*10, 0L);
//DEL 			TRACE("Cycles : %5d Sum Square Error : %0.4f  Learning Rate : %0.4f\n",TotalCycles,SumSquareError,m_LearningRate);
//DEL 			SetDlgItemText(TrainDlg,IDC_TRAING_DATA,StatusStr);
//DEL 		}
//DEL 
//DEL 		TotalCycles++;
//DEL //		if(SumSquareError/OSumSquareError > 1.04) 
//DEL //		{
//DEL //			TRACE("New Randomize\n");
//DEL //			m_LearningRate *= 0.7;
//DEL //			m_Network.RandomizeWeights();
//DEL //		} else if(SumSquareError<OSumSquareError)
//DEL //		{
//DEL //			m_LearningRate *= 1.05;
//DEL //		}
//DEL 
//DEL 		if(TotalCycles>0.7*m_MaxCycles)
//DEL 			NewNF = 0;
//DEL 		else if(TotalCycles>0.5*m_MaxCycles)
//DEL 			NewNF = 0.25*m_NoiseFactor;
//DEL 		else if(TotalCycles>0.3*m_MaxCycles)
//DEL 			NewNF = 0.50*m_NoiseFactor;
//DEL 		else if(TotalCycles>0.1*m_MaxCycles)
//DEL 			NewNF = 0.75*m_NoiseFactor;
//DEL 		m_Network.SetNF(NewNF);
//DEL 	}
//DEL //	fprintf(file,"End of file\n");
//DEL 	if(m_ErrorTolerance<SumSquareError) 
//DEL 	{
//DEL 		SetDlgItemText(TrainDlg,IDC_TRAING_DATA,"Saving Data");
//DEL 		m_Network.SaveNetwork(m_NeuralFilename);
//DEL 	}
//DEL //	fclose(file);
//DEL 
//DEL 	for(int i=0;i<TrainList->GetSize();i++)
//DEL 		delete TrainList->GetAt(i);
//DEL 	SAFE_DELETE(TrainList);
//DEL 	for(i=0;i<KickList->GetSize();i++)
//DEL 		delete KickList->GetAt(i);
//DEL 	SAFE_DELETE(KickList);
//DEL 	
//DEL 	ShowWindow(TrainDlg,SW_HIDE);
//DEL 	DestroyWindow(TrainDlg);
//DEL }

//DEL LRESULT CALLBACK CFootballApp::LearningStatisDlgProc( HWND hDlg, UINT msg, WPARAM wParam, LPARAM lParam )
//DEL {
//DEL     switch (msg)
//DEL     {
//DEL         case WM_INITDIALOG:
//DEL 			if(g_App->GetMatch())
//DEL 			{
//DEL 				TCHAR str[100];
//DEL 				CFootballMatch* Match = g_App->GetMatch();
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER1_NAME,Match->GetTeamNo(TEAM1)->GetTeamName());
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER2_NAME,Match->GetTeamNo(TEAM2)->GetTeamName());
//DEL 				sprintf(str,"%0.2f",Match->GetScore()->GetProsRatio(TEAM1));
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER1_POSS,str);
//DEL 				sprintf(str,"%0.2f",Match->GetScore()->GetProsRatio(TEAM2));
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER2_POSS,str);
//DEL 				sprintf(str,"%0.2f",Match->GetScore()->GetPassRatio(TEAM1));
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER1_PASS,str);
//DEL 				sprintf(str,"%0.2f",Match->GetScore()->GetPassRatio(TEAM2));
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER1_PASS,str);
//DEL //				PCArrayOfKickStruct SourceList = new CArrayOfKickStruct();
//DEL 				//Match->GetScore()->LoadKickData(g_App->m_PassDataFilename,SourceList);
//DEL //				PCArrayOfKickStruct DestList   = 
//DEL //					((CFootballTeamLearning*)Match->GetTeamNo(TEAM2))->GetAllKick();
//DEL //				sprintf(str,"%d",SourceList->GetSize());
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER1_PATT,str);
//DEL //				sprintf(str,"%d",DestList->GetSize());
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER2_PATT,str);
//DEL 				int Diff = 0,PassSuccess = 0;
//DEL //				for(int i=0;i<SourceList->GetSize();i++)
//DEL //					for(int j=0;j<DestList->GetSize();j++)
//DEL //					{
//DEL //						if(!CFootballTeamLearning::SameData(SourceList->GetAt(i),DestList->GetAt(j)))
//DEL //						{
//DEL //							Diff++;
//DEL //							if(DestList->GetAt(j)->Result == 1)
//DEL //								PassSuccess++;
//DEL //						}
//DEL //					}
//DEL //				sprintf(str,"%d(%d)",Diff,(double)PassSuccess/Diff);
//DEL 				SetDlgItemText(hDlg,IDC_PLAYER2_SUCC,str);
//DEL 	        }
//DEL             return TRUE;
//DEL 
//DEL         case WM_COMMAND:
//DEL             switch( LOWORD(wParam) )
//DEL             {
//DEL                 case IDOK:
//DEL                 case IDCANCEL:
//DEL                     EndDialog( hDlg, TRUE );
//DEL                     return TRUE;
//DEL             }
//DEL             break;
//DEL     }
//DEL     return FALSE;
//DEL }

//-----------------------------------------------------------------------------
// Name: MenuNewGame()
//-----------------------------------------------------------------------------
void CFootballApp::MenuNewGame()
{
	m_pMatch->ReleaseSurface();
	SAFE_DELETE(m_pMatch);
	m_pMatch = new CFootballMatch(this);
	m_pMatch->CreateSurface(m_pDisplay);
	if(m_TrainAtStart && 
		(m_PlayerAType == MODE_LEARNING || 
		 m_PlayerBType == MODE_LEARNING ))
	{
		DialogBox(m_hInstance,(LPCTSTR)IDD_PROCESS_DIALOG,
			m_hWnd,(DLGPROC)MenuTrainProcessDlgProc);
	}

	switch(m_PlayerAType)
	{
	case MODE_HUMAN:
		m_pMatch->SetTeam(TEAM1,new CFootballTeamControl("Human",new CFootballTactic("Resource\\Tactic1.tac")));
		m_pMatch->SetControlTeam(TEAM1);
		break;
	case MODE_COMPUTER:
		m_pMatch->SetTeam(TEAM1,new CFootballTeamComputer("Computer1",new CFootballTactic("Resource\\Tactic1.tac")));
		break;
	case MODE_LEARNING:
		m_pMatch->SetTeam(TEAM1,new CFootballTeamLearning("Learning1",new CFootballTactic("Resource\\Tactic1.tac")));
		((CFootballTeamLearning*)m_pMatch->GetTeamNo(TEAM1))->LoadData(NEURAL_FILE);
		break;
	}
	switch(m_PlayerBType)
	{
	case MODE_HUMAN:
		m_pMatch->SetTeam(TEAM2,new CFootballTeamControl("Human",new CFootballTactic("Resource\\Tactic1.tac")));
		m_pMatch->SetControlTeam(TEAM2);
		break;
	case MODE_COMPUTER:
		m_pMatch->SetTeam(TEAM2,new CFootballTeamComputer("Computer2",new CFootballTactic("Resource\\Tactic1.tac")));
		break;
	case MODE_LEARNING:
		m_pMatch->SetTeam(TEAM2,new CFootballTeamLearning("Learning2",new CFootballTactic("Resource\\Tactic1.tac")));
		((CFootballTeamLearning*)m_pMatch->GetTeamNo(TEAM2))->LoadData(NEURAL_FILE);
		break;
	}
	m_pMatch->SetDefendSide(rand()%2);
	m_pMatch->SetMatchState(/*MS_CHANGINGROOM*/MS_FIRST_HALF);
}

TCHAR CFootballApp::strFileName[MAX_PATH] = "";
TCHAR CFootballApp::strPath[MAX_PATH] = "";
//-----------------------------------------------------------------------------
// Name: MenuLoadGame()
//-----------------------------------------------------------------------------
void CFootballApp::MenuLoadGame(HWND hWnd,CFootballMatch* Match)
{
    // Setup the OPENFILENAME structure
    OPENFILENAME ofn = { sizeof(OPENFILENAME), hWnd, NULL,
                         TEXT("Football Save Files\0*.sav\0All Files\0*.*\0\0"), NULL,
                         0, 1, strFileName, MAX_PATH, NULL, 0, strPath,
                         TEXT("Load Game"),
                         OFN_FILEMUSTEXIST|OFN_HIDEREADONLY, 0, 0,
                         TEXT(".sav"), 0, NULL, NULL };

    if(! GetOpenFileName( &ofn ) )
        return;
    
	CFile file(strFileName,CFile::modeRead);
	CArchive ar(&file,CArchive::load);
	Match->Serialize(ar);
	ar.Close();
	file.Close();

    // Remember the path for next time
    strcpy( strPath, strFileName );
    char* strLastSlash = strrchr( strPath, '\\' );
    strLastSlash[0] = '\0';
}

//-----------------------------------------------------------------------------
// Name: MenuSaveGame()
//-----------------------------------------------------------------------------
void CFootballApp::MenuSaveGame(HWND hWnd,CFootballMatch* Match)
{
    // Setup the OPENFILENAME structure
    OPENFILENAME ofn = { sizeof(OPENFILENAME), hWnd, NULL,
                         TEXT("Football Save Files\0*.sav\0All Files\0*.*\0\0"), NULL,
                         0, 1, strFileName, MAX_PATH, NULL, 0, strPath,
                         TEXT("Save Game"),
                         OFN_HIDEREADONLY, 0, 0,
                         TEXT(".sav"), 0, NULL, NULL };

    if(! GetSaveFileName( &ofn ) )
        return;
    
	CFile file(strFileName,CFile::modeReadWrite | CFile::modeCreate);
	CArchive ar(&file,CArchive::store);
	Match->Serialize(ar);
	ar.Close();
	file.Close();

#ifdef _DEBUG
	CFootballMatch* MatchDebug = new CFootballMatch();
	CFile File(strFileName,CFile::modeRead);
	CArchive Ar(&File,CArchive::load);
	MatchDebug->SetTeam(TEAM1,new CFootballTeamComputer("Computer1",new CFootballTactic("Resource\\Tactic1.tac")));
	MatchDebug->SetTeam(TEAM2,new CFootballTeamComputer("Computer1",new CFootballTactic("Resource\\Tactic1.tac")));
	MatchDebug->Serialize(Ar);
	Ar.Close();
	File.Close();

	ASSERT(Match->GetBall()->GetLocation() == MatchDebug->GetBall()->GetLocation());
	ASSERT(Match->GetBall()->GetDirection() == MatchDebug->GetBall()->GetDirection());
	ASSERT(Match->GetBall()->GetHeight() == MatchDebug->GetBall()->GetHeight());
	ASSERT(Match->GetScore()->GetScore(TEAM1) == MatchDebug->GetScore()->GetScore(TEAM1));
	ASSERT(Match->GetScore()->GetScore(TEAM2) == MatchDebug->GetScore()->GetScore(TEAM2));
	ASSERT(Match->GetScore()->GetTime() == MatchDebug->GetScore()->GetTime());
	delete MatchDebug;
#endif 

    // Remember the path for next time
    strcpy( strPath, strFileName );
    char* strLastSlash = strrchr( strPath, '\\' );
    strLastSlash[0] = '\0';
}

DWORD CFootballApp::m_PlayerAType = 0;
DWORD CFootballApp::m_PlayerBType = 1;
BOOL CFootballApp::m_TrainAtStart = TRUE;

LRESULT CALLBACK CFootballApp::MenuGameOptionDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam)
{
	char szList[][20] = {"Human","Computer","Learning"};
    switch (msg)
    {
        case WM_INITDIALOG:
            {
				for(int i=0;i<3;i++)
				{
					SendDlgItemMessage(hDlg,IDC_TYPE_A,LB_ADDSTRING,0,(LPARAM)szList[i]);
					SendDlgItemMessage(hDlg,IDC_TYPE_B,LB_ADDSTRING,0,(LPARAM)szList[i]);
				}
				SendDlgItemMessage(hDlg,IDC_TYPE_A,LB_SETCURSEL,m_PlayerAType,0);
				SendDlgItemMessage(hDlg,IDC_TYPE_B,LB_SETCURSEL,m_PlayerBType,0);
				CheckDlgButton(hDlg,IDC_TRAINATSTART,m_TrainAtStart);
            }
            return TRUE;

        case WM_COMMAND:
            switch( LOWORD(wParam) )
            {
                case IDOK:
					m_PlayerAType = SendDlgItemMessage(hDlg,IDC_TYPE_A,LB_GETCURSEL,0,0);
					m_PlayerBType = SendDlgItemMessage(hDlg,IDC_TYPE_B,LB_GETCURSEL,0,0);
					if(m_PlayerAType == 0 && m_PlayerBType == 0)
					{
						MessageBox(hDlg,"Error Cannot Play 2 Human.\n Change Player B to Computer.",
							"Game Option Error",MB_OK);
						m_PlayerBType = 0;
					}
					m_TrainAtStart = IsDlgButtonChecked(hDlg,IDC_TRAINATSTART);
                    EndDialog( hDlg, TRUE );
                    return TRUE;
                case IDCANCEL:
                    EndDialog( hDlg, TRUE );
                    return TRUE;
            }
            break;
    }
    return FALSE;
}

CNetwork	CFootballApp::m_Network;
//-----------------------------------------------------------------------------
// Name: MenuLoadNeural()
//-----------------------------------------------------------------------------
void CFootballApp::MenuLoadNeural(HWND hWnd)
{
    // Setup the OPENFILENAME structure
    OPENFILENAME ofn = { sizeof(OPENFILENAME), hWnd, NULL,
                         TEXT("Neural m_Network Files\0*.neu\0All Files\0*.*\0\0"), NULL,
                         0, 1, strFileName, MAX_PATH, NULL, 0, strPath,
                         TEXT("Load m_Network"),
                         OFN_FILEMUSTEXIST|OFN_HIDEREADONLY, 0, 0,
                         TEXT(".neu"), 0, NULL, NULL };

    if(! GetOpenFileName( &ofn ) )
        return;
    
	m_Network.LoadNetwork(strFileName);

    // Remember the path for next time
    strcpy( strPath, strFileName );
    char* strLastSlash = strrchr( strPath, '\\' );
    strLastSlash[0] = '\0';
}

//-----------------------------------------------------------------------------
// Name: MenuSaveNeural()
//-----------------------------------------------------------------------------
void CFootballApp::MenuSaveNeural(HWND hWnd)
{
	    // Setup the OPENFILENAME structure
    OPENFILENAME ofn = { sizeof(OPENFILENAME), hWnd, NULL,
                         TEXT("Neural m_Network Files\0*.neu\0All Files\0*.*\0\0"), NULL,
                         0, 1, strFileName, MAX_PATH, NULL, 0, strPath,
                         TEXT("Save m_Network"),
                         OFN_HIDEREADONLY, 0, 0,
                         TEXT(".neu"), 0, NULL, NULL };

    if(! GetSaveFileName( &ofn ) )
        return;
    
	m_Network.SaveNetwork(strFileName);

    // Remember the path for next time
    strcpy( strPath, strFileName );
    char* strLastSlash = strrchr( strPath, '\\' );
    strLastSlash[0] = '\0';
}

TCHAR	CFootballApp::m_DataFilename[_MAX_PATH] = DATA_FILE;
TCHAR	CFootballApp::m_NeuralFilename[_MAX_PATH] = NEURAL_FILE;
DWORD	CFootballApp::m_MaxPatterns = 100;

LRESULT CALLBACK CFootballApp::MenuTrainNeuralDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam)
{
    switch (msg)
    {
        case WM_INITDIALOG:
            {
				TCHAR str[100] = "";
				SetDlgItemText(hDlg,IDC_DATA_FILE,m_DataFilename);
				SetDlgItemText(hDlg,IDC_NEURAL_FILE,m_NeuralFilename);
				sprintf(str,"%d",m_MaxPatterns);	SetDlgItemText(hDlg,IDC_TRAINPATTERN,str);
            }
            return TRUE;
        case WM_COMMAND:
            switch( LOWORD(wParam) )
            {
                case IDOK:
					TCHAR str[100];
					GetDlgItemText(hDlg,IDC_DATA_FILE,m_DataFilename,_MAX_PATH);
					GetDlgItemText(hDlg,IDC_NEURAL_FILE,m_NeuralFilename,_MAX_PATH);
					GetDlgItemText(hDlg,IDC_TRAINPATTERN,str,100);
					sscanf(str,"%d",&m_MaxPatterns);
                    EndDialog( hDlg, IDOK );
                    return TRUE;
                case IDCANCEL:
                    EndDialog( hDlg, IDCANCEL );
                    return TRUE;
				case IDC_DATA_BROWSE:
					{
						OPENFILENAME ofn = { sizeof(OPENFILENAME), hDlg, NULL,
											 TEXT("Data Files\0*.dat\0All Files\0*.*\0\0"), NULL,
											 0, 1, strFileName, MAX_PATH, NULL, 0, strPath,
											 TEXT("Load Data"),
											 OFN_FILEMUSTEXIST|OFN_HIDEREADONLY, 0, 0,
											 TEXT(".dat"), 0, NULL, NULL };
						if(! GetOpenFileName( &ofn ) )	return TRUE;    
						SetDlgItemText(hDlg,IDC_DATA_FILE,strFileName);
					}
					return TRUE;
				case IDC_NEURAL_BROWSE:
					{
						OPENFILENAME ofn = { sizeof(OPENFILENAME), hDlg, NULL,
											 TEXT("Neural m_Network Files\0*.neu\0All Files\0*.*\0\0"), NULL,
											 0, 1, strFileName, MAX_PATH, NULL, 0, strPath,
											 TEXT("Save m_Network"),
											 OFN_HIDEREADONLY, 0, 0,
											 TEXT(".neu"), 0, NULL, NULL };
						if(! GetSaveFileName( &ofn ) )	return TRUE;    
						SetDlgItemText(hDlg,IDC_NEURAL_FILE,strFileName);
					}
					return TRUE;
            }
            break;
    }
    return FALSE;
}

DOUBLE	CFootballApp::m_LearningRate	= 0.25;
DOUBLE	CFootballApp::m_MomentumConst	= 0.0;
DOUBLE	CFootballApp::m_NoiseFactor		= 0.0;
DOUBLE	CFootballApp::m_ErrorTolerance	= 0.01;
DWORD	CFootballApp::m_MaxCycles		= 200;
BOOL	CFootballApp::m_UnlimitsCycles	= TRUE;

LRESULT CALLBACK CFootballApp::MenuTrainOptionDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam)
{
    switch (msg)
    {
        case WM_INITDIALOG:
            {
				TCHAR str[100];
				sprintf(str,"%f",m_LearningRate);	SetDlgItemText(hDlg,IDC_LEARNINGRATE,str);
				sprintf(str,"%f",m_MomentumConst);	SetDlgItemText(hDlg,IDC_MOMENTUMCONST,str);
				sprintf(str,"%f",m_NoiseFactor);	SetDlgItemText(hDlg,IDC_NOISEFACTOR,str);
				sprintf(str,"%f",m_ErrorTolerance);	SetDlgItemText(hDlg,IDC_ERRORTOLERANCE,str);
				sprintf(str,"%d",m_MaxCycles);		SetDlgItemText(hDlg,IDC_MAXCYCLES,str);
				CheckDlgButton(hDlg,IDC_AUTOADDNODE,m_UnlimitsCycles);
            }
            return TRUE;

        case WM_COMMAND:
            switch( LOWORD(wParam) )
            {
                case IDOK:
					FLOAT fp;
					TCHAR str[100];
					GetDlgItemText(hDlg,IDC_LEARNINGRATE,str,100);
					sscanf(str,"%f",&fp);	m_LearningRate = fp;
					GetDlgItemText(hDlg,IDC_MOMENTUMCONST,str,100);
					sscanf(str,"%f",&fp);	m_MomentumConst = fp;
					GetDlgItemText(hDlg,IDC_NOISEFACTOR,str,100);
					sscanf(str,"%f",&fp);	m_NoiseFactor = fp;
					GetDlgItemText(hDlg,IDC_ERRORTOLERANCE,str,100);
					sscanf(str,"%f",&fp);	m_ErrorTolerance = fp;
					GetDlgItemText(hDlg,IDC_MAXCYCLES,str,100);
					sscanf(str,"%d",&m_MaxCycles);
					m_UnlimitsCycles = IsDlgButtonChecked(hDlg,IDC_AUTOADDNODE);
                    EndDialog( hDlg, TRUE );
                    return TRUE;
                case IDCANCEL:
                    EndDialog( hDlg, TRUE );
                    return TRUE;
            }
            break;
    }
    return FALSE;
}

PCArrayOfKickData		KickList;
PCArrayOfTrainData		TrainList;

LRESULT CALLBACK CFootballApp::MenuTrainProcessDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam)
{
	static HANDLE Thread;
	switch (msg)
    {
        case WM_INITDIALOG:
			Thread = CreateThread(NULL,0,MenuTrainProcessThreadProc,hDlg,0,NULL);
            return TRUE;

        case WM_COMMAND:
			{				
				int i;
            switch( LOWORD(wParam) )
            {
				case IDOK:
					for(i=0;i<TrainList->GetSize();i++)
						delete TrainList->GetAt(i);
					for(i=0;i<KickList->GetSize();i++)
						delete KickList->GetAt(i);
					SAFE_DELETE(KickList);
					SAFE_DELETE(TrainList);
					m_Network.ClearPattern();
					TerminateThread(Thread,0);
					EndDialog(hDlg, TRUE );
                    return TRUE;
                case IDCANCEL:
					for(i=0;i<TrainList->GetSize();i++)
						delete TrainList->GetAt(i);
					for(i=0;i<KickList->GetSize();i++)
						delete KickList->GetAt(i);
					SAFE_DELETE(KickList);
					SAFE_DELETE(TrainList);
					m_Network.ClearPattern();
					TerminateThread(Thread,0);
                    EndDialog( hDlg, FALSE );
                    return TRUE;
            }
			}
            break;
    }
    return FALSE;
}

DWORD WINAPI CFootballApp::MenuTrainProcessThreadProc(LPVOID lpParameter)
{
	HWND hDlg = (HWND)lpParameter;
	HWND ProgressWnd = GetDlgItem(hDlg,IDC_TRAINING_PROGRESS);
	SendMessage(ProgressWnd,PBM_SETRANGE32,0,m_MaxCycles);
	HWND ErrorWnd	= GetDlgItem(hDlg,IDC_TRAINING_SUMSQUAREERROR);
	SendMessage(ErrorWnd,PBM_SETRANGE32,0,1000);

	CTrainData*		TrainData;
	KickList		= new CArrayOfKickData();
	TrainList		= new CArrayOfTrainData();

	DWORD		TotalCycles		= 0;
	DWORD		StepProgress	= m_MaxCycles/100+1;
	double		LearningRate	= m_LearningRate;
	double		NewNF			= m_NoiseFactor;
	double		SumSquareError	= m_ErrorTolerance+1;
	double		OSumSquareError = SumSquareError;
	double		Error;
	TCHAR		StatusStr[255];

	m_Network.SetLayers(3);
	m_Network.SetLayerNo(0,2*NUMBER_OF_PLAYERS/**2*/+1);
	m_Network.SetLayerNo(1,2*NUMBER_OF_PLAYERS/**2*/+2);
	m_Network.SetLayerNo(2,1);

	m_Network.SetupNetwork();
	m_Network.RandomizeWeights();
	m_Network.SetNF(NewNF);
	

	double Input[2*NUMBER_OF_PLAYERS/**2*/+1];
	double Output[1];

	CFootballScore::LoadKickData(m_DataFilename,KickList);
	CFootballTeamLearning::PreTraining(TrainList,KickList);

	for(int Pos=0;Pos<TrainList->GetSize();Pos++)
	{
		TrainData = TrainList->GetAt(Pos);
		for(int j=0;j<2;j++)
			for(int i=0;i<NUMBER_OF_PLAYERS;i++)
			{
//				Input[j*10+i*2+0] = TRUNCATE(TrainData->Loc[j][i][0]/GROUND_HEIGHT*100)*1.0/100;
//				Input[j*10+i*2+1] = TRUNCATE(TrainData->Loc[j][i][1]/GROUND_WIDTH*100)*1.0/100;
				Input[j*NUMBER_OF_PLAYERS+i] = TrainData->ZoneLoc[j][i]*1.0/(ZONE_COL*ZONE_ROW);
			}
		Input[2*NUMBER_OF_PLAYERS/**2*/] = TrainData->ShootDir*1.0/7;
		Output[0] = TrainData->Result;
		m_Network.SetPattern(Input,Output);
	}

	DWORD		NumberPattern	= m_Network.GetNumberPatts();
	TRACE("Trains %5d Patterns\n",NumberPattern);

	CNetwork::m_TrainError = false;
	while((m_UnlimitsCycles || TotalCycles<m_MaxCycles) && !CNetwork::m_TrainError && m_ErrorTolerance<SumSquareError)
	{
		SumSquareError = 0;
	
		m_Network.UpdateMomentum();
		for(DWORD i=0;i<NumberPattern;i++)
		{
			m_Network.SetupPattern(i);
			m_Network.ForwardProp();
			m_Network.BackwardProp(Error);
			SumSquareError += Error*Error;
			m_Network.UpdateWeights(LearningRate,m_MomentumConst);
		}
		
		if(TotalCycles%StepProgress == 0)
		{
			SendMessage(ProgressWnd,	PBM_SETPOS, TotalCycles, 0L);
			SendMessage(ErrorWnd,		PBM_SETPOS,	SumSquareError*10, 0L);
		}

		if(TotalCycles%10 == 0)
		{
			sprintf(StatusStr,"Cycles : %5d Sum Square Error : %0.4f  Learning Rate : %0.4f\n",TotalCycles,SumSquareError,LearningRate);
			TRACE("%s",StatusStr);
			SetDlgItemText(hDlg,IDC_STATUS,StatusStr);
		}

		if(SumSquareError/OSumSquareError > 1.4) 
		{
			LearningRate *= 0.7;
			m_Network.RandomizeWeights();
		} else 
		if(SumSquareError/OSumSquareError < 0.9)
		{
			LearningRate *= 1.05;
		}
		OSumSquareError = SumSquareError;

		TotalCycles++;
		if(TotalCycles>0.6*m_MaxCycles)
			NewNF = 0;
		else if(TotalCycles>0.4*m_MaxCycles)
			NewNF = 0.25*m_NoiseFactor;
		else if(TotalCycles>0.2*m_MaxCycles)
			NewNF = 0.50*m_NoiseFactor;
		else if(TotalCycles>0.1*m_MaxCycles)
			NewNF = 0.75*m_NoiseFactor;
		m_Network.SetNF(NewNF);
	}

	if(m_ErrorTolerance<SumSquareError) 
		m_Network.SaveNetwork(m_NeuralFilename);

	TRACE("Cycles : %5d Sum Square Error : %0.4f  Learning Rate : %0.4f\n",TotalCycles,SumSquareError,m_LearningRate);
	if(CNetwork::m_TrainError) TRACE("ERROR:::");
	HWND hWnd = GetDlgItem(hDlg,IDOK);
	EnableWindow(hWnd,TRUE);
	return 0;
}
