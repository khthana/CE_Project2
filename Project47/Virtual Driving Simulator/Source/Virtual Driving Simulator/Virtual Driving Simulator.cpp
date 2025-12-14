											
//-----------------------------------------------------------------------------
// File: Virtual Driving Simulator.cpp
//
// Desc: DirectX window application created by the DirectX AppWizard
//-----------------------------------------------------------------------------
#define STRICT
#define DIRECTINPUT_VERSION 0x0800
#include <windows.h>
#include <commctrl.h>
#include <commdlg.h>
#include <basetsd.h>
#include <math.h>
#include <stdio.h>
#include <d3dx9.h>
#include <dxerr9.h>
#include <tchar.h>
#include <dinput.h>
#include "DXUtil.h"
#include "D3DEnumeration.h"
#include "D3DSettings.h"
#include "D3DApp.h"
#include "D3DFont.h"
#include "D3DFile.h"
#include "D3DUtil.h"
#include "DIUtil.h"
#include "DMUtil.h"
#include "DSUtil.h"
#include "resource.h"
#include "Virtual Driving Simulator.h"


//-----------------------------------------------------------------------------
// Defines, and constants
//-----------------------------------------------------------------------------
// This GUID must be unique for every game, and the same for 
// every instance of this app.  // {C69C8E8A-0ABA-4B73-BA86-A8A658D05273}
// The GUID allows DirectInput to remember input settings
GUID g_guidApp = { 0xc69c8e8a, 0x0aba, 0x4b73, { 0xba, 0x86, 0xa8, 0xa6, 0x58, 0xd0, 0x52, 0x73 } };


// Input semantics used by this app
enum INPUT_SEMANTICS
{
    // Gameplay semantics
    // TODO: change as needed
	INPUT_ACCEL=1, INPUT_BRAKE, INPUT_CLUTCH,   INPUT_STEER, INPUT_GEAR, 
	INPUT_LEFT,	   INPUT_RIGHT, INPUT_ON, INPUT_OFF,
    INPUT_CONFIG_INPUT,     INPUT_CONFIG_DISPLAY,
    INPUT_PLAY_SOUND,   
	INPUT_MENU_1, INPUT_MENU_2, INPUT_MENU_3, INPUT_MENU_4
 
};

// Actions used by this app
DIACTION g_rgGameAction[] =
{
    // TODO: change as needed.  Be sure to delete user map files 
    // (C:\Program Files\Common Files\DirectX\DirectInput\User Maps\*.ini)
    // after changing this, otherwise settings won't reset and will be read 
    // from the out of date ini files 

    // Device input (joystick, etc.) that is pre-defined by DInput, according
    // to genre type. The genre for this app is space simulators.
    { INPUT_ACCEL,		DIAXIS_FLYINGH_THROTTLE,       0, TEXT("ACCEL"), },
    { INPUT_BRAKE,		DIAXIS_FLYINGH_PITCH,          0, TEXT("BRAKE"), },
	{ INPUT_CLUTCH,		DIAXIS_FLYINGH_COLLECTIVE,     0, TEXT("CLUTCH"), },
	{ INPUT_STEER,		DIAXIS_FLYINGH_BANK,          0, TEXT("STEER"), },
	{ INPUT_GEAR,		DIAXIS_FLYINGH_TORQUE,          0, TEXT("GEAR"), },
	{ INPUT_LEFT,		DIBUTTON_FLYINGH_FIRE,          0, TEXT("LEFT LIGHT"), },
	{ INPUT_RIGHT,		DIBUTTON_FLYINGH_MENU,          0, TEXT("RIGHT LIGHT"), },
	{ INPUT_ON,			DIBUTTON_FLYINGH_TARGET,          0, TEXT("ON ENGINE"), },
	{ INPUT_MENU_1,		DIBUTTON_FLYINGH_COUNTER,          0, TEXT("MENU 1"), },
	{ INPUT_MENU_2,		DIBUTTON_FLYINGH_DEVICE,          0, TEXT("MENU 2"), },
	{ INPUT_MENU_3,		DIBUTTON_FLYINGH_FASTER_LINK,      0, TEXT("MENU 3"), },
	{ INPUT_MENU_4,		DIBUTTON_FLYINGH_FIRESECONDARY,    0, TEXT("MENU 4"), },
	{ INPUT_OFF,		DIBUTTON_FLYINGH_WEAPONS,          0, TEXT("OFF ENGINE"), },
    { INPUT_PLAY_SOUND,      DIKEYBOARD_F5,                 0, TEXT("Play sound"), },
    { INPUT_CONFIG_DISPLAY,  DIKEYBOARD_F2,                 DIA_APPFIXED, TEXT("Configure Display"), },    
    { INPUT_CONFIG_INPUT,    DIKEYBOARD_F3,                 DIA_APPFIXED, TEXT("Configure Input"), },    

};

#define NUMBER_OF_GAMEACTIONS    (sizeof(g_rgGameAction)/sizeof(DIACTION))




//-----------------------------------------------------------------------------
// Global access to the app (needed for the global WndProc())
//-----------------------------------------------------------------------------
CMyD3DApplication* g_pApp  = NULL;
HINSTANCE          g_hInst = NULL;


int LightStat = 0; 
int Engine = 0;

//-----------------------------------------------------------------------------
// Name: WinMain()
// Desc: Entry point to the program. Initializes everything, and goes into a
//       message-processing loop. Idle time is used to render the scene.
//-----------------------------------------------------------------------------
INT WINAPI WinMain( HINSTANCE hInst, HINSTANCE, LPSTR, INT )
{
    CMyD3DApplication d3dApp;

    g_pApp  = &d3dApp;
    g_hInst = hInst;

    InitCommonControls();
    if( FAILED( d3dApp.Create( hInst ) ) )
        return 0;

    return d3dApp.Run();
}




//-----------------------------------------------------------------------------
// Name: CMyD3DApplication()
// Desc: Application constructor.   Paired with ~CMyD3DApplication()
//       Member variables should be initialized to a known state here.  
//       The application window has not yet been created and no Direct3D device 
//       has been created, so any initialization that depends on a window or 
//       Direct3D should be deferred to a later stage. 
//-----------------------------------------------------------------------------
CMyD3DApplication::CMyD3DApplication()
{
    m_dwCreationWidth           = 1024;
    m_dwCreationHeight          = 768;
    m_strWindowTitle            = TEXT( "Virtual Driving Simulator" );
    m_d3dEnumeration.AppUsesDepthBuffer   = TRUE;
	m_bStartFullscreen			= false;
	m_bShowCursorWhenFullscreen	= false;

    // Create a D3D font using d3dfont.cpp
    m_pFont                     = new CD3DFont( _T("Arial"), 12, D3DFONT_BOLD );
    m_bLoadingApp               = TRUE;
    m_pInputDeviceManager       = NULL;
    m_pMusicManager             = NULL;
    m_pDIConfigSurface          = NULL;

    ZeroMemory( &m_UserInput, sizeof(m_UserInput) );
    m_fWorldRotX                = 0.0f;
    m_fWorldRotY                = 0.0f;

	m_bClearSW					= false;
	m_bClearSW2					= false;

	EngineCheck					= false;
	OldGear						= 0;		// initial
	Accel						= 0;
	Brake						= 0;
	ClutchCounter				= 0;
	GearTemp					= 0;
	GearTemp2					= 0;
	Old1						= 0;
	Old2						= 0;
	Old3						= 0;
	Flag						= true;
	RPM							= 0;
	Direction					= 0;
	

	//////////////////////////
	// Additional variables //
	//////////////////////////
	
	// Object from class
	m_pCar						= NULL;					// Represent car parameters
	m_pCamera					= NULL;

	// Vertex buffer
	m_pTerrainVB				= NULL;
	m_pSkyboxVB					= NULL;
	m_pMirrorVB					= NULL;
	m_pConsoleVB				= NULL;

	// Xfiles
    m_pWall[24]					= NULL;					// The Wall
	m_pCarbody					= NULL;					// The Car body
	m_pBridge					= NULL;					// The bridge
	m_pHouse1					= NULL;
	m_pGrandStand				= NULL;
	m_pWhiteBlock				= NULL;
	m_pRedBlock					= NULL;
	m_pPalace					= NULL;
	m_pConcreteBlock			= NULL;
	m_pWireFence				= NULL;
	m_pFence1					= NULL;
	m_pGate						= NULL;
	m_pWall1					= NULL;
	m_pSecondTask				= NULL;
	m_pSideRoad					= NULL;
	m_pTurnRight				= NULL;
	m_pUTurn					= NULL;
	m_pUTurn2					= NULL;
	m_pMission1					= NULL;
	m_pMission2					= NULL;
	m_pMission3					= NULL;
	m_pSpeedLimit				= NULL;

	// Bounding box
//	m_sBoundingWall[24]			= 0;					// The Wall

	// Texture
	m_pTopSkyboxTexture			= NULL;
	m_pFrontSkyboxTexture		= NULL;
	m_pLeftSkyboxTexture		= NULL;
	m_pRightSkyboxTexture		= NULL;
	m_pBackSkyboxTexture		= NULL;
	m_pConsoleTexture			= NULL;
	m_pGrassTexture				= NULL;
	m_pShortRoadTexture			= NULL;
	m_pCornerRoadTexture		= NULL;
	m_pRoadTexture				= NULL;
	m_pLeftRightTexture			= NULL;
	m_pCrossRoadTexture			= NULL;

	// Music 
	g_pMusicSegments[8]			= (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
	g_p3DAudiopath				= NULL;

	// Game variables
	m_bFirstTask = false;
	m_bSecondTask = false;
	m_bThirdTask = false;
	m_bPass = true;
	m_bFinish = false;
	m_bCheckpoint1 = false;
	m_bCrash1 = false;
	m_bStop1 = false;
	m_bCheckpoint2 = false;
	m_bStop21 = false;
	m_bStop22 = false;
	m_bCrash2 = false;
	m_bCheckpoint3 = false;
	m_bCrash3 = false;
	m_bOver3 = false;
	m_bCheckpoint32 = false;
	m_vStop3.x = 930.0f; m_vStop3.y = 5.0f; m_vStop3.z = 400.0f;

	// Others
	m_dwAppState				= APPSTATE_DISPLAYVIDEO;		// Current state the app is in
	m_vPos						= D3DXVECTOR3(0.0f, 0.0f, 0.0f);				// Set initial position
	m_fRotationY				= 0.0f;
	m_fBridgeAngle				= 16.70f;
	m_iTimeDelay				= 30;

    // Read settings from registry
    ReadSettings();
}




//-----------------------------------------------------------------------------
// Name: ~CMyD3DApplication()
// Desc: Application destructor.  Paired with CMyD3DApplication()
//-----------------------------------------------------------------------------
CMyD3DApplication::~CMyD3DApplication()
{
}




//-----------------------------------------------------------------------------
// Name: OneTimeSceneInit()
// Desc: Paired with FinalCleanup().
//       The window has been created and the IDirect3D9 interface has been
//       created, but the device has not been created yet.  Here you can
//       perform application-related initialization and cleanup that does
//       not depend on a device.
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::OneTimeSceneInit()
{
    // TODO: perform one time initialization

    lstrcpy( m_strProfilePath, ".\\media\\");
	// Set the current working dir, so that the model loading 
    // code in d3dfile.cpp can find the textures
    lstrcpy( m_strCurrentWorkingDir, m_strProfilePath );
    TCHAR* pChar = _tcsrchr( m_strCurrentWorkingDir, TEXT('\\') );
    if (pChar)
        *pChar = 0;
    SetCurrentDirectory( m_strCurrentWorkingDir );

    // Drawing loading status message until app finishes loading
    SendMessage( m_hWnd, WM_PAINT, 0, 0 );

    // Initialize DirectInput
    InitInput( m_hWnd );

    // Initialize audio
    InitAudio( m_hWnd );

    m_bLoadingApp = FALSE;

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: ReadSettings()
// Desc: Read the app settings from the registry
//-----------------------------------------------------------------------------
VOID CMyD3DApplication::ReadSettings()
{
    HKEY hkey;
    if( ERROR_SUCCESS == RegCreateKeyEx( HKEY_CURRENT_USER, DXAPP_KEY, 
        0, NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL, &hkey, NULL ) )
    {
        // TODO: change as needed

        // Read the stored window width/height.  This is just an example,
        // of how to use DXUtil_Read*() functions.
        DXUtil_ReadIntRegKey( hkey, TEXT("Width"), &m_dwCreationWidth, m_dwCreationWidth );
        DXUtil_ReadIntRegKey( hkey, TEXT("Height"), &m_dwCreationHeight, m_dwCreationHeight );

        RegCloseKey( hkey );
    }
}




//-----------------------------------------------------------------------------
// Name: WriteSettings()
// Desc: Write the app settings to the registry
//-----------------------------------------------------------------------------
VOID CMyD3DApplication::WriteSettings()
{
    HKEY hkey;

    if( ERROR_SUCCESS == RegCreateKeyEx( HKEY_CURRENT_USER, DXAPP_KEY, 
        0, NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, NULL, &hkey, NULL ) )
    {
        // TODO: change as needed

        // Write the window width/height.  This is just an example,
        // of how to use DXUtil_Write*() functions.
        DXUtil_WriteIntRegKey( hkey, TEXT("Width"), m_rcWindowClient.right );
        DXUtil_WriteIntRegKey( hkey, TEXT("Height"), m_rcWindowClient.bottom );

        RegCloseKey( hkey );
    }
}





//-----------------------------------------------------------------------------
// Name: StaticInputAddDeviceCB()
// Desc: Static callback helper to call into CMyD3DApplication class
//-----------------------------------------------------------------------------
HRESULT CALLBACK CMyD3DApplication::StaticInputAddDeviceCB( 
                                         CInputDeviceManager::DeviceInfo* pDeviceInfo, 
                                         const DIDEVICEINSTANCE* pdidi, 
                                         LPVOID pParam )
{
    CMyD3DApplication* pApp = (CMyD3DApplication*) pParam;
    return pApp->InputAddDeviceCB( pDeviceInfo, pdidi );
}




//-----------------------------------------------------------------------------
// Name: InputAddDeviceCB()
// Desc: Called from CInputDeviceManager whenever a device is added. 
//       Set the dead zone, and creates a new InputDeviceState for each device
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::InputAddDeviceCB( CInputDeviceManager::DeviceInfo* pDeviceInfo, 
                                                   const DIDEVICEINSTANCE* pdidi )
{
    UNREFERENCED_PARAMETER( pdidi );
    
    // Setup the deadzone 
    DIPROPDWORD dipdw;
    dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
    dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
    dipdw.diph.dwObj        = 0;
    dipdw.diph.dwHow        = DIPH_DEVICE;
    dipdw.dwData            = 500;
    pDeviceInfo->pdidDevice->SetProperty( DIPROP_DEADZONE, &dipdw.diph );

    // Create a new InputDeviceState for each device so the 
    // app can record its state 
    InputDeviceState* pNewInputDeviceState = new InputDeviceState;
    ZeroMemory( pNewInputDeviceState, sizeof(InputDeviceState) );
    pDeviceInfo->pParam = (LPVOID) pNewInputDeviceState;

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: InitInput()
// Desc: Initialize DirectInput objects
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::InitInput( HWND hWnd )
{
    HRESULT hr;

    // Setup action format for the actual gameplay
    ZeroMemory( &m_diafGame, sizeof(DIACTIONFORMAT) );
    m_diafGame.dwSize          = sizeof(DIACTIONFORMAT);
    m_diafGame.dwActionSize    = sizeof(DIACTION);
    m_diafGame.dwDataSize      = NUMBER_OF_GAMEACTIONS * sizeof(DWORD);
    m_diafGame.guidActionMap   = g_guidApp;

    // TODO: change the genre as needed
    m_diafGame.dwGenre         = DIVIRTUAL_FLYING_HELICOPTER; 

    m_diafGame.dwNumActions    = NUMBER_OF_GAMEACTIONS;
    m_diafGame.rgoAction       = g_rgGameAction;
    m_diafGame.lAxisMin        = -100;
    m_diafGame.lAxisMax        = 100;
    m_diafGame.dwBufferSize    = 16;
    _tcscpy( m_diafGame.tszActionMap, _T("Virtual Driving Simulator Game") );

    // Create a new input device manager
    m_pInputDeviceManager = new CInputDeviceManager();

    if( FAILED( hr = m_pInputDeviceManager->Create( hWnd, NULL, m_diafGame, 
                                                    StaticInputAddDeviceCB, this ) ) )
        return DXTRACE_ERR( "m_pInputDeviceManager->Create", hr );

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: InitAudio()
// Desc: Initialize DirectX audio objects
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::InitAudio( HWND hWnd )
{
    HRESULT hr;

    // Create the music manager class, used to create the sounds
    m_pMusicManager = new CMusicManager();
    if( FAILED( hr = m_pMusicManager->Initialize( hWnd ) ) )
        return DXTRACE_ERR( "m_pMusicManager->Initialize", hr );

	// Create a 3D Audiopath. This creates a synth port that feeds a 3d buffer.
	// We can then play all segments into this buffer and directly control its
	// 3D parameters.
	IDirectMusicPerformance8* pPerformance = m_pMusicManager->GetPerformance();
	if( FAILED( hr = pPerformance->CreateStandardAudioPath( DMUS_APATH_DYNAMIC_3D, 128, 
                                                            TRUE, &g_p3DAudiopath ) ) )
        return DXTRACE_ERR_MSGBOX( TEXT("CreateStandardAudioPath"), hr );


    // Instruct the music manager where to find the files
    // TODO: Set this to the media directory, or use resources
    TCHAR szPath[MAX_PATH];
    GetCurrentDirectory( MAX_PATH, szPath ); 
    m_pMusicManager->SetSearchDirectory( szPath );

    TCHAR strFileNames[8][MAX_PATH] = { TEXT("shortengine2.wav"),	// 0
		                                TEXT("crash3.wav"),	// 1
		                                TEXT("shortbrake.wav"),	// 2
		                                TEXT("start.wav"),  // 3 start
										TEXT("longengine.wav"),  // 4 start
										TEXT("background4.mid"),
										TEXT("background.wav"),
										TEXT("left_right.wav")
	                                  };
	
    // TODO: load the sounds from resources (or files)
 //   m_pMusicManager->CreateSegmentFromResource( &m_pBounceSound, _T("BOUNCE"), _T("WAVE") );

    // Create the segments from a file
	for (DWORD dwIndex = 0;dwIndex < 8; dwIndex++)
	{
        if( FAILED( hr = m_pMusicManager->CreateSegmentFromFile( &g_pMusicSegments[dwIndex], 
                                                                strFileNames[dwIndex] ) ) )
            return DXTRACE_ERR_MSGBOX( TEXT("CreateSegmentFromFile"), hr );
    }

    // Get the listener from the in the Audiopath.
    IDirectSound3DListener* pDSListener = NULL;
    if( FAILED( hr = g_p3DAudiopath->GetObjectInPath( 0, DMUS_PATH_PRIMARY_BUFFER, 0,
                                                      GUID_NULL, 0, IID_IDirectSound3DListener, 
                                                      (LPVOID*) &pDSListener ) ) )
        return DXTRACE_ERR_MSGBOX( TEXT("GetObjectInPath"), hr );

    // Set a new rolloff factor (1.0f is default)
    if( FAILED( hr = pDSListener->SetRolloffFactor( 1.0f, DS3D_IMMEDIATE ) ) )
        return DXTRACE_ERR_MSGBOX( TEXT("SetRolloffFactor"), hr );       

    // Release the listener since we are done with it.
    SAFE_RELEASE( pDSListener );

	SetPosition( 0, 0, 0 );

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: SetPosition()
// Desc: 
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::SetPosition( float fXPos, float fYPos, float fZPos )
{
    HRESULT hr;

	if( NULL == g_p3DAudiopath )
        return E_INVALIDARG;

	// First, get the 3D interface from the buffer by using GetObjectInPath.
	IDirectSound3DBuffer *pBuffer;
    if( FAILED( hr = g_p3DAudiopath->GetObjectInPath( DMUS_PCHANNEL_ALL, DMUS_PATH_BUFFER, 0, 
		                                              GUID_NULL, 0, IID_IDirectSound3DBuffer, 
                                                      (void **)&pBuffer ) ) )
        return DXTRACE_ERR_MSGBOX( TEXT("GetObjectInPath"), hr );

	// Then, set the coordinates and release.
	if( FAILED( hr = pBuffer->SetPosition( fXPos, fYPos, fZPos, DS3D_IMMEDIATE ) ) )
        return DXTRACE_ERR_MSGBOX( TEXT("SetPosition"), hr );

    SAFE_RELEASE( pBuffer );

    return S_OK;
}



//-----------------------------------------------------------------------------
// Name: PlaySegment()
// Desc: 
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::PlaySegment( int dwIndex )
{
    HRESULT hr = S_OK;

	SetPosition( 0, 0, 0 );

	if( g_pMusicSegments[dwIndex] )
	{
        switch( dwIndex )
        {
		 case 0:  // engine sound
		SetPosition( 0, 0, float(m_pCar->m_iRPM/1000) - 5);
		 if (!g_pMusicSegments[3]->IsPlaying())
         hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT | DMUS_SEGF_SECONDARY, 
                                                 g_p3DAudiopath );			
		 
			break;
		


       /* case 0:
			SetPosition( 0, 0, -20.0 );
			// Lullaby theme. This should play as a primary segment.
			pAudioPath =  m_pMusicManager->GetDefaultAudioPath();
		//	pAudioPath->SetVolume( -9600,0);
			//g_pMusicSegments[dwIndex]->SetRepeats(10000);
			if (!g_pMusicSegments[3]->IsPlaying())
				hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT, g_p3DAudiopath );
            break; */

        case 1:	// brake sound	
            hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT | DMUS_SEGF_SECONDARY, 
                                                  g_p3DAudiopath );			
            break;
		
		case 2:	 // crash sound	
			SetPosition( 0, 0, 10000);
            hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT | DMUS_SEGF_SECONDARY, 
                                                  g_p3DAudiopath );			
            break;

	/*	  case 2:
			// Rude awakening. Notice that this also passes the Audiopath 
			// in pFrom, indicating that all segments currently playing on 
			// the Audiopath should be stopped at the exact time
			// this starts. 
			IDirectMusicSegment8* pSegment = g_pMusicSegments[dwIndex]->GetSegment();
			IDirectMusicPerformance8* pPerformance = m_pMusicManager->GetPerformance();

			hr = pPerformance->PlaySegmentEx( pSegment, 0, NULL, 0, 0, 0, 
											  g_p3DAudiopath, g_p3DAudiopath );
			break;*/

        case 3: // start engine sound
			// Sound effects. These play as secondary segments so 
            // they can be triggered multiple times and will layer on top.			
            hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT | DMUS_SEGF_SECONDARY, 
                                                  g_p3DAudiopath );			
            break;
		
		case 4:	
		 if (!g_pMusicSegments[3]->IsPlaying())
         hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT | DMUS_SEGF_SECONDARY, 
                                                 g_p3DAudiopath );			
		 
         break;

		case 5:
  		 if (!g_pMusicSegments[4]->IsPlaying())
         hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT, 
                                                 g_p3DAudiopath );			
			break;    

		case 6:
			SetPosition( 0, 0, 0);
  		 if (!g_pMusicSegments[5]->IsPlaying())
         hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT , 
                                                 g_p3DAudiopath );		
		 
		case 7:
			SetPosition( 0, 0, 20);
  		 if (!g_pMusicSegments[6]->IsPlaying())
         hr = g_pMusicSegments[dwIndex]->Play( DMUS_SEGF_DEFAULT | DMUS_SEGF_SECONDARY, 
                                                 g_p3DAudiopath );		

        }
	}

    if( FAILED(hr) )
        return DXTRACE_ERR_MSGBOX( TEXT("PlaySegmentEx"), hr );

    return S_OK;
}





//-----------------------------------------------------------------------------
// Name: ConfirmDevice()
// Desc: Called during device initialization, this code checks the display device
//       for some minimum set of capabilities
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::ConfirmDevice( D3DCAPS9* pCaps, DWORD dwBehavior,
                                          D3DFORMAT Format )
{
    UNREFERENCED_PARAMETER( Format );
    UNREFERENCED_PARAMETER( dwBehavior );
    UNREFERENCED_PARAMETER( pCaps );
    
    BOOL bCapsAcceptable;

    // TODO: Perform checks to see if these display caps are acceptable.
    bCapsAcceptable = TRUE;

    if( bCapsAcceptable )         
        return S_OK;
    else
        return E_FAIL;
}




//-----------------------------------------------------------------------------
// Name: InitDeviceObjects()
// Desc: Paired with DeleteDeviceObjects()
//       The device has been created.  Resources that are not lost on
//       Reset() can be created here -- resources in D3DPOOL_MANAGED,
//       D3DPOOL_SCRATCH, or D3DPOOL_SYSTEMMEM.  Image surfaces created via
//       CreateImageSurface are never lost and can be created here.  Vertex
//       shaders and pixel shaders can also be created here as they are not
//       lost on Reset().
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::InitDeviceObjects()
{
    // TODO: create device objects

    HRESULT hr;

	/////////////////////////////////////
	// Additional vertexbuffer control //
	/////////////////////////////////////
	
	
	// Create vertex buffer for terrain
	
	m_pd3dDevice->CreateVertexBuffer(
		6 * 3 * sizeof(Vertex), 
		D3DUSAGE_WRITEONLY,
		Vertex::FVF,
		D3DPOOL_MANAGED,
		&m_pTerrainVB,
		0);

	Vertex* v;
	m_pTerrainVB->Lock(0, 0, (void**)&v, 0);

	// m_pTerrainVB built from two triangles:
	// for road
	v[0] = Vertex( 25.0f,  0.0f,-25.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f);
	v[1] = Vertex(-25.0f,  0.0f,-25.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f);
	v[2] = Vertex(-25.0f,  0.0f, 25.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f);

	v[3] = Vertex( 25.0f,  0.0f, 25.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f);
	v[4] = Vertex( 25.0f,  0.0f,-25.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f);
	v[5] = Vertex(-25.0f,  0.0f, 25.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f);
	// for grass
	v[6] = Vertex( 1500.0f,  -1.0f,-1000.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f);
	v[7] = Vertex(-1500.0f,  -1.0f,-1000.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f);
	v[8] = Vertex(-1500.0f,  -1.0f, 1500.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f);

	v[9] = Vertex( 1500.0f,  -1.0f, 1500.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f);
	v[10] = Vertex( 1500.0f, -1.0f,-1000.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f);
	v[11] = Vertex(-1500.0f, -1.0f, 1500.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f);
	// for first check
	v[12] = Vertex( 160.0f,  0.0f, 95.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f);
	v[13] = Vertex( 80.0f,  0.0f, 95.0f, 0.0f, 1.0f, 0.0f, 0.0f, 0.0f);
	v[14] = Vertex( 80.0f,  0.0f, 235.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f);

	v[15] = Vertex( 160.0f,  0.0f, 235.0f, 0.0f, 1.0f, 0.0f, 1.0f, 1.0f);
	v[16] = Vertex( 160.0f, 0.0f, 95.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f);
	v[17] = Vertex( 80.0f, 0.0f, 235.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f);

	m_pTerrainVB->Unlock();	

	// Create vertex for sky box
	
	m_pd3dDevice->CreateVertexBuffer(
		6 * 5 * sizeof(Vertex), 
		D3DUSAGE_WRITEONLY,
		Vertex::FVF,
		D3DPOOL_MANAGED,
		&m_pSkyboxVB,
		0);

	Vertex* v2;
	m_pSkyboxVB->Lock(0, 0, (void**)&v2, 0);

	// m_pSkyboxVB built from 5 sides:
	// top
	v2[0] = Vertex(1500.0f, 500.0f,-700.0f, 0.0f,-1.0f, 0.0f, 1.0f, 1.0f);
	v2[1] = Vertex(-700.0f, 500.0f, 1000.0f, 0.0f,-1.0f, 0.0f, 0.0f, 0.0f);
	v2[2] = Vertex(-700.0f, 500.0f,-700.0f, 0.0f,-1.0f, 0.0f, 0.0f, 1.0f);

	v2[3] = Vertex(1500.0f, 500.0f, 1000.0f, 0.0f,-1.0f, 0.0f, 1.0f, 0.0f);
	v2[4] = Vertex(-700.0f, 500.0f, 1000.0f, 0.0f,-1.0f, 0.0f, 0.0f, 0.0f);
	v2[5] = Vertex(1500.0f, 500.0f,-700.0f, 0.0f,-1.0f, 0.0f, 1.0f, 1.0f);

	// front
	v2[6] = Vertex(1500.0f,   0.0f, 1000.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v2[7] = Vertex(-700.0f,   0.0f, 1000.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v2[8] = Vertex(-700.0f, 500.5f, 1000.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	v2[9] = Vertex(1500.0f, 500.5f, 1000.0f, 0.0f, 0.0f,-1.0f, 1.0f, 0.0f);
	v2[10] = Vertex(1500.0f,   0.0f, 1000.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v2[11] = Vertex(-700.0f, 500.5f, 1000.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	// left
	v2[12] = Vertex(-700.0f,   0.0f, 1000.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f);
	v2[13] = Vertex(-700.0f,   0.0f,-700.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f);
	v2[14] = Vertex(-700.0f, 500.5f,-700.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f);

	v2[15] = Vertex(-700.0f, 500.5f, 1000.0f, 1.0f, 0.0f, 0.0f, 1.0f, 0.0f);
	v2[16] = Vertex(-700.0f,   0.0f, 1000.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f);
	v2[17] = Vertex(-700.0f, 500.5f,-700.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f);

	// right
	v2[18] = Vertex(1500.0f,   0.0f,-700.0f,-1.0f, 0.0f, 0.0f, 1.0f, 1.0f);
	v2[19] = Vertex(1500.0f,   0.0f, 1000.0f,-1.0f, 0.0f, 0.0f, 0.0f, 1.0f);
	v2[20] = Vertex(1500.0f, 500.5f, 1000.0f,-1.0f, 0.0f, 0.0f, 0.0f, 0.0f);

	v2[21] = Vertex(1500.0f, 500.5f,-700.0f,-1.0f, 0.0f, 0.0f, 1.0f, 0.0f);
	v2[22] = Vertex(1500.0f,   0.0f,-700.0f,-1.0f, 0.0f, 0.0f, 1.0f, 1.0f);
	v2[23] = Vertex(1500.0f, 500.5f, 1000.0f,-1.0f, 0.0f, 0.0f, 0.0f, 0.0f);
		
	// back
	v2[24] = Vertex(-700.0f,   0.0f,-700.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f);
	v2[25] = Vertex(1500.0f,   0.0f,-700.0f, 0.0f, 0.0f, 1.0f, 0.0f, 1.0f);
	v2[26] = Vertex(1500.0f, 500.5f,-700.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f);

	v2[27] = Vertex(-700.0f, 500.5f,-700.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f);
	v2[28] = Vertex(-700.0f,   0.0f,-700.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f);
	v2[29] = Vertex(1500.0f, 500.5f,-700.0f, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f);

	m_pSkyboxVB->Unlock();

	// Create vertex for mirror
	
	m_pd3dDevice->CreateVertexBuffer(
		6 * 3 * sizeof(Vertex), 
		D3DUSAGE_WRITEONLY,
		Vertex::FVF,
		D3DPOOL_MANAGED,
		&m_pMirrorVB,
		0);

	Vertex* v3;
	m_pMirrorVB->Lock(0, 0, (void**)&v3, 0);

	// m_pMirrorVB each mirror built from 2 triangles:
	// Back
	v3[0] = Vertex(  6.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v3[1] = Vertex( -6.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v3[2] = Vertex( -6.0f,   9.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	v3[3] = Vertex(  6.0f,   9.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 0.0f);
	v3[4] = Vertex(  6.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v3[5] = Vertex( -6.0f,   9.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	// Left 
	v3[6] = Vertex( -1.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v3[7] = Vertex( -6.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v3[8] = Vertex( -6.0f,   7.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	v3[9]  = Vertex( -1.0f,   7.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 0.0f);
	v3[10] = Vertex( -1.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v3[11] = Vertex( -6.0f,   7.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	// Right
	v3[12] = Vertex(  6.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v3[13] = Vertex(  1.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v3[14] = Vertex(  1.0f,   7.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	v3[15] = Vertex(  6.0f,   7.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 0.0f);
	v3[16] = Vertex(  6.0f,   4.0f,   10.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v3[17] = Vertex(  1.0f,   7.0f,   10.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	m_pMirrorVB->Unlock();

	// Create vertex for console

	m_pd3dDevice->CreateVertexBuffer(
		6 * 3 * sizeof(Vertex), 
		D3DUSAGE_WRITEONLY,
		Vertex::FVF,
		D3DPOOL_MANAGED,
		&m_pConsoleVB,
		0);

	Vertex* v4;
	m_pConsoleVB->Lock(0, 0, (void**)&v4, 0);

	// m_pConsoleVB built each pointer from 1 triangle
	// for console
	v4[0] = Vertex(  1.3f,   3.2f,   5.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v4[1] = Vertex( -1.3f,   3.2f,   5.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v4[2] = Vertex( -1.3f,   4.2f,   5.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	v4[3] = Vertex(  1.3f,   4.2f,   5.0f, 0.0f, 0.0f,-1.0f, 1.0f, 0.0f);
	v4[4] = Vertex(  1.3f,   3.2f,   5.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v4[5] = Vertex( -1.3f,   4.2f,   5.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	// for Velocity
	v4[6] = Vertex(  0.2f,  0.0f,   4.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v4[7] = Vertex( -0.2f,  0.0f,   4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v4[8] = Vertex(  0.0f,  1.65f,  4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	// for Accel 
	v4[9] =  Vertex(  0.2f,  0.0f,   4.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v4[10] = Vertex( -0.2f,  0.0f,   4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v4[11] = Vertex(  0.0f,  1.65f,  4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	// for Left Light
	v4[12] = Vertex( -0.07f,  4.35f,    4.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v4[13] = Vertex( -0.07f,  4.28f,    4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v4[14] = Vertex( -0.17f,  4.315f,   4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);
	
	// for Right Light
	v4[15] = Vertex(  0.09f,  4.35f,    4.0f, 0.0f, 0.0f,-1.0f, 1.0f, 1.0f);
	v4[16] = Vertex(  0.19f,  4.315f,    4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 1.0f);
	v4[17] = Vertex(  0.09f,  4.28f,   4.0f, 0.0f, 0.0f,-1.0f, 0.0f, 0.0f);

	m_pConsoleVB->Unlock();

	//////////////////////////////
	// Additional create object //
	//////////////////////////////

	// Create car parameter object

	m_pCar = new CCar;
	if(FAILED(m_pCar))
	{
		::MessageBox(0, "Can not create class CCar object.", 0, 0);
		return false;
	}

	// Create Camera

	m_pCamera = new CCamera;
	if(FAILED(m_pCamera))
	{
		::MessageBox(0, "Can not create class CCar object.", 0, 0);
		return false;
	}

	// Create car body

	m_pCarbody = new CD3DMesh();
    if( m_pCarbody )
    {
        hr = m_pCarbody->Create( m_pd3dDevice, "car.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pCarbody->m_bUseMaterials = TRUE;
    }

	// Create bridge

	m_pBridge = new CD3DMesh();
    if( m_pBridge )
    {
        hr = m_pBridge->Create( m_pd3dDevice, "bridge.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pBridge->m_bUseMaterials = TRUE;
    }

	// Create house1

	m_pHouse1 = new CD3DMesh();
    if( m_pHouse1 )
    {
        hr = m_pHouse1->Create( m_pd3dDevice, "house1.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pHouse1->m_bUseMaterials = TRUE;
    }

	// Create grand stand

	m_pGrandStand = new CD3DMesh();
    if( m_pGrandStand )
    {
        hr = m_pGrandStand->Create( m_pd3dDevice, "grandstand.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pGrandStand->m_bUseMaterials = TRUE;
    }

	// Create white block

	m_pWhiteBlock = new CD3DMesh();
    if( m_pWhiteBlock )
    {
        hr = m_pWhiteBlock->Create( m_pd3dDevice, "wblock.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pWhiteBlock->m_bUseMaterials = TRUE;
    }

	// Create red block

	m_pRedBlock = new CD3DMesh();
    if( m_pRedBlock )
    {
        hr = m_pRedBlock->Create( m_pd3dDevice, "rblock.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pRedBlock->m_bUseMaterials = TRUE;
    }

	// Create the palace

	m_pPalace = new CD3DMesh();
    if( m_pPalace )
    {
        hr = m_pPalace->Create( m_pd3dDevice, "palace1.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pPalace->m_bUseMaterials = TRUE;
    }

	// Create the concrete block

	m_pConcreteBlock = new CD3DMesh();
    if( m_pConcreteBlock )
    {
        hr = m_pConcreteBlock->Create( m_pd3dDevice, "block1.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pConcreteBlock->m_bUseMaterials = TRUE;
    }

	// Create wire fence

	m_pWireFence = new CD3DMesh();
    if( m_pWireFence )
    {
        hr = m_pWireFence->Create( m_pd3dDevice, "wirefence.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pWireFence->m_bUseMaterials = TRUE;
    }

	// Create fence1

	m_pFence1 = new CD3DMesh();
    if( m_pFence1 )
    {
        hr = m_pFence1->Create( m_pd3dDevice, "fence1.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pFence1->m_bUseMaterials = TRUE;
    }

	// Create the gate

	m_pGate = new CD3DMesh();
    if( m_pGate )
    {
        hr = m_pGate->Create( m_pd3dDevice, "gate.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pGate->m_bUseMaterials = TRUE;
    }

	// Create the wall

	m_pWall1 = new CD3DMesh();
    if( m_pWall1 )
    {
        hr = m_pWall1->Create( m_pd3dDevice, "wall.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pWall1->m_bUseMaterials = TRUE;
    }

	m_pSecondTask = new CD3DMesh();
    if( m_pSecondTask )
    {
        hr = m_pSecondTask->Create( m_pd3dDevice, "secondtask.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pSecondTask->m_bUseMaterials = TRUE;
    }

	m_pSideRoad = new CD3DMesh();
    if( m_pSideRoad )
    {
        hr = m_pSideRoad->Create( m_pd3dDevice, "sideroad.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pSideRoad->m_bUseMaterials = TRUE;
    }

	m_pTurnRight = new CD3DMesh();
    if( m_pTurnRight )
    {
        hr = m_pTurnRight->Create( m_pd3dDevice, "turnright.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pTurnRight->m_bUseMaterials = TRUE;
    }

	m_pUTurn = new CD3DMesh();
    if( m_pUTurn )
    {
        hr = m_pUTurn->Create( m_pd3dDevice, "uturn.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pUTurn->m_bUseMaterials = TRUE;
    }

	m_pUTurn2 = new CD3DMesh();
    if( m_pUTurn )
    {
        hr = m_pUTurn2->Create( m_pd3dDevice, "UTurn2.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pUTurn2->m_bUseMaterials = TRUE;
    }

	m_pMission1 = new CD3DMesh();
    if( m_pMission1 )
    {
        hr = m_pMission1->Create( m_pd3dDevice, "mission1.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pMission1->m_bUseMaterials = TRUE;
    }

	m_pMission2 = new CD3DMesh();
    if( m_pMission2 )
    {
        hr = m_pMission2->Create( m_pd3dDevice, "mission2.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pMission2->m_bUseMaterials = TRUE;
    }

	m_pMission3 = new CD3DMesh();
    if( m_pMission3 )
    {
        hr = m_pMission3->Create( m_pd3dDevice, "mission3.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pMission3->m_bUseMaterials = TRUE;
    }

	m_pSpeedLimit = new CD3DMesh();
    if( m_pSpeedLimit )
    {
        hr = m_pSpeedLimit->Create( m_pd3dDevice, "speedlimit.x" );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXLoadMeshFromX() - FAILED", 0, 0);
			return false;
		}
        m_pSpeedLimit->m_bUseMaterials = TRUE;
    }

	// This part for create all abject

	D3DXCreateBox( m_pd3dDevice, 5.0f, 50.0f, 500.0f, &m_pWall[0], 0);
	D3DXCreateBox( m_pd3dDevice, 920.0f, 50.0f, 5.0f, &m_pWall[1], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 10.0f, 500.0f, &m_pWall[2], 0);
	D3DXCreateBox( m_pd3dDevice, 920.0f, 10.0f, 5.0f, &m_pWall[3], 0);
	D3DXCreateBox( m_pd3dDevice, 650.0f, 5.0f, 5.0f, &m_pWall[4], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 45.0f, &m_pWall[5], 0);
	D3DXCreateBox( m_pd3dDevice, 645.0f, 5.0f, 5.0f, &m_pWall[6], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 195.0f, &m_pWall[7], 0);
	D3DXCreateBox( m_pd3dDevice, 45.0f, 5.0f, 5.0f, &m_pWall[8], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 50.0f, 45.0f, &m_pWall[9], 0);
	D3DXCreateBox( m_pd3dDevice, 35.0f, 50.0f, 5.0f, &m_pWall[10], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 50.0f, 45.0f, &m_pWall[11], 0);
	D3DXCreateBox( m_pd3dDevice, 60.0f, 5.0f, 5.0f, &m_pWall[12], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 80.0f, &m_pWall[13], 0);
	D3DXCreateBox( m_pd3dDevice, 90.0f, 5.0f, 5.0f, &m_pWall[14], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 25.0f, &m_pWall[15], 0);
	D3DXCreateBox( m_pd3dDevice, 45.0f, 5.0f, 5.0f, &m_pWall[16], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 150.0f, &m_pWall[17], 0);
	D3DXCreateBox( m_pd3dDevice, 815.0f, 5.0f, 5.0f, &m_pWall[18], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 95.0f, &m_pWall[19], 0);
	D3DXCreateBox( m_pd3dDevice, 650.0f, 5.0f, 5.0f, &m_pWall[20], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 150.0f, &m_pWall[21], 0);
	D3DXCreateBox( m_pd3dDevice, 655.0f, 5.0f, 5.0f, &m_pWall[22], 0);
	D3DXCreateBox( m_pd3dDevice, 5.0f, 5.0f, 145.0f, &m_pWall[23], 0);
	D3DXCreateBox( m_pd3dDevice, 815.0f, 5.0f, 5.0f, &m_pWall[24], 0);


	///////////////////////////////
	// Additional create texture //
	///////////////////////////////

	// Terrain
	D3DXCreateTextureFromFile(m_pd3dDevice,"shortroad.jpg",&m_pShortRoadTexture);
	D3DXCreateTextureFromFile(m_pd3dDevice,"cornerroad.jpg",&m_pCornerRoadTexture);
	D3DXCreateTextureFromFile(m_pd3dDevice,"grass.jpg",&m_pGrassTexture);
	D3DXCreateTextureFromFile(m_pd3dDevice,"road.jpg",&m_pRoadTexture);
    D3DXCreateTextureFromFile(m_pd3dDevice,"crossroad.jpg",&m_pCrossRoadTexture);
    // Skybox
	D3DXCreateTextureFromFile(m_pd3dDevice,"Top.bmp",&m_pTopSkyboxTexture);
	D3DXCreateTextureFromFile(m_pd3dDevice,"Front.bmp",&m_pFrontSkyboxTexture);
	D3DXCreateTextureFromFile(m_pd3dDevice,"Right.bmp",&m_pLeftSkyboxTexture);
	D3DXCreateTextureFromFile(m_pd3dDevice,"Left.bmp",&m_pRightSkyboxTexture);
	D3DXCreateTextureFromFile(m_pd3dDevice,"Back.bmp",&m_pBackSkyboxTexture);
	// Console
    D3DXCreateTextureFromFile(m_pd3dDevice,"console.jpg",&m_pConsoleTexture);
	// Left-right Light
    D3DXCreateTextureFromFile(m_pd3dDevice,"light.jpg",&m_pLeftRightTexture);


	////////////////////////////////////
	// Additional create bounding box //
	////////////////////////////////////

	// This part for create all bounding box

		// for Out wall
	m_sBoundingWall[0]._max.x = -20.0f;m_sBoundingWall[0]._max.y = 10.0f;m_sBoundingWall[0]._max.z = 400.0f;
	m_sBoundingWall[0]._min.x = -25.0f;m_sBoundingWall[0]._min.y = 0.0f; m_sBoundingWall[0]._min.z = -100.0f;	

	m_sBoundingWall[1]._max.x = 930.0f;m_sBoundingWall[1]._max.y = 10.0f;m_sBoundingWall[1]._max.z = 405.0f;
	m_sBoundingWall[1]._min.x = -20.0f;m_sBoundingWall[1]._min.y = 0.0f;m_sBoundingWall[1]._min.z = 400.0f;	

	m_sBoundingWall[2]._max.x = 935.0f;m_sBoundingWall[2]._max.y = 10.0f;m_sBoundingWall[2]._max.z = 400.0f;
	m_sBoundingWall[2]._min.x = 930.0f;m_sBoundingWall[2]._min.y = 0.0f;m_sBoundingWall[2]._min.z = -100.0f;	

	m_sBoundingWall[3]._max.x = 930.0f;m_sBoundingWall[3]._max.y = 10.0f;m_sBoundingWall[3]._max.z = -100.0f;
	m_sBoundingWall[3]._min.x = -20.0f;m_sBoundingWall[3]._min.y = 0.0f;m_sBoundingWall[3]._min.z = -105.0f;	

	m_sBoundingWall[4]._max.x = 930.0f;m_sBoundingWall[4]._max.y = 100.0f;m_sBoundingWall[4]._max.z = 200.0f;
	m_sBoundingWall[4]._min.x = 250.0f;m_sBoundingWall[4]._min.y = 0.0f;m_sBoundingWall[4]._min.z = 195.0f;	

	m_sBoundingWall[5]._max.x = 255.0f;m_sBoundingWall[5]._max.y = 10.0f;m_sBoundingWall[5]._max.z = 195.0f;
	m_sBoundingWall[5]._min.x = 250.0f;m_sBoundingWall[5]._min.y = 0.0f;m_sBoundingWall[5]._min.z = 150.0f;	

	m_sBoundingWall[6]._max.x = 930.0f;m_sBoundingWall[6]._max.y = 10.0f;m_sBoundingWall[6]._max.z = 155.0f;
	m_sBoundingWall[6]._min.x = 255.0f;m_sBoundingWall[6]._min.y = 0.0f;m_sBoundingWall[6]._min.z = 150.0f;	

		// for In wall
	m_sBoundingWall[7]._max.x = 35.0f;m_sBoundingWall[7]._max.y = 10.0f;m_sBoundingWall[7]._max.z = 150.0f;
	m_sBoundingWall[7]._min.x = 30.0f;m_sBoundingWall[7]._min.y = 0.0f;m_sBoundingWall[7]._min.z = -45.0f;	

	m_sBoundingWall[8]._max.x = 60.0f;m_sBoundingWall[8]._max.y = 10.0f;m_sBoundingWall[8]._max.z = 150.0f;
	m_sBoundingWall[8]._min.x = 35.0f;m_sBoundingWall[8]._min.y = 0.0f;m_sBoundingWall[8]._min.z = 145.0f;	

	m_sBoundingWall[9]._max.x = 65.0f;m_sBoundingWall[9]._max.y = 10.0f;m_sBoundingWall[9]._max.z = 150.0f;
	m_sBoundingWall[9]._min.x = 60.0f;	m_sBoundingWall[9]._min.y = 0.0f;m_sBoundingWall[9]._min.z = 100.0f;	

	m_sBoundingWall[10]._max.x = 110.0f;m_sBoundingWall[10]._max.y = 10.0f;m_sBoundingWall[10]._max.z = 100.0f;
	m_sBoundingWall[10]._min.x = 75.0f;m_sBoundingWall[10]._min.y = 0.0f;m_sBoundingWall[10]._min.z = 95.0f;	

	m_sBoundingWall[11]._max.x = 125.0f;m_sBoundingWall[11]._max.y = 10.0f;m_sBoundingWall[11]._max.z = 145.0f;
	m_sBoundingWall[11]._min.x = 120.0f;m_sBoundingWall[11]._min.y = 0.0f;m_sBoundingWall[11]._min.z = 100.0f;	

	m_sBoundingWall[12]._max.x = 165.0f;m_sBoundingWall[12]._max.y = 10.0f;m_sBoundingWall[12]._max.z = 150.0f;
	m_sBoundingWall[12]._min.x = 125.0f;m_sBoundingWall[12]._min.y = 0.0f;m_sBoundingWall[12]._min.z = 145.0f;	
	
	m_sBoundingWall[13]._max.x = 165.0f;m_sBoundingWall[13]._max.y = 10.0f;m_sBoundingWall[13]._max.z = 230.0f;
	m_sBoundingWall[13]._min.x = 160.0f;m_sBoundingWall[13]._min.y = 0.0f;m_sBoundingWall[13]._min.z = 150.0f;	

	m_sBoundingWall[14]._max.x = 165.0f;m_sBoundingWall[14]._max.y = 10.0f;m_sBoundingWall[14]._max.z = 235.0f;
	m_sBoundingWall[14]._min.x = 75.0f;m_sBoundingWall[14]._min.y = 0.0f;m_sBoundingWall[14]._min.z = 230.0f;	

	m_sBoundingWall[15]._max.x = 80.0f;m_sBoundingWall[15]._max.y = 10.0f;m_sBoundingWall[15]._max.z = 230.0f;
	m_sBoundingWall[15]._min.x = 75.0f;m_sBoundingWall[15]._min.y = 0.0f;m_sBoundingWall[15]._min.z = 205.0f;	

	m_sBoundingWall[16]._max.x = 80.0f;m_sBoundingWall[16]._max.y = 10.0f;m_sBoundingWall[16]._max.z = 205.0f;
	m_sBoundingWall[16]._min.x = 35.0f;m_sBoundingWall[16]._min.y = 0.0f;m_sBoundingWall[16]._min.z = 200.0f;	

	m_sBoundingWall[17]._max.x = 35.0f;m_sBoundingWall[17]._max.y = 10.0f;m_sBoundingWall[17]._max.z = 350.0f;
	m_sBoundingWall[17]._min.x = 30.0f;m_sBoundingWall[17]._min.y = 0.0f;m_sBoundingWall[17]._min.z = 200.0f;	

	m_sBoundingWall[18]._max.x = 850.0f;m_sBoundingWall[18]._max.y = 10.0f;m_sBoundingWall[18]._max.z = 350.0f;
	m_sBoundingWall[18]._min.x = 35.0f;m_sBoundingWall[18]._min.y = 0.0f;m_sBoundingWall[18]._min.z = 345.0f;	

	m_sBoundingWall[19]._max.x = 850.0f;m_sBoundingWall[19]._max.y = 10.0f;m_sBoundingWall[19]._max.z = 345.0f;
	m_sBoundingWall[19]._min.x = 845.0f;m_sBoundingWall[19]._min.y = 0.0f;m_sBoundingWall[19]._min.z = 250.0f;	

	m_sBoundingWall[20]._max.x = 845.0f;m_sBoundingWall[20]._max.y = 100.0f;m_sBoundingWall[20]._max.z = 255.0f;
	m_sBoundingWall[20]._min.x = 195.0f;m_sBoundingWall[20]._min.y = 0.0f;m_sBoundingWall[20]._min.z = 250.0f;	

	m_sBoundingWall[21]._max.x = 200.0f;m_sBoundingWall[21]._max.y = 10.0f;m_sBoundingWall[21]._max.z = 250.0f;
	m_sBoundingWall[21]._min.x = 195.0f;m_sBoundingWall[21]._min.y = 0.0f;m_sBoundingWall[21]._min.z = 100.0f;	

	m_sBoundingWall[22]._max.x = 850.0f;m_sBoundingWall[22]._max.y = 10.0f;m_sBoundingWall[22]._max.z = 100.0f;
	m_sBoundingWall[22]._min.x = 195.0f;m_sBoundingWall[22]._min.y = 0.0f;m_sBoundingWall[22]._min.z = 95.0f;	

	m_sBoundingWall[23]._max.x = 850.0f;m_sBoundingWall[23]._max.y = 10.0f;m_sBoundingWall[23]._max.z = 95.0f;
	m_sBoundingWall[23]._min.x = 845.0f;m_sBoundingWall[23]._min.y = 0.0f;m_sBoundingWall[23]._min.z = -50.0f;	

	m_sBoundingWall[24]._max.x = 845.0f;m_sBoundingWall[24]._max.y = 10.0f;m_sBoundingWall[24]._max.z = -45.0f;
	m_sBoundingWall[24]._min.x = 30.0f;m_sBoundingWall[24]._min.y = 0.0f;m_sBoundingWall[24]._min.z = -50.0f;	

	// for the bridge
	m_sBoundingBridge._max.x = 600.0f; m_sBoundingBridge._max.y = 100.0f; m_sBoundingBridge._max.z = 260.0f;
	m_sBoundingBridge._min.x = 475.0f; m_sBoundingBridge._min.y = 0.0f;  m_sBoundingBridge._min.z = 200.0f;

	// for the start
	m_sStart._max.x = 30.0f; m_sStart._max.y = 10.0f; m_sStart._max.z = 5.0f;
	m_sStart._min.x =-20.0f; m_sStart._min.y =  0.0f; m_sStart._min.z = 0.0f;

	// for the goal
	m_sFinish._max.x = 50.0f; m_sFinish._max.y = 10.0f; m_sFinish._max.z = -50.0f;
	m_sFinish._min.x = 45.0f; m_sFinish._min.y = 0.0f;  m_sFinish._min.z = -100.0f;

	// for checkpoint1
	m_sCheckpoint1._max.x = 35.0f; m_sCheckpoint1._max.y = 10.0f; m_sCheckpoint1._max.z = 200.0f;
	m_sCheckpoint1._min.x = 30.0f; m_sCheckpoint1._min.y =  0.0f; m_sCheckpoint1._min.z = 150.0f;

	// for area 1
	m_sArea1._max.x = 105.0f; m_sArea1._max.y = 10.0f; m_sArea1._max.z = 110.0f;
	m_sArea1._min.x =  80.0f; m_sArea1._min.y =  0.0f; m_sArea1._min.z = 102.0f;

	// for checkpoint2
	m_sCheckpoint2._max.x = 35.0f; m_sCheckpoint2._max.y = 10.0f; m_sCheckpoint2._max.z = 400.0f;
	m_sCheckpoint2._min.x = 30.0f; m_sCheckpoint2._min.y =  0.0f; m_sCheckpoint2._min.z = 350.0f;

	// for block2
	m_sBlock2._max.x = 435.0f; m_sBlock2._max.y = 10.0f; m_sBlock2._max.z = 400.0f;
	m_sBlock2._min.x = 425.0f; m_sBlock2._min.y =  0.0f; m_sBlock2._min.z = 380.0f;

	// for area 21
	m_sArea21._max.x = 427.0f; m_sArea21._max.y = 10.0f; m_sArea21._max.z = 400.0f;
	m_sArea21._min.x = 417.0f; m_sArea21._min.y =-10.0f; m_sArea21._min.z = 375.0f;

	// for area 22
	m_sArea22._max.x = 425.0f; m_sArea22._max.y = 10.0f; m_sArea22._max.z = 397.0f;
	m_sArea22._min.x = 370.0f; m_sArea22._min.y =-10.0f; m_sArea22._min.z = 390.0f;

	// for checkpoint3
	m_sCheckpoint3._max.x = 880.0f; m_sCheckpoint3._max.y = 10.0f; m_sCheckpoint3._max.z = 250.0f;
	m_sCheckpoint3._min.x = 875.0f; m_sCheckpoint3._min.y =  0.0f; m_sCheckpoint3._min.z = 200.0f;

	// for checkpoint after 3
	m_sCheckpoint32._max.x = 305.0f; m_sCheckpoint32._max.y = 10.0f; m_sCheckpoint32._max.z = 250.0f;
	m_sCheckpoint32._min.x = 300.0f; m_sCheckpoint32._min.y =  0.0f; m_sCheckpoint32._min.z = 200.0f;

	////////////////
	// DirectShow //
	////////////////

	// Initialize the COM library.
    hr = CoInitialize(NULL);
	if(FAILED(hr))
	{
		::MessageBox(0, "Initialize the COM library failed", 0, 0);
		return false;
	}

	// Create the filter graph manager and query for interfaces.
    hr = CoCreateInstance(CLSID_FilterGraph, NULL, CLSCTX_INPROC_SERVER, 
                        IID_IGraphBuilder, (void **)&pGB);
    if(FAILED(hr))
    {
		::MessageBox(0, "Create the filter graph manager failed", 0, 0);
		return false;
    }

	hr = pGB->QueryInterface(IID_IMediaControl, (void **)&pMC);
    hr = pGB->QueryInterface(IID_IMediaEvent, (void **)&pME);
    hr = pGB->QueryInterface(IID_IVideoWindow, (void **)&pVW);

    // Init the font
    m_pFont->InitDeviceObjects( m_pd3dDevice );

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: RestoreDeviceObjects()
// Desc: Paired with InvalidateDeviceObjects()
//       The device exists, but may have just been Reset().  Resources in
//       D3DPOOL_DEFAULT and any other device state that persists during
//       rendering should be set here.  Render states, matrices, textures,
//       etc., that don't change during rendering can be set once here to
//       avoid redundant state setting during Render() or FrameMove().
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::RestoreDeviceObjects()
{
    // TODO: setup render states
    HRESULT hr;

    // Setup a material
    D3DMATERIAL9 mtrl;
    D3DUtil_InitMaterial( mtrl, 1.0f, 1.0f, 1.0f );
    m_pd3dDevice->SetMaterial( &mtrl );

    // Set up the textures
    m_pd3dDevice->SetTextureStageState( 0, D3DTSS_COLOROP,   D3DTOP_MODULATE );
    m_pd3dDevice->SetTextureStageState( 0, D3DTSS_COLORARG1, D3DTA_TEXTURE );
    m_pd3dDevice->SetTextureStageState( 0, D3DTSS_COLORARG2, D3DTA_DIFFUSE );
    m_pd3dDevice->SetTextureStageState( 0, D3DTSS_ALPHAOP,   D3DTOP_MODULATE );
    m_pd3dDevice->SetTextureStageState( 0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE );
    m_pd3dDevice->SetTextureStageState( 0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE );
    m_pd3dDevice->SetSamplerState( 0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR );
    m_pd3dDevice->SetSamplerState( 0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR );

    // Set miscellaneous render states
    m_pd3dDevice->SetRenderState( D3DRS_DITHERENABLE,   FALSE );
    m_pd3dDevice->SetRenderState( D3DRS_SPECULARENABLE, FALSE );
    m_pd3dDevice->SetRenderState( D3DRS_ZENABLE,        TRUE );
    m_pd3dDevice->SetRenderState( D3DRS_AMBIENT,        0x000F0F0F );
	m_pd3dDevice->SetRenderState(D3DRS_NORMALIZENORMALS, TRUE);

	m_pd3dDevice->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	m_pd3dDevice->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	m_pd3dDevice->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_POINT);

    // Set the world matrix
    D3DXMATRIX matIdentity;
    D3DXMatrixIdentity( &matIdentity );
    m_pd3dDevice->SetTransform( D3DTS_WORLD,  &matIdentity );

    // Set up our view matrix. A view matrix can be defined given an eye point,
    // a point to lookat, and a direction for which way is up. Here, we set the
    // eye five units back along the z-axis and up three units, look at the
    // origin, and define "up" to be in the y-direction.
    D3DXMATRIX matView;
    D3DXVECTOR3 vFromPt   = D3DXVECTOR3( 0.0f, 0.0f, -5.0f );
    D3DXVECTOR3 vLookatPt = D3DXVECTOR3( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 vUpVec    = D3DXVECTOR3( 0.0f, 1.0f, 0.0f );
    D3DXMatrixLookAtLH( &matView, &vFromPt, &vLookatPt, &vUpVec );
    m_pd3dDevice->SetTransform( D3DTS_VIEW, &matView );
//	m_pCamera->getViewMatrix(&matView);
//  m_pd3dDevice->SetTransform( D3DTS_VIEW, &matView );

    // Set the projection matrix
    D3DXMATRIX matProj;
    FLOAT fAspect = ((FLOAT)m_d3dsdBackBuffer.Width) / m_d3dsdBackBuffer.Height;
	D3DXMatrixPerspectiveFovLH(
			&matProj,
			D3DX_PI * 0.25f, // 90 - degree
			fAspect,
			1.0f,
			2000.0f);
    m_pd3dDevice->SetTransform( D3DTS_PROJECTION, &matProj );

    // Set up lighting states
    D3DLIGHT9 light;
    D3DUtil_InitLight( light, D3DLIGHT_DIRECTIONAL, -1.0f, -1.0f, 2.0f );
    m_pd3dDevice->SetLight( 0, &light );
    m_pd3dDevice->LightEnable( 0, TRUE );
    m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, TRUE );

    // Restore the font
    m_pFont->RestoreDeviceObjects();

    if( !m_bWindowed )
    {
        // Create a surface for configuring DInput devices
        if( FAILED( hr = m_pd3dDevice->CreateOffscreenPlainSurface( 640, 480, 
                                        m_d3dsdBackBuffer.Format, D3DPOOL_DEFAULT, 
										&m_pDIConfigSurface, NULL ) ) ) 
            return DXTRACE_ERR( "CreateOffscreenPlainSurface", hr );
    }

	//////////////////////////////////////
	// Additional restore device object //
	//////////////////////////////////////

    // Create the device-dependent objects for the file-based mesh objects
    if( m_pCarbody )
    {
        hr = m_pCarbody->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pBridge )
    {
        hr = m_pBridge->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pHouse1 )
    {
        hr = m_pHouse1->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pGrandStand )
    {
        hr = m_pGrandStand->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pWhiteBlock )
    {
        hr = m_pWhiteBlock->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pRedBlock )
    {
        hr = m_pRedBlock->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pPalace )
    {
        hr = m_pPalace->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pConcreteBlock )
    {
        hr = m_pConcreteBlock->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pWireFence )
    {
        hr = m_pWireFence->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pFence1 )
    {
        hr = m_pFence1->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pGate )
    {
        hr = m_pGate->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pWall1 )
    {
        hr = m_pWall1->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pSecondTask )
    {
        hr = m_pSecondTask->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pSideRoad )
    {
        hr = m_pSideRoad->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pTurnRight )
    {
        hr = m_pTurnRight->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pUTurn )
    {
        hr = m_pUTurn->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pUTurn2 )
    {
        hr = m_pUTurn2->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pMission1 )
    {
        hr = m_pMission1->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pMission2 )
    {
        hr = m_pMission2->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    if( m_pMission3 )
    {
        hr = m_pMission3->RestoreDeviceObjects( m_pd3dDevice );
		if(FAILED(hr))
		{
			::MessageBox(0, "D3DXRestoreMeshFromX() - FAILED", 0, 0);
			return false;
		}
	}

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: StaticConfigureInputDevicesCB()
// Desc: Static callback helper to call into CMyD3DApplication class
//-----------------------------------------------------------------------------
BOOL CALLBACK CMyD3DApplication::StaticConfigureInputDevicesCB( 
                                            IUnknown* pUnknown, VOID* pUserData )
{
    CMyD3DApplication* pApp = (CMyD3DApplication*) pUserData;
    return pApp->ConfigureInputDevicesCB( pUnknown );
}




//-----------------------------------------------------------------------------
// Name: ConfigureInputDevicesCB()
// Desc: Callback function for configuring input devices. This function is
//       called in fullscreen modes, so that the input device configuration
//       window can update the screen.
//-----------------------------------------------------------------------------
BOOL CMyD3DApplication::ConfigureInputDevicesCB( IUnknown* pUnknown )
{
    // Get access to the surface
    LPDIRECT3DSURFACE9 pConfigSurface = NULL;
    if( FAILED( pUnknown->QueryInterface( IID_IDirect3DSurface9,
                                          (VOID**)&pConfigSurface ) ) )
        return TRUE;

    // Render the scene, with the config surface blitted on top
    Render();

    RECT  rcSrc;
    SetRect( &rcSrc, 0, 0, 640, 480 );

    POINT ptDst;
    ptDst.x = (m_d3dsdBackBuffer.Width-640)/2;
    ptDst.y = (m_d3dsdBackBuffer.Height-480)/2;

    LPDIRECT3DSURFACE9 pBackBuffer;
    m_pd3dDevice->GetBackBuffer( 0, 0, D3DBACKBUFFER_TYPE_MONO, &pBackBuffer );
    m_pd3dDevice->UpdateSurface( pConfigSurface, &rcSrc, pBackBuffer, &ptDst );
    pBackBuffer->Release();

    // Present the backbuffer contents to the front buffer
    m_pd3dDevice->Present( 0, 0, 0, 0 );

    // Release the surface
    pConfigSurface->Release();

    return TRUE;
}




//-----------------------------------------------------------------------------
// Name: FrameMove()
// Desc: Called once per frame, the call is the entry point for animating
//       the scene.
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::FrameMove()
{
    D3DXMATRIX matView;
    // TODO: update world

    // Update user input state
    UpdateInput( &m_UserInput );

	
	// Update Car parameter
	UpdateCarParam();

	// Check each task
	if ( m_bCheckpoint1 )
		FirstTask();
	if ( m_bCheckpoint2 )
		SecondTask();
	if ( m_bCheckpoint3 )
		ThirdTask();

    // Respond to input
    if( m_UserInput.bDoConfigureInput && m_bWindowed )  // full-screen configure disabled for now
    {
        // One-shot per keypress
        m_UserInput.bDoConfigureInput = FALSE;

        Pause( true );

        // Get access to the list of semantically-mapped input devices
        // to delete all InputDeviceState structs before calling ConfigureDevices()
        CInputDeviceManager::DeviceInfo* pDeviceInfos;
        DWORD dwNumDevices;
        m_pInputDeviceManager->GetDevices( &pDeviceInfos, &dwNumDevices );

        for( DWORD i=0; i<dwNumDevices; i++ )
        {
            InputDeviceState* pInputDeviceState = (InputDeviceState*) pDeviceInfos[i].pParam;
            SAFE_DELETE( pInputDeviceState );
            pDeviceInfos[i].pParam = NULL;
        }

        // Configure the devices (with edit capability)
        if( m_bWindowed )
            m_pInputDeviceManager->ConfigureDevices( m_hWnd, NULL, NULL, DICD_EDIT, NULL );
        else
            m_pInputDeviceManager->ConfigureDevices( m_hWnd,
                                                     m_pDIConfigSurface,
                                                     (VOID*)StaticConfigureInputDevicesCB,
                                                     DICD_EDIT, (LPVOID) this );

        Pause( false );
    }

    if( m_UserInput.bDoConfigureDisplay )
    {
        // One-shot per keypress
        m_UserInput.bDoConfigureDisplay = FALSE;

        Pause(true);

        // Configure the display device
        UserSelectNewDevice();

        Pause(false);
    }

    // Update the world state according to user input
    D3DXMATRIX matWorld;
    D3DXMATRIX matRotY;
    D3DXMATRIX matRotX;

	v = float(m_pCar->m_fVelocity * 5.2);


	if (m_pCar->EngineState)		// if engine is ON
	{	
		PlaySegment(0);	// play engine running sound

		if (Brake > 0)
		{
			if (m_pCar->m_fVelocity > 0)
			{
				m_pCar->m_fVelocity -= Brake*m_fElapsedTime/2;
				if (m_pCar->m_fVelocity > 30 && Brake > 15) PlaySegment(2);
			}
		}

		if (m_pCar->m_fVelocity > 0)
		{
			if (m_pCar->m_iGear >= 1 && m_pCar->m_iGear <= 5) 
				m_pCar->m_fDirection = 1;						
			else if (m_pCar->m_iGear == 6) 
				m_pCar->m_fDirection = -1;							

			Direction = m_pCar->m_fDirection;
		}
		else m_pCar->m_fDirection = 0;
		
		if (m_UserInput.AxisClutch > 35)	// Engine May OFF (clutch not push)
		{	
			// count time for Clutch 
			if (m_UserInput.AxisClutch >= 36.f && m_UserInput.AxisClutch <= 45.f)
				ClutchCounter++;		

			if (m_pCar->m_iGear == 0)
			{
				switch (Accel)	// increase & decrease RPM when push
				{
				case 1 : if (m_pCar->m_iRPM <= 2000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 2 : if (m_pCar->m_iRPM <= 2500)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 3 : if (m_pCar->m_iRPM <= 3000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 4 : if (m_pCar->m_iRPM <= 3500)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 5 : if (m_pCar->m_iRPM <= 4000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 6 : if (m_pCar->m_iRPM <= 4500)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 7 : if (m_pCar->m_iRPM <= 5000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 0 : if (m_pCar->m_iRPM > 800)
						 {
							if (m_pCar->m_fVelocity > 0 ) m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*100));							
							else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
						 }
						 else m_pCar->m_iRPM = 800;
					break;
				}
			}

					// calculate RPM
					RPM = 800 + int (m_pCar->m_fVelocity * 112.5);
					
					// increase Velocity when push Accel (if it does not reach max speed)
					if (CalAccel(m_pCar->m_iAccel))
					{
						switch (m_pCar->m_iGear)
						{	
						case 1 : m_pCar->m_fVelocity += float(m_pCar->m_iAccel*m_fElapsedTime*1);
							break;
						case 2 : m_pCar->m_fVelocity += float(m_pCar->m_iAccel*m_fElapsedTime*0.601);
							break;
						case 3 : m_pCar->m_fVelocity += float(m_pCar->m_iAccel*m_fElapsedTime*0.413);
							break;
						case 4 : m_pCar->m_fVelocity += float(m_pCar->m_iAccel*m_fElapsedTime*0.306);
							break;
						case 5 : m_pCar->m_fVelocity += float(m_pCar->m_iAccel*m_fElapsedTime*0.257);
							break;
						case 6 : m_pCar->m_fVelocity += float(m_pCar->m_iAccel*m_fElapsedTime*1.02);
							break;
						}

///						m_pCar->m_fVelocity = m_pCar->m_fVelocity + (m_pCar->m_iAccel*m_fElapsedTime*2);			
					}

					switch (m_pCar->m_iGear)
					{
					case 1 : m_pCar->m_iRPM = RPM; break;
					case 2 : m_pCar->m_iRPM = int (RPM * 0.601); break;
					case 3 : m_pCar->m_iRPM = int (RPM * 0.413); break;
					case 4 : m_pCar->m_iRPM = int (RPM * 0.306); break;	
					case 5 : m_pCar->m_iRPM = int (RPM * 0.257); break;
					case 6 : m_pCar->m_iRPM = int (RPM * 1.02); break;
					}				

					if (m_pCar->m_iRPM > 5000) 
					{
						m_pCar->m_iRPM = 5000;
						m_pCar->m_fVelocity = m_pCar->m_fVelocity - 0.3f;							 
					}

					if (m_pCar->m_iRPM < 700) EngineOFF();

				// calculate RPM when release Clutch
				if (m_UserInput.AxisClutch > 40 && m_UserInput.AxisClutch <= 45)
				{	
					switch (m_pCar->m_iGear)
					{
					case 1 :												
						if (m_pCar->m_fVelocity < 3 && ClutchCounter < 7)
							EngineOFF();									
						else if (ClutchCounter < 3) EngineOFF();						
						break;

					case 2 : 				
						if (m_pCar->m_fVelocity < 5 && ClutchCounter < 5) 
							EngineOFF();			
						else if (ClutchCounter < 3) EngineOFF();		
						
						break;

					case 3 : 						
						if (ClutchCounter < 3) EngineOFF();
						break;

					case 4 : 												
						if (ClutchCounter < 3) EngineOFF();
						break;

					case 5 : 														
						if (ClutchCounter < 3) EngineOFF();
						break;

					case 6 : 														
						if (m_pCar->m_fVelocity < 3 && ClutchCounter < 7)
							EngineOFF();						
						else if (ClutchCounter < 3) EngineOFF();
						break;
					}
				}						

				else if (m_UserInput.AxisClutch > 45)	// car start moving
				{					
					if (m_pCar->m_iGear != 0) 
					{			
							m_pCar->m_iAccel = Accel;			// assign Accel to Real-Accel	
					}
																					
						if (Accel == 0)	// not push accel
						{
							m_pCar->m_iAccel = 0;
							
							if (m_pCar->m_iGear != 0) // gear != 0 Reduce Velocity 
							{								
								if (m_pCar->m_iRPM > 1000)
								{
								m_pCar->m_fVelocity = m_pCar->m_fVelocity - 0.1f;							 
								}							
							}
							else if (m_pCar->m_iGear == 0)  // gear = 0 min 
							{
								if (m_pCar->m_fVelocity > 0)
								m_pCar->m_fVelocity = m_pCar->m_fVelocity - 0.25f;							
							}						
						}
				}
			}

		else if (m_UserInput.AxisClutch <= 35)		// Clutch Push -> Engine Always ON 
		{	
			m_pCar->m_iAccel = 0;
			ClutchCounter = 0;

			//if (m_pCar->m_iRPM >= 800 && m_pCar->m_iGear != 0) m_pCar->m_iRPM -= 30;

			//if (m_pCar->m_iAccel > 0) m_pCar->m_iAccel = m_pCar->Accel - 1;

			// if running and push clutch reduce by 0.01f
			//if (m_pCar->m_fVelocity > 0) m_pCar->m_fVelocity = m_pCar->m_fVelocity - 0.01f;

				switch (Accel)	// increase & decrease RPM when push
				{
				case 1 : if (m_pCar->m_iRPM <= 2000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;					
				case 2 : if (m_pCar->m_iRPM <= 2500)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 3 : if (m_pCar->m_iRPM <= 3000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 4 : if (m_pCar->m_iRPM <= 3500)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 5 : if (m_pCar->m_iRPM <= 4000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 6 : if (m_pCar->m_iRPM <= 4500)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 7 : if (m_pCar->m_iRPM <= 5000)
							 m_pCar->m_iRPM = int (m_pCar->m_iRPM + (Accel*m_fElapsedTime*400));	
						else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*400));	
					break;
				case 0 : if (m_pCar->m_iRPM > 800)
						 {
							if (m_pCar->m_fVelocity > 0 ) m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*100));							
							else m_pCar->m_iRPM = int (m_pCar->m_iRPM - (m_fElapsedTime*1000));	
						 }
						 else m_pCar->m_iRPM = 800;
					break;				
				}
		}
		
			if(OnBridge() && !isHit())
			{
				if(m_pCar->m_iGear != 6)
					MovementOnBridgeForward();
				else MovementOnBridgeBackward();
			} else
				if(!isHit())
				{		
					m_vStop3.x = 930.0f; m_vStop3.y = 5.0f; m_vStop3.z = 400.0f;
					m_fBridgeAngle = 16.70f;
					m_vPos.y = 5.0f;
					m_pCamera->setPosition(&m_vPos);			
					if( v > 0 && m_pCar->m_iGear == 6 && m_pCar->m_fDirection == -1)
					{					
						m_pCamera->walk( (v/100.00f) * float(-cos( (m_pCar->m_fWheelDirection/180)*D3DX_PI)) );
						m_pCamera->yaw( float(-sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50 );
						m_fRotationY = m_fRotationY - float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50;
						if( m_sStart.isHit(m_pCar) )
						{
							m_bFirstTask = false;
							m_bSecondTask = false;
							m_bThirdTask = false;
							m_bPass = true;
							m_bFinish = false;
							m_bCheckpoint1 = false;
							m_bCrash1 = false;
							m_bStop1 = false;
							m_bCheckpoint2 = false;
							m_bStop21 = false;
							m_bStop22 = false;
							m_bCrash2 = false;
							m_bCheckpoint3 = false;
							m_bCrash3 = false;
							m_bOver3 = false;
							m_bCheckpoint32 = false;
						}
						if( m_sFinish.isHit(m_pCar) )
						{
							m_bFinish = true;
						}
						if( m_sCheckpoint1.isHit(m_pCar) )
						{
							m_bCheckpoint1 = true;
						}
						if( m_sCheckpoint2.isHit(m_pCar) )
						{
							m_bCheckpoint2 = true;
						}
						if( m_sCheckpoint3.isHit(m_pCar) )
						{
							m_bCheckpoint3 = true;
						}
						if( m_sCheckpoint32.isHit(m_pCar) )
						{
							m_bCheckpoint32 = true;
						}
					}
					
					if( v > 0 && m_pCar->m_iGear != 6 && m_pCar->m_fDirection == 1)
					{					
						m_pCamera->walk( (v/100.00f) * float(cos( (m_pCar->m_fWheelDirection/180)*D3DX_PI)) );
						m_pCamera->yaw( float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50 );
						m_fRotationY = m_fRotationY + float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50;
						if( m_sStart.isHit(m_pCar) )
						{
							m_bFirstTask = false;
							m_bSecondTask = false;
							m_bThirdTask = false;
							m_bPass = true;
							m_bFinish = false;
							m_bCheckpoint1 = false;
							m_bCrash1 = false;
							m_bStop1 = false;
							m_bCheckpoint2 = false;
							m_bStop21 = false;
							m_bStop22 = false;
							m_bCrash2 = false;
							m_bCheckpoint3 = false;
							m_bCrash3 = false;
							m_bOver3 = false;
						}
						if( m_sFinish.isHit(m_pCar) )
						{
							m_bFinish = true;
						}
						if( m_sCheckpoint1.isHit(m_pCar) )
						{
							m_bCheckpoint1 = true;
						}
						if( m_sCheckpoint2.isHit(m_pCar) )
						{
							m_bCheckpoint2 = true;
						}
						if( m_sCheckpoint3.isHit(m_pCar) )
						{
							m_bCheckpoint3 = true;
						}
						if( m_sCheckpoint32.isHit(m_pCar) )
						{
							m_bCheckpoint32 = true;
						}
					}
				}  
	}

    // Play the sound every so often while the button is pressed 
    if( m_UserInput.bPlaySoundButtonDown )
    {
		HRESULT hr;
	
		if( FAILED( hr = PlaySegment( 0 ) ) )
		{
			DXTRACE_ERR_MSGBOX( TEXT("PlaySegment"), hr );
			return TRUE;
		}          
    }
    else
    {
        m_fSoundPlayRepeatCountdown = 0.0f;
    }

	
	m_pCamera->getViewMatrix(&matView);

    m_pd3dDevice->SetTransform( D3DTS_VIEW, &matView );

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: UpdateInput()
// Desc: Update the user input.  Called once per frame 
//-----------------------------------------------------------------------------
void CMyD3DApplication::UpdateInput( UserInput* pUserInput )
{
    if( NULL == m_pInputDeviceManager )
        return;

	// Clear Car Accel
	//Accel = 0;

    // Get access to the list of semantically-mapped input devices
    CInputDeviceManager::DeviceInfo* pDeviceInfos;
    DWORD dwNumDevices;
    m_pInputDeviceManager->GetDevices( &pDeviceInfos, &dwNumDevices );

    // Loop through all devices and check game input
    for( DWORD i=0; i<dwNumDevices; i++ )
    {
        DIDEVICEOBJECTDATA rgdod[10];
        DWORD   dwItems = 10;
        HRESULT hr;
        LPDIRECTINPUTDEVICE8 pdidDevice = pDeviceInfos[i].pdidDevice;
        InputDeviceState* pInputDeviceState = (InputDeviceState*) pDeviceInfos[i].pParam;

        hr = pdidDevice->Acquire();
        hr = pdidDevice->Poll();
        hr = pdidDevice->GetDeviceData( sizeof(DIDEVICEOBJECTDATA),
                                        rgdod, &dwItems, 0 );
        if( FAILED(hr) )
            continue;

        // Get the sematics codes for the game menu
        for( DWORD j=0; j<dwItems; j++ )
        {
            BOOL  bButtonState = (rgdod[j].dwData==0x80) ? TRUE : FALSE;
            FLOAT fButtonState = (rgdod[j].dwData==0x80) ? 1.0f : 0.0f;
            FLOAT fAxisState   = (FLOAT)((int)rgdod[j].dwData);
            UNREFERENCED_PARAMETER( fButtonState );

            switch( rgdod[j].uAppData )
            {
                // TODO: Handle semantics for the game 

                // Handle relative axis data

				case INPUT_ACCEL: 
                    pInputDeviceState->AxisAccel = -fAxisState;
					break;

                case INPUT_BRAKE:
                    pInputDeviceState->AxisBrake = -fAxisState;					
                    break;
				
				case INPUT_CLUTCH:
					pInputDeviceState->AxisClutch = -fAxisState;
					break;

				case INPUT_STEER:
					m_pCar->m_fWheelDirection = float(fAxisState/1.5);
					pInputDeviceState->AxisSteer = float(-fAxisState/1.5);
					break;

				case INPUT_GEAR:
					pInputDeviceState->AxisGear = -fAxisState; 

			//		if (m_pCar->m_iGear > 0 && m_pCar->m_iGear != Old1)
			//			Old1 = m_pCar->m_iGear;
									
					if (pInputDeviceState->AxisGear >= 97 && pInputDeviceState->AxisGear <= 100)
						{m_pCar->m_iGear = 0;
						 m_vOldPos = D3DXVECTOR3(900.0f, 0.0f, 400.0f);
						}
					else if ((pInputDeviceState->AxisGear >= 94 && pInputDeviceState->AxisGear <= 96)&&(OldGear == 0))					
						{m_pCar->m_iGear = 1; 
						 m_vOldPos = D3DXVECTOR3(900.0f, 0.0f, 400.0f);			
						}
					else if ((pInputDeviceState->AxisGear >= 91 && pInputDeviceState->AxisGear <= 93)&&(OldGear == 0))
						{m_pCar->m_iGear = 2; 
						 m_vOldPos = D3DXVECTOR3(900.0f, 0.0f, 400.0f);			
						}
					else if ((pInputDeviceState->AxisGear >= 89 && pInputDeviceState->AxisGear <= 92)&&(OldGear == 0))
						{m_pCar->m_iGear = 3; 
						 m_vOldPos = D3DXVECTOR3(900.0f, 0.0f, 400.0f);			
						}
					else if ((pInputDeviceState->AxisGear >= 86 && pInputDeviceState->AxisGear <= 91)&&(OldGear == 0))
						{m_pCar->m_iGear = 4; 
						 m_vOldPos = D3DXVECTOR3(900.0f, 0.0f, 400.0f);					
						}
					else if ((pInputDeviceState->AxisGear >= 81 && pInputDeviceState->AxisGear <= 85)&&(OldGear == 0))
						{m_pCar->m_iGear = 5; 
						 m_vOldPos = D3DXVECTOR3(900.0f, 0.0f, 400.0f);					
						}
					else if ((pInputDeviceState->AxisGear >= 74 && pInputDeviceState->AxisGear <= 80)&&(OldGear == 0))
						{m_pCar->m_iGear = 6; 
						 m_vOldPos = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
						}
					

					
					
					
					
					// if gear changed
			//	if (Old1 == m_pCar->m_iGear && Old1 != Old2)
			//	{
			//		Old3 = Old2;
			//		Old2 = Old1;
			//		Flag = true;

			//	}
					
				
					//if (m_pCar->m_iGear != GearTemp) GearTemp2 = 1;
					
					
					// if gear changes without clutch push
					if ((OldGear != m_pCar->m_iGear)&&(pInputDeviceState->AxisClutch > 35))					
					{						
						EngineOFF();
					}
					else { OldGear = m_pCar->m_iGear;	}

									
					break;

				case INPUT_LEFT:
					if(!m_bClearSW)
					{
					m_UserInput.Light = 1;
					LightStat = 1;
					m_bClearSW = true;
					}
					else
					{
						LightStat = 3;
						m_bClearSW = false;
					}
					break;
					
				case INPUT_RIGHT:
					
					if(!m_bClearSW)
					{
					m_UserInput.Light = 2;
					LightStat = 2;
					m_bClearSW = true;
					}
					else 
					{
						LightStat = 3;
						m_bClearSW = false;
					}
					break;

				case INPUT_ON:		// Engine Check true = Can Start
					if (!m_bClearSW2)
					{
						Engine = 1;
						m_bClearSW2 = true;

						if ((m_pCar->m_iGear == 0)||((m_pCar->m_iGear > 0)&&(pInputDeviceState->AxisClutch < 35))) 
						{												
								if (EngineCheck)
								{							
									EngineCheck = false; 
									PlaySegment(3);									
									m_pCar->EngineState = true;
									m_pCar->m_iRPM = 800;
								}
						}
					}
					else
					{
						Engine = 3;				// NONE
						m_bClearSW2 = false;					
					}
					break;
					
				case INPUT_OFF:					
					if (!m_bClearSW2)
					{
					m_UserInput.EngineState = 2;	// OFF							
					//m_pCar->EngineState = false;
					//m_pCar->m_iRPM = 0;
					EngineOFF();
					Engine = 2;	
					m_bClearSW2 = true;
					EngineCheck = true;		// can start Engine Now
					}
					else 
					{
						Engine = 3;					// NONE
						m_bClearSW2 = false;					
					}
					
					break;
				
				case INPUT_MENU_1:
					
					break;

				case INPUT_MENU_2:
					PlaySegment(6);
					break;

				case INPUT_MENU_3:

					break;

				case INPUT_MENU_4:

					break;

				// Handle buttons separately so the button state data
                // doesn't overwrite the axis state data, and handle
                // each button separately so they don't overwrite each other
                case INPUT_PLAY_SOUND:   pInputDeviceState->bButtonPlaySoundButtonDown = bButtonState; break;

                // Handle one-shot buttons
                case INPUT_CONFIG_INPUT:   if( bButtonState ) pUserInput->bDoConfigureInput = TRUE; break;
                case INPUT_CONFIG_DISPLAY:  if( bButtonState ) pUserInput->bDoConfigureDisplay = TRUE; 
					break;
            }
        }
    }

    // TODO: change process code as needed

    // Process user input and store result into pUserInput struct
	pUserInput->AxisAccel = 0.0f;
    pUserInput->AxisBrake = 0.0f;
	pUserInput->AxisSteer = 0.0f;
	pUserInput->AxisClutch = 0.0f;
	pUserInput->AxisGear = 0.0f;
    pUserInput->bPlaySoundButtonDown = FALSE;

    // Concatinate the data from all the DirectInput devices
    for( i=0; i<dwNumDevices; i++ )
    {
        InputDeviceState* pInputDeviceState = (InputDeviceState*) pDeviceInfos[i].pParam;

        // Use the axis data that is furthest from zero
       if( fabs(pInputDeviceState->AxisAccel) > fabs(pUserInput->AxisAccel) )
            pUserInput->AxisAccel = pInputDeviceState->AxisAccel;

        if( fabs(pInputDeviceState->AxisBrake) > fabs(pUserInput->AxisBrake) )
            pUserInput->AxisBrake = pInputDeviceState->AxisBrake;
		
        if( fabs(pInputDeviceState->AxisClutch) > fabs(pUserInput->AxisClutch) )
            pUserInput->AxisClutch = pInputDeviceState->AxisClutch;
				
        if( fabs(pInputDeviceState->AxisGear) > fabs(pUserInput->AxisGear) )
            pUserInput->AxisGear = pInputDeviceState->AxisGear;

        if( fabs(pInputDeviceState->AxisSteer) > fabs(pUserInput->AxisSteer) )
            pUserInput->AxisSteer = pInputDeviceState->AxisSteer;

		if( pInputDeviceState->bButtonPlaySoundButtonDown )
            pUserInput->bPlaySoundButtonDown = TRUE;
		
		if (LightStat != 3)
		{
			if (m_UserInput.Light == 1)	LightStat = 1;
			else if (m_UserInput.Light == 2)	LightStat = 2;
		}

		if (Engine != 3)
		{													
			if (m_UserInput.EngineState == 1) Engine = 1;
			else if (m_UserInput.EngineState == 2) Engine = 2;
		}

		else if( pInputDeviceState->bButtonRotateRight )
		{
			if ( m_pCar->m_fWheelDirection < 45.0f) 
				m_pCar->m_fWheelDirection = m_pCar->m_fWheelDirection + 1.0f;
		}

		if (m_pCar->EngineState)
		{	
			if (pInputDeviceState->AxisAccel >= 60.0f && pInputDeviceState->AxisAccel <=  69.0f){Accel = 0;}			
			else if (pInputDeviceState->AxisAccel > 69.0f && pInputDeviceState->AxisAccel <=  70.0f){Accel = 1;}			
			else if (pInputDeviceState->AxisAccel > 70.0f && pInputDeviceState->AxisAccel <=  71.0f){Accel = 2;}			
			else if (pInputDeviceState->AxisAccel > 71.0f && pInputDeviceState->AxisAccel <=  73.0f){Accel = 3;}			
			else if (pInputDeviceState->AxisAccel > 73.0f && pInputDeviceState->AxisAccel <=  75.0f){Accel = 4;}			
			else if (pInputDeviceState->AxisAccel > 75.0f && pInputDeviceState->AxisAccel <=  77.0f){Accel = 5;}			
			else if (pInputDeviceState->AxisAccel > 77.0f && pInputDeviceState->AxisAccel <=  80.0f){Accel = 6;}						
			else if (pInputDeviceState->AxisAccel > 80.0f && pInputDeviceState->AxisAccel <=  85.0f){Accel = 7;}						
		}

        
			if (pInputDeviceState->AxisBrake > 93.0f && pInputDeviceState->AxisBrake < 97) Brake = 0;
			else if(pInputDeviceState->AxisBrake == 93.0f) Brake = 3;
			else if (pInputDeviceState->AxisBrake == 92.0f) Brake = 6;
			else if (pInputDeviceState->AxisBrake == 91.0f) Brake = 9;
			else if (pInputDeviceState->AxisBrake == 90.0f) Brake = 15;
			else if (pInputDeviceState->AxisBrake == 89.0f) Brake = 20;
			else if (pInputDeviceState->AxisBrake == 88.0f) Brake = 25;
			else if (pInputDeviceState->AxisBrake <= 87.0f && pInputDeviceState->AxisBrake > 80) Brake = 35;				
	
	
        /*if( pInputDeviceState->AxisBrake > 0.0f && pInputDeviceState->AxisBrake <= 15.0f )
		{
			Accel = -40;
		} 
        if( pInputDeviceState->AxisBrake > 15.0f && pInputDeviceState->AxisBrake <= 30.0f )
		{
			Accel = -20;
		} 
        if( pInputDeviceState->AxisBrake > 30.0f && pInputDeviceState->AxisBrake <= 45.0f )
		{
			Accel = -10;
		} */

/*		{
//			if( m_UserInput.AxisAccel <= 93.00 )
//			{
				if(!isHit())
				{	
					if( m_pCar->m_fVelocity > 0 && m_pCar->m_iGear == 6)
					{
						m_pCamera->walk( (m_pCar->m_fVelocity/100.00f) * float(-cos( (m_pCar->m_fWheelDirection/180)*D3DX_PI)) );
						m_pCamera->yaw( float(-sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50 );
						m_fRotationY = m_fRotationY - float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50;
					}
					if( m_pCar->m_fVelocity > 0 && m_pCar->m_iGear != 6)
					{
						m_pCamera->walk( (m_pCar->m_fVelocity/100.00f) * float(cos( (m_pCar->m_fWheelDirection/180)*D3DX_PI)) );
						m_pCamera->yaw( float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50 );
						m_fRotationY = m_fRotationY + float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI))/50;
					}
				}  
				if(m_pCar->m_fVelocity > 0)
				m_pCar->m_fVelocity = m_pCar->m_fVelocity-0.1f;
//			}
		}*/
    } 
}




//-----------------------------------------------------------------------------
// Name: Render()
// Desc: Render the scene based on current state of the app
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::Render()
{
    // Render the scene based on current state of the app
    switch( m_dwAppState )
    {
        case APPSTATE_LOADMENU:
			m_pd3dDevice->Clear( 0L, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER,
                         0xfffffff, 1.0f, 0L );
            // Nothing to render while loading the splash screen
            break;

        case APPSTATE_DISPLAYMENU:
//            RenderSplash();
//            g_pd3dDevice->Present( 0, 0, 0, 0 );
            break;

        case APPSTATE_LOADVIDEO:
            // Nothing to render while starting sound to advance a level
            break;

        case APPSTATE_DISPLAYVIDEO:
			  PlaySegment(5);
			  RenderVideo();
//		      m_dwAppState = APPSTATE_ACTIVE; 
            break;

		case APPSTATE_BEGINACTIVESCREEN:
			break;

        case APPSTATE_ACTIVE:
            RenderFrame();
            m_pd3dDevice->Present( 0, 0, 0, 0 );
			break;

        case APPSTATE_WAITFOREND:
            break;
    }
    return S_OK;
}



HRESULT CMyD3DApplication::RenderVideo()
{
	HRESULT hr;

	m_pd3dDevice->Clear( 0L, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER,
                        0xfffffff, 1.0f, 0L );

	hr = pGB->RenderFile(L"highway.avi", NULL);
	pVW->put_FullScreenMode(OATRUE);

	if (SUCCEEDED(hr))
	{
		// Run the graph.
		hr = pMC->Run();
		if (SUCCEEDED(hr))
		{
			// Wait for completion.
			long msTimeout=90000;
			long evCode;
			pME->WaitForCompletion(msTimeout, &evCode);

			// Note: Do not use INFINITE in a real application, because it
			// can block indefinitely.
		}
	}
		pMC->Release();
		pME->Release();
		pVW->Release();
		pGB->Release();
		CoUninitialize();
		m_dwAppState = APPSTATE_ACTIVE; 

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: Render()
// Desc: Called once per frame, the call is the entry point for 3d
//       rendering. This function sets up render states, clears the
//       viewport, and renders the scene.
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::RenderFrame()
{
	D3DXMATRIX matWorld;
	D3DXMATRIX matTran;
	D3DXMATRIX matScal;
	D3DXMATRIX matRotX;
	D3DXMATRIX matRotY;
	D3DXMATRIX matRotZ;
	D3DXMATRIX matIden;
	D3DXMATRIX matRotL;
	D3DMATERIAL9 red;
	D3DVIEWPORT9 worldVP;

	// Init materail
    D3DUtil_InitMaterial( red, 1.0f, 1.0f, 0.0f );


	D3DXMatrixIdentity(&matIden);

    // Clear the viewport
    m_pd3dDevice->Clear( 0L, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER | D3DCLEAR_STENCIL,
                         0xfffffff, 1.0f, 0L );

    // Begin the scene
    if( SUCCEEDED( m_pd3dDevice->BeginScene() ) )
    {
        // TODO: render world

        m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, FALSE );
        
		/////////////////////////////////////////
		// Render in the terrain vertex buffer //
		/////////////////////////////////////////

		// Render road plane
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
		m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -25.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -75.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 25.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 75.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 125.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 175.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 225.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 275.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 325.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 375.0f);
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 375.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
		D3DXMatrixRotationY( &matRotY, D3DX_PI );
		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 375.0f);
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 325.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 275.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
		D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 225.0f);
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
		D3DXMatrixRotationY( &matRotY, D3DX_PI );
		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 125.0f);
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 75.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 25.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -25.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
		D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -75.0f);
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
		D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 225.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 225.0f, 0.0f, 175.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// corner
		m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
		D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
		// This is for crossroad
		m_pd3dDevice->SetTexture( 0, m_pCrossRoadTexture );
		D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
		D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 125.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, -75.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 175.0f);
		D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		// Entire grass plane
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
		m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pGrassTexture );
		D3DXMatrixTranslation(&matTran, 5.0f, -0.2f, 0.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);

		// other road
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
		m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
		D3DXMatrixTranslation(&matTran, 0.0f, 0.0f, 0.0f);
		D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);

		////////////////////////////////////////
		// Render in the skybox vertex buffer //
		////////////////////////////////////////

		// Render skybox
			// Top
		m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pTopSkyboxTexture );
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
			// Front
		m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pFrontSkyboxTexture );
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);
			// Left
		m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pLeftSkyboxTexture );
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);
			// Right
		m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pRightSkyboxTexture );
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 18, 2);
			// Back
		m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pBackSkyboxTexture );
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 24, 2);

        m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, TRUE );
 
		////////////////////////////////////////////////
		// Render outside the allocated vertex buffer //
		////////////////////////////////////////////////

		// Render car
		m_pCamera->getPosition(&m_vPos);

		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x-(3.0f*m_pCamera->m_vLook.z)+(4.5f*m_pCamera->m_vLook.x), m_vPos.y-3.5f, m_vPos.z+(4.5f*m_pCamera->m_vLook.z)+(3.0f*m_pCamera->m_vLook.x));
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		D3DXMatrixScaling(&matScal, 0.3f, 0.3f, 0.3f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pCarbody->Render(m_pd3dDevice);

		// Render the bridge
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 500.0f, 26.0f, 225.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.3f, 0.2f, 0.15f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pBridge->Render( m_pd3dDevice );

		// Render house1
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 400.0f, 37.0f, 424.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pHouse1->Render( m_pd3dDevice );

		// Render fence 1
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 400.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 2
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 370.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 3
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 340.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 4
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 310.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 5
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 280.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 6
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 250.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 7
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 220.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 8
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 190.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 9
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 160.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 10
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 130.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 11
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 100.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 12
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 70.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 13
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 40.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 14
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 10.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 15
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -20.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 16
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -50.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render fence 17
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -80.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pFence1->Render( m_pd3dDevice );

		// Render gate1
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixTranslation(&matTran, -95.5f, 15.5f, 150.0f);
		D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
		D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.02f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pGate->Render( m_pd3dDevice );

		// Render gate2
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixTranslation(&matTran, 295.5f, 15.5f, 149.0f);
		D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
		D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.054f, 0.05f, 0.02f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pGate->Render( m_pd3dDevice );

		// Render wall1
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 93.0f, 9.0f, 95.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixScaling(&matScal, 1.0f, 1.0f, 1.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWall1->Render( m_pd3dDevice );

		// Render wall2
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 113.0f, 9.0f, 125.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWall1->Render( m_pd3dDevice );

		// Render wall3
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 72.0f, 9.0f, 125.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWall1->Render( m_pd3dDevice );

		// Render wire fence 1
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 350.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixScaling(&matScal, 0.525f, 0.2f, 0.1f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWireFence->Render( m_pd3dDevice );

		// Render wire fence 2
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 195.0f, 7.0f, 250.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWireFence->Render( m_pd3dDevice );

		// Render wire fence 3
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 950.0f, 7.0f, 200.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWireFence->Render( m_pd3dDevice );

		// Render wire fence 4
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 200.0f, 7.0f, 100.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.1f, 0.2f, 0.1f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWireFence->Render( m_pd3dDevice );

		// Render wire fence 5
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 255.0f, 7.0f, 150.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWireFence->Render( m_pd3dDevice );

		// Render wire fence 6
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 100.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWireFence->Render( m_pd3dDevice );

		// Render stand1 
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, -58.0f, -5.0f, 225.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.5f, 0.5f, 0.5f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pGrandStand->Render( m_pd3dDevice );

		// Render stand2 
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 700.0f, -5.0f, -138.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pGrandStand->Render( m_pd3dDevice );

		// Render stand3 
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 250.0f, -5.0f, -138.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pGrandStand->Render( m_pd3dDevice );

//    	m_pd3dDevice->SetMaterial( &red );
//        m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, TRUE );

		// Render White block 1
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, -10.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 1
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 10.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 30.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 50.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 3
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 70.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 3
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 90.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 4
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 110.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 4
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 130.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 5
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 150.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 5
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 170.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 6
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 190.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 6
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 210.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 7
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 230.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 7
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 250.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 8
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 270.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 8
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 290.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 9
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 310.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 9
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 330.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 10
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 350.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 10
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 370.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 11
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 390.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 11
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 410.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 12
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 430.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 12
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 450.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 13
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 470.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 13
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 490.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 14
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 510.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 14
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 530.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 15
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 550.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 15
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 570.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 16
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 590.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 16
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 610.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 17
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 630.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 17
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 650.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 18
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 670.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 18
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 690.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 19
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 710.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 19
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 730.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 20
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 750.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 20
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 770.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 21
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 790.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 21
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 810.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 22
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 830.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 22
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 850.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 23
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 870.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 23
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 890.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 24
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 910.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 24
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 930.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 25
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 950.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 25
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 970.0f, 3.9f, 403.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Change edge
		// Render White block 1
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 40.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 1
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 60.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 80.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 100.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 3
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 120.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 3
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 140.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 4
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 160.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 4
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 180.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 5
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 200.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 5
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 220.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 6
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 240.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 6
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 260.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 7
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 280.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 7
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 300.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 8
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 320.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 8
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 340.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 9
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 360.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 9
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 380.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 10
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 400.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 10
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 420.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 11
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 440.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 11
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 460.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 12
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 480.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 12
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 500.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 13
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 520.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 13
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 540.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 14
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 560.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 14
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 580.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 15
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 600.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 15
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 620.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 16
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 640.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 16
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 660.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 17
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 680.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 17
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 700.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 18
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 720.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 18
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 740.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 19
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 760.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 19
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 780.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 20
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 800.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render Red block 20
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 820.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pRedBlock->Render( m_pd3dDevice );

		// Render White block 21
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 836.0f, 1.1f, -48.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.15f, 0.1f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pWhiteBlock->Render( m_pd3dDevice );

		// Render the palace for car start
//    	m_pd3dDevice->SetMaterial( &red );
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, -70.0f, -2.0f, -30.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.5f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pPalace->Render( m_pd3dDevice );

		// Render the concrete 1
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 37.0f, 1.0f, 202.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 51.0f, 1.0f, 202.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 3
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 65.0f, 1.0f, 202.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 4
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 76.0f, 1.0f, 202.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );
		// change direction
		// Render the concrete 5
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 210.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 6
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 224.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 7
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 238.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 8
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 252.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 9
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 266.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 10
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 280.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 11
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 294.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 12
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 308.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 13
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 322.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 14
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 336.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 15
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 347.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// change edge
		// Render the concrete 16
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 143.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 17
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 129.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 18
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 115.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 19
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 101.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 20
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 87.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 21
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 73.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 22
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 59.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 23
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 45.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 24
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 31.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 25
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 17.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 26
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 3.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 27
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -11.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 28
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -25.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the concrete 29
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -39.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pConcreteBlock->Render( m_pd3dDevice );

		// Render the second task block
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 430.0f, 2.5f, 385.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.07f, 0.07f, 0.045f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pSecondTask->Render( m_pd3dDevice );

		// Render cross road
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, -20.0f, 4.0f, 120.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pSideRoad->Render( m_pd3dDevice );

		// Render turn right
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, -20.0f, 4.0f, 340.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pTurnRight->Render( m_pd3dDevice );

		// Render  Uturn right 1
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 830.0f, 4.0f, 400.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pUTurn->Render( m_pd3dDevice );

		// Render Uturn left 2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 270.0f, 4.0f, 200.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pUTurn->Render( m_pd3dDevice );

		// Render turn right 2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 810.0f, 4.0f, 150.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pTurnRight->Render( m_pd3dDevice );

		// Render turn right 3
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 928.0f, 4.0f, -10.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pTurnRight->Render( m_pd3dDevice );

		// Render turn right 4
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 60.0f, 4.0f, -50.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pTurnRight->Render( m_pd3dDevice );

		// Render mission1
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 40.0f, 4.0f, 200.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pMission1->Render( m_pd3dDevice );

		// Render mission2
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 330.0f, 4.0f, 400.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pMission2->Render( m_pd3dDevice );

		// Render mission3
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 800.0f, 4.0f, 200.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pMission3->Render( m_pd3dDevice );

/*		// Render speed limit
		D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
		D3DXMatrixTranslation(&matTran, 0.0f, 4.0f, 50.0f);
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		D3DXMatrixRotationZ( &matRotY, D3DX_PI );
		D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
		D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.06f);
		D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pSpeedLimit->Render( m_pd3dDevice );*/

		// Render The wall
		m_pd3dDevice->SetTexture( 0, m_pRoadTexture );

		D3DXMatrixTranslation(&matTran, 252.5f, 0.0f, 172.5f);		
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matTran);
		m_pWall[5]->DrawSubset(0);

		D3DXMatrixTranslation(&matTran, 162.5f, 0.0f, 190.0f);		
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matTran);
		m_pWall[13]->DrawSubset(0);

		D3DXMatrixTranslation(&matTran, 120.0f, 0.0f, 232.5f);		
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matTran);
		m_pWall[14]->DrawSubset(0);

		D3DXMatrixTranslation(&matTran, 77.5f, 0.0f, 217.5f);		
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matTran);
		m_pWall[15]->DrawSubset(0);

		D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 297.5f);		
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matTran);
		m_pWall[19]->DrawSubset(0);

		D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 22.5f);		
		D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matTran);
		m_pWall[23]->DrawSubset(0);

		/////////////////////////////////////////
		// Render in the console vertex buffer //
		/////////////////////////////////////////

		m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, FALSE );

		// Retrieve world viewport before change
		m_pd3dDevice->GetViewport( &worldVP );

		// Set up each viewport
		D3DVIEWPORT9 velocityVP = { 282, 545, 220, 150, 0.0f, 1.0f };	
		D3DVIEWPORT9 accelVP = { 522, 545, 220, 150, 0.0f, 1.0f };	

		// Render console
		// background
		m_pd3dDevice->SetStreamSource(0, m_pConsoleVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pConsoleTexture );
		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		// The indicator of velocity
		m_pd3dDevice->SetViewport( &velocityVP );

		m_pd3dDevice->SetStreamSource(0, m_pConsoleVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, 0 );

		D3DXMatrixRotationZ( &matRotL, 2.20f - (m_pCar->m_fVelocity/32.00f));
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotL);

		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f+5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 1);

		// The indicator of accel
		m_pd3dDevice->SetViewport( &accelVP );

//		D3DXMatrixRotationZ( &matRotL, 2.0f - (m_pCar->m_iRPM/1000.00f));
		D3DXMatrixRotationZ( &matRotL, 2.0f - (m_pCar->m_iRPM/1666.00f));
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotL);

		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f+5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 9, 1);

		// Return to world viewport
		m_pd3dDevice->SetViewport( &worldVP );

		// Left light
		if(m_iTimeDelay > 15 && LightStat == 1)
		{
		m_pd3dDevice->SetStreamSource(0, m_pConsoleVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pLeftRightTexture );
//		m_pd3dDevice->SetMaterial(&red);

		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 1);
		PlaySegment(7);
		}

		if (m_iTimeDelay > 15 && LightStat == 2)
		{
		// Right right
		m_pd3dDevice->SetStreamSource(0, m_pConsoleVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, m_pLeftRightTexture );
//		m_pd3dDevice->SetMaterial(&green);

		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 15, 1);
		PlaySegment(7);
		}
		m_iTimeDelay--;
		if(m_iTimeDelay==0)  
			m_iTimeDelay = 30;


		////////////////////////////////////////
		// Render in the mirror vertex buffer //
		////////////////////////////////////////

		// Retrieve world viewport before change
		m_pd3dDevice->GetViewport( &worldVP );

		// Set up each viewport
		D3DVIEWPORT9 backMirrorVP = { 300, 50, 400, 150, 0.0f, 1.0f };	
		D3DVIEWPORT9 leftMirrorVP = { 20, 500, 450, 300, 0.0f, 1.0f };	
		D3DVIEWPORT9 rightMirrorVP = { 550, 500, 450, 300, 0.0f, 1.0f };	

		// Render mirror
		// Back
		m_pd3dDevice->SetViewport( &backMirrorVP );

		m_pd3dDevice->SetStreamSource(0, m_pMirrorVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

		// Render back mirror
		RenderBackMirror();

		// Left
		m_pd3dDevice->SetViewport( &leftMirrorVP );

		m_pd3dDevice->SetStreamSource(0, m_pMirrorVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);

		// Render  left mirror
		RenderLeftMirror();

		// Right
		m_pd3dDevice->SetViewport( &rightMirrorVP );

		m_pd3dDevice->SetStreamSource(0, m_pMirrorVB, 0, sizeof(Vertex));
		m_pd3dDevice->SetFVF(Vertex::FVF);
		m_pd3dDevice->SetTexture( 0, 0 );
		D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
		D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

		D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
		D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

		m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
		m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);

		// Render right mirror
		RenderRightMirror();

		// Return Light state
	    m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, TRUE );

		// Return to world viewport
		m_pd3dDevice->SetViewport( &worldVP );

        // Render stats and help text  
        RenderText();

        // End the scene.
        m_pd3dDevice->EndScene();
    }

    return S_OK;
}




HRESULT CMyD3DApplication::RenderBackMirror()
{
	D3DXMATRIX matWorld;
	D3DXMATRIX matTran;
	D3DXMATRIX matScal;
	D3DXMATRIX matRotX;
	D3DXMATRIX matRotY;
	D3DXMATRIX matRotZ;
	D3DXMATRIX matIden;
    D3DXPLANE  plane;

	D3DXMatrixIdentity(&matIden);

	//
	// Draw Mirror quad to stencil buffer ONLY.  In this way
	// only the stencil bits that correspond to the mirror will
	// be on.  Therefore, the reflected teapot can only be rendered
	// where the stencil bits are turned on, and thus on the mirror 
	// only.
	//

    m_pd3dDevice->SetRenderState(D3DRS_STENCILENABLE,    true);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILFUNC,      D3DCMP_ALWAYS);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILREF,       0x1);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILMASK,      0xffffffff);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILWRITEMASK, 0xffffffff);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILZFAIL,     D3DSTENCILOP_KEEP);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILFAIL,      D3DSTENCILOP_KEEP);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILPASS,      D3DSTENCILOP_REPLACE);

	// disable writes to the depth and back buffers
    m_pd3dDevice->SetRenderState(D3DRS_ZWRITEENABLE, false);
//    m_pd3dDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, true);
    m_pd3dDevice->SetRenderState(D3DRS_SRCBLEND,  D3DBLEND_ZERO);
    m_pd3dDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);

    // draw the mirror to the stencil buffer
	// Back
	m_pd3dDevice->SetStreamSource(0, m_pMirrorVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
	D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

	D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
	D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	// re-enable depth writes
	m_pd3dDevice->SetRenderState( D3DRS_ZWRITEENABLE, true );

	// only draw reflected teapot to the pixels where the mirror
	// was drawn to.
	m_pd3dDevice->SetRenderState(D3DRS_STENCILFUNC,  D3DCMP_EQUAL);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILPASS,  D3DSTENCILOP_KEEP);

	D3DXVECTOR3 point1 = m_vPos;
	D3DXVECTOR3 point2 = m_vPos+m_pCamera->m_vUp;
	D3DXVECTOR3 point3 = m_vPos+m_pCamera->m_vRight;

	// position reflection
	D3DXMATRIX W, T, R;
    D3DXPlaneFromPoints( &plane, &point1, &point2, &point3 );	
	D3DXMatrixReflect(&R, &plane);

	m_pCamera->getPosition(&m_vPos);

	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
	D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

	D3DXMatrixTranslation(&matTran, m_vPos.x-(3.0f*m_pCamera->m_vLook.z)+(4.5f*m_pCamera->m_vLook.x), m_vPos.y-3.5f, m_vPos.z+(4.5f*m_pCamera->m_vLook.z)+(3.0f*m_pCamera->m_vLook.x));
	D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

	D3DXMatrixScaling(&matScal, 0.3f, 0.3f, 0.3f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );

	// USE THIS SECTION FOR MOVE THE MIRROR UP
	D3DXMatrixTranslation(&matTran, 0.0f, 0.0f, 0.0f);
	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vRight, 0.1f);
	D3DXMatrixScaling(&matScal, 1.0f, 1.0f, 1.0f);

	D3DXMatrixMultiply( &W, &matIden, &R );

	// clear depth buffer and blend the reflected teapot with the mirror
	m_pd3dDevice->Clear(0, 0, D3DCLEAR_ZBUFFER, 0, 1.0f, 0);
	m_pd3dDevice->SetRenderState(D3DRS_SRCBLEND,  D3DBLEND_DESTCOLOR);
    m_pd3dDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ZERO);

	// Finally, draw the reflected teapot
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &W);

	m_pd3dDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);

	// render everthing to the stencil buffer

	/////////////////////////////////////////
	// Render in the terrain vertex buffer //
	/////////////////////////////////////////

	m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, FALSE );

	// Render road plane
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 175.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 275.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 325.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 375.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 375.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 325.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 275.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -75.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 225.0f, 0.0f, 175.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);	
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 175.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	// Entire plane
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pGrassTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, -0.2f, 0.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);

	// other road
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 0.0f, 0.0f, 0.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);

	////////////////////////////////////////
	// Render in the skybox vertex buffer //
	////////////////////////////////////////

	// Render skybox
//	m_pd3dDevice->SetTransform(D3DTS_WORLD, &W);
	// Top
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pTopSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// Front
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pFrontSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);
	// Left
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pLeftSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);
	// Right
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pRightSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 18, 2);
	// Back
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pBackSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 24, 2);

    m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, TRUE );

	////////////////////////////////////////////////
	// Render outside the allocated vertex buffer //
	////////////////////////////////////////////////

	// Render bridge
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 500.0f, 26.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.3f, 0.2f, 0.15f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pBridge->Render( m_pd3dDevice );

	// Render house1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 400.0f, 37.0f, 424.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pHouse1->Render( m_pd3dDevice );

	// Render fence 1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 400.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 370.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 340.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 4
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 310.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 5
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 280.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 6
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 250.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 7
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 220.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 8
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 190.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 9
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 160.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 10
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 130.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 11
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 12
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 70.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 13
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 40.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 14
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 10.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 15
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -20.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 16
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -50.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 17
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -80.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render gate1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixTranslation(&matTran, -93.0f, 15.5f, 150.0f);
	D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
	D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.02f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGate->Render( m_pd3dDevice );

	// Render gate2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixTranslation(&matTran, 293.0f, 15.5f, 149.0f);
	D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
	D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );	
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.054f, 0.05f, 0.02f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGate->Render( m_pd3dDevice );

	// Render wall1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 93.0f, 9.0f, 95.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wall2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 113.0f, 9.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wall3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 72.0f, 9.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wire fence 1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 350.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.525f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 195.0f, 7.0f, 250.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 950.0f, 7.0f, 200.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 4
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 200.0f, 7.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.1f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 5
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 255.0f, 7.0f, 150.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 6
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render stand1 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -58.0f, -5.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.5f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render stand2 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 700.0f, -5.0f, -138.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render stand3 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 250.0f, -5.0f, -138.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render White block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -10.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 10.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 30.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 50.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 70.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 90.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 110.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 130.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 150.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 170.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 190.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 210.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 230.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 250.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 270.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 290.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 310.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 330.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 350.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 370.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 390.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 410.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 430.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 450.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 470.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 490.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 510.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 530.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 550.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 570.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 590.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 610.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 630.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 650.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 670.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );	
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 690.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 710.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 730.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 750.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 770.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 790.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 810.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 830.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 870.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 890.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 910.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 930.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 950.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 970.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );
		
	// Change edge
	// Render White block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 40.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 60.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 80.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 100.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 120.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 140.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 160.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 180.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 200.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 220.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 240.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 260.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 280.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 300.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 320.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 340.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 360.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 380.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 400.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 420.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 440.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 460.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 480.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 500.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 520.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 540.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 560.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 580.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 600.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 620.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 640.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 660.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 680.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 700.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 720.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 740.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 760.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 780.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 800.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 820.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 836.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.15f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render the palace for car start
//  m_pd3dDevice->SetMaterial( &red );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -70.0f, -2.0f, -30.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pPalace->Render( m_pd3dDevice );

	// Render the concrete 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 37.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 51.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 65.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 76.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );
	// change direction
	// Render the concrete 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 210.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 224.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 238.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 252.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 266.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 280.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 294.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 308.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 322.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 336.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 347.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// change edge
	// Render the concrete 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 143.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 129.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 115.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 101.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 87.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 73.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 59.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 45.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 31.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 17.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 26
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 3.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 27
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -11.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 28
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 29
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -39.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );
		
	// Render The wall
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );

	D3DXMatrixTranslation(&matTran, 162.5f, 0.0f, 190.0f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[13]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 120.0f, 0.0f, 232.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[14]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 77.5f, 0.0f, 217.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[15]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 297.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[19]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 22.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[23]->DrawSubset(0);
	
	// Restore render states.
	m_pd3dDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, false);
	m_pd3dDevice->SetRenderState( D3DRS_STENCILENABLE, false);
	m_pd3dDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	return S_OK;
}




HRESULT CMyD3DApplication::RenderLeftMirror()
{
	D3DXMATRIX matWorld;
	D3DXMATRIX matTran;
	D3DXMATRIX matScal;
	D3DXMATRIX matRotX;
	D3DXMATRIX matRotY;
	D3DXMATRIX matRotZ;
	D3DXMATRIX matIden;
    D3DXPLANE  plane;

	D3DXMatrixIdentity(&matIden);

	//
	// Draw Mirror quad to stencil buffer ONLY.  In this way
	// only the stencil bits that correspond to the mirror will
	// be on.  Therefore, the reflected teapot can only be rendered
	// where the stencil bits are turned on, and thus on the mirror 
	// only.
	//

    m_pd3dDevice->SetRenderState(D3DRS_STENCILENABLE,    true);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILFUNC,      D3DCMP_ALWAYS);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILREF,       0x1);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILMASK,      0xffffffff);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILWRITEMASK, 0xffffffff);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILZFAIL,     D3DSTENCILOP_KEEP);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILFAIL,      D3DSTENCILOP_KEEP);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILPASS,      D3DSTENCILOP_REPLACE);

	// disable writes to the depth and back buffers
    m_pd3dDevice->SetRenderState(D3DRS_ZWRITEENABLE, false);
    m_pd3dDevice->SetRenderState(D3DRS_SRCBLEND,  D3DBLEND_ZERO);
    m_pd3dDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);

    // draw the mirror to the stencil buffer
	// Left
	m_pd3dDevice->SetStreamSource(0, m_pMirrorVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
	D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

	D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
	D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);

	// re-enable depth writes
	m_pd3dDevice->SetRenderState( D3DRS_ZWRITEENABLE, true );

	// only draw reflected teapot to the pixels where the mirror
	// was drawn to.
	m_pd3dDevice->SetRenderState(D3DRS_STENCILFUNC,  D3DCMP_EQUAL);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILPASS,  D3DSTENCILOP_KEEP);

	D3DXVECTOR3 point1 = m_vPos;
	D3DXVECTOR3 point2 = m_vPos+m_pCamera->m_vUp;
	D3DXVECTOR3 point3 = m_vPos+m_pCamera->m_vRight;

	// position reflection
	D3DXMATRIX W, T, R;
    D3DXPlaneFromPoints( &plane, &point1, &point2, &point3 );	
	D3DXMatrixReflect(&R, &plane);

	m_pCamera->getPosition(&m_vPos);

	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
	D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

	D3DXMatrixTranslation(&matTran, m_vPos.x-(3.0f*m_pCamera->m_vLook.z)+(4.5f*m_pCamera->m_vLook.x), m_vPos.y-3.5f, m_vPos.z+(4.5f*m_pCamera->m_vLook.z)+(3.0f*m_pCamera->m_vLook.x));
	D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

	D3DXMatrixScaling(&matScal, 0.3f, 0.3f, 0.3f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );

	// USE THIS SECTION FOR MOVE THE MIRROR UP
	D3DXMatrixTranslation(&matTran, 0.0f, 0.0f, 0.0f);
	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vRight, 0.1f);
	D3DXMatrixScaling(&matScal, 1.0f, 1.0f, 1.0f);

	D3DXMatrixMultiply( &W, &matTran, &R );

	// clear depth buffer and blend the reflected teapot with the mirror
	m_pd3dDevice->Clear(0, 0, D3DCLEAR_ZBUFFER, 0, 1.0f, 0);
	m_pd3dDevice->SetRenderState(D3DRS_SRCBLEND,  D3DBLEND_DESTCOLOR);
    m_pd3dDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ZERO);

	// Finally, draw the reflected teapot
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &W);

	m_pd3dDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);

	// Render everthing to stencil buffer

	/////////////////////////////////////////
	// Render in the terrain vertex buffer //
	/////////////////////////////////////////

	m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, FALSE );

	// Render road plane
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 175.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 275.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 325.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 375.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 375.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 325.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 275.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -75.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 225.0f, 0.0f, 175.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);	
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 175.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	// Entire plane
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pGrassTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, -0.2f, 0.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);

	// other road
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 0.0f, 0.0f, 0.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);

	////////////////////////////////////////
	// Render in the skybox vertex buffer //
	////////////////////////////////////////

	// Render skybox
//	m_pd3dDevice->SetTransform(D3DTS_WORLD, &W);
	// Top
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pTopSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// Front
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pFrontSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);
	// Left
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pLeftSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);
	// Right
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pRightSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 18, 2);
	// Back
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pBackSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 24, 2);

    m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, TRUE );

	////////////////////////////////////////////////
	// Render outside the allocated vertex buffer //
	////////////////////////////////////////////////

	// Render bridge
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 500.0f, 26.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.3f, 0.2f, 0.15f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pBridge->Render( m_pd3dDevice );

	// Render house1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 400.0f, 37.0f, 424.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pHouse1->Render( m_pd3dDevice );

	// Render fence 1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 400.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 370.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 340.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 4
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 310.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 5
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 280.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 6
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 250.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 7
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 220.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 8
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 190.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 9
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 160.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 10
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 130.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 11
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 12
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 70.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 13
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 40.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 14
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 10.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 15
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -20.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 16
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -50.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 17
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -80.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render gate1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixTranslation(&matTran, -93.0f, 15.5f, 150.0f);
	D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
	D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.02f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGate->Render( m_pd3dDevice );

	// Render gate2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixTranslation(&matTran, 293.0f, 15.5f, 149.0f);
	D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
	D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );	
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.054f, 0.05f, 0.02f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGate->Render( m_pd3dDevice );

	// Render wall1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 93.0f, 9.0f, 95.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wall2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 113.0f, 9.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wall3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 72.0f, 9.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wire fence 1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 350.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.525f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 195.0f, 7.0f, 250.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 950.0f, 7.0f, 200.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 4
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 200.0f, 7.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.1f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 5
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 255.0f, 7.0f, 150.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 6
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render stand1 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -58.0f, -5.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.5f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render stand2 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 700.0f, -5.0f, -138.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render stand3 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 250.0f, -5.0f, -138.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render White block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -10.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 10.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 30.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 50.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 70.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 90.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 110.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 130.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 150.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 170.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 190.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 210.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 230.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 250.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 270.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 290.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 310.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 330.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 350.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 370.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 390.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 410.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 430.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 450.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 470.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 490.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 510.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 530.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 550.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 570.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 590.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 610.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 630.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 650.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 670.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );	
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 690.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 710.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 730.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 750.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 770.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 790.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 810.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 830.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 870.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 890.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 910.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 930.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 950.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 970.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );
		
	// Change edge
	// Render White block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 40.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 60.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 80.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 100.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 120.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 140.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 160.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 180.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 200.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 220.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 240.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 260.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 280.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 300.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 320.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 340.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 360.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 380.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 400.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 420.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 440.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 460.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 480.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 500.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 520.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 540.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 560.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 580.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 600.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 620.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 640.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 660.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 680.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 700.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 720.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 740.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 760.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 780.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 800.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 820.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 836.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.15f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render the palace for car start
//  m_pd3dDevice->SetMaterial( &red );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -70.0f, -2.0f, -30.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pPalace->Render( m_pd3dDevice );

	// Render the concrete 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 37.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 51.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 65.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 76.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );
	// change direction
	// Render the concrete 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 210.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 224.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 238.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 252.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 266.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 280.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 294.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 308.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 322.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 336.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 347.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// change edge
	// Render the concrete 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 143.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 129.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 115.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 101.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 87.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 73.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 59.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 45.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 31.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 17.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 26
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 3.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 27
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -11.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 28
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 29
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -39.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );
		
	// Render The wall
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );

	D3DXMatrixTranslation(&matTran, 162.5f, 0.0f, 190.0f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[13]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 120.0f, 0.0f, 232.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[14]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 77.5f, 0.0f, 217.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[15]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 297.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[19]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 22.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[23]->DrawSubset(0);
	
	// Restore render states.
	m_pd3dDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, false);
	m_pd3dDevice->SetRenderState( D3DRS_STENCILENABLE, false);
	m_pd3dDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	return S_OK;
}




HRESULT CMyD3DApplication::RenderRightMirror()
{
	D3DXMATRIX matWorld;
	D3DXMATRIX matTran;
	D3DXMATRIX matScal;
	D3DXMATRIX matRotX;
	D3DXMATRIX matRotY;
	D3DXMATRIX matRotZ;
	D3DXMATRIX matIden;
    D3DXPLANE  plane;

	D3DXMatrixIdentity(&matIden);

	//
	// Draw Mirror quad to stencil buffer ONLY.  In this way
	// only the stencil bits that correspond to the mirror will
	// be on.  Therefore, the reflected teapot can only be rendered
	// where the stencil bits are turned on, and thus on the mirror 
	// only.
	//

    m_pd3dDevice->SetRenderState(D3DRS_STENCILENABLE,    true);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILFUNC,      D3DCMP_ALWAYS);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILREF,       0x1);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILMASK,      0xffffffff);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILWRITEMASK, 0xffffffff);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILZFAIL,     D3DSTENCILOP_KEEP);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILFAIL,      D3DSTENCILOP_KEEP);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILPASS,      D3DSTENCILOP_REPLACE);

	// disable writes to the depth and back buffers
    m_pd3dDevice->SetRenderState(D3DRS_ZWRITEENABLE, false);
    m_pd3dDevice->SetRenderState(D3DRS_SRCBLEND,  D3DBLEND_ZERO);
    m_pd3dDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);

    // draw the mirror to the stencil buffer
	// Right
	m_pd3dDevice->SetStreamSource(0, m_pMirrorVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
	D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

	D3DXMatrixTranslation(&matTran, m_vPos.x, m_vPos.y-5.0f, m_vPos.z);
	D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);

	// re-enable depth writes
	m_pd3dDevice->SetRenderState( D3DRS_ZWRITEENABLE, true );

	// only draw reflected teapot to the pixels where the mirror
	// was drawn to.
	m_pd3dDevice->SetRenderState(D3DRS_STENCILFUNC,  D3DCMP_EQUAL);
    m_pd3dDevice->SetRenderState(D3DRS_STENCILPASS,  D3DSTENCILOP_KEEP);

	D3DXVECTOR3 point1 = m_vPos;
	D3DXVECTOR3 point2 = m_vPos+m_pCamera->m_vUp;
	D3DXVECTOR3 point3 = m_vPos+m_pCamera->m_vRight;

	// position reflection
	D3DXMATRIX W, T, R;
    D3DXPlaneFromPoints( &plane, &point1, &point2, &point3 );	
	D3DXMatrixReflect(&R, &plane);

	m_pCamera->getPosition(&m_vPos);

	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vUp, m_fRotationY);
	D3DXMatrixMultiply( &matWorld, &matIden, &matRotY);

	D3DXMatrixTranslation(&matTran, m_vPos.x-(3.0f*m_pCamera->m_vLook.z)+(4.5f*m_pCamera->m_vLook.x), m_vPos.y-3.5f, m_vPos.z+(4.5f*m_pCamera->m_vLook.z)+(3.0f*m_pCamera->m_vLook.x));
	D3DXMatrixMultiply( &matWorld, &matWorld, &matTran);

	D3DXMatrixScaling(&matScal, 0.3f, 0.3f, 0.3f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );

	// USE THIS SECTION FOR MOVE THE MIRROR UP
	D3DXMatrixTranslation(&matTran, 0.0f, 0.0f, 0.0f);
	D3DXMatrixRotationAxis( &matRotY, &m_pCamera->m_vRight, 0.1f);
	D3DXMatrixScaling(&matScal, 1.0f, 1.0f, 1.0f);

	D3DXMatrixMultiply( &W, &matTran, &R );

	// clear depth buffer and blend the reflected teapot with the mirror
	m_pd3dDevice->Clear(0, 0, D3DCLEAR_ZBUFFER, 0, 1.0f, 0);
	m_pd3dDevice->SetRenderState(D3DRS_SRCBLEND,  D3DBLEND_DESTCOLOR);
    m_pd3dDevice->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ZERO);

	// Finally, draw the reflected teapot
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &W);

	m_pd3dDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);

	// Render everthing to the stencil buffer

	/////////////////////////////////////////
	// Render in the terrain vertex buffer //
	/////////////////////////////////////////

	m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, FALSE );

	// Render road plane
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, -75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 175.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 275.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 325.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 5.0f, 0.0f, 375.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 375.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 375.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 325.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 275.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, D3DX_PI );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 75.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, 25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pCornerRoadTexture );
	D3DXMatrixRotationY( &matRotY, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 905.0f, 0.0f, -75.0f);
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 225.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 225.0f, 0.0f, 175.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// corner
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	m_pd3dDevice->SetTexture( 0, m_pShortRoadTexture );
	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, 125.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 105.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 155.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 205.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 255.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 305.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 355.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 405.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 455.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 505.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);	
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 555.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 605.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 655.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 705.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 755.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 805.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 855.0f, 0.0f, -75.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	D3DXMatrixTranslation(&matTran, 55.0f, 0.0f, 175.0f);
	D3DXMatrixRotationY( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);

	// Entire plane
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pGrassTexture );
	D3DXMatrixTranslation(&matTran, 5.0f, -0.2f, 0.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);

	// other road
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matIden);
	m_pd3dDevice->SetStreamSource(0, m_pTerrainVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );
	D3DXMatrixTranslation(&matTran, 0.0f, 0.0f, 0.0f);
	D3DXMatrixMultiply( &matWorld, &matIden, &matTran );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);

	////////////////////////////////////////
	// Render in the skybox vertex buffer //
	////////////////////////////////////////

	// Render skybox
//	m_pd3dDevice->SetTransform(D3DTS_WORLD, &W);
	// Top
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pTopSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	// Front
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pFrontSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 6, 2);
	// Left
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pLeftSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 12, 2);
	// Right
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pRightSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 18, 2);
	// Back
	m_pd3dDevice->SetStreamSource(0, m_pSkyboxVB, 0, sizeof(Vertex));
	m_pd3dDevice->SetFVF(Vertex::FVF);
	m_pd3dDevice->SetTexture( 0, m_pBackSkyboxTexture );
	m_pd3dDevice->DrawPrimitive(D3DPT_TRIANGLELIST, 24, 2);

    m_pd3dDevice->SetRenderState( D3DRS_LIGHTING, TRUE );

	////////////////////////////////////////////////
	// Render outside the allocated vertex buffer //
	////////////////////////////////////////////////

	// Render bridge
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 500.0f, 26.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.3f, 0.2f, 0.15f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pBridge->Render( m_pd3dDevice );

	// Render house1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 400.0f, 37.0f, 424.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pHouse1->Render( m_pd3dDevice );

	// Render fence 1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 400.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 370.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 340.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 4
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 310.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 5
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 280.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 6
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 250.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 7
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 220.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 8
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 190.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 9
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 160.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 10
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 130.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 11
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 12
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 70.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 13
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 40.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 14
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, 10.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 15
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -20.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 16
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -50.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render fence 17
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 935.0f, 4.0f, -80.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.06f, 0.5f, 0.05f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pFence1->Render( m_pd3dDevice );

	// Render gate1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixTranslation(&matTran, -93.0f, 15.5f, 150.0f);
	D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
	D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.05f, 0.05f, 0.02f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGate->Render( m_pd3dDevice );

	// Render gate2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixTranslation(&matTran, 293.0f, 15.5f, 149.0f);
	D3DXMatrixMultiply( &matWorld, &matTran, &matIden );
	D3DXMatrixRotationX( &matRotY, -D3DX_PI/2 );	
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.054f, 0.05f, 0.02f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGate->Render( m_pd3dDevice );

	// Render wall1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 93.0f, 9.0f, 95.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wall2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 113.0f, 9.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wall3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 72.0f, 9.0f, 125.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 1.3f, 1.0f, 1.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall1->Render( m_pd3dDevice );

	// Render wire fence 1
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 350.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.525f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 2
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 195.0f, 7.0f, 250.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 3
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 950.0f, 7.0f, 200.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 4
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 200.0f, 7.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.1f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 5
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 255.0f, 7.0f, 150.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.43f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render wire fence 6
	m_pd3dDevice->SetTexture( 0, 0 );
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 7.0f, 100.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 0.447f, 0.2f, 0.1f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWireFence->Render( m_pd3dDevice );

	// Render stand1 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -58.0f, -5.0f, 225.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.5f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render stand2 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 700.0f, -5.0f, -138.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render stand3 
	m_pd3dDevice->SetTexture( 0, 0 );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 250.0f, -5.0f, -138.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixScaling(&matScal, 1.0f, 0.5f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pGrandStand->Render( m_pd3dDevice );

	// Render White block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -10.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 10.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 30.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 50.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 70.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 90.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 110.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 130.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 150.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 170.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 190.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 210.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 230.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 250.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 270.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 290.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 310.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 330.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 350.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 370.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 390.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 410.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 430.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 450.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 470.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 490.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 510.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 530.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 550.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 570.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 590.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 610.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 630.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 650.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 670.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );	
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 690.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 710.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 730.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 750.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 770.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 790.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 810.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 830.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 850.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 870.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 890.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 910.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 930.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 950.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 970.0f, 3.9f, 403.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.2f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );
		
	// Change edge
	// Render White block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 40.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 60.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 80.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 100.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 120.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 140.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 160.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 180.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 200.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 220.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 240.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 260.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 280.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 300.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 320.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 340.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 360.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 380.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 400.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 420.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 440.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 460.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 480.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 500.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 520.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 540.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 560.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 580.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 600.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 620.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 640.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 660.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 680.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 700.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 720.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 740.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 760.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 780.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 800.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render Red block 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 820.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pRedBlock->Render( m_pd3dDevice );

	// Render White block 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 836.0f, 1.1f, -48.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.15f, 0.1f, 0.06f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWhiteBlock->Render( m_pd3dDevice );

	// Render the palace for car start
//  m_pd3dDevice->SetMaterial( &red );

	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, -70.0f, -2.0f, -30.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.2f, 0.5f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pPalace->Render( m_pd3dDevice );

	// Render the concrete 1
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 37.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 2
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 51.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 3
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 65.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 4
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 76.0f, 1.0f, 202.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, D3DX_PI );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );
	// change direction
	// Render the concrete 5
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 210.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 6
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 224.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 7
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 238.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 8
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 252.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 9
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 266.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 10
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 280.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 11
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 294.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 12
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 308.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 13
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 322.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 14
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 336.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 15
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 347.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.2f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// change edge
	// Render the concrete 16
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 143.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 17
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 129.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 18
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 115.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 19
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 101.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 20
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 87.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 21
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 73.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 22
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 59.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 23
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 45.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 24
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 31.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 25
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 17.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 26
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, 3.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 27
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -11.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 28
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -25.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );

	// Render the concrete 29
	D3DXMatrixRotationX( &matRotX, -D3DX_PI/2 );
	D3DXMatrixTranslation(&matTran, 32.0f, 1.0f, -39.0f);
	D3DXMatrixMultiply( &matWorld, &matRotX, &matTran );
	D3DXMatrixRotationZ( &matRotY, -D3DX_PI/2 );
	D3DXMatrixMultiply( &matWorld, &matRotY, &matWorld );
	D3DXMatrixScaling(&matScal, 0.4f, 0.5f, 0.4f);
	D3DXMatrixMultiply( &matWorld, &matScal, &matWorld );
	D3DXMatrixMultiply( &matWorld, &matWorld, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pConcreteBlock->Render( m_pd3dDevice );
		
	// Render The wall
	m_pd3dDevice->SetTexture( 0, m_pRoadTexture );

	D3DXMatrixTranslation(&matTran, 162.5f, 0.0f, 190.0f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[13]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 120.0f, 0.0f, 232.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[14]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 77.5f, 0.0f, 217.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[15]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 297.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[19]->DrawSubset(0);

	D3DXMatrixTranslation(&matTran, 847.5f, 0.0f, 22.5f);		
	D3DXMatrixMultiply( &matWorld, &matTran, &W );        // To calculate the reflected
	m_pd3dDevice->SetTransform(D3DTS_WORLD, &matWorld);
	m_pWall[23]->DrawSubset(0);
	
	// Restore render states.
	m_pd3dDevice->SetRenderState(D3DRS_ALPHABLENDENABLE, false);
	m_pd3dDevice->SetRenderState( D3DRS_STENCILENABLE, false);
	m_pd3dDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	return S_OK;
}





//-----------------------------------------------------------------------------
// Name: RenderText()
// Desc: Renders stats and help text to the scene.
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::RenderText()
{
    D3DCOLOR fontColor        = D3DCOLOR_ARGB(255,0,255,0);	
    TCHAR szMsg[MAX_PATH] = TEXT("");
	TCHAR m_cText[10] = TEXT("");

	if (m_pCar->EngineState) fontColor = D3DCOLOR_ARGB(255,0,255,0);	
	else fontColor = D3DCOLOR_ARGB(255,255,0,0);
	
    // Output display stats
    FLOAT fNextLine = 40.0f; 

    lstrcpy( szMsg, m_strDeviceStats );
    fNextLine -= 20.0f;
 //   m_pFont->DrawText( 2, fNextLine, fontColor, szMsg );

    lstrcpy( szMsg, m_strFrameStats );
    fNextLine -= 20.0f;
//    m_pFont->DrawText( 2, fNextLine, fontColor, szMsg );

    fNextLine = (FLOAT) m_d3dsdBackBuffer.Height; 
    
	if(m_bFirstTask)
	{
		sprintf( m_cText, TEXT("Mission 1 :: Passed"), m_bFirstTask , m_bFirstTask );
		fNextLine = 20.0f; m_pFont->DrawText( 800, fNextLine, fontColor, m_cText );
	} else
	{
		sprintf( m_cText, TEXT("Mission 1 :: Unknow"), m_bFirstTask , m_bFirstTask );
		fNextLine = 20.0f; m_pFont->DrawText( 800, fNextLine, fontColor, m_cText );
	}

	if(m_bSecondTask)
	{
		sprintf( m_cText, TEXT("Mission 2 :: Passed"), m_bSecondTask , m_bSecondTask );
		fNextLine += 20.0f; m_pFont->DrawText( 800, fNextLine, fontColor, m_cText );
	} else
	{
		sprintf( m_cText, TEXT("Mission 2 :: Unknow"), m_bSecondTask , m_bSecondTask );
		fNextLine += 20.0f; m_pFont->DrawText( 800, fNextLine, fontColor, m_cText );
	}

	if(m_bThirdTask)
	{
		sprintf( m_cText, TEXT("Mission 3 :: Passed"), m_bThirdTask , m_bThirdTask );
		fNextLine += 20.0f; m_pFont->DrawText( 800, fNextLine, fontColor, m_cText );
	} else
	{
		sprintf( m_cText, TEXT("Mission 3 :: Unknow"), m_bThirdTask , m_bThirdTask );
		fNextLine += 20.0f; m_pFont->DrawText( 800, fNextLine, fontColor, m_cText );
	}

	sprintf( m_cText, TEXT(": %d :"), m_pCar->m_iGear , m_pCar->m_iGear );
	m_pFont->DrawText( 500, 518, fontColor, m_cText );

	if( m_bFinish && m_bPass && m_bFirstTask && m_bSecondTask && m_bThirdTask)
	{
		sprintf( m_cText, TEXT("CONGRATURATION!"),  0, 0);
		m_pFont->DrawTextScaled(-0.96f, -0.5f, 0.0f, 0.16f, 0.2f, fontColor, m_cText);

		sprintf( m_cText, TEXT("YOU PASSED..."),  0, 0);
	    m_pFont->DrawTextScaled(-0.5f, 0.1f, 0.0f, 0.1f, 0.1f, fontColor, m_cText);
	}

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: Pause()
// Desc: Called in to toggle the pause state of the app.
//-----------------------------------------------------------------------------
VOID CMyD3DApplication::Pause( bool bPause )
{
    // Get access to the list of semantically-mapped input devices
    // to zero the state of all InputDeviceState structs.  This is needed
    // because when using DISCL_FOREGROUND, the action mapper will not 
    // record actions when the focus switches, for example if a dialog appears.
    // This causes a problem when a button held down when loosing focus, and let
    // go when the focus is lost.  The app will not record that the button 
    // has been let go, so the state will be incorrect when focus returns.  
    // To fix this either use DISCL_BACKGROUND or zero the state when 
    // loosing focus.
    CInputDeviceManager::DeviceInfo* pDeviceInfos;
    DWORD dwNumDevices;
    m_pInputDeviceManager->GetDevices( &pDeviceInfos, &dwNumDevices );

    for( DWORD i=0; i<dwNumDevices; i++ )
    {
        InputDeviceState* pInputDeviceState = (InputDeviceState*) pDeviceInfos[i].pParam;
        ZeroMemory( pInputDeviceState, sizeof(InputDeviceState) );
    }

    CD3DApplication::Pause( bPause );
}




//-----------------------------------------------------------------------------
// Name: MsgProc()
// Desc: Overrrides the main WndProc, so the sample can do custom message
//       handling (e.g. processing mouse, keyboard, or menu commands).
//-----------------------------------------------------------------------------
LRESULT CMyD3DApplication::MsgProc( HWND hWnd, UINT msg, WPARAM wParam,
                                    LPARAM lParam )
{
    switch( msg )
    {
        case WM_PAINT:
        {
            if( m_bLoadingApp )
            {
                // Draw on the window tell the user that the app is loading
                // TODO: change as needed
                HDC hDC = GetDC( hWnd );
                TCHAR strMsg[MAX_PATH];
                wsprintf( strMsg, TEXT("Loading... Please wait") );
                RECT rct;
                GetClientRect( hWnd, &rct );
                DrawText( hDC, strMsg, -1, &rct, DT_CENTER|DT_VCENTER|DT_SINGLELINE );
                ReleaseDC( hWnd, hDC );
            }
            break;
        }

        case WM_COMMAND:
        {
            switch( LOWORD(wParam) )
            {
                case IDM_CONFIGINPUT:
                    m_UserInput.bDoConfigureInput = TRUE;
                    break;

                case IDM_CHANGEDEVICE:
                    m_UserInput.bDoConfigureDisplay = TRUE;
                    return 0; // Don't hand off to parent
            }
            break;
        }

    }

    return CD3DApplication::MsgProc( hWnd, msg, wParam, lParam );
}




//-----------------------------------------------------------------------------
// Name: InvalidateDeviceObjects()
// Desc: Invalidates device objects.  Paired with RestoreDeviceObjects()
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::InvalidateDeviceObjects()
{
    // TODO: Cleanup any objects created in RestoreDeviceObjects()
    m_pFont->InvalidateDeviceObjects();
    SAFE_RELEASE( m_pDIConfigSurface );

	//////////////////////////////////
	// Additional invalidate object //
	//////////////////////////////////
    if( m_pCarbody )
        m_pCarbody->InvalidateDeviceObjects();

    if( m_pBridge )
        m_pBridge->InvalidateDeviceObjects();

    if( m_pHouse1 )
        m_pHouse1->InvalidateDeviceObjects();

    if( m_pGrandStand )
        m_pGrandStand->InvalidateDeviceObjects();

    if( m_pWhiteBlock )
        m_pWhiteBlock->InvalidateDeviceObjects();

    if( m_pRedBlock )
        m_pRedBlock->InvalidateDeviceObjects();

    if( m_pPalace )
        m_pPalace->InvalidateDeviceObjects();

    if( m_pConcreteBlock )
        m_pConcreteBlock->InvalidateDeviceObjects();

    if( m_pWireFence )
        m_pWireFence->InvalidateDeviceObjects();

    if( m_pSecondTask )
        m_pSecondTask->InvalidateDeviceObjects();

    if( m_pSideRoad )
        m_pSideRoad->InvalidateDeviceObjects();

    if( m_pTurnRight )
        m_pTurnRight->InvalidateDeviceObjects();

    if( m_pUTurn )
        m_pUTurn->InvalidateDeviceObjects();

    if( m_pUTurn2 )
        m_pUTurn2->InvalidateDeviceObjects();

    if( m_pMission1 )
        m_pMission1->InvalidateDeviceObjects();

    if( m_pMission2 )
        m_pMission2->InvalidateDeviceObjects();

    if( m_pMission3 )
        m_pMission3->InvalidateDeviceObjects();

    if( m_pSpeedLimit )
        m_pSpeedLimit->InvalidateDeviceObjects();

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: DeleteDeviceObjects()
// Desc: Paired with InitDeviceObjects()
//       Called when the app is exiting, or the device is being changed,
//       this function deletes any device dependent objects.  
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::DeleteDeviceObjects()
{
    // TODO: Cleanup any objects created in InitDeviceObjects()
    m_pFont->DeleteDeviceObjects();

	/////////////////////////////////////////////
	// Additional delete vertex buffer control //
	/////////////////////////////////////////////
    SAFE_RELEASE( m_pTerrainVB );
    SAFE_RELEASE( m_pSkyboxVB );
    SAFE_RELEASE( m_pMirrorVB );
    SAFE_RELEASE( m_pConsoleVB );

	//////////////////////////////
	// Additional delete object //
	//////////////////////////////
	SAFE_DELETE( m_pCar );
	SAFE_DELETE( m_pCamera );

	SAFE_DELETE( m_pCarbody );
	SAFE_DELETE( m_pBridge );
	SAFE_DELETE( m_pHouse1 );
	SAFE_DELETE( m_pGrandStand );
	SAFE_DELETE( m_pWhiteBlock );
	SAFE_DELETE( m_pRedBlock );
	SAFE_DELETE( m_pPalace );
	SAFE_DELETE( m_pConcreteBlock );
	SAFE_DELETE( m_pWireFence );
	SAFE_DELETE( m_pFence1 );
	SAFE_DELETE( m_pGate );
	SAFE_DELETE( m_pWall1 );
	SAFE_DELETE( m_pSecondTask );
	SAFE_DELETE( m_pSideRoad );
	SAFE_DELETE( m_pTurnRight );
	SAFE_DELETE( m_pUTurn );
	SAFE_DELETE( m_pUTurn2 );
	SAFE_DELETE( m_pMission1 );
	SAFE_DELETE( m_pMission2 );
	SAFE_DELETE( m_pMission3 );
	SAFE_DELETE( m_pSpeedLimit );

	SAFE_RELEASE( m_pWall[0] );
	SAFE_RELEASE( m_pWall[1] );
	SAFE_RELEASE( m_pWall[2] );
	SAFE_RELEASE( m_pWall[3] );
	SAFE_RELEASE( m_pWall[4] );
	SAFE_RELEASE( m_pWall[5] );
	SAFE_RELEASE( m_pWall[6] );
	SAFE_RELEASE( m_pWall[7] );
	SAFE_RELEASE( m_pWall[8] );
	SAFE_RELEASE( m_pWall[9] );
	SAFE_RELEASE( m_pWall[10] );
	SAFE_RELEASE( m_pWall[11] );
	SAFE_RELEASE( m_pWall[12] );
	SAFE_RELEASE( m_pWall[13] );
	SAFE_RELEASE( m_pWall[14] );
	SAFE_RELEASE( m_pWall[15] );
	SAFE_RELEASE( m_pWall[16] );
	SAFE_RELEASE( m_pWall[17] );
	SAFE_RELEASE( m_pWall[18] );
	SAFE_RELEASE( m_pWall[19] );
	SAFE_RELEASE( m_pWall[20] );
	SAFE_RELEASE( m_pWall[21] );
	SAFE_RELEASE( m_pWall[22] );
	SAFE_RELEASE( m_pWall[23] );
	SAFE_RELEASE( m_pWall[24] );
//	SAFE_RELEASE( m_pWall[25] );

	///////////////////////////////
	// Additional delete texture //
	///////////////////////////////
	SAFE_RELEASE( m_pRoadTexture );
	SAFE_RELEASE( m_pCornerRoadTexture );
	SAFE_RELEASE( m_pShortRoadTexture );
	SAFE_RELEASE( m_pTopSkyboxTexture );
	SAFE_RELEASE( m_pFrontSkyboxTexture );
	SAFE_RELEASE( m_pLeftSkyboxTexture );
	SAFE_RELEASE( m_pRightSkyboxTexture );
	SAFE_RELEASE( m_pBackSkyboxTexture );
	SAFE_RELEASE( m_pConsoleTexture );
	SAFE_RELEASE( m_pGrassTexture );
	SAFE_RELEASE( m_pLeftRightTexture );
	SAFE_RELEASE( m_pCrossRoadTexture );


	//////////////////////////////////
	// Additional delete DirectShow //
	//////////////////////////////////
//	SAFE_RELEASE( pGB );
//	SAFE_RELEASE( pMC );
//	SAFE_RELEASE( pME );
//	SAFE_RELEASE( pVW );

//	SAFE_DELETE( m_sBoundingWall[0] );
 
    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: FinalCleanup()
// Desc: Paired with OneTimeSceneInit()
//       Called before the app exits, this function gives the app the chance
//       to cleanup after itself.
//-----------------------------------------------------------------------------
HRESULT CMyD3DApplication::FinalCleanup()
{
    // TODO: Perform any final cleanup needed
    // Cleanup D3D font
    SAFE_DELETE( m_pFont );

    // Cleanup DirectInput
    CleanupDirectInput();

    // Cleanup DirectX audio objects
    SAFE_DELETE( g_pMusicSegments[0] );
    SAFE_DELETE( g_pMusicSegments[1] );
    SAFE_DELETE( g_pMusicSegments[2] );
    SAFE_DELETE( g_pMusicSegments[3] );
	SAFE_DELETE( g_pMusicSegments[4] );
    SAFE_DELETE( m_pMusicManager );

    // Write the settings to the registry
    WriteSettings();

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: CleanupDirectInput()
// Desc: Cleanup DirectInput 
//-----------------------------------------------------------------------------
VOID CMyD3DApplication::CleanupDirectInput()
{
    if( NULL == m_pInputDeviceManager )
        return;

    // Get access to the list of semantically-mapped input devices
    // to delete all InputDeviceState structs
    CInputDeviceManager::DeviceInfo* pDeviceInfos;
    DWORD dwNumDevices;
    m_pInputDeviceManager->GetDevices( &pDeviceInfos, &dwNumDevices );

    for( DWORD i=0; i<dwNumDevices; i++ )
    {
        InputDeviceState* pInputDeviceState = (InputDeviceState*) pDeviceInfos[i].pParam;
        SAFE_DELETE( pInputDeviceState );
        pDeviceInfos[i].pParam = NULL;
    }

    // Cleanup DirectX input objects
    SAFE_DELETE( m_pInputDeviceManager );

}

//-----------------------------------------------------------------------------
// Name: UpdateCarParam()
// Desc: Update all of the car parameter 
//-----------------------------------------------------------------------------
void CMyD3DApplication::UpdateCarParam()
{
	// Assign the size of car
	m_pCar->m_vFrontLeft.x = -10.0f; m_pCar->m_vFrontLeft.y = 0.0f; m_pCar->m_vFrontLeft.z = 20.0f;
	m_pCar->m_vFrontRight.x = 5.0f; m_pCar->m_vFrontRight.y = 0.0f; m_pCar->m_vFrontRight.z = 20.0f;
	m_pCar->m_vBackLeft.x = -10.0f; m_pCar->m_vBackLeft.y = 0.0f; m_pCar->m_vBackLeft.z = -25.0f;
	m_pCar->m_vBackRight.x = 5.0f; m_pCar->m_vBackRight.y = 0.0f; m_pCar->m_vBackRight.z = -25.0f;

	// Get Position
	m_pCamera->getPosition(&m_vPos);

	// Compute the car position
	m_pCar->m_vCurrentPos = m_vPos;

	m_pCar->m_vFrontLeft.x = m_vPos.x - (-10.0f*m_pCamera->m_vLook.z)+(20.0f*m_pCamera->m_vLook.x);
	m_pCar->m_vFrontLeft.z = m_vPos.z + (20.0f*m_pCamera->m_vLook.z)+(-10.0f*m_pCamera->m_vLook.x);

	m_pCar->m_vFrontRight.x = m_vPos.x - (5.0f*m_pCamera->m_vLook.z)+(20.0f*m_pCamera->m_vLook.x);
	m_pCar->m_vFrontRight.z = m_vPos.z + (20.0f*m_pCamera->m_vLook.z)+(5.0f*m_pCamera->m_vLook.x);

	m_pCar->m_vBackLeft.x = m_vPos.x - (-10.0f*m_pCamera->m_vLook.z)+(-25.0f*m_pCamera->m_vLook.x);
	m_pCar->m_vBackLeft.z = m_vPos.z + (-25.0f*m_pCamera->m_vLook.z)+(-10.0f*m_pCamera->m_vLook.x);

	m_pCar->m_vBackRight.x = m_vPos.x - (5.0f*m_pCamera->m_vLook.z)+(-25.0f*m_pCamera->m_vLook.x);
	m_pCar->m_vBackRight.z = m_vPos.z + (-25.0f*m_pCamera->m_vLook.z)+(5.0f*m_pCamera->m_vLook.x);		
	
}

//-----------------------------------------------------------------------------
// Name: isHit()
// Desc: Check the car with other objects to check collision
//-----------------------------------------------------------------------------
bool CMyD3DApplication::isHit()
{
	// Out wall
	if(m_sBoundingWall[0].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[1].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z-0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[2].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x-0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[3].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[4].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[5].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x-0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[6].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z-0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}

	// In wall
	if(m_sBoundingWall[7].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x-0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[8].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[9].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[10].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[11].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x-0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[12].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[13].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x-0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[14].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z-0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[15].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[16].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z-0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[17].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x-0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[18].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[19].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[20].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z-0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[21].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[22].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[23].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	if(m_sBoundingWall[24].isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x+0.0f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z-0.1f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}

	if(m_sBlock2.isHit(m_pCar))
	{
		D3DXVECTOR3 temp;	
		temp.x = m_vPos.x-0.1f;	
		temp.y = m_vPos.y+0.0f;	
		temp.z = m_vPos.z+0.0f;
		m_pCamera->setPosition(&temp);
		m_bPass = false;
		PlaySegment(1);
		return true;
	}
	return false;
}




bool CMyD3DApplication::OnBridge()
{
	if(m_sBoundingBridge.isHit(m_pCar))
		return true;
	return false;
}




void CMyD3DApplication::MovementOnBridgeForward()
{
	Accel = int(Accel - ( 5 * (sin((m_fBridgeAngle/180.00)*D3DX_PI)) ));
	if(m_vPos.x < 534 && m_vStop3.x != 930.00f && v<=0 && Brake==0)
	{
//		if( m_vOldPos.x - m_vPos.x < -1 )
//			m_fBridgeAngle = m_fBridgeAngle-0.17f;
		m_pCamera->walk( float(0.2f * (-cos((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->fly( float(0.05f *(sin((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->yaw( float(-sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50) );
		m_fRotationY = m_fRotationY - float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50);

	}
	if(m_vPos.x >= 534 && m_vStop3.x != 930.00f && v<=0 && Brake==0)
	{
//		if( m_vOldPos.x - m_vPos.x < -1 )
//			m_fBridgeAngle = m_fBridgeAngle+0.17f;
		m_pCamera->walk( float( 0.2f * (-cos((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->fly( float(0.05f * (-sin((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->yaw( float(-sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50) );
		m_fRotationY = m_fRotationY - float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50);
	}
	if(m_vPos.x < 534 && v > 0)
	{
		if( m_vOldPos.x - m_vPos.x > 1 )
			m_fBridgeAngle = m_fBridgeAngle+0.17f;
		m_pCamera->walk( float((v/100.00f) * (cos((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->fly( float((v/100.00f) * (-sin((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->yaw( float((sin((m_pCar->m_fWheelDirection/180)*D3DX_PI)/50 )));
		m_fRotationY = m_fRotationY + float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50);
	}
	if(m_vPos.x >= 534 && v > 0)
	{
		if( m_vOldPos.x - m_vPos.x > 1 )
			m_fBridgeAngle = m_fBridgeAngle-0.17f;
		m_pCamera->walk( float((v/100.00f) * (cos((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->fly( float((v/100.00f) * (sin((m_fBridgeAngle/180.00)*D3DX_PI))));
		m_pCamera->yaw( float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50) );
		m_fRotationY = m_fRotationY + float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50);
	}
	if( m_vOldPos.x - m_vPos.x > 1 )
		m_vOldPos = m_vPos;
}





void CMyD3DApplication::MovementOnBridgeBackward()
{
	Accel = int(Accel - ( 5 * (sin((m_fBridgeAngle/180.00)*D3DX_PI)) ));
	if(m_vPos.x < 534 && v > 0)
	{
		if( m_vOldPos.x - m_vPos.x < -1 )
			m_fBridgeAngle = m_fBridgeAngle-0.17f;
		m_pCamera->walk( float((v/100.00f) * (-cos((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->fly( float((v/100.00f) * (sin((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->yaw( float(-sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50) );
		m_fRotationY = m_fRotationY - float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50);
	} 
	if(m_vPos.x >= 534 && v > 0)
	{
		if( m_vOldPos.x - m_vPos.x < -1 )
			m_fBridgeAngle = m_fBridgeAngle+0.17f;
		m_pCamera->walk( float((v/100.00f) * (-cos((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->fly( float((v/100.00f) * (-sin((m_fBridgeAngle/180.00)*D3DX_PI))) );
		m_pCamera->yaw( float(-sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50) );
		m_fRotationY = m_fRotationY - float(sin( (m_pCar->m_fWheelDirection/180)*D3DX_PI)/50);
	}
	if( m_vOldPos.x - m_vPos.x < -1 )
		m_vOldPos = m_vPos;
}




void CMyD3DApplication::FirstTask()
{  
	if( m_sBoundingWall[8].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[9].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[10].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[11].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[12].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[13].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[14].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[15].isHit(m_pCar) )
		m_bCrash1 = true;
	if( m_sBoundingWall[16].isHit(m_pCar) )
		m_bCrash1 = true;

	if( m_sArea1.isPointInside(m_pCar->m_vBackLeft) && m_sArea1.isPointInside(m_pCar->m_vBackRight) && !m_pCar->EngineState )
		m_bStop1 = true;

	if( m_bCheckpoint1 && !m_bCrash1 && m_bStop1 )
	{
		m_bFirstTask = true;
//		::MessageBox(0, "You passed this first!", 0, 0);
	}
}


void CMyD3DApplication::SecondTask()
{
	if( m_sBoundingWall[1].isHit(m_pCar) )
		m_bCrash2 = true;
	if( m_sBoundingWall[18].isHit(m_pCar) )
		m_bCrash2 = true;

	if( m_sArea21.isPointInside(m_pCar->m_vFrontLeft) && m_sArea21.isPointInside(m_pCar->m_vFrontRight) && !m_pCar->EngineState )
		m_bStop21 = true;

	if( m_sArea22.isPointInside(m_pCar->m_vFrontRight) && m_sArea22.isPointInside(m_pCar->m_vBackRight) && !m_pCar->EngineState )
		m_bStop22 = true;	

	if( m_bCheckpoint2 && !m_bCrash2 && m_bStop21 && m_bStop22 )
	{
		m_bSecondTask = true;
//		::MessageBox(0, "You passed this second task!", 0, 0);
	}
}


void CMyD3DApplication::ThirdTask()
{
	float threshold = 50.0f;

	if( m_sBoundingWall[4].isHit(m_pCar) )
		m_bCrash3 = true;
	if( m_sBoundingWall[20].isHit(m_pCar) )
		m_bCrash3 = true;

	if( (m_pCar->m_fVelocity <= 0.0f) )
		m_vStop3 = m_vPos;
	
	if( (m_vPos.x - m_vStop3.x) > threshold )
		m_bOver3 = true;

	if( m_bCheckpoint32 && !m_bCrash3 && !m_bOver3 )
	{
		m_bThirdTask = true;
//		::MessageBox(0, "You passed this third task!", 0, 0);
	}
}




//-----------------------------------------------------------------------------
// Name: ComputeBoundingBox()
// Desc: Compute bounding box size 
//-----------------------------------------------------------------------------
bool CMyD3DApplication::ComputeBoundingBox(ID3DXMesh* mesh, BoundingBox* box)
{
	HRESULT hr = 0;

	BYTE* v = 0;
	mesh->LockVertexBuffer(0, (void**)&v);

	hr = D3DXComputeBoundingBox(
			(D3DXVECTOR3*)v,
			mesh->GetNumVertices(),
			D3DXGetFVFVertexSize(mesh->GetFVF()),
			&box->_min,
			&box->_max);

	mesh->UnlockVertexBuffer();

	if( FAILED(hr) )
		return false;

	return true;
}




//-----------------------------------------------------------------------------
// Name: ComputeBoundingSphere()
// Desc: Compute bounding sphere size 
//-----------------------------------------------------------------------------
bool CMyD3DApplication::ComputeBoundingSphere(ID3DXMesh* mesh, BoundingSphere* sphere)
{
	HRESULT hr = 0;

	BYTE* v = 0;
	mesh->LockVertexBuffer(0, (void**)&v);

	hr = D3DXComputeBoundingSphere(
			(D3DXVECTOR3*)v,
			mesh->GetNumVertices(),
			D3DXGetFVFVertexSize(mesh->GetFVF()),
			&sphere->_center,
			&sphere->_radius);

	mesh->UnlockVertexBuffer();

	if( FAILED(hr) )
		return false;

	return true;
}

void CMyD3DApplication::EngineOFF()
{
	m_pCar->m_iRPM = 0;
	m_pCar->m_fVelocity = 0;
	OldGear = 0;
	m_pCar->EngineState = false;
	m_pMusicManager->StopAll();	
}

bool CMyD3DApplication::CalAccel(int parameter)
{
	double mul=0.0;

		switch (parameter)
		{
		case 1 : mul = 0.2; break;
		case 2 : mul = 0.3; break;
		case 3 : mul = 0.4; break;
		case 4 : mul = 0.6; break;
		case 5 : mul = 0.7; break;
		case 6 : mul = 0.9; break;
		case 7 : mul = 1.0; break;
		}

		int calculate = false;		

		switch (m_pCar->m_iGear) 
		{
		case 1 : if (m_pCar->m_fVelocity < (mul*40))
					 calculate = true; break;
		case 2 : if (m_pCar->m_fVelocity < (mul*66))
					 calculate = true; break;
		case 3 : if (m_pCar->m_fVelocity < (mul*96))
					 calculate = true; break;
		case 4 : if (m_pCar->m_fVelocity < (mul*130))
					 calculate = true; break;
		case 5 : if (m_pCar->m_fVelocity < (mul*155))
					 calculate = true; break;
		case 6 : if (m_pCar->m_fVelocity < (mul*39))
					 calculate = true; break;
		}
		
		if (calculate) return true;

		else return false;		
}






//-----------------------------------------------------------------------------
// Struct BoundingBox
//
// Desc: The body of bounding box & bounding sphere structure
//-----------------------------------------------------------------------------


const float INFINITY = FLT_MAX;
const float EPSILON  = 0.001f;


BoundingBox::BoundingBox()
{
	// infinite small 
	_min.x = INFINITY;
	_min.y = INFINITY;
	_min.z = INFINITY;

	_max.x = -INFINITY;
	_max.y = -INFINITY;
	_max.z = -INFINITY;
}


bool BoundingBox::isPointInside(D3DXVECTOR3& p)
{
	if( p.x >= _min.x && p.y >= _min.y && p.z >= _min.z &&
		p.x <= _max.x && p.y <= _max.y && p.z <= _max.z )
	{
		return true;
	}
	else
	{
		return false;
	}
}


// Function for test if bounding of car hit any bounding by shoot rays every sides
bool BoundingBox::isHit(CCar* m_sCarBounding)
{	
	D3DXVECTOR3	fDirection1 = m_sCarBounding->m_vFrontRight-m_sCarBounding->m_vFrontLeft;
	D3DXVECTOR3	fDirection2 = m_sCarBounding->m_vFrontLeft-m_sCarBounding->m_vFrontRight;
	D3DXVECTOR3 lDirection1 = m_sCarBounding->m_vBackLeft-m_sCarBounding->m_vFrontLeft;
	D3DXVECTOR3	lDirection2 = m_sCarBounding->m_vFrontLeft-m_sCarBounding->m_vBackLeft;
	D3DXVECTOR3 rDirection1 = m_sCarBounding->m_vBackRight-m_sCarBounding->m_vFrontRight;
	D3DXVECTOR3	rDirection2 = m_sCarBounding->m_vFrontRight-m_sCarBounding->m_vBackRight;
	D3DXVECTOR3 bDirection1 = m_sCarBounding->m_vBackRight-m_sCarBounding->m_vBackLeft;
	D3DXVECTOR3	bDirection2 = m_sCarBounding->m_vBackLeft-m_sCarBounding->m_vBackRight;
	// Front side
	if(D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vFrontLeft,&fDirection1) &&
	   D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vFrontRight,&fDirection2))
		return true;
	// Left side
	if(D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vFrontLeft,&lDirection1) &&
	   D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vBackLeft,&lDirection2))
		return true;
	// Right side
	if(D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vFrontRight,&rDirection1) &&
	   D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vBackRight,&rDirection2))
		return true;
	// Back side
	if(D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vBackLeft,&bDirection1) &&
	   D3DXBoxBoundProbe(&_min,&_max,&m_sCarBounding->m_vBackRight,&bDirection2))
		return true;
	return false;
}

/*void BoundingBox::UpdateBoundingBox( float x, float y, float z, char rotateAxis , float angle, float scaleFactor) 
{
	D3DXVECTOR3 newMax,newMin;

	// Update scaling component
	newMin = _min * scaleFactor;
	newMax = _max * scaleFactor;

	// Update rotation component	
	switch (rotateAxis)
	{
		case 'x' :		// Rotate x axis
			newMin.x = newMin.x;
			newMin.y = (newMin.y*cos(angle)) - (newMin.z*sin(angle));
			newMin.z = (newMin.y*sin(angle)) + (newMin.z*cos(angle));

			newMax.x = newMax.x;

			newMax.y = (newMax.y*cos(angle)) - (newMax.z*sin(angle));
			newMax.z = (newMax.y*sin(angle)) + (newMax.z*cos(angle));
			
			break;
		case 'y' :		// Rotate y axis
			newMin.x = (newMin.x*cos(angle)) + (newMin.z*sin(angle));
			newMin.y = newMin.y;
			newMin.z = (newMin.z*cos(angle)) - (newMin.x*sin(angle));

			newMax.x = (newMax.x*cos(angle)) + (newMax.z*sin(angle));
			newMax.y = newMax.y;
			newMax.z = (newMax.z*cos(angle)) - (newMax.x*sin(angle));

			break;
		case 'z' :		// Rotate z axis
			newMin.x = (newMin.x*cos(angle)) - (newMin.y*sin(angle));
			newMin.y = (newMin.x*sin(angle)) + (newMin.y*cos(angle));
			newMin.z = newMin.z;

			newMax.x = (newMax.x*cos(angle)) - (newMax.y*sin(angle));
			newMax.y = (newMax.x*sin(angle)) + (newMax.y*cos(angle));
			newMax.z = newMax.z;
			break;
		default :
			break;
	}

	// Update translation component
	newMax.x = newMax.x+x;
	newMax.y = newMax.y+y;
	newMax.z = newMax.z+z;
	newMin.x = newMin.x+x;
	newMin.y = newMin.y+y;
	newMin.z = newMin.z+z;


	// Update scaling component
//	newMin = newMin * scaleFactor;
//	newMax = newMax * scaleFactor;

	// Assign to old _min, _max
	_max.x = newMax.x;
	_max.y = newMax.y;
	_max.z = newMax.z;
	_min.x = newMin.x;
	_min.y = newMin.y;
	_min.z = newMin.z;		
}*/


BoundingSphere::BoundingSphere()
{
	_radius = 0.0f;
}
