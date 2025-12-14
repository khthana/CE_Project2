//-----------------------------------------------------------------------------
// File: Virtual Driving Simulator.h
//
// Desc: Header file Virtual Driving Simulator sample app
//-----------------------------------------------------------------------------
#pragma once

// Additional include
#include "Car.h"
#include "Camera.h"
#include "mesh.h"
#include <dshow.h>


//-----------------------------------------------------------------------------
// Defines, and constants
//-----------------------------------------------------------------------------
// TODO: change "DirectX AppWizard Apps" to your name or the company name
#define DXAPP_KEY        TEXT("Software\\DirectX AppWizard Apps\\Virtual Driving Simulator")

// DirectInput action mapper reports events only when buttons/axis change
// so we need to remember the present state of relevant axis/buttons for 
// each DirectInput device.  The CInputDeviceManager will store a 
// pointer for each device that points to this struct
struct InputDeviceState
{
    // TODO: change as needed
    FLOAT fAxisRotateLR;
    BOOL  bButtonRotateLeft;
    BOOL  bButtonRotateRight;

    FLOAT fAxisRotateUD;
    BOOL  bButtonRotateUp;
    BOOL  bButtonRotateDown;

	FLOAT AxisAccel;
    FLOAT AxisBrake;
	FLOAT AxisClutch;
	FLOAT AxisSteer;
	FLOAT AxisGear;
	INT GearState;
	INT EngineState;
	INT Light;

    BOOL  bButtonPlaySoundButtonDown;
};


// Struct to store the current input state
struct UserInput
{
    // TODO: change as needed
    FLOAT fAxisRotateUD;
    FLOAT fAxisRotateLR;
    BOOL bPlaySoundButtonDown;
    BOOL bDoConfigureInput;
    BOOL bDoConfigureDisplay;

	FLOAT AxisBrake;
	FLOAT AxisAccel;
	FLOAT AxisClutch;
	FLOAT AxisSteer;
	FLOAT AxisGear;
	INT GearState;
	INT Light;
	INT EngineState;	
};


//-----------------------------------------------------------------------------
// Name: struct BoundingBox
// Desc: Use box to check collistion detection
//-----------------------------------------------------------------------------

struct BoundingBox
{
	BoundingBox();

	bool isPointInside(D3DXVECTOR3& p);
	void UpdateBoundingBox( float x, float y, float z, char rotateAxis , float angle , float scaleFactor); 
	bool isHit(CCar* m_sCarBounding);

	D3DXVECTOR3 _min;
	D3DXVECTOR3 _max;
};

struct BoundingSphere
{
	BoundingSphere();

	D3DXVECTOR3 _center;
	float       _radius;
};



//-----------------------------------------------------------------------------
// Name: class CMyD3DApplication
// Desc: Application class. The base class (CD3DApplication) provides the 
//       generic functionality needed in all Direct3D samples. CMyD3DApplication 
//       adds functionality specific to this sample program.
//-----------------------------------------------------------------------------
class CMyD3DApplication : public CD3DApplication
{
    BOOL                    m_bLoadingApp;          // TRUE, if the app is loading
    CD3DFont*               m_pFont;                // Font for drawing text

    CInputDeviceManager*    m_pInputDeviceManager;  // DirectInput device manager
    DIACTIONFORMAT          m_diafGame;             // Action format for game play
    LPDIRECT3DSURFACE9      m_pDIConfigSurface;     // Surface for config'ing DInput devices
    UserInput               m_UserInput;            // Struct for storing user input 

    FLOAT                   m_fSoundPlayRepeatCountdown; // Sound repeat timer
    CMusicManager*          m_pMusicManager;        // DirectMusic manager class
	CMusicSegment*          g_pMusicSegments[8];
	IDirectMusicAudioPath*  g_p3DAudiopath;

    FLOAT                   m_fWorldRotX;           // World rotation state X-axis
    FLOAT                   m_fWorldRotY;           // World rotation state Y-axis

	bool					m_bClearSW;
	bool					m_bClearSW2;


	//////////////////////////
	// Additional variables //
	//////////////////////////

	// Object from class
	CCar*					m_pCar;					// Represent car parameters
	CCamera*				m_pCamera;

	// Vertex buffer
	IDirect3DVertexBuffer9* m_pTerrainVB;
	IDirect3DVertexBuffer9* m_pSkyboxVB;
	IDirect3DVertexBuffer9* m_pMirrorVB;
	IDirect3DVertexBuffer9*	m_pConsoleVB;

	// Xfiles
    ID3DXMesh*				m_pWall[25];			// The Wall
	CD3DMesh*				m_pCarbody;				// The Car body
	CD3DMesh*				m_pBridge;				// The bridge
	CD3DMesh*				m_pHouse1;				// The 1st house
	CD3DMesh*				m_pGrandStand;
	CD3DMesh*				m_pWhiteBlock;
	CD3DMesh*				m_pRedBlock;
	CD3DMesh*				m_pPalace;
	CD3DMesh*				m_pConcreteBlock;
	CD3DMesh*				m_pWireFence;
	CD3DMesh*				m_pFence1;
	CD3DMesh*				m_pGate;
	CD3DMesh*				m_pWall1;
	CD3DMesh*				m_pSecondTask;
	CD3DMesh*				m_pSideRoad;
	CD3DMesh*				m_pTurnRight;
	CD3DMesh*				m_pUTurn;
	CD3DMesh*				m_pUTurn2;
	CD3DMesh*				m_pMission1;
	CD3DMesh*				m_pMission2;
	CD3DMesh*				m_pMission3;
	CD3DMesh*				m_pSpeedLimit;
		
	// Bounding box
	BoundingBox				m_sBoundingWall[25];	// The Wall
	BoundingBox				m_sBoundingBridge;		// The Bridge
	BoundingBox				m_sFinish;
	BoundingBox				m_sStart;
	BoundingBox				m_sCheckpoint1;
	BoundingBox				m_sArea1;
	BoundingBox				m_sCheckpoint2;
	BoundingBox				m_sBlock2;
	BoundingBox				m_sArea21;
	BoundingBox				m_sArea22;
	BoundingBox				m_sCheckpoint3;
	BoundingBox				m_sCheckpoint32;
	
	// Texture
	IDirect3DTexture9*      m_pTopSkyboxTexture;       
	IDirect3DTexture9*      m_pFrontSkyboxTexture;       
	IDirect3DTexture9*      m_pLeftSkyboxTexture;       
	IDirect3DTexture9*      m_pRightSkyboxTexture;       
	IDirect3DTexture9*      m_pBackSkyboxTexture;       
	IDirect3DTexture9*      m_pConsoleTexture;       
	IDirect3DTexture9*      m_pGrassTexture;      
	IDirect3DTexture9*      m_pShortRoadTexture;       
	IDirect3DTexture9*      m_pCornerRoadTexture;       
	IDirect3DTexture9*      m_pRoadTexture;    
  	IDirect3DTexture9*      m_pLeftRightTexture;    
	IDirect3DTexture9*      m_pCrossRoadTexture;

	// DirectShow interfaces
	IGraphBuilder			*pGB;
	IMediaControl			*pMC;
	IMediaEvent				*pME;
	IVideoWindow			*pVW;

	// Game variables
	bool					m_bPass;
	bool					m_bFinish;
	bool					m_bFirstTask;
	bool					m_bSecondTask;
	bool					m_bThirdTask;
	bool					m_bCheckpoint1;
	bool					m_bCrash1;
	bool					m_bStop1;
	bool					m_bCheckpoint2;
	bool					m_bStop21;
	bool					m_bStop22;
	bool					m_bCrash2;
	bool					m_bCheckpoint3;
	bool					m_bCheckpoint32;
	D3DXVECTOR3				m_vStop3;
	bool					m_bCrash3;
	bool					m_bOver3;

	// Others
	DWORD					m_dwAppState;			// Current state the app is in
	D3DXVECTOR3				m_vPos;					// Current position
	D3DXVECTOR3				m_vOldPos;
    TCHAR m_strProfilePath[MAX_PATH];				// Use for set current directory
    TCHAR m_strCurrentWorkingDir[MAX_PATH];
	FLOAT					m_fRotationY;			// Current direction
	FLOAT					m_fBridgeAngle;			
	INT						m_iTimeDelay;

	BOOL					EngineCheck;			// For Checking ON/OFF Engine completely
	INT						OldGear;				// For Checking Clutch is press before gear is changed	
	FLOAT					v;						// real velocity to move car
	INT						Accel;
	INT						Brake;
	INT						ClutchCounter;
	INT						GearTemp;
	INT						GearTemp2;
	INT						Old1;
	INT						Old2;
	INT						Old3;
	BOOL					Flag;
	INT						RPM;
	INT						Direction;
	
protected:
    virtual HRESULT OneTimeSceneInit();
    virtual HRESULT InitDeviceObjects();
    virtual HRESULT RestoreDeviceObjects();
    virtual HRESULT InvalidateDeviceObjects();
    virtual HRESULT DeleteDeviceObjects();
    virtual HRESULT Render();
    virtual HRESULT FrameMove();
    virtual HRESULT FinalCleanup();
    virtual HRESULT ConfirmDevice( D3DCAPS9*, DWORD, D3DFORMAT );
    VOID    Pause( bool bPause );

    HRESULT RenderText();

    HRESULT InitInput( HWND hWnd );
    void    UpdateInput( UserInput* pUserInput );
    void    CleanupDirectInput();

    HRESULT InitAudio( HWND hWnd );

    VOID    ReadSettings();
    VOID    WriteSettings();

	//////////////////////////
	// Additional functions //
	//////////////////////////

	HRESULT RenderVideo();
	HRESULT RenderFrame();
	HRESULT RenderBackMirror();
	HRESULT RenderLeftMirror();
	HRESULT RenderRightMirror();
	VOID UpdateCarParam();	
	bool ComputeBoundingBox(ID3DXMesh* mesh, BoundingBox* box);
    bool ComputeBoundingSphere(ID3DXMesh* mesh, BoundingSphere* sphere);
	bool isHit();
	bool OnBridge();
	void EngineOFF();
	bool CalAccel(int parameter);
	HRESULT SetPosition( float fXPos, float fYPos, float fZPos );
	HRESULT PlaySegment( int dwIndex );
	void MovementOnBridgeForward();
	void MovementOnBridgeBackward();
	void FirstTask();
	void SecondTask();
	void ThirdTask();

public:
    LRESULT MsgProc( HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam );
    CMyD3DApplication();
    virtual ~CMyD3DApplication();

    HRESULT InputAddDeviceCB( CInputDeviceManager::DeviceInfo* pDeviceInfo, const DIDEVICEINSTANCE* pdidi );
    static HRESULT CALLBACK StaticInputAddDeviceCB( CInputDeviceManager::DeviceInfo* pDeviceInfo, const DIDEVICEINSTANCE* pdidi, LPVOID pParam );   
    BOOL    ConfigureInputDevicesCB( IUnknown* pUnknown );
    static BOOL CALLBACK StaticConfigureInputDevicesCB( IUnknown* pUnknown, VOID* pUserData );
};

// States the app can be in
enum APP_STATE_TYPE
{ 
    APPSTATE_LOADMENU, 
    APPSTATE_DISPLAYMENU, 
    APPSTATE_LOADVIDEO, 
    APPSTATE_DISPLAYVIDEO, 
    APPSTATE_BEGINACTIVESCREEN,
	APPSTATE_ACTIVE,
	APPSTATE_WAITFOREND,
	APPSTATE_END
};



// Structure of vertex

struct Vertex
{
	Vertex(){}
	Vertex(
		float x, float y, float z,
		float nx, float ny, float nz,
		float u, float v)
	{
		_x  = x;  _y  = y;  _z  = z;
		_nx = nx; _ny = ny; _nz = nz;
		_u  = u;  _v  = v;
	}
    float _x, _y, _z;
    float _nx, _ny, _nz;
    float _u, _v; // texture coordinates

	static const DWORD FVF;
};
const DWORD Vertex::FVF = D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_TEX1;


