#include <vector>
#include <string>
#include <iostream>
#include <Windows.h>
#include <mmsystem.h>
#include <d3dx9.h>
//#include "Camera.h"
#include <dinput.h>
#include <dplay8.h>
#include <mysql.h>
#include <vector>
#include "conio.h"
//#include "dxutil.h"

using namespace std;

#define KEYDOWN(buffer,dwOffset) (buffer[dwOffset]&0x80)

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------
LPDIRECT3D9             g_pD3D           = NULL; // Used to create the D3DDevice
LPDIRECT3DDEVICE9       g_pd3dDevice     = NULL; // Our rendering device

LPD3DXMESH              g_pMesh          = NULL;// Our mesh object in sysmem
D3DMATERIAL9*           g_pMeshMaterials = NULL; // Materials for our mesh
LPDIRECT3DTEXTURE9*     g_pMeshTextures  = NULL; // Textures for our mesh
DWORD                   g_dwNumMaterials = 0L;   // Number of mesh materials

IDirectPlay8Client		*g_pDPClient		= NULL;
IDirectPlay8Address*	g_pDeviceAddress	= NULL;
IDirectPlay8Address*	hostAddress			= NULL;

#define SAFE_DELETE(p)  { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_RELEASE(p) { if(p) { (p)->Release(); (p)=NULL; } }
LPDIRECTINPUT8			g_pDI = NULL;			// The DirectInput object         
LPDIRECTINPUTDEVICE8	g_pKeyboard = NULL;		// The keyboard device 
int	time=timeGetTime()/1000;
float cameraRolDown = 0.0f;
float cameraRolRight = 0.0f;
float cameraMoveForward = -3.0f;
float cameraMoveRight = 0.0f;
float MoveForward = -10.0f;
float MoveRight = 0.0f;
char stri[25];
string status = "";
int round = 0;
int level = 1;
DWORD time1 ;
DWORD time2 ;
int flag_time = 0;


string username = "JOE";
string password = "JOEY";

static const GUID g_guidApp = 
{ 0xede9493e, 0x6ac8, 0x4f15, { 0x8d, 0x1, 0x8b, 0x16, 0x32, 0x0, 0xb9, 0x66 } };

struct Packet_recieve
{
public:
	int column;
	int size;
	string str[255];
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
	int blood;
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
	int blood;
	int exp;
	int lv;
	int str;
	int dex;
	int hp;
	int agi;
};
Packet_sent_lv_up pack_sent_lv_up;


int sentData(string str_sent,float positionX,float positionY,float rotate,int status,int blood,int exp)
{
//	Packet_sent pack_sent;
	pack_sent.str_query = str_sent;
	pack_sent.positionX = positionX;
	pack_sent.positionY = positionY;
	pack_sent.rotate = rotate;
	pack_sent.status = status;
	pack_sent.blood = blood;
	pack_sent.exp = exp;
	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_sent);
    bufferDesc.pBufferData  = (BYTE*) &pack_sent;

	g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
	return 0;
}

int sentData_lv_up(string str_sent,float positionX,float positionY,float rotate,int status,int blood,int exp,int lv,int str,int dex,int hp,int agi)
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

HRESULT TerminateDirectplay()
{
	HRESULT hr;
	hr = g_pDPClient->Close(0);
	cout << "destroy player" << endl;
	g_pDPClient->Release();
	g_pDPClient = NULL;
	hostAddress->Release();
	hostAddress=NULL;
	CoUninitialize();
	return hr;
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
				if(status == "wait")
				{
					string str_recieve = pack_recieve->status_user;
					if(str_recieve.length() >= 2)
					{
						string status1 = str_recieve.substr(0,2);
						int siz = str_recieve.length();
						string name = str_recieve.substr(2,siz-1);
						if(status1 == "OK" && name == username)
						{
//							MessageBox(NULL,"Login Success","Client",MB_OKCANCEL);
							status = "play";
							cout << "PLAY" << endl;
						}
					}
				}
				else if(status == "play")
				{
				}
//				cout << "." ;
				
//				MessageBox(NULL,stri,"Client",MB_OKCANCEL);
//				cout << pack->str << endl;
//				sentData();
//				cout << "sent Data" << endl;

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
//					sentData("OK JOE");
//					cout << "send data" << endl;
				}
				else
				{
//					MessageBox(NULL,"Connect incomplete......","Client",MB_OKCANCEL);
					cout << "Connect Incomplete" << endl;
				}
				break;
			}
		}
	return hr; 
}

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

VOID DXUtil_ConvertGenericStringToWide( WCHAR* wstrDestination, const TCHAR* tstrSource, 
                                        int cchDestChar )
{
    if( wstrDestination==NULL || tstrSource==NULL )
        return;

#ifdef _UNICODE
    if( cchDestChar == -1 )
	    wcscpy( wstrDestination, tstrSource );
    else
	    wcsncpy( wstrDestination, tstrSource, cchDestChar );
#endif
}

int connectTo()
{
	HRESULT					hReturn;
	char					pname[256];
	WCHAR					hostname[]={L"161.246.6.92"};
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
	hReturn = hostAddress->AddComponent(DPNA_KEY_HOSTNAME,hostname, 2*(wcslen(hostname) + 1),DPNA_DATATYPE_STRING);
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

//-----------------------------------------------------------------------------
// Name: WinMain()
// Desc: The application's entry point
//-----------------------------------------------------------------------------
int main()
{
/*	DWORD i = 2;
	DWORD j;
	for(int k = 2;k<=32;k++)
	{
		j = i*2;
		i = j;
	}
	cout << i-1 << endl;
*/	cout << "Hi" << endl;
	COMModule commod;
	Init_Directplay();
	int result = connectTo();
	if(result == -1) { return -1;}
//	sentData();
//	cout << "type your username: " ;
//	cin >> username;
//	cout << "type your password: " ;
//	cin >> password;

	pack_sent.str_query			= "login";
	int str_size = username.size();
	if(str_size <= 8)
	{
		for(int i = 0;i < str_size;i++)
		{
			pack_sent.username_login[i] = username[i];
			pack_sent_lv_up.username_login[i] = username[i];
		}
		for(int j = str_size;j < 9;j++)
		{
			pack_sent.username_login[j] = NULL;
			pack_sent_lv_up.username_login[j] = NULL;
		}
	}
	str_size = password.size();
	if(str_size <= 8)
	{
		for(int k = 0;k < str_size;k++)
		{
			pack_sent.password_login[k] = password[k];
			pack_sent_lv_up.password_login[k] = password[k];
		}
		for(int l = str_size;l < 9;l++)
		{
			pack_sent.password_login[l] = NULL;
			pack_sent_lv_up.password_login[l] = NULL;
		}
	}
	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_sent);
	bufferDesc.pBufferData  = (BYTE*) &pack_sent;
	g_pDPClient->Send(&bufferDesc, 1, 0, 0, 0,DPNSEND_SYNC | DPNSEND_NOLOOPBACK);
	time1 = timeGetTime();
	status = "wait";
    MSG msg; 
    ZeroMemory( &msg, sizeof(msg) );
	while( msg.message!=WM_QUIT )
	{
		time2 = timeGetTime();
		if(kbhit() != 0)
		{
			sentData_lv_up("logout",40.9,-10.9,10.0,1,30,30,level,6,6,60,6);
			TerminateDirectplay();
			cout << "Terminate" << endl;
			getch();
			return 0;
		}
		if( PeekMessage( &msg, NULL, 0U, 0U, PM_REMOVE ) )
		{
			TranslateMessage( &msg );
			DispatchMessage( &msg );
		}
		if(status == "play")
		{
			if(flag_time != 0)
			{
				int response = 0;
				if(time2 > time1)
					response = time2 - time1;
				else
				{
					response = 4294967295 - time1;
					response += time2;
				}
				flag_time = 0;
				cout << "Response time =\t " << response << "\tMilliseconds"<< endl;
			}
			sentData("Position",66.6,-6.6,10.0,6,60,60);
			round++;
			if(round == 30000)
			{
				level++;
				round = 0;
				cout << "Level up: " << level << endl;
				sentData_lv_up("Level",66.9,-6.9,10.0,6,60,60,level,6,6,66,6);
			}
		}
		else
		{
			//check time again
			if(time2 >= time1 && flag_time == 0)
			{
				flag_time = 1;
			}
			else if(time2 < time1 && flag_time == 1)
			{
				flag_time = 2;
			}
			else if(time2 > time1 && flag_time ==2)
			{
				cout << "Time Out" << endl;
				cout << time1 << " " << time2 << endl;
				getch();
				break;
			}

			if(time2 < time1 && flag_time == 0)
			{
				flag_time = 4;
			}
			else if(time2 > time1 && flag_time == 4)
			{
				flag_time = 5;
			}
			else if(time2 < time1 && flag_time ==5)
			{
				cout << "Time Out" << endl;
				cout << time1 << " " << time2 << endl;
				getch();
				break;
			}
		}
	}
	TerminateDirectplay();
    return 0;
}



