// Game.cpp: implementation of the CGame class.
//
//////////////////////////////////////////////////////////////////////

#include "Game.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CGame::CGame()
{
	m_pD3D = NULL;
	m_pD3DDevice = NULL;
	m_dwFrames = 0;
	m_dwStartTime = 0;
	m_dwEndTime = 0;
	m_dwTotalPolygons = 0;

	m_pDirectInput = NULL;
	m_pKeyboard = NULL;

	m_pMeshWorld = NULL;
	m_pMeshTulip = NULL;
	m_pMeshSakuraso = NULL;
	m_pMeshPalm = NULL;
	m_pMeshPalm1 = NULL;
	m_pMeshSun = NULL;
	m_pMeshFence = NULL;
	m_pMeshBridge = NULL;

	//Axis Rotation
	m_rRotataY = 0.0f;
	m_rRotataX = 90.0f;
	m_rRotataZ = 180.0f;

	//First-Person View
	Moving_Speed = 1.0f;
	KEYBOARD_MOVING_SPEED   = Moving_Speed;
	KEYBOARD_ROTATION_SPEED = 2.0f;
	g_fAngleX = 0.0f;
	g_fAngleY = 0.0f;
	g_fPosX = 0.0f;
	g_fPosY = 8.0f;
	g_fPosZ = -25.0f; 

	//Scale (Zoom)
	m_rZoom = 1.0f;

	m_pFont = NULL;
	m_pCube1 = NULL;
	m_pCube2 = NULL;
	m_pTerrain1 = NULL;

	m_pBuilding = NULL;

	m_pWall1 = NULL;
	m_pWall2 = NULL;
	m_pWall3 = NULL;
	m_pWall4 = NULL;

	m_pBrickWall = NULL;
	m_pBrickWall2 = NULL;
	m_pBrickWall3 = NULL;
	m_pBrickWall4 = NULL;
	m_pBrickWall5 = NULL;


	collide = false;
	UpDown = 0;
	UpDownDist = 0;

	m_pFontBig = NULL;

	//sky box
	m_pMeshSkyBox = NULL;

	//sound
	m_pDirectAudioPerformance = NULL;
	m_pDirectAudioLoader = NULL;
	//Initialise COM
	CoInitialize(NULL);

	m_pSoundBG = NULL;
	m_pSound1 = NULL;
	Toggle_Koh = false;
	Toggle_Bump = false;


}

CGame::~CGame()
{
	//Game finished, so destroy game objects
	LogInfo("<br>Finish Game:");

	SafeDelete(m_pMeshWorld);
	SafeDelete(m_pMeshSkyBox);
	SafeDelete(m_pMeshTulip);
	SafeDelete(m_pMeshSakuraso);
	SafeDelete(m_pMeshPalm);
	SafeDelete(m_pMeshPalm1);
	SafeDelete(m_pMeshSun);
	SafeDelete(m_pMeshFence);
	SafeDelete(m_pMeshBridge);

	SafeRelease(m_pD3DDevice);
	SafeRelease(m_pD3D);

	SafeDelete(m_pFont);   
	SafeDelete(m_pFontBig); 
	SafeDelete(m_pCube1);   
	SafeDelete(m_pCube2);  
	SafeDelete(m_pBuilding);  
	SafeDelete(m_pTerrain1);   
	SafeDelete(m_pWall1);
	SafeDelete(m_pWall2);
	SafeDelete(m_pWall3);
	SafeDelete(m_pWall4);
	SafeDelete(m_pBrickWall);
	SafeDelete(m_pBrickWall2);
	SafeDelete(m_pBrickWall3);
	SafeDelete(m_pBrickWall4);
	SafeDelete(m_pBrickWall5);

	CleanUpDirectInput();

	//hardware interface
	CloseHandle(hdriver);

	CloseHandle(h);
	
	CleanUpDirectAudio();
	CoUninitialize();

	//Game finished, so save statistics to log
	DWORD dwDuration = (m_dwEndTime - m_dwStartTime) / 1000;
	
	if((dwDuration != 0)&&(m_dwFrames != 0))
	{
		//Log stats
		LogInfo("<br>Statistics:");
		LogInfo("<li>Start Time (ms): %d", m_dwStartTime);
		LogInfo("<li>End Time (ms): %d", m_dwEndTime);
		LogInfo("<li>Duration (s): %d", dwDuration);
		LogInfo("<li>Total Frame Count: %d", m_dwFrames);
		LogInfo("<li>Average FPS: %d", (m_dwFrames / dwDuration));
		LogInfo("<li>Total Polygons: %d", m_dwTotalPolygons);
		LogInfo("<li>Average Polygons per Frame: %d", (m_dwTotalPolygons / m_dwFrames));
	}
	else
	{
		LogInfo("<br>No statistics to report");
	}


	StopLogging();
}

void CGame::CleanUpDirectInput()
{
	if(m_pKeyboard)
	{
		m_pKeyboard->Unacquire(); 
	}

	SafeRelease(m_pKeyboard);
	SafeRelease(m_pDirectInput);
}

void CGame::CleanUpDirectAudio()
{ 
    //Stop all sounds.
    m_pDirectAudioPerformance->Stop(NULL, NULL, 0, 0);

    //CleanUp
    m_pDirectAudioPerformance->CloseDown();

    SafeRelease(m_pDirectAudioLoader);
    SafeRelease(m_pDirectAudioPerformance);

    LogInfo("<li>CleanUpDirectAudio finished.");
}

bool CGame::Initialise(HWND hWnd, HINSTANCE hInst, UINT nWidth, UINT nHeight)
{
	//Initialise Direct3D
	if(!InitialiseD3D(hWnd, nWidth, nHeight))
	{
		return false;
	}

	//Initialise DirectInput
	if(!InitialiseDirectInput(hWnd, hInst))
	{
		return false;
	}


	if(!InitialiseDirectAudio(hWnd))
	{
		return false;
	}

	//initialise parallel port
	if(!InitialiseParallelPort())
	{
		//return false;

	}
	
	//Initialise Lighting
	if(!InitialiseLights()) 
	{
		return false;
	}

	//Initialise Game Objects
	if(!InitialiseGame())
	{
		return false;
	}

	//init harware interface
	Opendriver();

	return true;
}

bool CGame::InitialiseDirectAudio(HWND hWnd)
{
    LogInfo("<br>Initialise DirectAudio:");


    //Create the DirectAudio performance object
    if(CoCreateInstance(CLSID_DirectMusicPerformance, NULL, CLSCTX_INPROC, 
                        IID_IDirectMusicPerformance8, (void**) &m_pDirectAudioPerformance) != S_OK)
    {
        LogError("<li>Failed to create the DirectAudio perfomance object.");
        return false;
    }
    else
    {
        LogInfo("<li>DirectAudio perfomance object created OK.");
    }

    //Create the DirectAudio loader object
    if(CoCreateInstance(CLSID_DirectMusicLoader, NULL, CLSCTX_INPROC, 
                        IID_IDirectMusicLoader8, (void**) &m_pDirectAudioLoader) != S_OK)
    {
        LogError("<li>Failed to create the DirectAudio loader object.");
        return false;
    }
    else
    {
        LogInfo("<li>DirectAudio loader object created OK.");
    }

    //Initialise the performance object
    if(FAILED(m_pDirectAudioPerformance->InitAudio(NULL, NULL, hWnd, DMUS_APATH_SHARED_STEREOPLUSREVERB,
                                                   64, DMUS_AUDIOF_ALL, NULL)))
    {
        LogError("<li>Failed to initialise the DirectAudio perfomance object.");
        return false;
    }
    else
    {
        LogInfo("<li>Initialised the DirectAudio perfomance object OK.");
    }



    //Get the our applications "sounds" directory.
    CHAR strSoundPath[MAX_PATH];
    GetCurrentDirectory(MAX_PATH, strSoundPath);
    strcat(strSoundPath, "\\Sounds");
 
    //Convert the path to unicode.
    WCHAR wstrSoundPath[MAX_PATH];
    MultiByteToWideChar(CP_ACP, 0, strSoundPath, -1, wstrSoundPath, MAX_PATH);
 
    //Set the search directory.
    if(FAILED(m_pDirectAudioLoader->SetSearchDirectory(GUID_DirectMusicAllTypes, wstrSoundPath, FALSE)))
    {
        LogError("<li>Failed to set the search directory '%s'.", strSoundPath);
        return false;
    }
    else
    {
        LogInfo("<li>Search directory '%s' set OK.", strSoundPath);
    }


    return true;
}

bool CGame::InitialiseParallelPort()
{

	h = CreateFile("\\\\.\\printio", GENERIC_READ, 0, NULL,
					OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
	if(h == INVALID_HANDLE_VALUE) {
        		printf("Couldn't access parallel device\n");
        		return false;
    	}

	return true;

}


bool CGame::InitialiseGame()
{
	LogInfo("<br>Initialise Game:");

	//Setup games objects here

	m_pMeshWorld = new CMesh(m_pD3DDevice, "myworld2.x");
	m_pMeshSkyBox = new CMesh(m_pD3DDevice, "skybox2.x");
	m_pMeshTulip = new CMesh(m_pD3DDevice, "tulip.x");
	m_pMeshSakuraso = new CMesh(m_pD3DDevice, "Sakuraso.x");
	m_pMeshPalm = new CMesh(m_pD3DDevice, "palm.x");
	m_pMeshPalm1 = new CMesh(m_pD3DDevice, "palm1.x");
	m_pMeshSun = new CMesh(m_pD3DDevice, "sun.x");
	m_pMeshFence = new CMesh(m_pD3DDevice, "fence.x");
	m_pMeshBridge = new CMesh(m_pD3DDevice, "bridge.x");

	//Setup fonts here
	m_pFont = new CFont(m_pD3DDevice, "Verdana", 14, false, false, false);
	m_pFontBig = new CFont(m_pD3DDevice, "Verdana", 72, false, false, false);

	m_pCube1 = new CCuboid(m_pD3DDevice);
	m_pCube1->SetPosition(-27.0, 0.0, 0.0);
	m_pCube1->SetTexture("1.bmp");


	m_pCube2 = new CCuboid(m_pD3DDevice);
	m_pCube2->SetPosition(-27.0, 0.0, 0.0);
	m_pCube2->SetTexture("exit.jpg");

	m_pBuilding = new CCuboid(m_pD3DDevice);
	m_pBuilding->SetPosition(0.0, 0.0, 0.0);
	m_pBuilding->SetTexture("Building.jpg");

	m_pWall1 = new CCuboid(m_pD3DDevice);
	m_pWall1->SetPosition(0.0, 0.0, 0.0);
	m_pWall1->SetTexture("city-wall.bmp");

	m_pWall2 = new CCuboid(m_pD3DDevice);
	m_pWall2->SetPosition(0.0, 0.0, 0.0);
	m_pWall2->SetTexture("city-wall2.bmp");

	m_pWall3 = new CCuboid(m_pD3DDevice);
	m_pWall3->SetPosition(0.0, 0.0, 0.0);
	m_pWall3->SetTexture("city-wall.bmp");

	m_pWall4 = new CCuboid(m_pD3DDevice);
	m_pWall4->SetPosition(0.0, 0.0, 0.0);
	m_pWall4->SetTexture("city-wall2.bmp");

	m_pBrickWall = new CCuboid(m_pD3DDevice);
	m_pBrickWall->SetPosition(0.0, 0.0, 0.0);
	m_pBrickWall->SetTexture("brick-wall.bmp");

	m_pBrickWall2 = new CCuboid(m_pD3DDevice);
	m_pBrickWall2->SetPosition(0.0, 0.0, 0.0);
	m_pBrickWall2->SetTexture("brick-wall.bmp");

	m_pBrickWall3 = new CCuboid(m_pD3DDevice);
	m_pBrickWall3->SetPosition(0.0, 0.0, 0.0);
	m_pBrickWall3->SetTexture("brick-wall.bmp");

	m_pBrickWall4 = new CCuboid(m_pD3DDevice);
	m_pBrickWall4->SetPosition(0.0, 0.0, 0.0);
	m_pBrickWall4->SetTexture("texture1.bmp");

	m_pBrickWall5 = new CCuboid(m_pD3DDevice);
	m_pBrickWall5->SetPosition(0.0, 0.0, 0.0);
	m_pBrickWall5->SetTexture("texture1.bmp");

	//Create our terrain object (device, tile rows, tile cols, tile size, max height)
	m_pTerrain1 = new CTerrain(m_pD3DDevice, 20, 15, -10, 10, 5.0, 3);
	//m_pTerrain1->SetPosition(-10, 10, 10, 30);
	m_pTerrain1->SetTexture("Grass.bmp");

	m_pSoundBG = new CSound();
	m_pSoundBG->InitialiseForMP3();
	m_pSoundBG->LoadSound("BackgroundSound.mp3");

	m_pSound1 = new CSound();
	m_pSound1->InitialiseForWavMidi(m_pDirectAudioPerformance, m_pDirectAudioLoader);
	m_pSound1->LoadSound("ow.wav");


	//initial Center Angle
	CenterAngle = g_fAngleY;
	if(Rvary == 160)
	{
		CenterAngle = g_fAngleY - KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 192)
	{
		CenterAngle = g_fAngleY - 2*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 224)
	{
		CenterAngle = g_fAngleY - 3*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 64)
	{
		CenterAngle = g_fAngleY + KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 32)
	{
		CenterAngle = g_fAngleY + 2*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 0)
	{
		CenterAngle = g_fAngleY + 3*KEYBOARD_ROTATION_SPEED;
	}

	_outp(0x378,0);



	return true;  
}

D3DFORMAT CGame::CheckDisplayMode(UINT nWidth, UINT nHeight, UINT nDepth)
{
	UINT x;
	D3DDISPLAYMODE d3ddm;

	for(x = 0; x < m_pD3D->GetAdapterModeCount(0); x++)
	{
		m_pD3D->EnumAdapterModes(0, x, &d3ddm);
		if(d3ddm.Width == nWidth)
		{
			if(d3ddm.Height == nHeight)
			{
				if((d3ddm.Format == D3DFMT_R5G6B5) || (d3ddm.Format == D3DFMT_X1R5G5B5) || (d3ddm.Format == D3DFMT_X4R4G4B4))
				{
					if(nDepth == 16)
					{
						return d3ddm.Format;
					}
				}
				else if((d3ddm.Format == D3DFMT_R8G8B8) || (d3ddm.Format == D3DFMT_X8R8G8B8))
				{
					if(nDepth == 32)
					{
						return d3ddm.Format;
					}
				}
			}
		}
	}

	return D3DFMT_UNKNOWN;
}


bool CGame::InitialiseDirectInput(HWND hWnd, HINSTANCE hInst)
{
	LogInfo("<br>Initialise DirectInput:");

	//Create the DirectInput object
	if(FAILED(DirectInput8Create(hInst, DIRECTINPUT_VERSION, 
			  IID_IDirectInput8, (void**)&m_pDirectInput, NULL))) 
	{ 
		LogError("<li>Unable to create DirectInput interface.");
		return false;
	}
	else
	{
		LogInfo("<li>DirectInput interface created OK");
	}
	
	//KEYBOARD =======================================================================
	//Create the keyboard device object
	if(FAILED(m_pDirectInput->CreateDevice(GUID_SysKeyboard, &m_pKeyboard, NULL))) 
	{ 
		CleanUpDirectInput();
		LogError("<li>Unable to create DirectInput keyboard device interface.");
		return false; 
	}
	else
	{
		LogInfo("<li>DirectInput keyboard device interface created OK.");
	}

	//Set the data format for the keyboard
	if(FAILED(m_pKeyboard->SetDataFormat(&c_dfDIKeyboard)))
	{ 
		CleanUpDirectInput();
		LogError("<li>Unable to set the keyboard data format.");
		return false; 
	}
	else
	{
		LogInfo("<li>Set the keyboard data format OK.");
	}

	//Set the cooperative level for the keyboard
	if(FAILED(m_pKeyboard->SetCooperativeLevel(hWnd, DISCL_FOREGROUND | DISCL_NONEXCLUSIVE)))
	{ 
		CleanUpDirectInput();
		LogError("<li>Unable to set the keyboard cooperative level.");
		return false;
	}
	else
	{
		LogInfo("<li>Set the keyboard cooperative level OK.");
	}

	//Acquire the keyboard
	if(m_pKeyboard)
	{
		m_pKeyboard->Acquire(); 
	}

	return true;
}


bool CGame::InitialiseD3D(HWND hWnd, UINT nWidth, UINT nHeight)
{
	LogInfo("<br>Initialise Direct3D:");

    //First of all, create the main D3D object. If it is created successfully we 
    //should get a pointer to an IDirect3D8 interface.
    m_pD3D = Direct3DCreate8(D3D_SDK_VERSION);
    if(m_pD3D == NULL)
    {
		LogError("<li>Unable to create DirectX8 interface.");
        return false;
    }

    //Get the current display mode
    D3DDISPLAYMODE d3ddm;

	d3ddm.Format = CheckDisplayMode(nWidth, nHeight, 32);
	if(d3ddm.Format != D3DFMT_UNKNOWN)
	{
		//Width x Height x 32bit has been selected
		d3ddm.Width = nWidth;
		d3ddm.Height = nHeight;

		LogInfo("<li>%d x %d x 32bit back buffer format selected. Format = %d.", nWidth, nHeight, d3ddm.Format);
	}
	else
	{
		d3ddm.Format = CheckDisplayMode(nWidth, nHeight, 16);
		if(d3ddm.Format != D3DFMT_UNKNOWN)
		{
            //Width x Height x 16bit has been selected
			d3ddm.Width = nWidth;
			d3ddm.Height = nHeight;

			LogInfo("<li>%d x %d x 16bit back buffer format selected. Format = %d.", nWidth, nHeight, d3ddm.Format);
		}
        else
		{
			LogError("<li>Unable to select back buffer format for %d x %d.", nWidth, nHeight);
            return false;
        }
	}


    //Create a structure to hold the settings for our device
    D3DPRESENT_PARAMETERS d3dpp; 
    ZeroMemory(&d3dpp, sizeof(d3dpp));

	d3dpp.Windowed = FALSE;
    d3dpp.BackBufferCount = 1;
    d3dpp.BackBufferFormat = d3ddm.Format;
    d3dpp.BackBufferWidth = d3ddm.Width;
    d3dpp.BackBufferHeight = d3ddm.Height;
    d3dpp.hDeviceWindow = hWnd;
    d3dpp.SwapEffect = D3DSWAPEFFECT_COPY_VSYNC;
	d3dpp.FullScreen_RefreshRateInHz = D3DPRESENT_RATE_DEFAULT;
    d3dpp.FullScreen_PresentationInterval = D3DPRESENT_INTERVAL_ONE;

	//Select the best depth buffer, select 32, 24 or 16 bit
    if(m_pD3D->CheckDeviceFormat(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, d3ddm.Format, D3DUSAGE_DEPTHSTENCIL, D3DRTYPE_SURFACE, D3DFMT_D32) == D3D_OK)
	{
        d3dpp.AutoDepthStencilFormat = D3DFMT_D32;
        d3dpp.EnableAutoDepthStencil = TRUE;

		LogInfo("<li>32bit depth buffer selected");
    }
    else if(m_pD3D->CheckDeviceFormat(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, d3ddm.Format, D3DUSAGE_DEPTHSTENCIL, D3DRTYPE_SURFACE, D3DFMT_D24X8) == D3D_OK)
    {
		d3dpp.AutoDepthStencilFormat = D3DFMT_D24X8;
        d3dpp.EnableAutoDepthStencil = TRUE;

		LogInfo("<li>24bit depth buffer selected");
	}
    else if(m_pD3D->CheckDeviceFormat(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, d3ddm.Format, D3DUSAGE_DEPTHSTENCIL, D3DRTYPE_SURFACE, D3DFMT_D16) == D3D_OK)
    {
		d3dpp.AutoDepthStencilFormat = D3DFMT_D16;
        d3dpp.EnableAutoDepthStencil = TRUE;

		LogInfo("<li>16bit depth buffer selected");
	}
    else
	{
        d3dpp.EnableAutoDepthStencil = FALSE;
		LogError("<li>Unable to select depth buffer.");
	}


    //Create a Direct3D device.
    if(FAILED(m_pD3D->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, hWnd, 
                                   D3DCREATE_SOFTWARE_VERTEXPROCESSING, &d3dpp, &m_pD3DDevice)))
    {
		LogError("<li>Unable to create device.");
        return false;
    }
    
	//Turn on back face culling. This is becuase we want to hide the back of our polygons
	if(FAILED(m_pD3DDevice->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW)))
	{
		LogError("<li>SetRenderState: D3DRS_CULLMODE Failed");
		return false;
	}
	else
	{
		LogInfo("<li>SetRenderState: D3DRS_CULLMODE OK");
	}


	//Turn on Depth Buffering
	if(FAILED(m_pD3DDevice->SetRenderState(D3DRS_ZENABLE, D3DZB_TRUE)))
	{
		LogError("<li>SetRenderState: D3DRS_ZENABLE Failed");
		return false;
	}
	else
	{
		LogInfo("<li>SetRenderState: D3DRS_ZENABLE OK");
	}


	//Set fill state. Possible values: D3DFILL_POINT, D3DFILL_WIREFRAME, D3DFILL_SOLID
	if(FAILED(m_pD3DDevice->SetRenderState(D3DRS_FILLMODE, D3DFILL_SOLID)))
	{
		LogError("<li>SetRenderState: D3DRS_FILLMODE Failed");
		return false;
	}
	else
	{
		LogInfo("<li>SetRenderState: D3DRS_FILLMODE OK");
	}
	
	//m_pD3DDevice->SetRenderState(D3DRS_FILLMODE, D3DFILL_WIREFRAME);

	//Set the D3DRS_NORMALIZENORMALS render state to fix the problem when scaling the objects get darker
	if(FAILED(m_pD3DDevice->SetRenderState(D3DRS_NORMALIZENORMALS, TRUE)))
	{
		LogError("<li>SetRenderState: D3DRS_NORMALIZENORMALS Failed");
		return false;
	}
	else
	{
		LogInfo("<li>SetRenderState: D3DRS_NORMALIZENORMALS OK");
	}

    return true;
}

bool CGame::InitialiseLights()
{
	LogInfo("<br>Initialise Lights:");

	D3DLIGHT8 d3dLight;

	//Initialize the light structure.
	ZeroMemory(&d3dLight, sizeof(D3DLIGHT8));

	d3dLight.Type = D3DLIGHT_POINT;
	
	d3dLight.Position.x = 0.0f;
	d3dLight.Position.y = 75.0f;
	d3dLight.Position.z = 0.0f;

	d3dLight.Attenuation0 = 1.0f; 
	d3dLight.Attenuation1 = 0.0f; 
	d3dLight.Attenuation2 = 0.0f; 
	d3dLight.Range = 1000.0f;	

	d3dLight.Diffuse.r = 1.0f;
	d3dLight.Diffuse.g = 1.0f;
	d3dLight.Diffuse.b = 1.0f;
	
	d3dLight.Ambient.r = 0.0f;
	d3dLight.Ambient.g = 0.0f;
	d3dLight.Ambient.b = 0.0f;
	
	d3dLight.Specular.r = 0.0f;
	d3dLight.Specular.g	= 0.0f;
	d3dLight.Specular.b	= 0.0f;

	//Assign the point light to our device in poisition (index) 0
	if(FAILED(m_pD3DDevice->SetLight(0, &d3dLight)))
	{
		LogError("<li>SetLight Failed");
		return false;
	}
	else
	{
		LogInfo("<li>SetLight OK");
	}

	//Enable our point light in position (index) 0
	if(FAILED(m_pD3DDevice->LightEnable(0, TRUE)))
	{
		LogError("<li>LightEnable Failed");
		return false;
	}
	else
	{
		LogInfo("<li>LightEnable OK");
	}

	//Turn on lighting
    if(FAILED(m_pD3DDevice->SetRenderState(D3DRS_LIGHTING, TRUE)))
	{
		LogError("<li>SetRenderState: D3DRS_LIGHTING Failed");
		return false;
	}
	else
	{
		LogInfo("<li>SetRenderState: D3DRS_LIGHTING OK");
	}

	//Set ambient light level
	if(FAILED(m_pD3DDevice->SetRenderState(D3DRS_AMBIENT, D3DCOLOR_XRGB(60, 60, 60))))	
	{
		LogError("<li>SetRenderState: D3DRS_AMBIENT Failed");
		return false;
	}
	else
	{
		LogInfo("<li>SetRenderState: D3DRS_AMBIENT OK");
	}

	return true;
}

LPDIRECT3DDEVICE8 CGame::GetDevice()
{
	return m_pD3DDevice;
}

void CGame::GameLoop()
{
    //Enter the game loop
    MSG msg; 
    BOOL fMessage;

    PeekMessage(&msg, NULL, 0U, 0U, PM_NOREMOVE);

	//Game started, so record time
	m_dwStartTime = timeGetTime();

    while(msg.message != WM_QUIT)
    {
        fMessage = PeekMessage(&msg, NULL, 0U, 0U, PM_REMOVE);

        if(fMessage)
        {
            //Process message
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }
        else
        {
            //No message to process, so render the current scene
            Render();
        }
    }

	//Game finished, so record time
	m_dwEndTime = timeGetTime();
}

void CGame::Render()
{
	if(m_pD3DDevice == NULL)
    {
        return;
    }

	//Process keyboard user input
	ProcessKeyboard();

	ProcessIO();

    //Clear the back buffer and depth buffer
    m_pD3DDevice->Clear(0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 153, 255), 1.0f, 0);
    
    //Begin the scene
    m_pD3DDevice->BeginScene();

	//Setup camera and perspective for 3D
	Setup3DCamera();
	
	//Render 3D
	Render3D();

	//Setup camera for 2D
	Setup2DCamera();

	
	//Start background music on first frame
	if(m_dwFrames == 1)
	{
		m_pSoundBG->Play();
	}
	else if(m_dwFrames > 1)
	{
		//Make the background music loop
		if(!m_pSoundBG->IsPlaying())
		{
			m_pSoundBG->Play();
		}
	}


	//Now render the text
	RenderText();

    //End the scene
    m_pD3DDevice->EndScene();
    
    //Filp the back and front buffers so that whatever has been rendered on the back buffer
    //will now be visible on screen (front buffer).
    m_pD3DDevice->Present(NULL, NULL, NULL, NULL);

	//Count Frames
	m_dwFrames++;
}

void CGame::Setup3DCamera()
{
	//Here we will setup the camera.
	//The camera has three settings: "Camera Position", "Look at Position" and "Up Direction"
    
	D3DXMATRIX matView;

	//First-Person View
	D3DXVECTOR3 vecEyePoint;    // The eye point
    D3DXVECTOR3 vecLookatPoint; // The camera look-at target
    D3DXVECTOR3 vecUp;          // The current world's up
    D3DXMATRIX matRotationX;    // The matrix that rotates around the x-axis
    D3DXMATRIX matRotationY;    // The matrix that rotates around the y-axis
    D3DXMATRIX matRotation;     // The matrix that rotates around the x and y-axis

	vecEyePoint    = D3DXVECTOR3(g_fPosX, g_fPosY, g_fPosZ);
    vecLookatPoint = D3DXVECTOR3(g_fPosX, g_fPosY, g_fPosZ + 0.1f);
    vecUp          = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
    
	D3DXMatrixLookAtLH(&matView, &vecEyePoint, &vecLookatPoint, &vecUp);

    D3DXMatrixRotationX(&matRotationX, D3DXToRadian(g_fAngleX));
    D3DXMatrixRotationY(&matRotationY, D3DXToRadian(g_fAngleY));
    D3DXMatrixMultiply(&matRotation, &matRotationY, &matRotationX);
    D3DXMatrixMultiply(&matView, &matView, &matRotation);

        
	m_pD3DDevice->SetTransform(D3DTS_VIEW, &matView);

	//Here we specify the field of view, aspect ration and near and far clipping planes.
    D3DXMATRIX matProj;
    D3DXMatrixPerspectiveLH(&matProj, D3DX_PI/4, 1.25f, 1.0f, 2000.0f);
    m_pD3DDevice->SetTransform(D3DTS_PROJECTION, &matProj);

	//Make sure that the z-buffer and lighting are enabled
	m_pD3DDevice->SetRenderState(D3DRS_ZENABLE, D3DZB_TRUE);
	m_pD3DDevice->SetRenderState(D3DRS_LIGHTING, TRUE);
}

void CGame::Render3D()
{

	D3DXMATRIX matMove;
	D3DXMATRIX matWorld,matTulip,matSakuraso,matPalm,matPalm1,matSun,matFence,matBridge;
	D3DXMATRIX matRotateX, matRotateY, matRotateZ, matScale;

	D3DXMATRIX matRotation,matCube,matScale1,matMove1;

	D3DXMATRIX matWall1, matWall2;

	m_pTerrain1->Render();

	//world
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(m_rRotataX));
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(m_rRotataY));
	D3DXMatrixRotationZ(&matRotateZ, D3DXToRadian(m_rRotataZ));

	D3DXMatrixScaling(&matScale, m_rZoom, m_rZoom, m_rZoom);

	D3DXMatrixTranslation(&matMove, 0.0f, 0.0f, 0.0f);

	D3DXMatrixMultiply(&matWorld, &matScale, &matRotateX);
	D3DXMatrixMultiply(&matWorld, &matWorld, &matRotateY);
	D3DXMatrixMultiply(&matWorld, &matWorld, &matRotateZ);
	
	D3DXMatrixMultiply(&matWorld, &matWorld, &matMove);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWorld);
	
	m_dwTotalPolygons += m_pMeshWorld->Render();

	//cube
/*	D3DXMatrixRotationAxis(&matRotation, &D3DXVECTOR3(1.0f, 1.0f, 0.0f), timeGetTime()/400.0f);
	D3DXMatrixScaling(&matScale1, 2.0f, 2.0f, 2.0f);
	D3DXMatrixTranslation(&matMove1, 0.0f, 5.0f, 0.0f);
	
	D3DXMatrixMultiply(&matCube, &matScale1, &matRotation);
	D3DXMatrixMultiply(&matCube, &matCube, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matCube);
	m_pCube1->Render();
*/

	//Exit sign
	D3DXMatrixRotationAxis(&matRotation, &D3DXVECTOR3(0.0f, 1.0f, 0.0f), timeGetTime()/400.0f);
	D3DXMatrixScaling(&matScale1, 10.0f, 5.0f, 0.2f);
	D3DXMatrixTranslation(&matMove1, 183.0f, 5.0f, 38.0f);
	
	D3DXMatrixMultiply(&matCube, &matScale1, &matRotation);
	D3DXMatrixMultiply(&matCube, &matCube, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matCube);
	m_pCube2->Render();

	//Building
	D3DXMatrixScaling(&matScale1, 10.0f, 40.0f, 10.0f);
	D3DXMatrixTranslation(&matMove1, 170.0f, 20.0f, 70.0f);
	
	D3DXMatrixMultiply(&matCube, &matScale1, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matCube);
	m_pBuilding->Render();

	//wall1
	D3DXMatrixScaling(&matScale1, 400.0f, 300.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, -10.0f, 147.0f, 133.0f);

	D3DXMatrixMultiply(&matWall1, &matScale1, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall1);
	//m_pWall1->Render();

	//wall2
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(90));
	D3DXMatrixScaling(&matScale1, 300.0f, 300.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, 190.0f, 147.0f, 8.0f);

	D3DXMatrixMultiply(&matWall2, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall2, &matWall2, &matMove1);
	
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall2);
	//m_pWall2->Render();

	//wall3
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(180));
	D3DXMatrixScaling(&matScale1, 400.0f, 300.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, -10.0f, 147.0f, -133.0f);

	D3DXMatrixMultiply(&matWall1, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall1, &matWall1, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall1);
	//m_pWall3->Render();

	//wall4
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 300.0f, 300.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, -190.0f, 147.0f, 8.0f);

	D3DXMatrixMultiply(&matWall2, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall2, &matWall2, &matMove1);
	
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall2);
	//m_pWall4->Render();

	//brick-wall
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(90));
	D3DXMatrixScaling(&matScale1, 75.0f, 24.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, 150.0f, 0.0f, -25.0f);

	D3DXMatrixMultiply(&matWall1, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall1, &matWall1, &matMove1);
	
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall1);
	m_pBrickWall->Render();

	//brick-wall2
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(90));
	D3DXMatrixScaling(&matScale1, 75.0f, 24.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, 150.0f, 0.0f, -100.0f);

	D3DXMatrixMultiply(&matWall2, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall2, &matWall2, &matMove1);
	
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall2);
	m_pBrickWall2->Render();

	//brick-wall3
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(180));
	D3DXMatrixScaling(&matScale1, 40.0f, 24.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, 170.0f, 0.0f, 12.0f);

	D3DXMatrixMultiply(&matWall1, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall1, &matWall1, &matMove1);
	
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall1);
	m_pBrickWall3->Render();

	//brick-wall4
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(90));
	D3DXMatrixScaling(&matScale1, 80.0f, 8.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, 150.0f, 4.0f, 100.0f);

	D3DXMatrixMultiply(&matWall2, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall2, &matWall2, &matMove1);
	
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall2);
	m_pBrickWall4->Render();
	
	//brick-wall4
	D3DXMatrixRotationY(&matRotateY, D3DXToRadian(180));
	D3DXMatrixScaling(&matScale1, 40.0f, 8.0f, 1.0f);
	D3DXMatrixTranslation(&matMove1, 170.0f, 4.0f, 60.0f);

	D3DXMatrixMultiply(&matWall2, &matScale1, &matRotateY);
	D3DXMatrixMultiply(&matWall2, &matWall2, &matMove1);
	
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matWall2);
	m_pBrickWall5->Render();

	//tulip
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 3.0f, 3.0f, 3.0f);
	D3DXMatrixTranslation(&matMove1, -20.0f, 2.0f, 7.0f);

	D3DXMatrixMultiply(&matTulip, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matTulip, &matTulip, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matTulip);
	m_pMeshTulip->Render();
	//
	D3DXMatrixTranslation(&matMove1, -20.0f, 2.0f, 6.0f);

	D3DXMatrixMultiply(&matTulip, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matTulip, &matTulip, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matTulip);
	m_pMeshTulip->Render();
	//
	D3DXMatrixScaling(&matScale1, 2.0f, 2.0f, 2.0f);
	D3DXMatrixTranslation(&matMove1, -19.5f, 1.0f, 6.0f);

	D3DXMatrixMultiply(&matTulip, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matTulip, &matTulip, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matTulip);
	m_pMeshTulip->Render();

	//Sakuraso
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 3.0f, 3.0f, 3.0f);
	D3DXMatrixTranslation(&matMove1, -21.0f, 2.0f, 7.0f);

	D3DXMatrixMultiply(&matSakuraso, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matSakuraso, &matSakuraso, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matSakuraso);
	m_pMeshSakuraso->Render();

	//Palm
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 0.1f, 0.1f, 0.3f);
	D3DXMatrixTranslation(&matMove1, -21.0f, 0.0f, 60.0f);

	D3DXMatrixMultiply(&matPalm, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matPalm, &matPalm, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matPalm);
	m_pMeshPalm->Render();
	//
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 0.1f, 0.1f, 0.2f);
	D3DXMatrixTranslation(&matMove1, -150.0f, 0.0f, 60.0f);

	D3DXMatrixMultiply(&matPalm, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matPalm, &matPalm, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matPalm);
	m_pMeshPalm->Render();
	
	//Palm1
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 0.1f, 0.1f, 0.3f);
	D3DXMatrixTranslation(&matMove1, 31.0f, 0.0f, 60.0f);

	D3DXMatrixMultiply(&matPalm1, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matPalm1, &matPalm1, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matPalm1);
	m_pMeshPalm1->Render();

	//sun
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixRotationAxis(&matRotation, &D3DXVECTOR3(0.0f, 0.0f, 1.0f), timeGetTime()/800.0f);
	D3DXMatrixScaling(&matScale1, 0.2f, 0.2f, 0.2f);
	D3DXMatrixTranslation(&matMove1, 0.0f, 40.0f, 100.0f);
	
	D3DXMatrixMultiply(&matSun, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matSun, &matSun, &matRotation);
	D3DXMatrixMultiply(&matSun, &matSun, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matSun);
	m_pMeshSun->Render();
		
	//Fence
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 0.1f, 0.1f, 0.1f);
	D3DXMatrixTranslation(&matMove1, -10.0f, 0.0f, 130.0f);

	D3DXMatrixMultiply(&matFence, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matFence, &matFence, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matFence);
	m_pMeshFence->Render();
	//
	D3DXMatrixTranslation(&matMove1, 0.13f, 0.0f, 130.0f);

	D3DXMatrixMultiply(&matFence, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matFence, &matFence, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matFence);
	m_pMeshFence->Render();
	//
	D3DXMatrixTranslation(&matMove1, 10.26f, 0.0f, 130.0f);

	D3DXMatrixMultiply(&matFence, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matFence, &matFence, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matFence);
	m_pMeshFence->Render();
	//
	D3DXMatrixTranslation(&matMove1, 20.39f, 0.0f, 130.0f);

	D3DXMatrixMultiply(&matFence, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matFence, &matFence, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matFence);
	m_pMeshFence->Render();
	//
	D3DXMatrixTranslation(&matMove1, 30.52f, 0.0f, 130.0f);

	D3DXMatrixMultiply(&matFence, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matFence, &matFence, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matFence);
	m_pMeshFence->Render();
		
	//Bridge
	D3DXMatrixRotationX(&matRotateX, D3DXToRadian(-90));
	D3DXMatrixScaling(&matScale1, 0.105f, 0.08f, 0.1f);
	D3DXMatrixTranslation(&matMove1, -135.0f, 18.0f, -50.0f);

	D3DXMatrixMultiply(&matBridge, &matScale1, &matRotateX);
	D3DXMatrixMultiply(&matBridge, &matBridge, &matMove1);

	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matBridge);
	m_pMeshBridge->Render();
}

void CGame::Setup2DCamera()
{
	D3DXMATRIX matOrtho;	
	D3DXMATRIX matIdentity;
	
	//Setup the orthogonal projection matrix and the default world/view matrix
	D3DXMatrixOrthoLH(&matOrtho, (float)m_nScreenWidth, (float)m_nScreenHeight, 0.0f, 1.0f);
	D3DXMatrixIdentity(&matIdentity);

	m_pD3DDevice->SetTransform(D3DTS_PROJECTION, &matOrtho);
	m_pD3DDevice->SetTransform(D3DTS_WORLD, &matIdentity);
	m_pD3DDevice->SetTransform(D3DTS_VIEW, &matIdentity);

	//Make sure that the z-buffer and lighting are disabled
	m_pD3DDevice->SetRenderState(D3DRS_ZENABLE, D3DZB_FALSE);
	m_pD3DDevice->SetRenderState(D3DRS_LIGHTING, FALSE);
}

void CGame::RenderText()
{
	//Draw some text at the top of the screen showing stats
	char buffer[255];
	char buffer2[255];
	char buffer3[255];
	char buffer4[255];
	char buffer5[255];
	char buffer6[255];
	char buffer7[255];
	char buffer8[255];

	DWORD dwDuration = (timeGetTime() - m_dwStartTime) / 1000;
	
	if(dwDuration > 0)
	{
		sprintf(buffer, "Axis Rotation:: X: %f. Y: %f. Z: %f. " , m_rRotataX,m_rRotataY,m_rRotataZ);
		sprintf(buffer2, "\nCamera Position:: X: %f. Y: %f. Z: %f. UpDown: %f. " , g_fPosX,g_fPosY,g_fPosZ,UpDownDist);
		sprintf(buffer4, "\n\nInport(Rvary) : %i. " , Rvary); 
		sprintf(buffer5, "\n\n\nInport(Sensor) : %i. " , Sensor); 
		sprintf(buffer6, "\n\n\n\nCollide : %i. " , collide); 
		sprintf(buffer7, "\n\n\n\n\nAngle Y : %f. " , g_fAngleY); 
		sprintf(buffer8, "\n\n\n\n\n\nFrame Count : %i. " , m_dwFrames); 

		if(collide)
		{
			sprintf(buffer3, "\n\n\n           !!BUMP!!");
		}

	}
	else
	{
		sprintf(buffer, "Calculating...");
		sprintf(buffer2, "\nCalculating...");
		sprintf(buffer3, "\n\n\n           Calculating...");
		sprintf(buffer4, "\n\nReading Port...");
		sprintf(buffer5, "\n\n\nReading Port..."); 
		sprintf(buffer6, "\n\n\n\nChecking..."); 
		sprintf(buffer7, "\n\n\n\n\nCalculating..."); 
		sprintf(buffer8, "\n\n\n\n\n\nCalculating..."); 

	}
		
	m_pFont->DrawText(buffer, 0, 0, D3DCOLOR_XRGB(0, 0, 255));
	m_pFont->DrawText(buffer2, 0, 0, D3DCOLOR_XRGB(0, 255, 0));
	m_pFont->DrawText(buffer4, 0, 0, D3DCOLOR_XRGB(0, 255, 0));
	m_pFont->DrawText(buffer5, 0, 0, D3DCOLOR_XRGB(0, 255, 255));
	m_pFont->DrawText(buffer6, 0, 0, D3DCOLOR_XRGB(0, 255, 255));
	m_pFont->DrawText(buffer7, 0, 0, D3DCOLOR_XRGB(255, 255, 0));
	m_pFont->DrawText(buffer8, 0, 0, D3DCOLOR_XRGB(255, 255, 127));
	if(collide)
	{
		m_pFontBig->DrawText(buffer3, 0, 0, D3DCOLOR_XRGB(255, 0, 0));
	}
}

void CGame::ProcessKeyboard()
{
    char KeyboardState[256]; 
     
    if(FAILED(m_pKeyboard->GetDeviceState(sizeof(KeyboardState),(LPVOID)&KeyboardState)))
    { 
		return; 
    } 

	//Axis Rotation
/*
    if(KEYDOWN(KeyboardState, DIK_Y))
	{
		m_rRotataY += 1.0f;
	}
    else if(KEYDOWN(KeyboardState, DIK_6))
	{
		m_rRotataY -= 1.0f;
	}

	if(KEYDOWN(KeyboardState, DIK_X))
	{
		m_rRotataX += 1.0f;
	}
    else if(KEYDOWN(KeyboardState, DIK_S))
	{
		m_rRotataX -= 1.0f;
	}

	if(KEYDOWN(KeyboardState, DIK_Z))
	{
		m_rRotataZ += 1.0f;
	}
    else if(KEYDOWN(KeyboardState, DIK_A))
	{
		m_rRotataZ -= 1.0f;
	}
*/

	//scale
/*
	if(KEYDOWN(KeyboardState, DIK_I))
	{
		m_rZoom += 0.1f;
	}
    else if(KEYDOWN(KeyboardState, DIK_O))
	{
		m_rZoom -= 0.1f;
	}

	if (m_rZoom<0)
	{
		m_rZoom=0.05f;
	}
*/


	//First-Person View Moving
	if(KEYDOWN(KeyboardState, DIK_UP))//move forward
	{
		//g_fPosX -= sinf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;
        //g_fPosZ += cosf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;

		g_fPosX -= sinf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosY += sinf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosZ += cosf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;

		CheckBridge();
		CheckObstacle();
		CheckCollision();

		if(collide)
		{
		m_pSound1->Play();
		//g_fPosX += sinf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;
        //g_fPosZ -= cosf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;	
		g_fPosX += sinf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosY -= sinf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosZ -= cosf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;

		}

	}
    else if(KEYDOWN(KeyboardState, DIK_DOWN))//move back
	{
		//g_fPosX += sinf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;
        //g_fPosZ -= cosf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;

		g_fPosX += sinf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosY -= sinf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosZ -= cosf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;

		CheckCollision();

		if(collide)
		{
		//g_fPosX -= sinf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;
        //g_fPosZ += cosf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;	
		g_fPosX -= sinf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosY += sinf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosZ += cosf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;

		}
	}

	if(KEYDOWN(KeyboardState, DIK_PGUP))//move left
	{
		g_fPosX -= sinf(D3DXToRadian(g_fAngleY + 90.0f)) * KEYBOARD_MOVING_SPEED;
        g_fPosZ += cosf(D3DXToRadian(g_fAngleY + 90.0f)) * KEYBOARD_MOVING_SPEED;

		CheckCollision();

		if(collide)
		{
		g_fPosX += sinf(D3DXToRadian(g_fAngleY + 90.0f)) * KEYBOARD_MOVING_SPEED;
        g_fPosZ -= cosf(D3DXToRadian(g_fAngleY + 90.0f)) * KEYBOARD_MOVING_SPEED;
		}

	}
	else if(KEYDOWN(KeyboardState, DIK_PGDN))//move right
	{
		g_fPosX -= sinf(D3DXToRadian(g_fAngleY - 90.0f)) * KEYBOARD_MOVING_SPEED;
        g_fPosZ += cosf(D3DXToRadian(g_fAngleY - 90.0f)) * KEYBOARD_MOVING_SPEED;

		CheckCollision();

		if(collide)
		{
		g_fPosX += sinf(D3DXToRadian(g_fAngleY - 90.0f)) * KEYBOARD_MOVING_SPEED;
        g_fPosZ -= cosf(D3DXToRadian(g_fAngleY - 90.0f)) * KEYBOARD_MOVING_SPEED;
		}

	}
	
	if(KEYDOWN(KeyboardState, DIK_LEFT))//turn left
	{
		g_fAngleY += KEYBOARD_ROTATION_SPEED;

        if (g_fAngleY >= 360.0f)
        {
            g_fAngleY = g_fAngleY - 360.0f;
        }
	}
	else if(KEYDOWN(KeyboardState, DIK_RIGHT))//turn right
	{
		g_fAngleY -= KEYBOARD_ROTATION_SPEED;

        if (g_fAngleY < 0.0f)
        {
            g_fAngleY = 360.0f + g_fAngleY;
		}
	}
	//end of First-Person Viewing

	//free camera viewing
	if(KEYDOWN(KeyboardState, DIK_8)) //Look Up
	{
		UpDown = UpDown + 0.1f;
		UpDownDist = UpDownDist +0.1f;
	}
	else if(KEYDOWN(KeyboardState, DIK_9)) //Look Down
	{
		UpDown = UpDown - 0.1f;
		UpDownDist = UpDownDist -0.1f;
	}
	else
	{
		UpDown = 0;
	}
	

	//change camera position when look up-down
	g_fAngleX += UpDown * KEYBOARD_ROTATION_SPEED;

	if (g_fAngleX < 0.0f)
	{
		g_fAngleX = 360.0f + g_fAngleX;
	}
	else if (g_fAngleX >= 360.0f)
    {
	    g_fAngleX = g_fAngleX - 360.0f;
    }
   
    if (g_fAngleX > 90.0f && g_fAngleX <= 180)
    {
         g_fAngleX = 90.0f;
    }
    else if (g_fAngleX > 180 && g_fAngleX < 270.0f)
    {
         g_fAngleX = 270.0f;
	}


	//reset
	if(KEYDOWN(KeyboardState, DIK_HOME))
	{	
		m_rRotataY = 0.0f;
		m_rRotataX = 90.0f;
		m_rRotataZ = 180.0f;

		g_fAngleX = 0.0f;
		g_fAngleY = 0.0f;
		CenterAngle = g_fAngleY;
		
		g_fPosX = 0.0f;
		g_fPosY = 8.0f;
		g_fPosZ = -25.0f; 
		
		m_rZoom = 1.0f;

		collide = false;

		UpDown = 0;
		UpDownDist = 0;

	}




}

void CGame::CheckBridge()
{
	float BridgeAngle = 1.0f;

	if(g_fPosX >= -145.0f && g_fPosX <= -124.0f && !collide)
	// 10 -> -80
		if(g_fPosZ <= -3.0f && g_fPosZ > -11.0f)
		{
			if ((g_fAngleY > 90) && (g_fAngleY < 270))
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed/2;
				UpDown = UpDown + BridgeAngle/2;
				UpDownDist = UpDownDist + BridgeAngle/2;
			}else
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed*2;
				UpDown = UpDown+BridgeAngle;
				UpDownDist = UpDownDist +BridgeAngle;
			}
		}	
		else if(g_fPosZ <= -11.0f && g_fPosZ > -27.0f)
		{

		}
		else if(g_fPosZ <= -27.0f && g_fPosZ > -35.0f)
		{
			if ((g_fAngleY > 90) && (g_fAngleY < 270))
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed/2;
				UpDown = UpDown - BridgeAngle/2;
				UpDownDist = UpDownDist - BridgeAngle/2;
			}else
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed*2;
				UpDown = UpDown - BridgeAngle;
				UpDownDist = UpDownDist - BridgeAngle;
			}
		}
		else if(g_fPosZ <= -35.0f && g_fPosZ >= -46.0f)
		{
			UpDown = 0;
			UpDownDist = 0;
			KEYBOARD_MOVING_SPEED = Moving_Speed;
		}
		else if(g_fPosZ < -46.0f && g_fPosZ > -52.0f)
		{
			if ((g_fAngleY > 90) && (g_fAngleY < 270))
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed*2;
				UpDown = UpDown - BridgeAngle;
				UpDownDist = UpDownDist - BridgeAngle;
			}else
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed/2;
				UpDown = UpDown - BridgeAngle/2;
				UpDownDist = UpDownDist - BridgeAngle/2;
			}

		}
		else if(g_fPosZ <= -52.0f && g_fPosZ > -68.0f)
		{

		}
		else if(g_fPosZ <= -68.0f && g_fPosZ >= -76.0f)
		{
			if ((g_fAngleY > 90) && (g_fAngleY < 270))
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed*2;
				UpDown = UpDown + BridgeAngle;
				UpDownDist = UpDownDist + BridgeAngle;
			}else
			{
				KEYBOARD_MOVING_SPEED = Moving_Speed/2;
				UpDown = UpDown+BridgeAngle/2;
				UpDownDist = UpDownDist +BridgeAngle/2;
			}
		}
		else
		{
			KEYBOARD_MOVING_SPEED = Moving_Speed;
			g_fAngleX = 0.0f;
			g_fPosY = 8.0f;
			UpDown = 0;
			UpDownDist = 0;
		}

	//change camera position when on the bridge
	g_fAngleX += UpDown * KEYBOARD_ROTATION_SPEED;

	if (g_fAngleX < 0.0f)
	{
		g_fAngleX = 360.0f + g_fAngleX;
	}
	else if (g_fAngleX >= 360.0f)
    {
	    g_fAngleX = g_fAngleX - 360.0f;
    }
   
    if (g_fAngleX > 90.0f && g_fAngleX <= 180)
    {
         g_fAngleX = 90.0f;
    }
    else if (g_fAngleX > 180 && g_fAngleX < 270.0f)
    {
         g_fAngleX = 270.0f;
	}

}

void CGame::CheckObstacle() //Koh-Krang-Tanon
{

	if ((g_fPosX >= -115.5 && g_fPosX <= -26.5)||(g_fPosX >= 33 && g_fPosX <= 123.5))
	{	
		Oldg_fPosY = g_fPosY;

		if (g_fPosZ >= 38.0f - 4*KEYBOARD_MOVING_SPEED && g_fPosZ <= 38.0f)
		{
			g_fPosY = 8.0f;
			if (Toggle_Koh )
			{
				OldFrame = m_dwFrames;
				//Toggle_Koh = false;
			}
			PulseMotor();
			Toggle_Koh = false;
			//if (Oldg_fPosY != g_fPosY)
				//PulseMotor();
			
		}
		else if (g_fPosZ > 38.0f && g_fPosZ < 44.0f)
		{
			g_fPosY = 10.0f;
			//if (Oldg_fPosY != g_fPosY)
			if (!Toggle_Koh )
			{
				OldFrame = m_dwFrames;
				Toggle_Koh = true;
			}
			
			PulseMotor();

		}
		else if (g_fPosZ >= 44.0f && g_fPosZ <= 44.0f + 4*KEYBOARD_MOVING_SPEED)
		{
			g_fPosY = 8.0f;
			if (Toggle_Koh )
			{
				OldFrame = m_dwFrames;
			}
			PulseMotor();
			Toggle_Koh = false;

			//if (Oldg_fPosY != g_fPosY)
				//PulseMotor();
		}
	}
	
	if (g_fPosZ >= 38.0f - 4*KEYBOARD_MOVING_SPEED && g_fPosZ <= 44.0f + 4*KEYBOARD_MOVING_SPEED)
		//left
		if (g_fPosX >= -115.5 - 4*KEYBOARD_MOVING_SPEED && g_fPosX < -115.5) 
		{
			g_fPosY = 8.0f;
			if (Toggle_Koh )
			{
				OldFrame = m_dwFrames;
			}
			PulseMotor();
			Toggle_Koh = false;
		}else if (g_fPosX > -26.5 && g_fPosX <= -26.5 + 4*KEYBOARD_MOVING_SPEED) 
		{
			g_fPosY = 8.0f;
			if (Toggle_Koh )
			{
				OldFrame = m_dwFrames;
			}
			PulseMotor();
			Toggle_Koh = false;
		
		//right
		}else if (g_fPosX >= 33 - 4*KEYBOARD_MOVING_SPEED && g_fPosX < 33) 
		{
			g_fPosY = 8.0f;
			if (Toggle_Koh )
			{
				OldFrame = m_dwFrames;
			}
			PulseMotor();
			Toggle_Koh = false;
		}else if (g_fPosX > 123.5 && g_fPosX <= 123.5 + 4*KEYBOARD_MOVING_SPEED) 
		{
			g_fPosY = 8.0f;
			if (Toggle_Koh )
			{
				OldFrame = m_dwFrames;
			}
			PulseMotor();
			Toggle_Koh = false;
		}

}


void CGame::CheckCollision()
{

	//reach wall outside the map
	if(g_fPosX <= -185.0f || g_fPosX >= 189.0f || g_fPosZ <= -130.0f || g_fPosZ >= 124.0f)
	{
		collide = true;
	}
	//floor
	else if(g_fPosY <=1.0f)
	{
		collide = true;
	}
	//Bridge's edge right
	else if( g_fPosX >= -148 && g_fPosX <= -143.5 && g_fPosZ > -76 && g_fPosZ < -3 )
	{
		collide = true;
	}
	//Bridge's edge left
	else if( g_fPosX <= -122 && g_fPosX >= -126 && g_fPosZ > -76 && g_fPosZ < -3 )
	{
		collide = true;
	}
	//fence 1
	else if( g_fPosX >= 145 && g_fPosZ > 58)
	{
		collide = true;
	}
	//fence 2
	else if( g_fPosX >= 145 && g_fPosZ < 13)
	{
		collide = true;
	}
	//building Zone1
	else if( g_fPosX >= -39 && g_fPosX <= -27 && g_fPosZ > -6 && g_fPosZ < 16)
	{
		collide = true;
	}
	else if( g_fPosX >= -59 && g_fPosX <= -45 && g_fPosZ > -5 && g_fPosZ < 9 )
	{
		collide = true;
	}
	else if( g_fPosX >= -90 && g_fPosX <= -65 && g_fPosZ > -5 && g_fPosZ < 9 )
	{
		collide = true;
	}
	else if( g_fPosX >= -115 && g_fPosX <= -101 && g_fPosZ > -5 && g_fPosZ < 9 )
	{
		collide = true;
	}
	//building Zone2
	else if( g_fPosX >= -37 && g_fPosX <= -25 && g_fPosZ > 96 && g_fPosZ < 108 )
	{
		collide = true;
	}
	else if( g_fPosX >= -38 && g_fPosX <= -24 && g_fPosZ > 67 && g_fPosZ < 81 )
	{
		collide = true;
	}
	else if( g_fPosX >= -58 && g_fPosX <= -44 && g_fPosZ > 66 && g_fPosZ < 74 )
	{
		collide = true;
	}
	else if( g_fPosX >= -72 && g_fPosX <= -61 && g_fPosZ > 66 && g_fPosZ < 75 )
	{
		collide = true;
	}
	else if( g_fPosX >= -87 && g_fPosX <= -77 && g_fPosZ > 67 && g_fPosZ < 77 )
	{
		collide = true;
	}
	else if( g_fPosX >= -108 && g_fPosX <= -95 && g_fPosZ > 64 && g_fPosZ < 73 )
	{
		collide = true;
	}

	//exit area
	else if( g_fPosX >= 170 && g_fPosZ > 12 && g_fPosZ < 60 )
	{
		PostQuitMessage(0); //exit	
	}
	else
	{
		collide = false;
	}

}

//hardware interface

int CGame::Opendriver(void)
{
    hdriver = CreateFile("\\\\.\\hwinterface", 
                                 GENERIC_READ | GENERIC_WRITE, 
                                 0, 
                                 NULL,
                                 OPEN_EXISTING, 
                                 FILE_ATTRIBUTE_NORMAL, 
                                 NULL);
	
	if(hdriver == INVALID_HANDLE_VALUE) 
		{
		return 1;
		}
	return 0;
}

void CGame::Closedriver(void)
{
    CloseHandle(hdriver);
}

void CGame::outport(int PortAddress, int data)
{
    unsigned int error;
    DWORD BytesReturned;        
    BYTE Buffer[3];
    unsigned short * pBuffer;
    pBuffer = (unsigned short *)&Buffer[0];
    *pBuffer = LOWORD(PortAddress);
    Buffer[2] = LOBYTE(data);

    error = DeviceIoControl(hdriver,
                            IOCTL_WRITE_PORT_UCHAR,
                            &Buffer,
                            3,
                            NULL,
                            0,
                            &BytesReturned,
                            NULL);

    if (!error)
	{
		printf("Error %d\n",GetLastError());
	}
	
}


int CGame::inport(int PortAddress)
{
    unsigned int error;
    DWORD BytesReturned;
    unsigned char Buffer[3];
    unsigned short * pBuffer;
    pBuffer = (unsigned short *)&Buffer;
    *pBuffer = LOWORD(PortAddress);
	Buffer[2] = 0;
    error = DeviceIoControl(hdriver,
                            IOCTL_READ_PORT_UCHAR,
                            &Buffer,
                            2,
                            &Buffer,
                            1,
                            &BytesReturned,
                            NULL);

    if (!error) printf("Error %d\n",GetLastError());
    return((int)Buffer[0]);
}


void CGame::ProcessIO()
{

	//outport(0x370,0x00);
	//Rvary = int((0x123 & 0x101)) ;
	//Rvary = _inp(0x379) & 0xE0 ^ 0x80;
	//Sensor = (_inp(0x379) & 0x10); //only S4 (sensor data)

	Rvary = (_inp(0x379) & 248 ^ 128) & 224;
	Sensor = (_inp(0x379) & 248 ^ 128) & 16;

	if(Rvary ==  160)
	{
		g_fAngleY = CenterAngle + 2*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 192)
	{
		g_fAngleY = CenterAngle + 4*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 224)
	{
		g_fAngleY = CenterAngle + 6*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 64)
	{
		g_fAngleY = CenterAngle - 2*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 32)
	{
		g_fAngleY = CenterAngle - 4*KEYBOARD_ROTATION_SPEED;
	}
	else if(Rvary == 0)
	{
		g_fAngleY = CenterAngle - 6*KEYBOARD_ROTATION_SPEED;
	}

	//if sensor toggled then move
	if(Sensor != OldSensor)
	{
		OldSensor = Sensor;


		if(Rvary == 160)
		{
			//g_fAngleY = CenterAngle + KEYBOARD_ROTATION_SPEED;
			CenterAngle = CenterAngle + KEYBOARD_ROTATION_SPEED;
		}
		else if(Rvary == 192)
		{
			//g_fAngleY = CenterAngle + 2*KEYBOARD_ROTATION_SPEED;
			CenterAngle = CenterAngle + 2*KEYBOARD_ROTATION_SPEED;
		}
		else if(Rvary == 224)
		{
			//g_fAngleY = CenterAngle + 3*KEYBOARD_ROTATION_SPEED;
			CenterAngle = CenterAngle + 3*KEYBOARD_ROTATION_SPEED;
		}
		else if(Rvary == 64)
		{
			//g_fAngleY = CenterAngle - KEYBOARD_ROTATION_SPEED;
			CenterAngle = CenterAngle - KEYBOARD_ROTATION_SPEED;
		}
		else if(Rvary == 32)
		{
			//g_fAngleY = CenterAngle - 2*KEYBOARD_ROTATION_SPEED;
			CenterAngle = CenterAngle - 2*KEYBOARD_ROTATION_SPEED; 
		}
		else if(Rvary == 0)
		{
			//g_fAngleY = CenterAngle - 3*KEYBOARD_ROTATION_SPEED;
			CenterAngle = CenterAngle - 3*KEYBOARD_ROTATION_SPEED;
		}


		//g_fPosX -= sinf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;
        //g_fPosZ += cosf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;

		g_fPosX -= sinf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosY += sinf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosZ += cosf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;

		CheckBridge();

		CheckObstacle();

		CheckCollision();

		if(collide)
		{
		//g_fPosX += sinf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;
        //g_fPosZ -= cosf(D3DXToRadian(g_fAngleY)) * KEYBOARD_MOVING_SPEED;	
		g_fPosX += sinf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosY -= sinf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		g_fPosZ -= cosf(D3DXToRadian(g_fAngleY)) * cosf(D3DXToRadian(g_fAngleX)) * KEYBOARD_MOVING_SPEED;
		}


	}//sensor

	//if collision occur then send signal to bicycle (to motor for vibration)
	if(collide)
	{	
		if(!Toggle_Bump)
		{	
			OldFrame = m_dwFrames;
			Toggle_Bump = true;
			m_pSound1->Play();
		}
		PulseMotor();

	}else
	{
		Toggle_Bump = false;
	}


}

void CGame::PulseMotor()
{
	if (m_dwFrames - OldFrame > 1)
		_outp(0x378,0);
	else
		_outp(0x378,0xff);

}