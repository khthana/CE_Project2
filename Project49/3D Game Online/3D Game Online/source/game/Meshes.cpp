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
#include <cstdlib>
#include <string>
#include <sstream>
#include <dsound.h>
#include <dplay8.h>
#include "bitmap.h"
//#include "dsound.h"
#include "SoundPlayer.h"

using namespace std;

int new_connect();

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
LPD3DXFONT				g_lp3dxfont = NULL;

IDirectPlay8Client		*g_pDPClient		= NULL;
IDirectPlay8Address*	g_pDeviceAddress	= NULL;
IDirectPlay8Address*	hostAddress			= NULL;

loadresource armor;loadresource armor5;
loadresource armor2;loadresource ninr;
loadresource armor3;loadresource zomr;
loadresource armor4;float zoom = 1.0;
int rdia = 45;int roll = 0;
loadresource map;loadresource Ruin1;loadresource Ruin2;loadresource wall;loadresource tree;loadresource car;loadresource house;
loadresource lamb;
loadresource map2;loadresource door;loadresource tower;loadresource b1;loadresource light1;loadresource tree2;loadresource home;
loadresource box;
StoreMesh people;
StoreMesh player;
StoreMesh mapmesh;StoreMesh mapmesh2;int selmap =0;int tselmap =1;int firstpac =0;int notreceive = 0;int tabon = 0;DWORD timetab = 0;
StoreMesh* tmap;int point=0;DWORD click=0;int de=0;int de2=0;int warn1=0;int warn2=0;
//Soundout sound[5];
char r[10];
int	time=timeGetTime()/1000;
DWORD timetosend = 0;
float cameraRolDown = 0.0f;
float cameraRolRight = 0.0f;
float cameraMoveForward = -40.0f;
float cameraMoveRight = -2.0f;
float MoveForward = -10.0f;
float MoveRight = 0.0f;
//DWORD timetorevive;
StoreMesh* collision[10];
char str[10];
int aim=-1;//show hp monster
int templv = 1;
int maxexp = 0;
int sizepacket = 0;
int receiveplayer = 0;
int server = 0;
int flag = 0;

LPD3DXSPRITE			lpSprite = NULL;
LPDIRECT3DTEXTURE9		pTexture = NULL;
Picture2D				picture2D;
string status = "username";
string username = "";
string password = "";
//istringstream b(s)
//b >> float

CSoundPlayer *gSoundPlayer=NULL;
LPDIRECTSOUND8 g_psound;

static const GUID g_guidApp = 
{ 0xede9493e, 0x6ac8, 0x4f15, { 0x8d, 0x1, 0x8b, 0x16, 0x32, 0x0, 0xb9, 0x66 } };

struct Packet_recieve
{
public:
	int column;
	int size;//row
	string str[455];
	string status_user;
};

struct Packet_sent
{
	string str_query;
	char username_login[9];
	char password_login[9];
	float positionX;
	float positionY;
	float rotate;
	int status;
	float blood;
	int exp;
};
Packet_sent pack_sent;

struct Packet_sent_lv_up
{
	string str_query;
	char username_login[9];
	char password_login[9];
	float positionX;
	float positionY;
	float rotate;
	int status;
	float blood;
	int exp;
	int lv;
	int str;
	int dex;
	int hp;
	int agi;
	int number_mon;
};
Packet_sent_lv_up pack_sent_lv_up;

struct Packet_sent_logout
{
	string str_query;
	char username_login[9];
	char password_login[9];
	float positionX;
	float positionY;
	float rotate;
	int status;
	float blood;
	int exp;
	int lv;
	int str;
	int dex;
	int hp;
	int agi;
	int number_mon;
	int map;
};
Packet_sent_logout pack_sent_logout;


#ifdef _WIN32_DCOM

class COMModule {
public:
	COMModule()
	{
		CoInitializeEx(0, COINIT_MULTITHREADED);
	}

	~COMModule()
	{
		CoUninitialize();
	}
};

#endif

int sentData(string str_sent,float positionX,float positionY,float rotate,int status)
{
//	Packet_sent pack_sent;
	pack_sent.str_query = str_sent;
	pack_sent.positionX = positionX;
	pack_sent.positionY = positionY;
	pack_sent.rotate = rotate;
	pack_sent.status = status;
	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_sent);
    bufferDesc.pBufferData  = (BYTE*) &pack_sent;

	g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
	return 0;
}

int sentData_lv_up(string str_sent,float positionX,float positionY,float rotate,int status,float blood,int exp,int lv,int str,int dex,int hp,int agi)
{
//	Packet_sent pack_sent;
	pack_sent_lv_up.str_query = str_sent;
	pack_sent_lv_up.positionX = positionX;
	pack_sent_lv_up.positionY = positionY;
	pack_sent_lv_up.rotate = rotate;
	pack_sent_lv_up.status = status;
	pack_sent_lv_up.blood = blood;
	pack_sent_lv_up.exp = exp;
	pack_sent_lv_up.lv = lv;
	pack_sent_lv_up.str = str;
	pack_sent_lv_up.dex = dex;
	pack_sent_lv_up.hp = hp;
	pack_sent_lv_up.agi = agi;

	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_sent_lv_up);
    bufferDesc.pBufferData  = (BYTE*) &pack_sent_lv_up;

	g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
	return 0;
}

int sentData_logout(string str_sent,float positionX,float positionY,float rotate,int status,float blood,int exp,int lv,int str,int dex,int hp,int agi,int map)
{
//	Packet_sent pack_sent;
	pack_sent_logout.str_query = str_sent;
	pack_sent_logout.positionX = positionX;
	pack_sent_logout.positionY = positionY;
	pack_sent_logout.rotate = rotate;
	pack_sent_logout.status = status;
	pack_sent_logout.blood = blood;
	pack_sent_logout.exp = exp;
	pack_sent_logout.lv = lv;
	pack_sent_logout.str = str;
	pack_sent_logout.dex = dex;
	pack_sent_logout.hp = hp;
	pack_sent_logout.agi = agi;
	pack_sent_logout.map = map;

	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_sent_logout);
    bufferDesc.pBufferData  = (BYTE*) &pack_sent_logout;

	g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
	return 0;
}

int sentData_attack(string str_sent,float damage,int number_m)
{
	pack_sent_lv_up.str_query = str_sent;
	pack_sent_lv_up.blood = damage;
	pack_sent_lv_up.number_mon = number_m;

	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_sent_lv_up);
    bufferDesc.pBufferData  = (BYTE*) &pack_sent_lv_up;

	g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
	return 0;
}

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

	if(KEYDOWN(buffer, DIK_BACK))	return "BACK";
	if(KEYDOWN(buffer, DIK_RETURN))	return "ENTER";
//ADD KEY

	return "";
}

void printText(string user,string passsword)
{
	char str1[9];
	char str2[9];
	int str_size = user.size();
//	if(status == "username")
//	{
		if(str_size <= 8)
		{
			for(int i = 0;i < str_size;i++)
			{
				str1[i] = user[i];
			}
			for(int j = str_size;j < 9;j++)
			{
				str1[j] = NULL;
			}
		}
//	}
	RECT Rect;
	Rect.left=420;
	Rect.right=420;
	Rect.top=275;
	Rect.bottom=275;
	g_lp3dxfont->DrawText(NULL,str1,-1,&Rect,DT_CENTER|DT_NOCLIP,D3DCOLOR_XRGB(0,0,0));
	str_size = password.size();
//	if(status == "password")
//	{
		if(str_size <= 8)
		{
			for(int k = 0;k < str_size;k++)
			{
				str2[k] = '*';
			}
			for(int l = str_size;l < 9;l++)
			{
				str2[l] = NULL;
			}
		}
//	}
	Rect.left=420;
	Rect.right=420;
	Rect.top=325;
	Rect.bottom=325;
	g_lp3dxfont->DrawText(NULL,str2,-1,&Rect,DT_CENTER|DT_NOCLIP,D3DCOLOR_XRGB(0,0,0));
}

int loginuser()
{
	string inputRead = GetInput();
	if(inputRead != "" && inputRead != "BACK" && inputRead != "ENTER")
	{
		username.append(inputRead);
		printText(username,password);
		Sleep(200);
	}
	else if(inputRead == "BACK")
	{
		int size_str = username.size() - 1;
		username = username.substr(0,size_str);
		printText(username,password);
		Sleep(200);
	}
	else if(inputRead == "ENTER")
	{
		status = "password";
		printText(username,password);
		Sleep(200);
	}
	else
	{
		printText(username,password);;
	}
	return 0;
}

int loginpassword()
{
	string inputRead = GetInput();
	if(inputRead != "" && inputRead != "BACK" && inputRead != "ENTER")
	{
		password.append(inputRead);
		printText(username,password);
		Sleep(200);
	}
	else if(inputRead == "BACK")
	{
		int size_str = password.size() - 1;
		password = password.substr(0,size_str);
		printText(username,password);
		Sleep(200);
	}
	else if(inputRead == "ENTER")
	{
		status = "wait";

//		Packet_sent pack_sent;
		pack_sent.str_query			= "login";
		int str_size = username.size();
		if(str_size <= 8)
		{
			for(int i = 0;i < str_size;i++)
			{
				pack_sent.username_login[i] = username[i];
				pack_sent_lv_up.username_login[i] = username[i];
				pack_sent_logout.username_login[i] = username[i];
			}
			for(int j = str_size;j < 9;j++)
			{
				pack_sent.username_login[j] = NULL;
				pack_sent_lv_up.username_login[j] = NULL;
				pack_sent_logout.username_login[j] = NULL;
			}
		}
		str_size = password.size();
		if(str_size <= 8)
		{
			for(int k = 0;k < str_size;k++)
			{
				pack_sent.password_login[k] = password[k];
//				pack_sent_lv_up.password_login[k] = password[k];
//				pack_sent_logout.password_login[k] = password[k];
			}
			for(int l = str_size;l < 9;l++)
			{
				pack_sent.password_login[l] = NULL;
//				pack_sent_lv_up.password_login[l] = NULL;
//				pack_sent_logout.password_login[k] = NULL;
			}
		}
		DPN_BUFFER_DESC bufferDesc;
		bufferDesc.dwBufferSize = sizeof(pack_sent);
		bufferDesc.pBufferData  = (BYTE*) &pack_sent;
		g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
	}
	else
	{
		printText(username,password);
	}
	return 0;
}

float StringToFloat(string str_num)
{
	istringstream b(str_num);
	float f;
	b >> f;
	return f;
}

int Font_DirectX(int x)
{	
	HDC hDC;
	int Height;     
	//Create LPD3DXFONT interface   
	hDC = GetDC( NULL );
	if(x == 0)
	{
		Height = -MulDiv(28,(int)GetDeviceCaps(hDC, LOGPIXELSY),72);
	}
	else
	{
		Height = -MulDiv(18,(int)GetDeviceCaps(hDC, LOGPIXELSY),72);
	}
	//Height = -( point_size * LOGPIXELSY ) / 72	 
	if(FAILED(D3DXCreateFont(g_pd3dDevice,Height,0,FW_BOLD,0,FALSE,DEFAULT_CHARSET
						,OUT_DEFAULT_PRECIS,ANTIALIASED_QUALITY,VARIABLE_PITCH
						,TEXT("Angsana new"),&g_lp3dxfont))) 
	{
		MessageBox(NULL,"Couldn't create LPD3DXFONT interface",
		"ERROR",MB_OK|MB_ICONEXCLAMATION);
		return -1;
	}
	ReleaseDC( NULL, hDC );     
	return 0;
}

HRESULT WINAPI DirectPlayMessageHandler( PVOID pvUserContext, DWORD dwMessageId, PVOID pMsgBuffer )
{
	HRESULT hr = S_OK; 
	switch (dwMessageId)
		{
			case DPN_MSGID_CREATE_PLAYER:
			{
				//CreatePlayer(UserContext,MessageData);
				break;
			}

			case DPN_MSGID_DESTROY_PLAYER:
			{
				//DestroyPlayer( UserContext , MessageData );
				break;
			}

			case DPN_MSGID_HOST_MIGRATE:
			{
				break;
			}
				
			case DPN_MSGID_TERMINATE_SESSION:
			{
				break;
			}
				
			case DPN_MSGID_RECEIVE:
			{
				PDPNMSG_RECEIVE msg;
				msg = (PDPNMSG_RECEIVE)pMsgBuffer;

				Packet_recieve *pack_recieve;
				pack_recieve = (Packet_recieve*)msg->pReceiveData;
				float number = 0.0;
				if(status == "play")
				{	if(firstpac == 0)
					{firstpac = 1;
					selmap = atoi(pack_recieve->str[15].c_str());}
				if(notreceive == 0 && atoi(pack_recieve->str[15].c_str())==selmap)
				{
				int x = pack_recieve->column * pack_recieve->size;
				if(x<=455 && x>0)
				{
					StoreMesh *y = player.nextmesh;
					StoreMesh *yy = player.nextmesh;
					int c=0;int b=0;
					if (sizepacket != x || selmap != tselmap|| warn2 == 1)//size of receive packet is change
					{	tselmap = selmap;
						if(warn2 == 1)warn2 = 0; else warn1 = 1;
						for(int i=0;i<x;i=i+pack_recieve->column)
						{						
							if(pack_recieve->str[i]==username)//that mesh is you
							{	if(receiveplayer == 0)//first time
								{
									string s = pack_recieve->str[i];
									
									int str_size = s.size();
									if(str_size <= 9)
									{
										for(int i = 0;i < str_size;i++)
										{
											r[i] = s[i];
										}
										for(int j = str_size;j <= 9;j++)
										{
											r[j] = NULL;
										}
									}
									people.name = r;
									people.x = strtod(pack_recieve->str[i+3].c_str(),NULL);
									people.z = strtod(pack_recieve->str[i+4].c_str(),NULL);
									people.ry = strtod(pack_recieve->str[i+5].c_str(),NULL);
									people.status = atoi(pack_recieve->str[i+6].c_str());
									if(atoi(pack_recieve->str[i+7].c_str())==0)//0='w'
										people.action = '0';
									else if(atoi(pack_recieve->str[i+7].c_str())==1)//1='n'
										people.action = '1';
									else if(atoi(pack_recieve->str[i+7].c_str())==2)//1='z'
										people.action = '2';
									else if(atoi(pack_recieve->str[i+7].c_str())==3)//1='w'
										people.action = '3';
									people.player->blood = strtod(pack_recieve->str[i+8].c_str(),NULL);
									people.player->exp = atoi(pack_recieve->str[i+9].c_str());
									people.player->lv = strtod(pack_recieve->str[i+10].c_str(),NULL);
									people.player->str = strtod(pack_recieve->str[i+11].c_str(),NULL);
									people.player->dex = strtod(pack_recieve->str[i+12].c_str(),NULL);
									people.player->agi = strtod(pack_recieve->str[i+13].c_str(),NULL);
									people.player->hp = strtod(pack_recieve->str[i+14].c_str(),NULL);
									selmap = atoi(pack_recieve->str[i+15].c_str());
									people.player->calstatus(0);
									templv = people.player->lv;
									receiveplayer = 1;
								}
							}else//other player mesh
							{	y = player.nextmesh;
								while(y)
								{	if(pack_recieve->str[i].c_str()==y->name)
									{c=1;}
										y = y->nextmesh;
								}
								if(c!=1)
								{	
									float f1,f2;
									f1 = strtod(pack_recieve->str[i+3].c_str(),NULL);
									f2 = strtod(pack_recieve->str[i+4].c_str(),NULL);
									//char s[9];
									//sprintf(s,"%s",pack_recieve->str[i]);
									const char* cr =  pack_recieve->str[i].c_str();
									yy = player.addmesh(cr,f1,f2,2,2);
									yy->ry = strtod(pack_recieve->str[i+5].c_str(),NULL);
									yy->status = atoi(pack_recieve->str[i+6].c_str());
									if(atoi(pack_recieve->str[i+7].c_str())==0)
										yy->action = '0';//ply1
									else if(atoi(pack_recieve->str[i+7].c_str())==1)
										{yy->action = '1';//ninw
										yy->player->calstatus(1);}
									else if(atoi(pack_recieve->str[i+7].c_str())==2)
										{yy->action = '2';//zomw
										yy->player->calstatus(3);}
									else if(atoi(pack_recieve->str[i+7].c_str())==3)
										yy->action = '3';//ply2
									else if(atoi(pack_recieve->str[i+7].c_str())==4)
										{yy->action = '4';//ninred
										yy->player->calstatus(2);}
									else if(atoi(pack_recieve->str[i+7].c_str())==5)
										{yy->action = '5';//zomred
										yy->player->calstatus(3);}
									yy->timeatk = timeGetTime();
									yy->number = atoi(pack_recieve->str[i].c_str());
								}
								y = player.nextmesh;
								while(y)
								{	if(pack_recieve->str[i].c_str()==y->name)
									{y->flag=1;}
										y = y->nextmesh;
								}
								c=0;
								y = player.nextmesh;
							}
						

						}
						y = player.nextmesh;
						while(y)
						{	if(y->flag==0)
							{y->flag = 3;
						y = y->nextmesh;
							}else
							{y->flag = 0;
							y = y->nextmesh;
							}
						}
						y = player.nextmesh;
						sizepacket = x;
					} else
					{	for(int i=0;i<x;i=i+pack_recieve->column)
						{
							while(y)
							{if(!strcmp(pack_recieve->str[i].c_str(),y->name))
								{		
									y->desx = strtod(pack_recieve->str[i+3].c_str(),NULL);
									y->desz = strtod(pack_recieve->str[i+4].c_str(),NULL);
									if(atoi(pack_recieve->str[i+7].c_str())==0 || atoi(pack_recieve->str[i+7].c_str())==3)//0='w'
									{	y->ry = strtod(pack_recieve->str[i+5].c_str(),NULL);
										y->status = atoi(pack_recieve->str[i+6].c_str());
										if(y->status == 1)
										y->delaystatus = timeGetTime();
										else if(y->status == 2)
										y->delaystatus2 = timeGetTime();
									}else//bot
									{	if(atoi(pack_recieve->str[i+6].c_str())<3)
										{	if(y->status > 2)y->status = 0;
											if(atoi(pack_recieve->str[i+6].c_str()) == 1)
											y->delaystatus = timeGetTime();
											else if (atoi(pack_recieve->str[i+6].c_str()) == 2)
											{y->status = atoi(pack_recieve->str[i+6].c_str());y->delaystatus2 = timeGetTime();}
										}else if(atoi(pack_recieve->str[i+6].c_str())==3||atoi(pack_recieve->str[i+6].c_str())==4)
										y->status = atoi(pack_recieve->str[i+6].c_str());
										else
											y->status = 0;

										y->player->blood = strtod(pack_recieve->str[i+8].c_str(),NULL);
									}
								}
								
									y = y->nextmesh;
							}
							if(!strcmp(pack_recieve->str[i].c_str(),people.name))
								{people.player->blood = strtod(pack_recieve->str[i+8].c_str(),NULL);}
							y = player.nextmesh;
						}
					}
					y = NULL;yy = NULL;
					delete y;delete yy;
					//x = pack_recieve->str[0];
//					MessageBox(NULL,"accept data","Client",MB_OKCANCEL);
				}	
				}
				}
				else if(status == "wait")
				{
					string str_recieve = pack_recieve->status_user;
					if(str_recieve.length() >= 2)
					{
						string status1 = str_recieve.substr(0,2);
						int siz = str_recieve.length();
						string name = str_recieve.substr(2,siz-1);
						if(status1 == "OK" && name == username)
						{
							server = pack_recieve->size;
							int res = 0;
							res = new_connect();
							if(res != -1)
							{
								status = "play";
								if(flag == 0)
								{
//									MessageBox(NULL,"play","Client",MB_OKCANCEL);
									sentData("Play",people.x,people.z,people.ry,people.status);
									flag = 1;
								}
//								MessageBox(NULL,"Login Success","Client",MB_OKCANCEL);
								Font_DirectX(1);
							}							
//							cout << "PLAY" << endl;
						}
					}

/*					if(pack_recieve->status_user == "OK" )
					{
						MessageBox(NULL,"Login Success","Client",MB_OKCANCEL);
						Font_DirectX(1);
						status = "play";
					}
*/				}
				break;
			}
			case DPN_MSGID_CONNECT_COMPLETE:
			{
				PDPNMSG_CONNECT_COMPLETE pcomplete;
				pcomplete=(PDPNMSG_CONNECT_COMPLETE)pMsgBuffer;
				if (pcomplete->hResultCode == DPN_OK)
				{
//					MessageBox(NULL,"Connect complete......","Client",MB_OKCANCEL);
					cout << "Connect Complete" << endl;
				}
				else
				{
					MessageBox(NULL,"Connect incomplete......","Client",MB_OKCANCEL);
				}
				break;
			}
		}
	return hr; 
}

HRESULT Init_Directplay()
{
	HRESULT hr;
//	CoInitialize(NULL);
	// Create the IDirectPlay8Peer Object
	if( FAILED( hr = CoCreateInstance( CLSID_DirectPlay8Client, NULL,CLSCTX_INPROC_SERVER,IID_IDirectPlay8Client, (LPVOID*) &g_pDPClient)))
		return hr;
	// Initialize DirectPlay
	if( FAILED( hr = g_pDPClient->Initialize(NULL, DirectPlayMessageHandler, 0))){return hr;}


    // Create our IDirectPlay8Address Device Address
	if( FAILED(hr = CoCreateInstance(CLSID_DirectPlay8Address,NULL,CLSCTX_INPROC_SERVER,IID_IDirectPlay8Address,(LPVOID*) &g_pDeviceAddress ))) {return hr;}
    // Set the SP for our Device Address
	if( FAILED(hr = g_pDeviceAddress->SetSP(&CLSID_DP8SP_TCPIP ))) {return hr;}
	if( FAILED(hr = CoCreateInstance(CLSID_DirectPlay8Address,NULL,CLSCTX_INPROC_SERVER,IID_IDirectPlay8Address,(LPVOID*)&hostAddress))) {return hr;}
	if( FAILED(hr = hostAddress->SetSP(&CLSID_DP8SP_TCPIP))) {return hr;}
	return S_OK;
}


int connectTo()
{
	HRESULT					hReturn;
	char					pname[256];
	WCHAR					hostname[] = {L"161.246.6.92"}; //server balance
	WCHAR					hostname1[] = {L"161.246.6.93"}; //server1
	WCHAR					hostname2[] = {L"161.246.6.129"}; //server2
	WCHAR					hostname3[] = {L"161.246.6.125"}; //server3
	WCHAR					wpeername[256];
	DWORD					dwPort=25944;//2375;
	DWORD					dwLength = 256;
	DPN_APPLICATION_DESC	appdesc;
	DPN_PLAYER_INFO			playerinfo;

//	DXUtil_ConvertGenericStringToWide( wpeername, pname,-1 );	
//	ZeroMemory( &playerinfo, sizeof(DPN_PLAYER_INFO) );
//	playerinfo.dwSize = sizeof(DPN_PLAYER_INFO);
//	playerinfo.dwInfoFlags = DPNINFO_NAME;
//	playerinfo.pwszName = wpeername;

//	hReturn = g_pDPClient->SetClientInfo( &playerinfo, NULL, NULL, DPNSETCLIENTINFO_SYNC );
	ZeroMemory( &appdesc, sizeof( DPN_APPLICATION_DESC ) );
	appdesc.dwSize = sizeof( DPN_APPLICATION_DESC );
	appdesc.guidApplication = g_guidApp;
	if(server == 0)
		hReturn = hostAddress->AddComponent(DPNA_KEY_HOSTNAME,hostname, 2*(wcslen(hostname) + 1),DPNA_DATATYPE_STRING);
	else if(server == 1)
		hReturn = hostAddress->AddComponent(DPNA_KEY_HOSTNAME,hostname1, 2*(wcslen(hostname1) + 1),DPNA_DATATYPE_STRING);
	else if(server == 2)
		hReturn = hostAddress->AddComponent(DPNA_KEY_HOSTNAME,hostname2, 2*(wcslen(hostname2) + 1),DPNA_DATATYPE_STRING);
	else if(server == 3)
		hReturn = hostAddress->AddComponent(DPNA_KEY_HOSTNAME,hostname3, 2*(wcslen(hostname3) + 1),DPNA_DATATYPE_STRING);
	hReturn = hostAddress->AddComponent(DPNA_KEY_PORT,&dwPort,sizeof(DWORD),DPNA_DATATYPE_DWORD);
	hReturn = g_pDPClient->Connect(&appdesc,hostAddress,g_pDeviceAddress,NULL,NULL,NULL,NULL,NULL,
									0, DPNCONNECT_SYNC);
	if( hReturn != S_OK ) 
	{	
		// fail to connect!!! return suddenly
		return -1;
	}
	return 0;
}

int new_connect()
{
	g_pDPClient->Close(0);
	cout << "destroy player" << endl;
	Sleep(1000);
	HRESULT hr = Init_Directplay();
	if(hr == S_OK)
	{
		int result = connectTo();
		if(result == -1) { return -1;}
	}
}

HRESULT TerminateDirectplay()
{
	HRESULT hr;
	hr = g_pDPClient->Close(0); 
	if (g_pDPClient != NULL)
	{
		g_pDPClient->Release();
		g_pDPClient = NULL;
	}

	hostAddress->Release();
	hostAddress=NULL;

	CoUninitialize();
	return hr;
}

string FloatToString ( float number )
{	stringstream ss;
	string s;
	ss << number;
	ss >> s;
	return s;
}
void changemap(int to_map)
{
	sentData_logout("logout",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi,selmap);
	flag = 0;
	server = 0;
	int res = 0;
	res = new_connect();
	status = "wait";
	pack_sent.str_query			= "login";
/*	int str_size = username.size();
	if(str_size <= 8)
	{
		for(int i = 0;i < str_size;i++)
		{
			pack_sent.username_login[i] = username[i];
			pack_sent_lv_up.username_login[i] = username[i];
			pack_sent_logout.username_login[i] = username[i];
		}
		for(int j = str_size;j < 9;j++)
		{
			pack_sent.username_login[j] = NULL;
			pack_sent_lv_up.username_login[j] = NULL;
			pack_sent_logout.username_login[j] = NULL;
		}
	}
	str_size = password.size();
	if(str_size <= 8)
	{
		for(int k = 0;k < str_size;k++)
		{
			pack_sent.password_login[k] = password[k];
		}
		for(int l = str_size;l < 9;l++)
		{
			pack_sent.password_login[l] = NULL;
		}
	}*/
	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_sent);
	bufferDesc.pBufferData  = (BYTE*) &pack_sent;
	g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
}
void checkmap(float x,float z)
{	if(selmap == 0)	
	{	if(x>=68 && x<=81.0&& z>=-8.0 && z<=-3.0)
		{	people.x = 87;people.z = -136;selmap = 1;notreceive = 1;
			changemap(selmap);
			StoreMesh *y = player.nextmesh;
			if(y!=NULL){y->delmesh();player.nextmesh=NULL;}
			warn2 = 1;
			notreceive = 0;
		}
	}
	else if(selmap == 1)	
	{
		if(x>=75 && x<=96.0&& z>=-123.0 && z<=-118.0)
		{	people.x = 74;people.z = -18;selmap = 0;notreceive = 1;
			changemap(selmap);
			StoreMesh *y = player.nextmesh;
			if(y!=NULL){y->delmesh();player.nextmesh=NULL;}
			warn2 = 1;
			notreceive = 0;
		}
	}
}

bool checkbuild(float x,float z)
{	checkmap(x,z);
	if(selmap == 0)	
	{	if(x>=35 && x<=112.0&& z>=-3.0 && z<=39.0)
			{ return true;}
		else if(x>=35.0 && x<=45.0&& z>=-33.0 && z<=-3.0)//ruin
			{ return true;}
		else if(x>=-32.0 && x<=19.0&& z>=-54.0 && z<=-40.0)//wallright
			{ return true;}
		else if(x>=85.0 && x<=112.0&& z>=-21.0 && z<=-3.0)//wallleft
			{ return true;}
		else if(x>=-26.0 && x<=2.0&& z>=-97.0 && z<=-54.0)//house
			{ return true;}
		else if(x>=39.0 && x<=44.0&& z>=-74.0 && z<=-67.0)//lamb
			{ return true;}
		else if(x>=-27.0 && x<=108.0&& z>=-100.0 && z<=35.0)//all
			{ return false;}
		return true;
	} else if(selmap == 1)	
	{if(x>=69 && x<=78.0&& z>=-297.0 && z<=-225.0)
			{ return true;}
			else if(x>=153.0 && x<=227.0&& z>=-228.0 && z<=-215.0)//ruin
			{ return true;}
			else if(x>=123.0 && x<=133.0&& z>=-197.0 && z<=-144.0)//ruin
			{ return true;}
			else if(x>=116.0 && x<=137.0&& z>=-262.0 && z<=-238.0)//ruin
			{ return true;}
			else if(x>=-23.0 && x<=21.0&& z>=-210.0 && z<=-170.0)//ruin
			{ return true;}
			else if(x>=-23.0 && x<=53.0&& z>=-170.0 && z<=-118.0)//ruin
			{ return true;}
			else if(x>=-23.0 && x<=6.0&& z>=-302.0 && z<=-271.0)//ruin
			{ return true;}
			else if(x>=174.0 && x<=230.0&& z>=-302.0 && z<=-252.0)//ruin
			{ return true;}
			else if(x>=69.0 && x<=75.0&& z>=-126.0 && z<=-118.0)//ruin
			{ return true;}
			else if(x>=97.0 && x<=103.0&& z>=-126.0 && z<=-118.0)//ruin
			{ return true;}
			else if(x>=-24.0 && x<=231.0&& z>=-303.0 && z<=-118.0)//all
			{ return false;}
		return true;
	}
}
bool checkcollision(float x,float y,StoreMesh& user,float k)//x,y is position to check/number is number of owner position/k is large of block
{	StoreMesh* yy = new StoreMesh();yy = player.nextmesh;
	if(user.number>0)
	{if(x<((people.x)+k) && x>((people.x)-k)&& y<((people.z)+k) && y>((people.z)-k))
		{ return true;}
	}
	else
	while(yy)
	{	if (yy->number != user.number && yy->status != 3 && yy->status != 4)
		{	if(x<((yy->x)+k) && x>((yy->x)-k)&& y<((yy->z)+k) && y>((yy->z)-k))
			{ return true;}
		}
		yy = yy->nextmesh;
	}
	return false;
}
int checkatk(float x,float y)//same as collision but return number of mesh that collision
{	StoreMesh* yy = new StoreMesh();
	yy = player.nextmesh;
	while(yy)
	{	if (yy->action == '2' || yy->action == 'z'||yy->action == '1'||yy->action == 'n'||yy->action == '4'||yy->action == '5'||yy->action == 'b'||yy->action == 'a')
		{	if(x<((yy->x)+2.5f) && x>((yy->x)-2.5f)&& y<((yy->z)+2.5f) && y>((yy->z)-2.5f))
			{ return yy->number;}
		}
		yy = yy->nextmesh;
	}
	return -1;
}
int checkatkarcher(float x,float y)//check for arrow to hit mesh and return number of that mesh
{	for (int i=2;i<10;i++)
	{	if (collision[i] != NULL)
		{	for(int j=1;j<=40;j++)
			{
				if(people.x+(x*j)<((collision[i]->x)+2.5f) && people.x+(x*j)>((collision[i]->x)-2.5f)&& people.z+(y*j)<((collision[i]->z)+2.5f) && people.z+(y*j)>((collision[i]->z)-2.5f))
				{ return i;}
			}
		}
	}
	return -1;
}
bool checkdes(float x,float y,StoreMesh des,float size)//check for arrive to giving mesh
{	if(x<(des.x+size) && x>(des.x-size)&& y<(des.z+size) && y>(des.z-size))
			{ return true;} else return false;
}
int nrand(int n)//function to random from 0 to n
{ const int bug = RAND_MAX/n;
int r;
do r=rand()/bug;
while(r>=n);
return r;
}
void movetoposition(StoreMesh& user,float posx,float posz)//Control mesh to walk at random in the area
{user.desx = posx;
user.desz = posz;
float x=0.0;float z=0.0;float ry=0.0;
x=user.desx-user.x;
z=user.desz-user.z;
ry=atan2(z,x);
ry=ry * (180.0f/D3DX_PI);
user.ry=180-ry;
if(user.status!=2)user.status = 1;
if ((timeGetTime() - user.time) > 10)
	{user.time = timeGetTime();
		if(x > -0.5 && x<0.5 && z > -0.5 && z<0.5)
		{if(user.status!=2)user.status = 0;}
		else{	if(!checkcollision((user.x)-0.2*cos(D3DXToRadian(user.ry)),(user.z)+0.2*sin(D3DXToRadian(user.ry)),user,2.5f))
				{user.x -= 0.2*cos(D3DXToRadian(user.ry));
				user.z += 0.2*sin(D3DXToRadian(user.ry));}
				else {	if(!checkcollision((user.x)-0.2*cos(D3DXToRadian(user.ry)),user.z,user,2.5f))
						{user.x -= 0.2*cos(D3DXToRadian(user.ry));} 
						if(!checkcollision(user.x,(user.z)+0.2*sin(D3DXToRadian(user.ry)),user,2.5f))
						{user.z += 0.2*sin(D3DXToRadian(user.ry));}
				}
			}
	}
}
void playermoveto(StoreMesh& user,int number)//Control mesh to walk at random in the area
{float temp1=0.0;
temp1 = timeGetTime() - user.timeatk;
if (temp1 > 15)
	{
	float x=0.0;float z=0.0;float ry=0.0;
	x=user.desx-user.x;
	z=user.desz-user.z;
	user.timeatk = timeGetTime();
	temp1 = (temp1*4.0)/150.0;
		if(x > -(0.1+(2*temp1)) && x<0.1+(2*temp1) && z > -(0.1+(2*temp1)) && z<0.1+(2*temp1))
		{	user.x = user.desx;user.z = user.desz;
		}
		else{	
				ry=atan2(z,x);
				ry=ry * (180.0f/D3DX_PI);
				user.ry=180-ry;
				user.x -= temp1*cos(D3DXToRadian(user.ry));
				user.z += temp1*sin(D3DXToRadian(user.ry));
			  }
	}
}
void randomposition(StoreMesh& user,int number,int random,float posx,float posz)//Control mesh to walk at random in the area
{if(timeGetTime() - user.timeatk > user.timechange)
{user.timeatk = timeGetTime();
user.desx = (nrand(random)-random/2)+posx;
user.desz=(nrand(random)-random/2)+posz;
}
movetoposition(user,user.desx,user.desz);
}


void moveto(StoreMesh& user,StoreMesh& des,int number,float size)//move from user mesh to des mesh && number of user mesh && atk des
{float x=0.0;float z=0.0;float ry=0.0;
x=des.x-user.x;
z=des.z-user.z;
ry=atan2(z,x);
ry=ry * (180.0f/D3DX_PI);
//ry = 180+ry;
user.ry=180-ry;
user.status = 1;
if ((timeGetTime() - user.time) > 10)
	{user.time = timeGetTime();
		if(!checkdes((user.x)-0.2*cos(D3DXToRadian(user.ry)),(user.z)+0.2*sin(D3DXToRadian(user.ry)),des,size))
		{
				if(!checkcollision((user.x)-0.2*cos(D3DXToRadian(user.ry)),(user.z)+0.2*sin(D3DXToRadian(user.ry)),user,2.5f))
				{user.x -= 0.2*cos(D3DXToRadian(user.ry));
				user.z += 0.2*sin(D3DXToRadian(user.ry));}
				else {	if(!checkcollision((user.x)-0.2*cos(D3DXToRadian(user.ry)),user.z,user,2.5f))
						{user.x -= 0.2*cos(D3DXToRadian(user.ry));} 
						if(!checkcollision(user.x,(user.z)+0.2*sin(D3DXToRadian(user.ry)),user,2.5f))
						{user.z += 0.2*sin(D3DXToRadian(user.ry));}
				}
		}else {	user.status = 2;
					if ((timeGetTime() - user.timeatk) > user.timeperhit)
					{user.timeatk = timeGetTime();
					int deff = des.player->flee - user.player->hit;
						if (nrand(100)>deff)
						{deff = user.player->atkmax - user.player->atkmin;
						deff = nrand(deff);
						des.player->blood -= (user.player->atkmin)+deff-(des.player->defmin);}
					}
					
		}
	}
		//user.status = 1;
	

}

void AIarcher()
{if(!checkdes((collision[1]->x)-0.2*cos(D3DXToRadian(collision[1]->ry)),(collision[1]->z)+0.2*sin(D3DXToRadian(collision[1]->ry)),people,20))
	{movetoposition(*collision[1],people.x+4*cos(D3DXToRadian(people.ry)),people.z-4*sin(D3DXToRadian(people.ry)));}//if not in area move to
else 
{	float a,b;
	a = (collision[0]->x)-0.2*cos(D3DXToRadian(collision[0]->ry));
	b = (collision[0]->z)+0.2*sin(D3DXToRadian(collision[0]->ry));
	int c = 0;//no mon
	for (int i=2;i<10;i++)
	{	if (collision[i] != NULL)
		{	if(a<((collision[i]->x)+20.0) && a>((collision[i]->x)-20.0)&& b<((collision[i]->z)+20.0) && b>((collision[i]->z)-20.0))
			{ c = 1;}//have mon in 20 area
		}
	}
	if(c == 1)
		{	float x,z,xx;float r=0.0f;float ri=0.0f;float ry=0.0f;
			for (int i=2;i<10;i++)
			{	if (collision[i] != NULL)
				{	if(a<((collision[i]->x)+20.0f) && a>((collision[i]->x)-20.0f)&& b<((collision[i]->z)+20.0f) && b>((collision[i]->z)-20.0f))
					{	x=collision[1]->x-collision[i]->x;
						z=collision[1]->z-collision[i]->z;
						xx=sqrt(x*x+z*z);
						if(r>xx || r==0.0f)
						{ri=i;r=xx;
						c=i;	//remember mon in i
						}
					}
				}
			}
			moveto(*collision[1],*collision[c],1,2.5f);
			
		}else {collision[1]->status = 0;		//no mon in area
			int random=15;
			if(timeGetTime() - collision[1]->timeatk > collision[1]->timechange) // random every timechange
				{collision[1]->timeatk = timeGetTime();
				collision[1]->desx = (nrand(random)-random/2)+(people.x+10*cos(D3DXToRadian(people.ry)));
				collision[1]->desz=(nrand(random)-random/2)+(people.z-10*sin(D3DXToRadian(people.ry)));
				}
			movetoposition(*collision[1],collision[1]->desx,collision[1]->desz);	//move to position that random
		  }
	
}
}
void checkmonster()//check monter in the area of player. If find! it move to you
{	
	if(collision[1])
	{	AIarcher();
	}
}
void checkdie()//check all mesh if hp<0 it die
{	
	if(collision[0]->player->blood<=0)
	{if(selmap==0)
		collision[0]->position(75.0f,0.0f,-30.0f);
	if(selmap==1)
		collision[0]->position(120.0f,0.0f,-200.0f);
	collision[0]->player->calstatus(0);
	collision[0]->player->blood = collision[0]->player->bloodmax;
	sentData_lv_up("Revive",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi);
	}
	
}
void MovementCamera(CXCamera camera,HWND hWnd)//control input to do from keyboard
{
	string inputRead = GetInput();
	if (inputRead == "UL") 
	{	
		people.ry = 45-roll;
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
	}
	else if (inputRead == "UR") 
	{	
		people.ry = 135-roll;
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
	}
	else if (inputRead == "DR") 
	{	
		people.ry = 225-roll;
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
	}
	else if (inputRead == "DL") 
	{	
		people.ry = 315-roll;
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
	}
	else if (inputRead == "UP") 
	{	//people.x -= 0.07*cos(D3DXToRadian(people.ry));
		//people.z += 0.07*sin(D3DXToRadian(people.ry));
		
		people.ry = 90-roll;
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
		//cameraRolDown = cameraRolDown - 0.01f;
		//camera.RotateDown(cameraRolDown);
		//camera.RotateRight(cameraRolRight);
	}
	else if (inputRead == "DOWN") 
	{	
		people.ry = 270-roll;
		/*cameraRolDown = cameraRolDown + 0.01f;
		camera.RotateDown(cameraRolDown);
		camera.RotateRight(cameraRolRight);*/
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
	}
	else if (inputRead == "RIGHT") 
	{	 /*people.ry += 1.5;*/
		
		people.ry = 180-roll;
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
		//cameraRolRight = cameraRolRight + 0.01f;
		//camera.RotateRight(cameraRolRight);
		//camera.RotateDown(cameraRolDown);
	}
	else if (inputRead == "LEFT") 
	{   /*people.ry -= 1.5;*/
		
		people.ry = 0-roll;
		if ((timeGetTime() - people.time) > 15)
		{
			people.time = timeGetTime();
			if(!checkcollision((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry)),people,2.5f))
			{if(!checkbuild((people.x)-0.4*cos(D3DXToRadian(people.ry)),(people.z)+0.4*sin(D3DXToRadian(people.ry))))
				{people.x -= 0.4*cos(D3DXToRadian(people.ry));
				people.z += 0.4*sin(D3DXToRadian(people.ry));}
			}
		}
		people.status = 1;
		people.delaystatus = timeGetTime();
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
/*	if (inputRead == "T") 
	{people2.x -= 0.07*cos(D3DXToRadian(people2.ry));
		people2.z += 0.07*sin(D3DXToRadian(people2.ry));
		people2.status = 1;}*/
	if (inputRead == "F1") 
	{if(timeGetTime() - timetab > 200)
		{if(tabon==0)tabon = 1;else tabon = 0;
		timetab = timeGetTime();
		}
	}
	else if (inputRead == "H") 
	{if(tabon==1)
		{	if(point > 0)
			{	if(timeGetTime() - click > 200)
				{people.player->hp += 1;
				people.player->calstatus(0);
				sentData_lv_up("Level",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi);
				click = timeGetTime();
				}
			}
		}
	}
	else if (inputRead == "F") 
	{if(roll<360)roll += 1; else roll = 0;
		//moveto(people,people2,0);
	}
	else if (inputRead == "S") 
	{ //people2.ry -= 1.5;
		if(tabon==1)
		{	if(point > 0)
			{	if(timeGetTime() - click > 200)
				{people.player->str += 1;
				people.player->calstatus(0);
				sentData_lv_up("Level",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi);
				click = timeGetTime();
				}
			}
		}
		else
		if(roll>0)roll -= 1; else roll = 360;
	}
	else if (inputRead == "T") 
	{
		if(zoom>0)zoom -= 0.01;
	}
	else if (inputRead == "G") //atk in range for archer
	{	if(zoom<=1.0)zoom += 0.01;
		/*people.status = 2;
		if ((timeGetTime() - people.time) > people.timeperhit)
		{	
			people.time = timeGetTime();
			int atk = checkatkarcher(0.5*cos(D3DXToRadian(people.ry+180)),0.5*sin(D3DXToRadian(people.ry)));
			if(atk>0)
			{	
				int deff = collision[atk]->player->flee - collision[0]->player->hit;
				if (nrand(100)>deff)
				//collision[atk]->hp -= 3;
				{
					deff = collision[0]->player->atkmax - collision[0]->player->atkmin;
					deff = nrand(deff);
					collision[atk]->player->blood -= (collision[0]->player->atkmin)+deff -(collision[atk]->player->defmin);
					if(collision[atk]->player->blood < 0)collision[0]->player->exp += collision[atk]->player->exp;
				}
			}
		}*/
	}
	else if (inputRead == "A") //malee atk
	{	if(tabon==1)
		{	if(point > 0)
			{	if(timeGetTime() - click > 200)
				{people.player->agi += 1;
				people.player->calstatus(0);
				sentData_lv_up("Level",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi);
				click = timeGetTime();
				}
			}
		}
		else
		{	
			people.status = 2;
			if ((timeGetTime() - people.time) > people.timeperhit)
			{
				people.time = timeGetTime();
				int atk = checkatk((people.x)-1.0*cos(D3DXToRadian(people.ry)),(people.z)+1.0*sin(D3DXToRadian(people.ry)));
				if(atk>0)
				{	StoreMesh* y = new StoreMesh;
					y = player.nextmesh;
					while(y)
					{	if(y->number == atk)	
						{	aim = atk;
							float deff = y->player->flee - people.player->hit;
							if (nrand(100)>deff)
							//collision[atk]->hp -= 3;
							{
								deff = people.player->atkmax - people.player->atkmin;
								deff = nrand(deff);
								deff = (people.player->atkmin)+deff -(y->player->defmin);
								if(deff < 5)deff = 5;
								y->player->blood -= deff;
								de = y->player->blood;
								de2 = deff;
								sentData_attack("Attack",deff,y->number);
								if(y->player->blood < 0)
								{
									people.player->exp += y->player->exp;
									gSoundPlayer->PlaySound(2,FALSE);
								}
								else
								{
									gSoundPlayer->PlaySound(3,FALSE);
								}
							}
						}
						y = y->nextmesh;
					}
				}
			}
		}
		//MoveRight = -0.2;
		//camera.MoveRight(MoveRight);
		//camera.Update();
	}
	else if (inputRead == "E")
	{if(rdia<80)rdia+=1;
	}
	else if (inputRead == "D") //rotate to monster in the area
	{	if(tabon==1)
		{	if(point > 0)
			{	if(timeGetTime() - click > 200)
				{people.player->dex += 1;
				people.player->calstatus(0);
				sentData_lv_up("Level",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi);
				click = timeGetTime();
				}
			}
		}
		else
		if(rdia>10)rdia-=1;
		
	}
	else if (inputRead == "F10") 
	{
//		sentData_lv_up("logout",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi);
//		sentData_logout("logout",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi,selmap);
		DestroyWindow(hWnd);
		status = "end";
	}
	D3DXVECTOR3* vecPosition = camera.GetPosition();
	cameraMoveForward = (*vecPosition).z;
	cameraMoveRight = (*vecPosition).x;
}

void printText2(string text,int left,int right,int top,int bottom)
{
	int str_size = text.size();

		if(str_size <= 9)
		{
			for(int i = 0;i < str_size;i++)
			{
				str[i] = text[i];
			}
			for(int j = str_size;j < 9;j++)
			{
				str[j] = NULL;
			}
		}
	RECT Rect;
	Rect.left=left;//150;
	Rect.right=right;//300;
	Rect.top=top;//50;
	Rect.bottom=bottom;//80;
	g_lp3dxfont->DrawText(NULL,str,-1,&Rect,DT_CENTER|DT_NOCLIP,D3DCOLOR_XRGB(255,0,0));
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

	picture2D.Init(g_pd3dDevice,lpSprite);
	picture2D.Load(g_pd3dDevice);

    return S_OK;
}

VOID Cleanup()
{	for(int i=0;i<5;i++)
	{
//	sound[i].ReleaseDSound ();
}
		armor.Cleanup();
		armor2.Cleanup();
		armor3.Cleanup();armor4.Cleanup();
		map.Cleanup();Ruin1.Cleanup();Ruin2.Cleanup();wall.Cleanup();tree.Cleanup();car.Cleanup();
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
            if(status != "username" && status != "password")
			{
				sentData_logout("logout",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi,selmap);
			}
			TerminateDirectplay();
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

void checkarray(int area)//control array. if out of range get out of array
{StoreMesh *x = people.nextmesh;
	for (int i=2;i<10;i++)
	{	if (collision[i] != NULL)
			if(collision[i]->x > people.x-area && collision[i]->x < people.x+area && collision[i]->z > people.z-area && collision[i]->z < people.z+area )
			{	if(collision[i]->countdown > 0)collision[i]=NULL;
			}else{collision[i]->range=0;collision[i]=NULL;}
	}
	i=2;
	while(x)
	{if(x->x > people.x-area && x->x < people.x+area && x->z > people.z-area && x->z < people.z+area && x->name != "AI")
		{	if(x->range == 0)	
				{	while(collision[i])
					{i++;}
					x->range=1;
					collision[i]=x;
					i = 2;
				}
			if(x->countdown > 0)
				{	if(timeGetTime()-(x->timedie) > x->countdown)
						{x->countdown = 0;
						while(collision[i])
						{i++;}
						//x->range=1;
						collision[i]=x;
						
						x->player->calstatus(1);
						x->status = 0;
						while(checkcollision(collision[i]->x,collision[i]->z,*collision[i],2.5))
							{collision[i]->x +=5.0;
							}
						i = 2;
						}
				}
		}else
		{	if(x->range == 1)	x->range=0;
		}
	 x=x->nextmesh;
	}
}

void checklvup()
{maxexp = pow(2,templv-1)*50;
if(collision[0]->player->exp >= maxexp)
collision[0]->player->lv++;
if(templv!=collision[0]->player->lv)
{
	collision[0]->player->calstatus(0);
	templv=collision[0]->player->lv;
//	sound[1].PlayWave ();
	gSoundPlayer->PlaySound(1,FALSE);
	sentData_lv_up("Level",people.x,people.z,people.ry,people.status,people.player->blood,people.player->exp,people.player->lv,people.player->str,people.player->dex,people.player->hp,people.player->agi);
}
}

void print_HP(float hp,float max_hp)
{
	//draw image hp
	float percent = (hp/max_hp);
	int x = hp;
	int y = max_hp;
	picture2D.DrawHP(lpSprite,percent);
	char hp_str[10];
	sprintf(hp_str,"%d / %d",x,y);
	RECT Rect;
	Rect.left	=	110;
	Rect.right	=	110;
	Rect.top	=	-5;
	Rect.bottom	=	-5;
	
	g_lp3dxfont->DrawText(NULL,hp_str,-1,&Rect,DT_CENTER|DT_NOCLIP,D3DCOLOR_XRGB(255,200,200));
}

void print_EXP(float exp,float max_exp)
{
	//draw image hp
	float percent = (exp/max_exp);
	int x = exp;
	int y = max_exp;
	picture2D.DrawEXP(lpSprite,percent);
/*	char hp_str[10];
	sprintf(hp_str,"%d / %d",x,y);
	RECT Rect;
	Rect.left	=	110;
	Rect.right	=	110;
	Rect.top	=	-5;
	Rect.bottom	=	-5;
	
	g_lp3dxfont->DrawText(NULL,hp_str,-1,&Rect,DT_CENTER|DT_NOCLIP,D3DCOLOR_XRGB(255,200,200));*/
}

void print_LV(int level)
{
	char lv_str[10];
	sprintf(lv_str,"%d",level);
	RECT Rect;
	Rect.left	=	220;
	Rect.right	=	220;
	Rect.top	=	-3;
	Rect.bottom	=	-3;
	
	g_lp3dxfont->DrawText(NULL,lv_str,-1,&Rect,DT_CENTER|DT_NOCLIP,D3DCOLOR_XRGB(255,230,230));
}

VOID Render()
{   g_pd3dDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, 
                         D3DCOLOR_XRGB(0,0,255), 1.0f, 0 );
    if( SUCCEEDED( g_pd3dDevice->BeginScene() ) )
	{	
		if(status == "play")
		{
			if(timetosend==0)
			{	timetosend = timeGetTime();
			sentData("Position",people.x,people.z,people.ry,people.status);
			}else if(timeGetTime() - timetosend > 100)
			{	
				sentData("Position",people.x,people.z,people.ry,people.status);
				timetosend = timeGetTime();
			}
			//people I am render
			if(people.action == 'w' || people.action == '0')
			people.renderall(g_pd3dDevice,armor2,0.0);
			else if(people.action == 'x'|| people.action == '3')
			people.renderall(g_pd3dDevice,armor5,0.0);
			else if(people.action == 'n'|| people.action == '1')
			people.renderall(g_pd3dDevice,armor3,0.0);
			else if(people.action == 'z'|| people.action == '2')
			people.renderall(g_pd3dDevice,armor4,0.0);
//			if(collision[1])collision[1]->renderall(g_pd3dDevice,armor5,0.0);	//AI render
			/*for (int i=2;i<10;i++)
			{	if(collision[i])
					if(collision[i]->zone==1)
						collision[i]->renderall(g_pd3dDevice,armor4,0.0);	
					else if(collision[i]->zone==2)
						collision[i]->renderall(g_pd3dDevice,armor3,0.0);
					//else collision[i]->renderall(g_pd3dDevice,armor2);
			}*/
			StoreMesh *y = player.nextmesh;
			while(y)//render BOT
			{if(y->status != 4)
				{if(y->action == 'w' ||y->action == '0')
				y->renderall(g_pd3dDevice,armor2,0.0);
				else if(y->action == 'x' ||y->action == '3')
				y->renderall(g_pd3dDevice,armor5,0.0);
				else if(y->action == 'n'||y->action == '1')
				y->renderall(g_pd3dDevice,armor3,0.0);
				else if(y->action == 'z'||y->action == '2')
				y->renderall(g_pd3dDevice,armor4,0.0);
				else if(y->action == 'b'||y->action == '4')
				y->renderall(g_pd3dDevice,ninr,0.0);
				else if(y->action == 'a'||y->action == '5')
				y->renderall(g_pd3dDevice,zomr,0.0);
				}
			y = y->nextmesh;
			}
			y = player.nextmesh;
			
			if(warn1==1)
			{	if(y!=NULL){y->delmesh();player.nextmesh=NULL;}
				warn1 = 0;
				warn2 = 1;
			}
			if(selmap == 0)
			{mapmesh.renderall(g_pd3dDevice,map,0.4);//all map
			tmap = mapmesh.nextmesh;
			tmap->ry = -90;
			tmap->renderall(g_pd3dDevice,Ruin1,1.0);
			tmap=tmap->nextmesh;
			tmap->ry = -90;
			tmap->renderall(g_pd3dDevice,wall,1.0);
			tmap->x += 20;tmap->renderall(g_pd3dDevice,wall,1.0);
			tmap->x += 40;tmap->z += 50;tmap->ry = 0;tmap->renderall(g_pd3dDevice,wall,1.0);
			tmap->z -= 20;tmap->renderall(g_pd3dDevice,wall,1.0);tmap->x -= 60;tmap->z -= 30;
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,Ruin2,1.0);
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,tree,1.0);
			//tmap->z += 20;tmap->renderall(g_pd3dDevice,tree,1.0);
			tmap->z += 40;tmap->renderall(g_pd3dDevice,tree,1.0);tmap->z -= 40;
			tmap=tmap->nextmesh;
			tmap->ry = -45;
			tmap->renderall(g_pd3dDevice,car,2.5f);
			tmap=tmap->nextmesh;tmap->ry = 75;tmap->y = -21.0;
			tmap->renderall(g_pd3dDevice,house,8.0f);
			tmap=tmap->nextmesh;
			tmap->ry = -90;
			tmap->renderall(g_pd3dDevice,lamb,4.0f);
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,box,20.0f);
			} else 
			{mapmesh2.renderall(g_pd3dDevice,map2,0.7);
			tmap = mapmesh2.nextmesh;tmap->ry = 90;
			tmap->renderall(g_pd3dDevice,door,1.0);
			tmap=tmap->nextmesh;tmap->ry = 90;
			tmap->renderall(g_pd3dDevice,tower,3.0f);
			tmap=tmap->nextmesh;
			tmap->ry = -90;
			tmap->renderall(g_pd3dDevice,lamb,4.0f);
			tmap=tmap->nextmesh;
			tmap->ry = -90;
			tmap->renderall(g_pd3dDevice,lamb,4.0f);
			tmap=tmap->nextmesh;
			tmap->ry = -135;
			tmap->renderall(g_pd3dDevice,b1,4.0f);
			tmap=tmap->nextmesh;
			tmap->ry = -135;
			tmap->renderall(g_pd3dDevice,car,2.5f);
			tmap=tmap->nextmesh;
			tmap->ry = -45;
			tmap->renderall(g_pd3dDevice,light1,10.f);
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,tree2,1.f);
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,tree2,1.f);
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,tree2,1.f);
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,tree2,1.f);
			tmap=tmap->nextmesh;tmap->ry = 90;
			tmap->renderall(g_pd3dDevice,Ruin2,1.0f);
			tmap=tmap->nextmesh;tmap->ry = 45;
			tmap->renderall(g_pd3dDevice,home,6.5f);
			tmap=tmap->nextmesh;tmap->ry = -90;
			tmap->renderall(g_pd3dDevice,wall,1.0);tmap->x -= 20;
			tmap->renderall(g_pd3dDevice,wall,1.0);tmap->x -= 20;
			tmap->renderall(g_pd3dDevice,wall,1.0);tmap->x -= 40;tmap->z += 60;tmap->ry = 0;
			tmap->renderall(g_pd3dDevice,wall,1.0);tmap->z -= 20;
			tmap->renderall(g_pd3dDevice,wall,1.0);tmap->x += 80;tmap->z -= 40;
			tmap=tmap->nextmesh;tmap->renderall(g_pd3dDevice,wall,1.0);tmap->z += 20;
			tmap->renderall(g_pd3dDevice,wall,1.0);tmap->z += 20;
			tmap->renderall(g_pd3dDevice,wall,1.0);
			tmap->z -= 40;
			tmap=tmap->nextmesh;
			tmap->renderall(g_pd3dDevice,box,21.0f);
			}
			char ca[5];
			printText2("LEVEL",30,60,50,50);
			printText2("HP",30,60,80,80);
			printText2("Atk",30,60,110,110);
			printText2("Def",30,60,140,140);
			printText2("EXP",30,60,170,170);
			printText2("HIT",30,60,200,200);
			printText2("Flee",30,60,230,230);
			printText2("Position",700,700,0,0);
			printText2("Target",500,500,0,0);
			itoa(de,ca,10);
			printText2(ca,600,600,0,0);
			itoa(de2,ca,10);
			printText2(ca,600,600,50,50);
//			if(aim>=0 && aim<10)
//			printText2(FloatToString(collision[aim]->player->blood),600,600,0,30);	
	
			printText2(FloatToString(people.player->lv),100,100,50,80);
			printText2(FloatToString(people.player->blood),100,100,80,110);
			printText2("/",145,100,80,110);
			printText2(FloatToString(people.player->bloodmax),150,150,80,110);
			itoa(people.player->atkmin,ca,10);
			printText2(ca,100,100,110,140);
			printText2("to",150,150,110,140);
			itoa(people.player->atkmax,ca,10);
			printText2(ca,200,200,110,140);
			itoa(people.player->defmin,ca,10);
			printText2(ca,100,100,140,140);
			printText2(FloatToString(people.player->exp),100,100,170,170);
			itoa(people.player->hit,ca,10);
			printText2(ca,100,100,200,200);
			itoa(people.player->flee,ca,10);
			printText2(ca,100,100,230,1230);
			printText2(FloatToString(people.x),800,800,0,0);
			printText2(FloatToString(people.z),900,900,0,0);
			
			picture2D.DrawStatus(lpSprite);
			picture2D.DrawMenu(lpSprite);
			print_HP(people.player->blood,people.player->bloodmax);
			print_EXP(people.player->exp-(pow(2,templv-2)*50),maxexp-(pow(2,templv-2)*50));
			print_LV(people.player->lv);

		}
		else if(status == "username")
		{
			picture2D.Draw(lpSprite);
			loginuser();
		}
		else if(status == "password")
		{
			picture2D.Draw2(lpSprite);
			loginpassword();
		}
		if(status == "wait")
		{
			picture2D.DrawBG(lpSprite);
		}
		if(tabon == 1)
		{	char ca[5];
			picture2D.Draw3(lpSprite);
			printText2("LEVEL",185,185,125,125);printText2(FloatToString(people.player->lv),260,260,125,125);
			printText2(FloatToString(people.player->str),410,410,125,125);
			printText2(FloatToString(people.player->blood),180,180,175,175);
			printText2("/",220,220,175,175);
			printText2(FloatToString(people.player->bloodmax),260,260,175,175);printText2(FloatToString(people.player->agi),410,410,175,175);
			itoa(people.player->atkmin,ca,10);
			printText2(ca,180,180,225,225);
			printText2("to",220,220,225,225);
			itoa(people.player->atkmax,ca,10);
			printText2(ca,260,260,225,225);printText2(FloatToString(people.player->dex),410,410,225,225);
			//printText2("Atk",180,180,225,225);
			itoa(people.player->defmin,ca,10);printText2(FloatToString(people.player->hp),410,410,275,275);
			printText2(ca,220,220,275,275);
			itoa(people.player->hit,ca,10);
			printText2(ca,220,220,325,325);
			itoa(people.player->flee,ca,10);
			printText2(ca,220,220,375,375);
			point = (22+(people.player->lv-1)*2)-(people.player->str+people.player->dex+people.player->agi+people.player->hp);
			itoa(point,ca,10);
			printText2(ca,410,410,375,375);
		}
//      g_pd3dDevice->EndScene();
		D3DXVECTOR3 vecDir;
		D3DLIGHT9 light;
		ZeroMemory(&light, sizeof(light));
		light.Type = D3DLIGHT_DIRECTIONAL;
		light.Diffuse.r = 1.0f;
		light.Diffuse.g = 1.0f;
		light.Diffuse.b = 1.0f;
		light.Diffuse.a = 1.0f;
		vecDir = D3DXVECTOR3(0.0f,-100.0f,0.0f);
		D3DXVec3Normalize((D3DXVECTOR3*)&light.Direction, &vecDir);
		light.Range = 1000.0f;
		g_pd3dDevice->SetLight(0, &light);
		g_pd3dDevice->LightEnable(0, TRUE);
    }
	g_pd3dDevice->EndScene();
    g_pd3dDevice->Present( NULL, NULL, NULL, NULL );
}

VOID Render_login()
{   g_pd3dDevice->Clear( 0, NULL, D3DCLEAR_TARGET|D3DCLEAR_ZBUFFER, 
                         D3DCOLOR_XRGB(0,0,255), 1.0f, 0 );
    if( SUCCEEDED( g_pd3dDevice->BeginScene() ) )
	{	
		if(status == "username")
		{
			picture2D.Draw(lpSprite);
			loginuser();
		}
		else if(status == "password")
		{
			picture2D.Draw2(lpSprite);
			loginpassword();
		}

//      g_pd3dDevice->EndScene();
/*		D3DXVECTOR3 vecDir;
		D3DLIGHT9 light;
		ZeroMemory(&light, sizeof(light));
		light.Type = D3DLIGHT_DIRECTIONAL;
		light.Diffuse.r = 1.0f;
		light.Diffuse.g = 1.0f;
		light.Diffuse.b = 1.0f;
		light.Diffuse.a = 1.0f;
		vecDir = D3DXVECTOR3(0.0f,-100.0f,0.0f);
		D3DXVec3Normalize((D3DXVECTOR3*)&light.Direction, &vecDir);
		light.Range = 1000.0f;
		g_pd3dDevice->SetLight(0, &light);
		g_pd3dDevice->LightEnable(0, TRUE);
*/    }
	g_pd3dDevice->EndScene();
    g_pd3dDevice->Present( NULL, NULL, NULL, NULL );
}



bool Init_Sound(HWND hWnd)
{
	
	HRESULT hr;
/*	if( FAILED( hr = CoCreateInstance(CLSID_DirectSound8,NULL,CLSCTX_INPROC_SERVER,IID_IDirectSound8,(LPVOID*) g_psound)))
	{	return hr;	}
	if( FAILED(hr = g_psound->Initialize(NULL))) {	return hr;	}
	if( FAILED(hr = g_psound->SetCooperativeLevel(hWnd,DSSCL_NORMAL))) {	return hr;	}
//	if( FAILED(hr = g_psound->CreateSoundBuffer(DSBUFFERDESC,g_psbuffer1,NULL))) {	return hr;	}
/*
    DSBUFFERDESC bufferDesc;
    ZeroMemory( &bufferDesc, sizeof(DSBUFFERDESC) );
    bufferDesc.dwSize            = sizeof(DSBUFFERDESC);
	bufferDesc.dwFlags           = DSBCAPS_PRIMARYBUFFER;
	bufferDesc.dwBufferBytes     = 0;
	bufferDesc.lpwfxFormat       = NULL;
    // Set primary buffer format to 44.1kHz and 16-bit stereo output.
    if( FAILED( hr = g_psound->CreateSoundBuffer( &bufferDesc, &g_psbuffer1, NULL ) ) )
    {
		MessageBox(NULL,"Can not crate sound buffer","Server",MB_OKCANCEL);
        return hr;
    }
//	DirectSoundCreate8(NULL,&dsound,NULL);
//	dsound->SetCooperativeLevel(hWnd,DSSCL_NORMAL);
	return hr;
	*/
	gSoundPlayer = new CSoundPlayer;
	if (FAILED(gSoundPlayer->Initialise(hWnd)))return FALSE;
	int id = 0;
//	if (!gSoundPlayer->AddWav("bgsound.wav",&id))return FALSE;
	if (!gSoundPlayer->AddWav("bg3.wav",&id))return FALSE;
	if (!gSoundPlayer->AddWav("lvup.wav",&id))return FALSE;
	if (!gSoundPlayer->AddWav("die.wav",&id))return FALSE;
	if (!gSoundPlayer->AddWav("hit.wav",&id))return FALSE;
//	if (!gSoundPlayer->AddWav("drum2.wav",&id))return FALSE;
	gSoundPlayer->PlaySound(0,TRUE);
	return TRUE;
}

INT WINAPI WinMain( HINSTANCE hInst, HINSTANCE, LPSTR, INT )
{
	COMModule commod;
    // Register the window class
    WNDCLASSEX wc = { sizeof(WNDCLASSEX), CS_CLASSDC, MsgProc, 0L, 0L, 
                      GetModuleHandle(NULL), NULL, NULL, NULL, NULL,
                      "D3D Tutorial", NULL };
    RegisterClassEx( &wc );

    // Create the application's window
    HWND hWnd = CreateWindow( "D3D Tutorial", "D3D Tutorial 06: Meshes", 
                              WS_OVERLAPPEDWINDOW, 0, 0, 1024, 768,
                              GetDesktopWindow(), NULL, wc.hInstance, NULL );

	Init_Directplay();
	int result = connectTo();
	if(result == -1) { return -1;}
	Init_Sound(hWnd);

	OnCreateDevice(hWnd);
	//people.player->calstatus(2);
	
//	people.addmesh("AI",50.0,0,2,0);
	//people.x=40.0f;
	mapmesh.x=-60;mapmesh.z=60;mapmesh2.x=-120;mapmesh2.x=-60;
	mapmesh.addmesh("Ruin1",75.0f,20.0f,0,0);mapmesh.addmesh("wall",-18.0f,-47.0f,0,0);mapmesh.addmesh("Ruin2",106.0f,-80.0f,0,0);
	mapmesh.addmesh("tree",112.0f,-76.0f,0,0);mapmesh.addmesh("car",97.0f,-13.0f,0,0);mapmesh.addmesh("house",-10.0f,-70.0f,0,0);
	mapmesh.addmesh("lamb",42.0f,-70.0f,0,0);mapmesh.addmesh("box",30.0f,-10.0f,0,0);

	mapmesh2.addmesh("door",100.0f,-74.0f,0,0);mapmesh2.addmesh("tower",130.0f,-250.0f,0,0);mapmesh2.addmesh("lamb",72.0f,-122.0f,0,0);
	mapmesh2.addmesh("lamb",100.0f,-122.0f,0,0);mapmesh2.addmesh("b1",12.0f,-138.0f,0,0);mapmesh2.addmesh("car",10.0f,-195.0f,0,0);
	mapmesh2.addmesh("light1",-5.0f,-200.0f,0,0);mapmesh2.addmesh("tree2",142.0f,-107.0f,0,0);mapmesh2.addmesh("tree2",202.0f,-107.0f,0,0);
	mapmesh2.addmesh("tree2",244.0f,-170.0f,0,0);mapmesh2.addmesh("tree2",244.0f,-230.0f,0,0);mapmesh2.addmesh("ruin2",20.0f,-290.0f,0,0);
	mapmesh2.addmesh("home",200.0f,-280.0f,0,0);mapmesh2.addmesh("wall",210.0f,-220.0f,0,0);mapmesh2.addmesh("wall",75.0f,-280.0f,0,0);
	mapmesh2.addmesh("box",100.0f,-180.0f,0,0);
	collision[0] = &people;
//	collision[1] = people.findmesh("AI");
	checkarray(100);
//	sound[0].DSoundInit (hWnd);sound[1].DSoundInit (hWnd);
//	sound[0].LoadWave ("XHAUSTED.wav");
//	sound[1].LoadWave ("lvup.wav");
	StoreMesh *yy = player.nextmesh;
//sound[0].PlayWave ();
    // Initialize Direct3D
    if( SUCCEEDED( InitD3D( hWnd ) ) )
    {	
        // Create the scene geometry
        if( SUCCEEDED( armor2.InitGeometry(g_pd3dDevice,"niny.x","niny.x",'w') ) )
		{	//armor2.InitGeometry(g_pd3dDevice,xx);
            // Show the window
			ninr.InitGeometry(g_pd3dDevice,"nin.x","nin.x",'b');
			zomr.InitGeometry(g_pd3dDevice,"zombie2.x","zombie2.x",'a');
			armor5.InitGeometry(g_pd3dDevice,"nins.x","nins.x",'x');
			armor3.InitGeometry(g_pd3dDevice,"ninw.x","ninw.x",'n');
			armor4.InitGeometry(g_pd3dDevice,"zombie.x","zombie.x",'z');
			map.InitGeometry(g_pd3dDevice,"map2.x","map2.x",'m');
			Ruin1.InitGeometry(g_pd3dDevice,"Ruin2.x","Ruin2.x",'m');
			Ruin2.InitGeometry(g_pd3dDevice,"Ruin1.x","Ruin1.x",'m');
			wall.InitGeometry(g_pd3dDevice,"SpinWall.x","SpinWall.x",'m');
			tree.InitGeometry(g_pd3dDevice,"Tree1.x","Tree1.x",'m');
			car.InitGeometry(g_pd3dDevice,"H_car1.x","H_car1.x",'m');
			house.InitGeometry(g_pd3dDevice,"StonHouse.x","StonHouse.x",'m');
			lamb.InitGeometry(g_pd3dDevice,"Lamb.x","Lamb.x",'m');
			map2.InitGeometry(g_pd3dDevice,"map1.x","map1.x",'m');
			door.InitGeometry(g_pd3dDevice,"Door.x","Door.x",'m');
			tower.InitGeometry(g_pd3dDevice,"Tower.x","Tower.x",'m');
			b1.InitGeometry(g_pd3dDevice,"B1.x","B1.x",'m');
			light1.InitGeometry(g_pd3dDevice,"Light1.x","Light1.x",'m');
			tree2.InitGeometry(g_pd3dDevice,"Tree.x","Tree.x",'m');
			home.InitGeometry(g_pd3dDevice,"home.x","home.x",'m');
			box.InitGeometry(g_pd3dDevice,"skybox2.x","skybox2.x",'m');
            ShowWindow( hWnd, SW_SHOWDEFAULT );
            UpdateWindow( hWnd );

            // Enter the message loop
            MSG msg; 
            ZeroMemory( &msg, sizeof(msg) );
			Font_DirectX(0);
			while(status != "play")
			{
				Render_login();
			}
			//InitGeometry(y);
			//Render();
			try
			{
				while( msg.message!=WM_QUIT )
				{
					if( PeekMessage( &msg, NULL, 0U, 0U, PM_REMOVE ) )
					{
						TranslateMessage( &msg );
						DispatchMessage( &msg );
					}else{
						while(firstpac == 0)
						{}
					CXCamera oat(g_pd3dDevice);
					//oat.SetPosition(cameraMoveRight, 0.0f,cameraMoveForward);
					D3DXVECTOR3 vEyePt( people.x+(90.0f*zoom*cos(D3DXToRadian(rdia))*sin(D3DXToRadian(roll))), zoom*60.0f*sin(D3DXToRadian(rdia)),(people.z)-(90.0f*zoom*cos(D3DXToRadian(rdia))*cos(D3DXToRadian(roll))));
					D3DXVECTOR3 vLookatPt( people.x,people.y+10.0, people.z );
					D3DXVECTOR3 vUpVec( 0.0f, 1.0f, 0.0f );
					oat.LookAtPos(&vEyePt,&vLookatPt,&vUpVec);
					MovementCamera(oat,hWnd);
					Render();
					//moveto(*collision[1],people,1);
					//moveto(*collision[2],people,2);
					checkmonster();
					checkdie();
					//revivemonster();
					checkarray(200);
					yy = player.nextmesh;
					while(yy)
					{if(yy->action=='2'||yy->action=='z'||yy->action=='1'||yy->action=='n'||yy->action=='4'||yy->action=='5'||yy->action=='b'||yy->action=='a')
						{if(yy->status!=3 && yy->status!=4)
							movetoposition(*yy,yy->desx,yy->desz);
						}
					else
						playermoveto(*yy,0);
					yy = yy->nextmesh;}
					checklvup();
					}
	                
				}
			}
			catch(int)
			{
				MessageBox(NULL,"Connect Server Failed","ERROR",MB_OK|MB_ICONEXCLAMATION);
				DestroyWindow(hWnd);
			}
		}
    }
    UnregisterClass( "D3D Tutorial", wc.hInstance );
//	TerminateDirectplay();
    return 0;
}



