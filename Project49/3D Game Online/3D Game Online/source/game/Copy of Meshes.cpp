#include <iostream>
#include <String>
#include <Windows.h>
#include <mmsystem.h>
#include <d3dx9.h>
#include "Camera.h"
#include <dinput.h>
#include <strsafe.h>
#include "StoreMesh.h"
#include "Skeletal.h"
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

loadresource armor;
loadresource armor2;
StoreMesh people;
int	time=timeGetTime()/1000;
float cameraRolDown = 0.0f;
float cameraRolRight = 0.0f;
float cameraMoveForward = -40.0f;
float cameraMoveRight = -2.0f;
float MoveForward = -10.0f;
float MoveRight = 0.0f;
StoreMesh* collision[5];
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

	if(KEYDOWN(buffer, DIK_UP) && KEYDOWN(buffer, DIK_LEFT))		return "UL";
	if(KEYDOWN(buffer, DIK_UP) && KEYDOWN(buffer, DIK_RIGHT))		return "UR";
	if(KEYDOWN(buffer, DIK_DOWN) && KEYDOWN(buffer, DIK_RIGHT))		return "DR";
	if(KEYDOWN(buffer, DIK_DOWN) && KEYDOWN(buffer, DIK_LEFT))		return "DL";
	if(KEYDOWN(buffer, DIK_UP))		return "UP";
	if(KEYDOWN(buffer, DIK_RIGHT))	return "RIGHT";
	if(KEYDOWN(buffer, DIK_DOWN))	return "DOWN";
	if(KEYDOWN(buffer, DIK_LEFT))	return "LEFT";

//ADD KEY

	return "";
}
bool checkcollision(float x,float y,int number)
{	for (int i=0;i<5;i++)
	{	if (collision[i] != NULL && i!=number)
		{	if(x<((collision[i]->x)+1.0f) && x>((collision[i]->x)-1.0f)&& y<((collision[i]->z)+1.0f) && y>((collision[i]->z)-1.0f))
			{ return true;}
		}
	}
	return false;
}
int checkatk(float x,float y,int number)
{	for (int i=0;i<5;i++)
	{	if (collision[i] != NULL && i!=number)
		{	if(x<((collision[i]->x)+1.0f) && x>((collision[i]->x)-1.0f)&& y<((collision[i]->z)+1.0f) && y>((collision[i]->z)-1.0f))
			{ return i;}
		}
	}
	return -1;
}
bool checkdes(float x,float y,StoreMesh des)
{	if(x<(des.x+1.0f) && x>(des.x-1.0f)&& y<(des.z+1.0f) && y>(des.z-1.0f))
			{ return true;} else return false;
}
void moveto(StoreMesh& user,StoreMesh& des,int number)
{float x=0.0;float z=0.0;float ry=0.0;
x=des.x-user.x;
z=des.z-user.z;
ry=atan2(z,x);
ry=ry * (180.0f/D3DX_PI);
//ry = 180+ry;
user.ry=180-ry;
user.status = 3;
if ((timeGetTime() - user.time) > 10)
	{user.time = timeGetTime();
		if(!checkdes((user.x)-0.2*cos(D3DXToRadian(user.ry)),(user.z)+0.2*sin(D3DXToRadian(user.ry)),des))
		{
				if(!checkcollision((user.x)-0.2*cos(D3DXToRadian(user.ry)),(user.z)+0.2*sin(D3DXToRadian(user.ry)),number))
				{user.x -= 0.2*cos(D3DXToRadian(user.ry));
				user.z += 0.2*sin(D3DXToRadian(user.ry));}
				else {	if(!checkcollision((user.x)-0.2*cos(D3DXToRadian(user.ry)),user.z,number))
						{user.x -= 0.2*cos(D3DXToRadian(user.ry));} 
						if(!checkcollision(user.x,(user.z)+0.2*sin(D3DXToRadian(user.ry)),number))
						{user.z += 0.2*sin(D3DXToRadian(user.ry));}
				}
		}else {user.status = 5;
				if ((timeGetTime() - user.timeatk) > 666)
				{user.timeatk = timeGetTime();des.player->blood -= (user.player->atkmin)-(des.player->defmin);}}
	}
		//user.status = 1;
	

}
void checkmonster()
{	for (int i=1;i<5;i++)
	{	if (collision[i] != NULL)
		{	if(people.x<((collision[i]->x)+10.0f) && people.x>((collision[i]->x)-10.0f)&& people.z<((collision[i]->z)+10.0f) && people.z>((collision[i]->z)-10.0f))
			{	if(collision[i]->status != 6)
				moveto(*collision[i],people,i);}
		}
	}
	
}
void checkdie()
{	for (int i=1;i<5;i++)
	{	if (collision[i] != NULL)
		{	if(collision[i]->player->blood <= 0)			
			{	if(collision[i]->status != 6){collision[i]->time = timeGetTime();}
					collision[i]->status = 6;
				if ((timeGetTime() - (collision[i]->time)) > 500)
				{collision[i]->parent->nextmesh=collision[i]->nextmesh;
				if(collision[i]->nextmesh)
					collision[i]->nextmesh->parent = collision[i]->parent;
				StoreMesh *temp;
				temp = collision[i];
				collision[i]=NULL;
				delete[] temp;
				}
				}
		}
	}
	if(collision[0]->player->blood<0)
	{collision[0]->position(0.0f,0.0f,0.0f);collision[0]->player->calstatus(0);
	}
	
}
void MovementCamera(CXCamera camera)
{
	string inputRead = GetInput();
	if (inputRead == "UL") 
	{	people.ry = 45;
	if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
		if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),0))
		{people.x -= 0.4*cos(D3DXToRadian(people.ry));
		people.z += 0.4*sin(D3DXToRadian(people.ry));}
		}
		people.status = 1;
	}
	if (inputRead == "UR") 
	{	people.ry = 135;
		if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
		if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),0))
		{people.x -= 0.4*cos(D3DXToRadian(people.ry));
		people.z += 0.4*sin(D3DXToRadian(people.ry));}
		}
		people.status = 1;
	}
	if (inputRead == "DR") 
	{	people.ry = -135;
		if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
		if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),0))
		{people.x -= 0.4*cos(D3DXToRadian(people.ry));
		people.z += 0.4*sin(D3DXToRadian(people.ry));}
		}
		people.status = 1;
	}
	if (inputRead == "DL") 
	{	people.ry = -45;
		if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
		if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),0))
		{people.x -= 0.4*cos(D3DXToRadian(people.ry));
		people.z += 0.4*sin(D3DXToRadian(people.ry));}
		}
		people.status = 1;
	}
	if (inputRead == "UP") 
	{	//people.x -= 0.07*cos(D3DXToRadian(people.ry));
		//people.z += 0.07*sin(D3DXToRadian(people.ry));
		if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
		if(!checkcollision(people.x,(people.z)+0.4f,0))
		{people.z += 0.4f;}
		}
		people.ry = 90;
		people.status = 1;
		//cameraRolDown = cameraRolDown - 0.01f;
		//camera.RotateDown(cameraRolDown);
		//camera.RotateRight(cameraRolRight);
	}
	else if (inputRead == "DOWN") 
	{
		/*cameraRolDown = cameraRolDown + 0.01f;
		camera.RotateDown(cameraRolDown);
		camera.RotateRight(cameraRolRight);*/
		if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
		if(!checkcollision(people.x,(people.z)-0.4f,0))
		{people.z -= 0.4f;}
		}
		people.ry = -90;
		people.status = 1;
	}
	else if (inputRead == "RIGHT") 
	{	 /*people.ry += 1.5;*/
		if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
			if(!checkcollision((people.x)+0.4f,people.z,0))
			{people.x += 0.4f;}
		}
		people.ry = 180;
		people.status = 1;
		//cameraRolRight = cameraRolRight + 0.01f;
		//camera.RotateRight(cameraRolRight);
		//camera.RotateDown(cameraRolDown);
	}
	else if (inputRead == "LEFT") 
	{   /*people.ry -= 1.5;*/
		if ((timeGetTime() - people.time) > 10)
		{people.time = timeGetTime();
		if(!checkcollision((people.x)-0.4f,people.z,0))
		{people.x -= 0.4f;}
		}
		people.ry = 0;
		people.status = 1;
		//cameraRolRight = cameraRolRight - 0.01f;
		//camera.RotateRight(cameraRolRight);
		//camera.RotateDown(cameraRolDown);
	}
	else 
	{
		camera.RotateDown(cameraRolDown);
		camera.RotateRight(cameraRolRight);
	}
	camera.Update();
	if (inputRead == "T") 
	{/*people2.x -= 0.07*cos(D3DXToRadian(people2.ry));
		people2.z += 0.07*sin(D3DXToRadian(people2.ry));
		people2.status = 1;*/}
	if (inputRead == "G") 
	{//people.y -= 0.1;
		//moveto(people,people2,0);
	}
	if (inputRead == "F") 
	{ //people2.ry -= 1.5;
	}
	if (inputRead == "H") 
	{//people2.ry += 1.5;
	}
	
	if (inputRead == "W") 
	{
		MoveForward = 0.2f;
		camera.MoveForward(MoveForward);
		camera.Update();
	}
	else if (inputRead == "S") 
	{
		MoveForward = -0.2f;
		camera.MoveForward(MoveForward);
		camera.Update();
	}
	else if (inputRead == "A") 
	{	people.status = 2;
		if ((timeGetTime() - people.time) > 700)
		{people.time = timeGetTime();
			int atk = checkatk((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),0);
			if(atk>0)
			{	//collision[atk]->hp -= 3;
				collision[atk]->player->blood -= (collision[0]->player->atkmin)-(collision[atk]->player->defmin);
				
			}
		}
		//MoveRight = -0.2;
		//camera.MoveRight(MoveRight);
		//camera.Update();
	}
	else if (inputRead == "D") 
	{
		MoveRight = 0.2;
		camera.MoveRight(MoveRight);
		camera.Update();
	}
	D3DXVECTOR3* vecPosition = camera.GetPosition();
	cameraMoveForward = (*vecPosition).z;
	cameraMoveRight = (*vecPosition).x;
}

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






VOID Cleanup()
{
    armor.Cleanup();
   armor2.Cleanup();
    if( g_pd3dDevice != NULL )
        g_pd3dDevice->Release();

    if( g_pD3D != NULL )
        g_pD3D->Release();
	if( g_pKeyboard ) 
        g_pKeyboard->Unacquire();
}

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
    if( g_pKeyboard ) 
        g_pKeyboard->Unacquire();
    SAFE_RELEASE( g_pKeyboard );
    SAFE_RELEASE( g_pDI );
}

HRESULT OnCreateDevice( HWND hDlg )
{
    HRESULT hr;
    KillTimer( hDlg, 0 );    
    FreeDirectInput();
	if( FAILED( hr = DirectInput8Create( GetModuleHandle(NULL), DIRECTINPUT_VERSION, 
                                         IID_IDirectInput8, (VOID**)&g_pDI, NULL ) ) )
        return hr;
    if( FAILED( hr = g_pDI->CreateDevice( GUID_SysKeyboard, &g_pKeyboard, NULL ) ) )
        return hr;
    if( FAILED( hr = g_pKeyboard->SetDataFormat( &c_dfDIKeyboard ) ) )
        return hr;
    hr = g_pKeyboard->SetCooperativeLevel( hDlg, DISCL_EXCLUSIVE );
   if( FAILED(hr) )
        return hr;
        DIPROPDWORD dipdw;
        dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
        dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
        dipdw.diph.dwObj        = 0;
        dipdw.diph.dwHow        = DIPH_DEVICE;
        dipdw.dwData            = SAMPLE_BUFFER_SIZE; // Arbitary buffer size

        if( FAILED( hr = g_pKeyboard->SetProperty( DIPROP_BUFFERSIZE, &dipdw.diph ) ) )
            return hr;
    g_pKeyboard->Acquire();
    SetTimer( hDlg, 0, 1000 / 12, NULL );
    return S_OK;
}



VOID Render()
{   g_pd3dDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, 
                         D3DCOLOR_XRGB(0,0,255), 1.0f, 0 );
    if( SUCCEEDED( g_pd3dDevice->BeginScene() ) )
	{	people.renderall(g_pd3dDevice,armor);
		for (int i=1;i<5;i++)
		{	if(collision[i])
			collision[i]->renderall(g_pd3dDevice,armor2);		
		}
        g_pd3dDevice->EndScene();
    }
    g_pd3dDevice->Present( NULL, NULL, NULL, NULL );
}
INT WINAPI WinMain( HINSTANCE hInst, HINSTANCE, LPSTR, INT )
{
    // Register the window class
    WNDCLASSEX wc = { sizeof(WNDCLASSEX), CS_CLASSDC, MsgProc, 0L, 0L, 
                      GetModuleHandle(NULL), NULL, NULL, NULL, NULL,
                      "D3D Tutorial", NULL };
    RegisterClassEx( &wc );

    // Create the application's window
    HWND hWnd = CreateWindow( "D3D Tutorial", "D3D Tutorial 06: Meshes", 
                              WS_OVERLAPPEDWINDOW, 0, 0, 1280, 800,
                              GetDesktopWindow(), NULL, wc.hInstance, NULL );
OnCreateDevice(hWnd);
LPCSTR xx = "SwordMan.x";
LPCSTR yy = "nin.x";
char* zz = "SwordMan.x";
char* zzz = "nin.x";
//people2.x = 5.0f;
//people2.z -= 5.0f;
//people3.z -= 5.0f;
//people.status = 4;
people.player->calstatus(0);
people.addmesh("bot1");
people.addmesh("bot2");
people.addmesh("bot3");
people.addmesh("bot4");
collision[0] = &people;
collision[1] = people.findmesh("bot1");
collision[2] = people.findmesh("bot2");
collision[3] = people.findmesh("bot3");
collision[4] = people.findmesh("bot4");
collision[1]->player->calstatus(1);
collision[2]->player->calstatus(1);
collision[3]->player->calstatus(1);
collision[4]->player->calstatus(1);
collision[1]->x += 15.0f;
collision[1]->z += 15.0f;
collision[2]->z += 15.0f;
collision[3]->x += 15.0f;
collision[4]->z -= 15.0f;
    // Initialize Direct3D
    if( SUCCEEDED( InitD3D( hWnd ) ) )
    {	
        // Create the scene geometry
        if( SUCCEEDED( armor.InitGeometry(g_pd3dDevice,xx,zz,'w') ) )
		{	//armor2.InitGeometry(g_pd3dDevice,xx);
            // Show the window
			armor2.InitGeometry(g_pd3dDevice,yy,zzz,'n');
            ShowWindow( hWnd, SW_SHOWDEFAULT );
            UpdateWindow( hWnd );

            // Enter the message loop
            MSG msg; 
            ZeroMemory( &msg, sizeof(msg) );
			
			
			//InitGeometry(y);
			//Render();
            while( msg.message!=WM_QUIT )
            {
                if( PeekMessage( &msg, NULL, 0U, 0U, PM_REMOVE ) )
                {
                    TranslateMessage( &msg );
                    DispatchMessage( &msg );
				}else{Render();
				//moveto(*collision[1],people,1);
				//moveto(*collision[2],people,2);
				checkmonster();
				checkdie();
				CXCamera oat(g_pd3dDevice);
				//oat.SetPosition(cameraMoveRight, 0.0f,cameraMoveForward);
				D3DXVECTOR3 vEyePt( (people.x)-2.0f, 20.0f,(people.z)-60.0f);
				D3DXVECTOR3 vLookatPt( people.x,people.y, people.z );
				D3DXVECTOR3 vUpVec( 0.0f, 1.0f, 0.0f );
				oat.LookAtPos(&vEyePt,&vLookatPt,&vUpVec);
				MovementCamera(oat);}
                
            }
			
		}
    }

    UnregisterClass( "D3D Tutorial", wc.hInstance );
    return 0;
}



