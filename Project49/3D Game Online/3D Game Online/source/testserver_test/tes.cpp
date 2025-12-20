#include "conio.h"
#include <iostream>
#include <String>
#include <Windows.h>
#include <mmsystem.h>
#include <dplay8.h>
#include <stdio.h>
#include <mysql.h>
#include <vector>
//#include <sstream>  // Required for stringstreams
#include "database.h"

using namespace std;

#define KEYDOWN(buffer,dwOffset) (buffer[dwOffset]&0x80)

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------
IDirectPlay8Server		*g_pDPServer	= NULL;
IDirectPlay8Address*  g_pDeviceAddress	= NULL;

#define SAFE_DELETE(p)  { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_RELEASE(p) { if(p) { (p)->Release(); (p)=NULL; } }
char cha[5];
int flag[2];
int num_player = -1;
int time = 50;

Database database;		//query
Database database2;		//query
Database database3;		//for login
Database database4;		//multicast

void query(char string_query[450])
{
	if(flag[0] == 0)
	{
		flag[0] = 1;
		database.doData(string_query);
		flag[0] = 0;
	}
	else if(flag[1] == 0)
	{
		flag[1] = 1;
		database2.doData(string_query);
		flag[1] = 0;
	}
}


class Packet_sent
{
friend class Database;
public:
	void assign_data()
	{
		int number_data = 0;
		if(database4.getData() != NULL)
		{
			size = database4.getNumOfRow();
			column = database4.getNumOfColumn();
			MYSQL_ROW row;
			while( row = mysql_fetch_row(database4.getData()) ) 
			{
				for(int i = 0;i < column;++i)
				{
					str[number_data] = row[i];
					number_data++;
				}
			}
			
		}
	};
	void check_login(char username_check[9],char password_check[9])
	{
		MYSQL_ROW row;
		while( row = mysql_fetch_row(database3.getData()) ) 
		{
			if(strcmp(password_check,row[1]) == 0)
			{
				if(strcmp("0",row[2]) == 0)
				{
					status_user = "OK";
					status_user.append(username_check);
					char string_query[200];
					//set login on
//					sprintf(string_query,"update `account` set `LOGIN`='1' where `USERNAME`='%s'",username_check);
					sprintf(string_query,"update `account` set `LOGIN`='0' where `USERNAME`='%s'",username_check);
					query(string_query);
					break;
				}
			}
		}
	};
private:
	int column;
	int size; //row
	string str[255];
	string status_user;
};

struct Packet_recieve
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

static const GUID g_guidApp = 
{ 0xede9493e, 0x6ac8, 0x4f15, {0x8d, 0x1, 0x8b, 0x16, 0x32, 0x0, 0xb9, 0x66} };

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

Packet_sent pack;
void sentData()
{
	pack.assign_data();
	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack);
	bufferDesc.pBufferData  = (BYTE*) &pack;
	g_pDPServer->SendTo( DPNID_ALL_PLAYERS_GROUP,			// dpnid
                                    &bufferDesc,			// pBufferDesc
                                    1,						// cBufferDesc
                                    0,						// dwTimeOut
                                    NULL,					// pvAsyncContext
                                    NULL,					// pvAsyncHandle
                                    DPNSEND_SYNC |
                                    DPNSEND_NOLOOPBACK );	// dwFlags
}

int sentDataForLogin(char username_check[9],char password_check[9])
{
	Packet_sent pack_login;
	pack_login.check_login(username_check,password_check);
	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(pack_login);
	bufferDesc.pBufferData  = (BYTE*) &pack_login;
	g_pDPServer->SendTo( DPNID_ALL_PLAYERS_GROUP,			// dpnid
                                    &bufferDesc,			// pBufferDesc
                                    1,						// cBufferDesc
                                    0,						// dwTimeOut
                                    NULL,					// pvAsyncContext
                                    NULL,					// pvAsyncHandle
                                    DPNSEND_SYNC |
                                    DPNSEND_NOLOOPBACK );	// dwFlags
	cout << "sent data for login" << endl;
	cout << "Number of Player is : " << num_player << endl;
	cout << "----------------------" << endl;
	return 0;
}

HRESULT WINAPI DirectPlayMessageHandlerServer( PVOID pvUserContext, DWORD dwMessageId, PVOID pMsgBuffer )
{
	HRESULT hr = S_OK; 
	switch (dwMessageId)
	{
		case DPN_MSGID_RECEIVE:
		{
			cout << "." << endl;
			PDPNMSG_RECEIVE msg;
			msg = (PDPNMSG_RECEIVE)pMsgBuffer;

			Packet_recieve *pack_recieve;
			pack_recieve =(Packet_recieve*)msg->pReceiveData;
			if(pack_recieve->str_query == "Position")
			{
				char string_query[200];
				sprintf(string_query,"update `account` set `POSITIONX`='%f',`POSITIONY`='%f',`ROTATE`='%f',`STATUS`='%d' where `USERNAME`='%s'",pack_recieve->positionX,pack_recieve->positionY,pack_recieve->rotate,pack_recieve->status,pack_recieve->username_login);
				query(string_query);
			}
			else if(pack_recieve->str_query == "Attack")
			{
				char string_query[200];
				sprintf(string_query,"update `account` set `BLOOD`='%f' where `USERNAME`='%d'",pack_recieve->blood,pack_recieve->number_mon);
				query(string_query);
			}
			else if(pack_recieve->str_query == "Revive")
			{
				char string_query[200];
				sprintf(string_query,"update `account` set `POSITIONX`='%f',`POSITIONY`='%f',`ROTATE`='%f',`STATUS`='%d',`BLOOD`='%f' where `USERNAME`='%s'",pack_recieve->positionX,pack_recieve->positionY,pack_recieve->rotate,pack_recieve->status,pack_recieve->blood,pack_recieve->username_login);
				query(string_query);
			}
			else if(pack_recieve->str_query == "Level")
			{
				char string_query_level[450];
				sprintf(string_query_level,"update `account` set `POSITIONX`='%f',`POSITIONY`='%f',`ROTATE`='%f',`STATUS`='%d',`LEVEL`='%d',`STR`='%d',`DEX`='%d',`AGI`='%d',`HP`='%d',`BLOOD`='%f',`EXP`='%d' where `USERNAME`='%s'",pack_recieve->positionX,pack_recieve->positionY,pack_recieve->rotate,pack_recieve->status,pack_recieve->lv,pack_recieve->str,pack_recieve->dex,pack_recieve->agi,pack_recieve->hp,pack_recieve->blood,pack_recieve->exp,pack_recieve->username_login);
				query(string_query_level);
			}
			else if(pack_recieve->str_query == "login")
			{
				cout << "Message Recieve is: " << pack_recieve->str_query << endl;
				cout << "username is: " << pack_recieve->username_login << endl;
				cout << "password is: " <<pack_recieve->password_login << endl;
				char string_query_login[80];
//				strcpy(string_query,"select * from account where USERNAME = \"");
//				strcat(string_query,pack_recieve->username_login);
//				strcat(string_query,"\";");
				sprintf(string_query_login,"select * from account where USERNAME =\"%s\"",pack_recieve->username_login);
				database3.doData(string_query_login);
				sentDataForLogin(pack_recieve->username_login,pack_recieve->password_login);
			}
			else if(pack_recieve->str_query == "logout")
			{
				char string_query_logout[500];
				cout << "Message Recieve is: " << pack_recieve->str_query << endl;
				cout << "username is: " << pack_recieve->username_login << endl;
//				sprintf(string_query_logout,"update `account` set `LOGIN`='0',`POSITIONX`='%f',`POSITIONY`='%f' where `USERNAME`='%s'",pack_recieve->positionX,pack_recieve->positionY,pack_recieve->username_login);
				sprintf(string_query_logout,"update `account` set `LOGIN`='0',`POSITIONX`='%f',`POSITIONY`='%f',`ROTATE`='%f',`STATUS`='%d',`LEVEL`='%d',`STR`='%d',`DEX`='%d',`AGI`='%d',`HP`='%d',`BLOOD`='%f',`EXP`='%d' where `USERNAME`='%s'",pack_recieve->positionX,pack_recieve->positionY,pack_recieve->rotate,pack_recieve->status,pack_recieve->lv,pack_recieve->str,pack_recieve->dex,pack_recieve->agi,pack_recieve->hp,pack_recieve->blood,pack_recieve->exp,pack_recieve->username_login);
				database3.doData(string_query_logout);
			}
			break;
		}

		case DPN_MSGID_INDICATE_CONNECT:
		{
//			MessageBox(NULL,"INDICATE_CONNECT","Server",MB_OKCANCEL);
			cout << "INDICATE_CONNECT" << endl;
			break;
		}

		case DPN_MSGID_CREATE_PLAYER:
		{		
//			MessageBox(NULL,"CREATE_PLAYER","Server",MB_OKCANCEL);
			cout << "CREATE_PLAYER" << endl;
			num_player++;
			break; 
		}

		case DPN_MSGID_DESTROY_PLAYER:
		{
//			MessageBox(NULL,"DESTROY_PLAYER","Server",MB_OKCANCEL);
			num_player--;
			cout << "DESTROY_PLAYER" << "\t Number is : \t"<< num_player <<  endl;
			break;
		}
	
		case DPN_MSGID_CONNECT_COMPLETE:
		{
			PDPNMSG_CONNECT_COMPLETE pcomplete;
			pcomplete=(PDPNMSG_CONNECT_COMPLETE)pMsgBuffer;
			if (pcomplete->hResultCode == DPN_OK)
			{
//				MessageBox(NULL,"Connect complete......","Server",MB_OKCANCEL);
			}
			else
			{
//				MessageBox(NULL,"Connect incomplete......","Server",MB_OKCANCEL);
			}
			break;
		}
	}
	return hr; 
}

HRESULT Init_Directplay()
{
	COMModule commod;
	HRESULT hr;
	// Create the IDirectPlay8Peer Object
	if( FAILED( hr = CoCreateInstance( CLSID_DirectPlay8Server, NULL,CLSCTX_INPROC_SERVER,IID_IDirectPlay8Server,(LPVOID*) &g_pDPServer)))
		return hr;
	// Initialize DirectPlay
	if( FAILED( hr = g_pDPServer->Initialize(NULL, DirectPlayMessageHandlerServer, 0))){return hr;}

    // Create our IDirectPlay8Address Device Address
    hr = CoCreateInstance( CLSID_DirectPlay8Address,NULL,CLSCTX_INPROC_SERVER,IID_IDirectPlay8Address,(LPVOID*) &g_pDeviceAddress ); 
    // Set the SP for our Device Address
    hr = g_pDeviceAddress->SetSP(&CLSID_DP8SP_TCPIP );

	DWORD					dwPort=25944;//2375;
	hr = g_pDeviceAddress->AddComponent(DPNA_KEY_PORT,&dwPort,sizeof(DWORD),DPNA_DATATYPE_DWORD);
//	Init(g_guidApp, 2375);

	WCHAR strHost[128] = {0};
	DPN_APPLICATION_DESC    dpAppDesc;
    // Set up the Application Description.
    ZeroMemory(&dpAppDesc, sizeof(DPN_APPLICATION_DESC));
    dpAppDesc.dwSize = sizeof(DPN_APPLICATION_DESC);
    dpAppDesc.dwFlags = DPNSESSION_CLIENT_SERVER;	// Flag describing the app
    dpAppDesc.guidApplication = g_guidApp;          // GUID for the app
    dpAppDesc.pwszSessionName = strHost;			// Session name
    // Host the application.
    if( FAILED (hr = g_pDPServer->Host(&dpAppDesc,	// pdnAppDesc
                          &g_pDeviceAddress, 1,		// prgpDeviceInfo, cDeviceInfo
                          NULL, NULL,				// pdpSecurity, pdpCredentials
                          NULL,						// pvPlayerContext
                          0)						// dwFlags
				)			
		) {return hr;}
	return hr;
}

HRESULT TerminateDirectplay()
{
	HRESULT hr;
	hr = g_pDPServer->Close(0);
//	g_pDPServer->Release();
	g_pDPServer = NULL;
	g_pDeviceAddress->Release();
	g_pDeviceAddress = NULL;
//	if(g_pDPServer != NULL)
//	{
//		g_pDPServer->Release();
//		g_pDPServer = NULL;
//	}
	CoUninitialize();
	return hr;
}

int main()
{
	char cha = NULL;
	flag[0] = 0;
	flag [1] = 0;
	Init_Directplay();
	int flag_check = 0;
	flag_check = database.connectDatabase();
		if(flag_check != 0) return 0;
	flag_check = database2.connectDatabase();
		if(flag_check != 0) return 0;
	flag_check = database3.connectDatabase();
		if(flag_check != 0) return 0;
	flag_check = database4.connectDatabase();
		if(flag_check != 0) return 0;
	cout << "for testclient" << endl;
	cout << "Connect Database Complete" << endl << "---------------------------------" << endl;
	if (flag_check != 0) {return -1;}
	MSG msg; 
    ZeroMemory( &msg, sizeof(msg) );
	while( msg.message!=WM_QUIT )
	{
		if(kbhit() != 0)
		{
			TerminateDirectplay();
			cout << "Terminate" << endl;
			getch();
			return 0;
		}
		Sleep(time);
//		database4.doData("select * from account where `LOGIN`!='0';");
		database4.doData("select * from account;");
		sentData();
		if( PeekMessage( &msg, NULL, 0U, 0U, PM_REMOVE ) )
		{
			TranslateMessage( &msg );
			DispatchMessage( &msg );
		}
	}
	return 0;
}

