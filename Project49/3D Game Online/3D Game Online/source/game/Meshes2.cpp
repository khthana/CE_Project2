#include <iostream>
#include <String>
#include <Windows.h>
#include <mmsystem.h>
#include <d3dx9.h>
#include "Camera.h"
#include <dinput.h>
#include <strsafe.h>

using namespace std;
#define SAFE_RELEASE(p) { if(p) { (p)->Release(); (p)=NULL; } }
#define SAMPLE_BUFFER_SIZE 8 
#define KEYDOWN(buffer,dwOffset) (buffer[dwOffset]&0x80)
//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------
LPDIRECT3D9             g_pD3D           = NULL; // Used to create the D3DDevice
LPDIRECT3DDEVICE9       g_pd3dDevice     = NULL; // Our rendering device

LPD3DXMESH              g_pMesh          = NULL; // Our mesh object in sysmem
D3DMATERIAL9*           g_pMeshMaterials = NULL; // Materials for our mesh
LPDIRECT3DTEXTURE9*     g_pMeshTextures  = NULL; // Textures for our mesh
DWORD                   g_dwNumMaterials = 0L;   // Number of mesh materials
LPDIRECTINPUT8			g_pDI       = NULL; // The DirectInput object         
LPDIRECTINPUTDEVICE8	g_pKeyboard = NULL;
int	time=timeGetTime()/1000;
float cou = 0.0f;
double countrot=0.01;
float cameraRolDown = 0.0f;
float cameraRolRight = 0.0f;
float cameraMoveForward = -10.0f;
float cameraMoveRight = 0.0f;
float MoveForward = -10.0f;
float MoveRight = 0.0f;

string GetInput()
{
	//#define KEYDOWN(buffer,dwOffset) (buffer[dwOffset]&0x80)
	BYTE buffer[256];
	ZeroMemory(buffer,sizeof(buffer));
	if(FAILED(g_pKeyboard->GetDeviceState(sizeof(buffer),(LPVOID)&buffer)))
	{
            g_pKeyboard->Acquire();
	}
	//Check value input
	if(KEYDOWN(buffer, DIK_0))	return "0";
	if(KEYDOWN(buffer, DIK_1))	return "1";
	if(KEYDOWN(buffer, DIK_2))	return "2";
	if(KEYDOWN(buffer, DIK_3))	return "3";
	if(KEYDOWN(buffer, DIK_4))	return "4";
	if(KEYDOWN(buffer, DIK_5))	return "5";
	if(KEYDOWN(buffer, DIK_6))	return "6";
	if(KEYDOWN(buffer, DIK_7))	return "7";
	if(KEYDOWN(buffer, DIK_8))	return "8";
	if(KEYDOWN(buffer, DIK_9))	return "9";

	if(KEYDOWN(buffer, DIK_A))	return "A";
	if(KEYDOWN(buffer, DIK_B))	return "B";
	if(KEYDOWN(buffer, DIK_C))	return "C";
	if(KEYDOWN(buffer, DIK_D))	return "D";
	if(KEYDOWN(buffer, DIK_E))	return "E";
	if(KEYDOWN(buffer, DIK_F))	return "F";
	if(KEYDOWN(buffer, DIK_G))	return "G";
	if(KEYDOWN(buffer, DIK_H))	return "H";
	if(KEYDOWN(buffer, DIK_I))	return "I";
	if(KEYDOWN(buffer, DIK_J))	return "J";
	if(KEYDOWN(buffer, DIK_K))	return "K";
	if(KEYDOWN(buffer, DIK_L))	return "L";
	if(KEYDOWN(buffer, DIK_M))	return "M";
	if(KEYDOWN(buffer, DIK_N))	return "N";
	if(KEYDOWN(buffer, DIK_O))	return "O";
	if(KEYDOWN(buffer, DIK_P))	return "P";
	if(KEYDOWN(buffer, DIK_Q))	return "Q";
	if(KEYDOWN(buffer, DIK_R))	return "R";
	if(KEYDOWN(buffer, DIK_S))	return "S";
	if(KEYDOWN(buffer, DIK_T))	return "T";
	if(KEYDOWN(buffer, DIK_U))	return "U";
	if(KEYDOWN(buffer, DIK_V))	return "V";
	if(KEYDOWN(buffer, DIK_W))	return "W";
	if(KEYDOWN(buffer, DIK_X))	return "X";
	if(KEYDOWN(buffer, DIK_Y))	return "Y";
	if(KEYDOWN(buffer, DIK_Z))	return "Z";

	if(KEYDOWN(buffer, DIK_F1))		return "F1";
	if(KEYDOWN(buffer, DIK_F2))		return "F2";
	if(KEYDOWN(buffer, DIK_F3))		return "F3";
	if(KEYDOWN(buffer, DIK_F4))		return "F4";
	if(KEYDOWN(buffer, DIK_F5))		return "F5";
	if(KEYDOWN(buffer, DIK_F6))		return "F6";
	if(KEYDOWN(buffer, DIK_F7))		return "F7";
	if(KEYDOWN(buffer, DIK_F8))		return "F8";
	if(KEYDOWN(buffer, DIK_F9))		return "F9";
	if(KEYDOWN(buffer, DIK_F10))	return "F10";
	if(KEYDOWN(buffer, DIK_F11))	return "F11";
	if(KEYDOWN(buffer, DIK_F12))	return "F12";
	if(KEYDOWN(buffer, DIK_F13))	return "F13";
	if(KEYDOWN(buffer, DIK_F14))	return "F14";
	if(KEYDOWN(buffer, DIK_F15))	return "F15";

	if(KEYDOWN(buffer, DIK_UP))		return "UP";
	if(KEYDOWN(buffer, DIK_RIGHT))	return "RIGHT";
	if(KEYDOWN(buffer, DIK_DOWN))	return "DOWN";
	if(KEYDOWN(buffer, DIK_LEFT))	return "LEFT";

//ADD KEY

	return "";
}

void MovementCamera(CXCamera camera)
{
	string inputRead = GetInput();
	if (inputRead == "UP") 
	{
		cameraRolDown = cameraRolDown - 0.01f;
		camera.RotateDown(cameraRolDown);
		camera.RotateRight(cameraRolRight);
	}
	else if (inputRead == "DOWN") 
	{
		cameraRolDown = cameraRolDown + 0.01f;
		camera.RotateDown(cameraRolDown);
		camera.RotateRight(cameraRolRight);
	}
	else if (inputRead == "RIGHT") 
	{
		cameraRolRight = cameraRolRight + 0.01f;
		camera.RotateRight(cameraRolRight);
		camera.RotateDown(cameraRolDown);
	}
	else if (inputRead == "LEFT") 
	{
		cameraRolRight = cameraRolRight - 0.01f;
		camera.RotateRight(cameraRolRight);
		camera.RotateDown(cameraRolDown);
	}
	else 
	{
		camera.RotateDown(cameraRolDown);
		camera.RotateRight(cameraRolRight);
	}
	camera.Update();
	if (inputRead == "W") 
	{
		MoveForward = 0.05f;
		camera.MoveForward(MoveForward);
		camera.Update();
	}
	else if (inputRead == "S") 
	{
		MoveForward = -0.05f;
		camera.MoveForward(MoveForward);
		camera.Update();
	}
	else if (inputRead == "A") 
	{
		MoveRight = -0.05;
		camera.MoveRight(MoveRight);
		camera.Update();
	}
	else if (inputRead == "D") 
	{
		MoveRight = 0.05;
		camera.MoveRight(MoveRight);
		camera.Update();
	}
	D3DXVECTOR3* vecPosition = camera.GetPosition();
	cameraMoveForward = (*vecPosition).z;
	cameraMoveRight = (*vecPosition).x;
}
//-----------------------------------------------------------------------------
// Name: InitD3D()
// Desc: Initializes Direct3D
//-----------------------------------------------------------------------------
HRESULT InitD3D( HWND hWnd )
{
    // Create the D3D object.
    if( NULL == ( g_pD3D = Direct3DCreate9( D3D_SDK_VERSION ) ) )
        return E_FAIL;

    // Set up the structure used to create the D3DDevice. Since we are now
    // using more complex geometry, we will create a device with a zbuffer.
    D3DPRESENT_PARAMETERS d3dpp; 
    ZeroMemory( &d3dpp, sizeof(d3dpp) );
    d3dpp.Windowed = TRUE;
    d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;
    d3dpp.BackBufferFormat = D3DFMT_UNKNOWN;
    d3dpp.EnableAutoDepthStencil = TRUE;
    d3dpp.AutoDepthStencilFormat = D3DFMT_D16;

    // Create the D3DDevice
    if( FAILED( g_pD3D->CreateDevice( D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, hWnd,
                                      D3DCREATE_SOFTWARE_VERTEXPROCESSING,
                                      &d3dpp, &g_pd3dDevice ) ) )
    {
		if( FAILED( g_pD3D->CreateDevice( D3DADAPTER_DEFAULT, D3DDEVTYPE_REF, hWnd,
                                      D3DCREATE_SOFTWARE_VERTEXPROCESSING,
                                      &d3dpp, &g_pd3dDevice ) ) )
			return E_FAIL;
    }

    // Turn on the zbuffer
    g_pd3dDevice->SetRenderState( D3DRS_ZENABLE, TRUE );

    // Turn on ambient lighting 
    g_pd3dDevice->SetRenderState( D3DRS_AMBIENT, 0xffffffff );
	g_pd3dDevice->SetRenderState( D3DRS_LIGHTING, true );
    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: InitGeometry()
// Desc: Load the mesh and build the material and texture arrays
//-----------------------------------------------------------------------------
HRESULT InitGeometry()
{
    LPD3DXBUFFER pD3DXMtrlBuffer;

    // Load the mesh from the specified file
    if( FAILED( D3DXLoadMeshFromX( "dra.x", D3DXMESH_SYSTEMMEM, 
                                   g_pd3dDevice, NULL, 
                                   &pD3DXMtrlBuffer, NULL, &g_dwNumMaterials, 
                                   &g_pMesh ) ) )
    {
        // If model is not in current folder, try parent folder
        if( FAILED( D3DXLoadMeshFromX( "..\\dra.x", D3DXMESH_SYSTEMMEM, 
                                    g_pd3dDevice, NULL, 
                                    &pD3DXMtrlBuffer, NULL, &g_dwNumMaterials, 
                                    &g_pMesh ) ) )
        {
            MessageBox(NULL, "Could not find tiger.x", "Meshes.exe", MB_OK);
            return E_FAIL;
        }
    }

    // We need to extract the material properties and texture names from the 
    // pD3DXMtrlBuffer
    D3DXMATERIAL* d3dxMaterials = (D3DXMATERIAL*)pD3DXMtrlBuffer->GetBufferPointer();
    g_pMeshMaterials = new D3DMATERIAL9[g_dwNumMaterials];
    g_pMeshTextures  = new LPDIRECT3DTEXTURE9[g_dwNumMaterials];

    for( DWORD i=0; i<g_dwNumMaterials; i++ )
    {
        // Copy the material
        g_pMeshMaterials[i] = d3dxMaterials[i].MatD3D;

        // Set the ambient color for the material (D3DX does not do this)
        g_pMeshMaterials[i].Ambient = g_pMeshMaterials[i].Diffuse;

        g_pMeshTextures[i] = NULL;
        if( d3dxMaterials[i].pTextureFilename != NULL && 
            lstrlen(d3dxMaterials[i].pTextureFilename) > 0 )
        {
            // Create the texture
            if( FAILED( D3DXCreateTextureFromFile( g_pd3dDevice, 
                                                d3dxMaterials[i].pTextureFilename, 
                                                &g_pMeshTextures[i] ) ) )
            {
                // If texture is not in current folder, try parent folder
                const TCHAR* strPrefix = TEXT("..\\");
                const int lenPrefix = lstrlen( strPrefix );
                TCHAR strTexture[MAX_PATH];
                lstrcpyn( strTexture, strPrefix, MAX_PATH );
                lstrcpyn( strTexture + lenPrefix, d3dxMaterials[i].pTextureFilename, MAX_PATH - lenPrefix );
                // If texture is not in current folder, try parent folder
                if( FAILED( D3DXCreateTextureFromFile( g_pd3dDevice, 
                                                    strTexture, 
                                                    &g_pMeshTextures[i] ) ) )
                {
                    MessageBox(NULL, "Could not find texture map", "Meshes.exe", MB_OK);
                }
            }
        }
    }

    // Done with the material buffer
    pD3DXMtrlBuffer->Release();

	//Shows you how to compute a bounding sphere
	LPDIRECT3DVERTEXBUFFER9 VertexBuffer = NULL;
	D3DXVECTOR3* Vertices = NULL;
	D3DXVECTOR3 Center;
	FLOAT Radius;
	DWORD FVFVertexSize = D3DXGetFVFVertexSize(g_pMesh->GetFVF());
	g_pMesh->GetVertexBuffer(&VertexBuffer);
	VertexBuffer->Lock(0,0, (VOID**) &Vertices, D3DLOCK_DISCARD);
	D3DXComputeBoundingSphere(Vertices, g_pMesh->GetNumVertices(), FVFVertexSize, &Center, &Radius);
	VertexBuffer->Unlock();
	VertexBuffer->Release();

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: Cleanup()
// Desc: Releases all previously initialized objects
//-----------------------------------------------------------------------------
VOID Cleanup()
{
    if( g_pMeshMaterials != NULL ) 
        delete[] g_pMeshMaterials;

    if( g_pMeshTextures )
    {
        for( DWORD i = 0; i < g_dwNumMaterials; i++ )
        {
            if( g_pMeshTextures[i] )
                g_pMeshTextures[i]->Release();
        }
        delete[] g_pMeshTextures;
    }
    if( g_pMesh != NULL )
        g_pMesh->Release();
    
    if( g_pd3dDevice != NULL )
        g_pd3dDevice->Release();

    if( g_pD3D != NULL )
        g_pD3D->Release();
	if( g_pKeyboard ) 
        g_pKeyboard->Unacquire();
}



//-----------------------------------------------------------------------------
// Name: SetupMatrices()
// Desc: Sets up the world, view, and projection transform matrices.
//-----------------------------------------------------------------------------
VOID SetupMatrices()
{
    // For our world matrix, we will just leave it as the identity
    D3DXMATRIXA16 matWorld;
	//D3DXMATRIXA16 matWorld1;
	//D3DXMATRIXA16 matWorld2;
   // D3DXMatrixRotationY( &matWorld1, timeGetTime()/1000.0f );
	D3DXMatrixScaling(&matWorld,0.3,0.3,0.3);
	//D3DXMatrixMultiply(&matWorld,&matWorld1,&matWorld2);
    g_pd3dDevice->SetTransform( D3DTS_WORLD, &matWorld );

    // Set up our view matrix. A view matrix can be defined given an eye point,
    // a point to lookat, and a direction for which way is up. Here, we set the
    // eye five units back along the z-axis and up three units, look at the 
    // origin, and define "up" to be in the y-direction.
	CXCamera oat(g_pd3dDevice);
	oat.SetPosition(cameraMoveRight, 0.0f,cameraMoveForward);
	MovementCamera(oat);

    // For the projection matrix, we set up a perspective transform (which
    // transforms geometry from 3D view space to 2D viewport space, with
    // a perspective divide making objects smaller in the distance). To build
    // a perpsective transform, we need the field of view (1/4 pi is common),
    // the aspect ratio, and the near and far clipping planes (which define at
    // what distances geometry should be no longer be rendered).
    D3DXMATRIXA16 matProj;
    D3DXMatrixPerspectiveFovLH( &matProj, D3DX_PI/4, 1.0f, 1.0f, 100.0f );
    g_pd3dDevice->SetTransform( D3DTS_PROJECTION, &matProj );
}




//-----------------------------------------------------------------------------
// Name: Render()
// Desc: Draws the scene
//-----------------------------------------------------------------------------
VOID Render()
{
    // Clear the backbuffer and the zbuffer
    g_pd3dDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, 
                         D3DCOLOR_XRGB(0,0,255), 1.0f, 0 );
    
    // Begin the scene
    if( SUCCEEDED( g_pd3dDevice->BeginScene() ) )
    {
        // Setup the world, view, and projection matrices
        SetupMatrices();

        // Meshes are divided into subsets, one for each material. Render them in
        // a loop
        for( DWORD i=0; i<g_dwNumMaterials; i++ )
        {
            // Set the material and texture for this subset
            g_pd3dDevice->SetMaterial( &g_pMeshMaterials[i] );
			D3DXVECTOR3 vecDir;
			D3DLIGHT9 light;
			ZeroMemory(&light, sizeof(light));
			light.Type = D3DLIGHT_DIRECTIONAL;
			light.Diffuse.r = 1.0f;
			light.Diffuse.g = 1.0f;
			light.Diffuse.b = 1.0f;
			vecDir = D3DXVECTOR3(0.0f,
			-100.0f,
			0.0f);
			D3DXVec3Normalize((D3DXVECTOR3*)&light.Direction, &vecDir);
			light.Range = 1000.0f;
			g_pd3dDevice->SetLight(0, &light);
			g_pd3dDevice->LightEnable(0, TRUE);
					
			g_pd3dDevice->SetLight( 0, &light );
			g_pd3dDevice->LightEnable( 0, TRUE);
            g_pd3dDevice->SetTexture( 0, g_pMeshTextures[i] );
        
            // Draw the mesh subset
            g_pMesh->DrawSubset( i );
        }

        // End the scene
        g_pd3dDevice->EndScene();
    }

    // Present the backbuffer contents to the display
    g_pd3dDevice->Present( NULL, NULL, NULL, NULL );
}




//-----------------------------------------------------------------------------
// Name: MsgProc()
// Desc: The window's message handler
//-----------------------------------------------------------------------------
LRESULT WINAPI MsgProc( HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam )
{
    switch( msg )
    {
        case WM_DESTROY:
            Cleanup();
            PostQuitMessage( 0 );
            return 0;
    }

    return DefWindowProc( hWnd, msg, wParam, lParam );
}

VOID FreeDirectInput()
{
    // Unacquire the device one last time just in case 
    // the app tried to exit while the device is still acquired.
    if( g_pKeyboard ) 
        g_pKeyboard->Unacquire();
    
    // Release any DirectInput objects.
    SAFE_RELEASE( g_pKeyboard );
    SAFE_RELEASE( g_pDI );
}

HRESULT OnCreateDevice( HWND hDlg )
{
    HRESULT hr;

    // Cleanup any previous call first
    KillTimer( hDlg, 0 );    
    FreeDirectInput();

    // Detrimine where the buffer would like to be allocated 
    
    // Create a DInput object
    if( FAILED( hr = DirectInput8Create( GetModuleHandle(NULL), DIRECTINPUT_VERSION, 
                                         IID_IDirectInput8, (VOID**)&g_pDI, NULL ) ) )
        return hr;
    
    // Obtain an interface to the system keyboard device.
    if( FAILED( hr = g_pDI->CreateDevice( GUID_SysKeyboard, &g_pKeyboard, NULL ) ) )
        return hr;
    
    // Set the data format to "keyboard format" - a predefined data format 
    //
    // A data format specifies which controls on a device we
    // are interested in, and how they should be reported.
    //
    // This tells DirectInput that we will be passing an array
    // of 256 bytes to IDirectInputDevice::GetDeviceState.
    if( FAILED( hr = g_pKeyboard->SetDataFormat( &c_dfDIKeyboard ) ) )
        return hr;
    
    // Set the cooperativity level to let DirectInput know how
    // this device should interact with the system and with other
    // DirectInput applications.
    hr = g_pKeyboard->SetCooperativeLevel( hDlg, DISCL_EXCLUSIVE );


    if( FAILED(hr) )
        return hr;

    
        // IMPORTANT STEP TO USE BUFFERED DEVICE DATA!
        //
        // DirectInput uses unbuffered I/O (buffer size = 0) by default.
        // If you want to read buffered data, you need to set a nonzero
        // buffer size.
        //
        // Set the buffer size to DINPUT_BUFFERSIZE (defined above) elements.
        //
        // The buffer size is a DWORD property associated with the device.
        DIPROPDWORD dipdw;

        dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
        dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
        dipdw.diph.dwObj        = 0;
        dipdw.diph.dwHow        = DIPH_DEVICE;
        dipdw.dwData            = SAMPLE_BUFFER_SIZE; // Arbitary buffer size

        if( FAILED( hr = g_pKeyboard->SetProperty( DIPROP_BUFFERSIZE, &dipdw.diph ) ) )
            return hr;
    

    // Acquire the newly created device
    g_pKeyboard->Acquire();

    // Set a timer to go off 12 times a second, to read input
    // Note: Typically an application would poll the keyboard
    //       much faster than this, but this slow rate is simply 
    //       for the purposes of demonstration
    SetTimer( hDlg, 0, 1000 / 12, NULL );

    return S_OK;
}


//-----------------------------------------------------------------------------
// Name: WinMain()
// Desc: The application's entry point
//-----------------------------------------------------------------------------
INT WINAPI WinMain( HINSTANCE hInst, HINSTANCE, LPSTR, INT )
{
    // Register the window class
    WNDCLASSEX wc = { sizeof(WNDCLASSEX), CS_CLASSDC, MsgProc, 0L, 0L, 
                      GetModuleHandle(NULL), NULL, NULL, NULL, NULL,
                      "D3D Tutorial", NULL };
    RegisterClassEx( &wc );

    // Create the application's window
    HWND hWnd = CreateWindow( "D3D Tutorial", "D3D Tutorial 06: Meshes", 
                              WS_OVERLAPPEDWINDOW, 100, 100, 1280, 800,
                              GetDesktopWindow(), NULL, wc.hInstance, NULL );
OnCreateDevice(hWnd);
    // Initialize Direct3D
    if( SUCCEEDED( InitD3D( hWnd ) ) )
    { 
        // Create the scene geometry
        if( SUCCEEDED( InitGeometry() ) )
        {
            // Show the window
            ShowWindow( hWnd, SW_SHOWDEFAULT );
            UpdateWindow( hWnd );

            // Enter the message loop
            MSG msg; 
            ZeroMemory( &msg, sizeof(msg) );
            while( msg.message!=WM_QUIT )
            {
                if( PeekMessage( &msg, NULL, 0U, 0U, PM_REMOVE ) )
                {
                    TranslateMessage( &msg );
                    DispatchMessage( &msg );
                }
                else
                    Render();
            }
        }
    }

    UnregisterClass( "D3D Tutorial", wc.hInstance );
    return 0;
}



