//----------------------------------------------------------------------------
// File: SimpleServer.cpp
//
// Desc: The SimpleClientServer sample is a simple client/server application. 
//
// Copyright (c) 1999-2001 Microsoft Corp. All rights reserved.
//-----------------------------------------------------------------------------
#include <stdio.h>
#include <dplay8.h>
#include <dpaddr.h>
#include <dxerr8.h>
#include <tchar.h>
#include "../common/vrcommon.h"
#include "../common/vrsmtp.h"
#include "../vrmysql/vrmysql.h"
#include "vrpacket.h"
#include "vrserver.h"
#include "resource.h"

#pragma comment(lib,"ws2_32.lib")

//-----------------------------------------------------------------------------
// Defines, and constants
//-----------------------------------------------------------------------------
struct APP_PLAYER_INFO
{
    LONG  lRefCount;                        // Ref count so we can cleanup when all threads 
                                            // are done w/ this object
    DPNID dpnidPlayer;                      // DPNID of player
    CHAR szPlayerName[MAX_PLAYER_NAME];		// Player name
	CHAR szPlayerPassword[MAX_PLAYER_NAME];	// Player name
	UINT nMapcode;
	CHAR szMapname[MAX_CHAR];

	INT		nSuit;
	DWORD	dwAction;
	INT		nFrameAngle;
	INT		xPos;
	INT		yPos;
};




//-----------------------------------------------------------------------------
// Player context locking defines
//-----------------------------------------------------------------------------
CRITICAL_SECTION g_csPlayerContext;
#define PLAYER_LOCK()                   EnterCriticalSection( &g_csPlayerContext ); 
#define PLAYER_ADDREF( pPlayerInfo )    if( pPlayerInfo ) pPlayerInfo->lRefCount++;
#define PLAYER_RELEASE( pPlayerInfo )   if( pPlayerInfo ) { pPlayerInfo->lRefCount--; if( pPlayerInfo->lRefCount <= 0 ) SAFE_DELETE( pPlayerInfo ); } pPlayerInfo = NULL;
#define PLAYER_UNLOCK()                 LeaveCriticalSection( &g_csPlayerContext );




//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------
IDirectPlay8Server* g_pDPServer						= NULL;    // DirectPlay server object
HINSTANCE			g_hInst							= NULL;    // HINST of app
HWND				g_hDlg							= NULL;    // HWND of main dialog
LONG				g_lNumberOfActivePlayers		= 0;       // Number of players currently in game
TCHAR				g_strAppName[256]				= TEXT("VRCampus Server (DPlay)");
TCHAR				g_strSessionName[12]			= TEXT("VRCampus");              // Session name
DWORD				g_dwPort						= 7777;    // Port
TCHAR				g_strDatabaseIP[256]			= TEXT("161.246.6.3");
HRESULT				g_hrDialog						= S_OK;    // Exit code for app 
BOOL				g_bServerStarted				= FALSE;   // TRUE if the server has started
CVRDatabase			*g_pDatabase					= NULL;
CVRMultilineText	*g_pcvrmtStatus					= NULL;
CMap				*g_pMap							= NULL;
CWrap				*g_pWrap						= NULL;
CNpc				*g_pNpc							= NULL;

int					g_nNpcCount						= 0;
int					g_nMapCount						= 0;
int					g_nWrapCount						= 0;





//-----------------------------------------------------------------------------
// Function-prototypes
//-----------------------------------------------------------------------------
HRESULT WINAPI   ServerMessageHandler( PVOID pvUserContext, DWORD dwMessageId, PVOID pMsgBuffer );
INT_PTR CALLBACK DlgServerProc( HWND hDlg, UINT msg, WPARAM wParam, LPARAM lParam );
HRESULT  StartServer( HWND hDlg );
VOID     StopServer( HWND hDlg );
VOID     DisplayPlayers( HWND hDlg );
HRESULT  SendCreatePlayerMsg( APP_PLAYER_INFO* pPlayerInfo, DPNID dpnidTarget );
HRESULT  SendWorldStateToNewPlayer( APP_PLAYER_INFO* pPlayerInfo, DPNID dpnidPlayer );
HRESULT  SendDestroyPlayerMsg( APP_PLAYER_INFO* pPlayerInfo,DPNID dpnidTarget );
HRESULT  SendWaveMessageToAll( DPNID dpnidFrom );

HRESULT	 SendWalkMessageToMap( DPNID dpnidFrom, char* szUsername, int nFrameAngle, int xDes, int yDes, int xPos, int yPos, UINT nMapcode );
HRESULT	 SendChatMessage( DPNID dpnidFrom,char* szChatMessage, char* szRecieveName, UINT nMapcode );

HRESULT	 SendLoginToPlayer( DPNID dpnidTarget, int nType );
HRESULT	 SendMapToPlayer(DPNID dpnidTarget, char* szUsername, UINT nMapcode ,int nPosX, int nPosY );
HRESULT	 SendWrapToPlayer(DPNID dpnidTarget, UINT nMapcode );
HRESULT	 SendNpcToPlayer(DPNID dpnidTarget, UINT nMapcode );
HRESULT	 SendNpcTalkToPlayer(DPNID dpnidTarget, int nNpcID, int nNextStateID, char* szGreeting, char* szCase );
HRESULT	 SendPlayerInfoToPlayer( DPNID dpnidTarget, char* szUsername );



HRESULT	 fnNpcTalk( APP_PLAYER_INFO* pPlayerInfo, DPNID dpnidTarget,PK_REQUEST_NPCTALK* );
HRESULT	 fnLoadMapInfo();


//-----------------------------------------------------------------------------
// Name: WinMain()
// Desc: Entry point for the application.  Since we use a simple dialog for 
//       user interaction we don't need to pump messages.
//-----------------------------------------------------------------------------
INT APIENTRY WinMain( HINSTANCE hInst, HINSTANCE hPrevInst, 
                      LPSTR pCmdLine, INT nCmdShow )
{
    g_hInst = hInst;
	g_pcvrmtStatus	= new CVRMultilineText( 6, 128 );


    InitializeCriticalSection( &g_csPlayerContext );
    CoInitializeEx( NULL, COINIT_MULTITHREADED );

    DialogBox( hInst, MAKEINTRESOURCE(IDD_SERVER), NULL, (DLGPROC) DlgServerProc );

    if( FAILED( g_hrDialog ) )
    {
        if( g_hrDialog == DPNERR_CONNECTIONLOST )
        {
            MessageBox( NULL, TEXT("The DirectPlay session was lost. ")
                        TEXT("The server will now quit."),
                        g_strAppName, MB_OK | MB_ICONERROR );
        }
        else
        {
            DXTRACE_ERR( TEXT("DialogBox"), g_hrDialog );
            MessageBox( NULL, TEXT("An error occured. ")
                        TEXT("The server will now quit."),
                        g_strAppName, MB_OK | MB_ICONERROR );
        }
    }


    StopServer( NULL );


    DeleteCriticalSection( &g_csPlayerContext );
    CoUninitialize();


	SAFE_DELETE( g_pcvrmtStatus );

    return TRUE;
}



HRESULT	fnLoadMapInfo()
{
	HRESULT hr = S_OK;

	g_nMapCount = g_pDatabase->GetCountRow( "map" );

	g_pMap = new CMap[g_nMapCount];
		for ( int i=0; i<g_nMapCount; i++ )
	{	
		DB_MAP_INFO* dbMapInfo;
		dbMapInfo = g_pDatabase->GetMapInfo ( i+1 );
		g_pMap[i].nMapCode = dbMapInfo->nMapcode ;
		strcpy ( g_pMap[i].szMapName, dbMapInfo->szMapName  );
	}

	g_nWrapCount = g_pDatabase->GetCountRow( "wrap" );
	g_pWrap = new CWrap[g_nWrapCount];

	for ( i=0; i<g_nWrapCount; i++ )
	{	
		DB_WRAP_INFO* dbWrapInfo;
		dbWrapInfo = g_pDatabase->GetWrapInfo ( i+1 );
		g_pWrap[i].nSrcMapCode = dbWrapInfo->nSrcMapcode ;
		g_pWrap[i].nSrcX = dbWrapInfo->nSrcX ;
		g_pWrap[i].nSrcY = dbWrapInfo->nSrcY ;
		g_pWrap[i].nDestMapCode = dbWrapInfo->nDestMapcode ;
		g_pWrap[i].nDestX = dbWrapInfo->nDestX ;
		g_pWrap[i].nDestY = dbWrapInfo->nDestY ;
	}


	g_nNpcCount = 18;
	g_pNpc = new CNpc[g_nNpcCount];
	g_pNpc[0].nID  = 600;
	g_pNpc[0].nMapCode = 600;
	g_pNpc[0].x	= 48;
	g_pNpc[0].y = 106;
	g_pNpc[0].nBmpID = 0;
	g_pNpc[0].nFuncID = 1;

	g_pNpc[1].nID  = 700;
	g_pNpc[1].nMapCode = 700;
	g_pNpc[1].x	= 48;
	g_pNpc[1].y = 106;
	g_pNpc[1].nBmpID = 0;
	g_pNpc[1].nFuncID = 1;

	g_pNpc[2].nID  = 800;
	g_pNpc[2].nMapCode = 800;
	g_pNpc[2].x	= 48;
	g_pNpc[2].y = 106;
	g_pNpc[2].nBmpID = 0;
	g_pNpc[2].nFuncID = 1;

	g_pNpc[3].nID  = 900;
	g_pNpc[3].nMapCode = 900;
	g_pNpc[3].x	= 48;
	g_pNpc[3].y = 106;
	g_pNpc[3].nBmpID = 0;
	g_pNpc[3].nFuncID = 1;

	g_pNpc[4].nID  = 100;
	g_pNpc[4].nMapCode = 100;
	g_pNpc[4].x	= 41;
	g_pNpc[4].y = 99;
	g_pNpc[4].nBmpID = 0;
	g_pNpc[4].nFuncID = 1;

	g_pNpc[5].nID  = 9001;
	g_pNpc[5].nMapCode = 900;
	g_pNpc[5].x	= 39;
	g_pNpc[5].y = 36;
	g_pNpc[5].nBmpID = 0;
	g_pNpc[5].nFuncID = 1;

	g_pNpc[6].nID  = 9002;
	g_pNpc[6].nMapCode = 900;
	g_pNpc[6].x	= 39;
	g_pNpc[6].y = 31;
	g_pNpc[6].nBmpID = -1;
	g_pNpc[6].nFuncID = 0;

	g_pNpc[7].nID  = 9003;
	g_pNpc[7].nMapCode = 900;
	g_pNpc[7].x	= 49;
	g_pNpc[7].y = 38;
	g_pNpc[7].nBmpID = -1;
	g_pNpc[7].nFuncID = 0;

	g_pNpc[8].nID  = 9004;
	g_pNpc[8].nMapCode = 900;
	g_pNpc[8].x	= 49;
	g_pNpc[8].y = 31;
	g_pNpc[8].nBmpID = -1;
	g_pNpc[8].nFuncID = 0;

	g_pNpc[9].nID  = 1009;
	g_pNpc[9].nMapCode = 100;
	g_pNpc[9].x	= 44;
	g_pNpc[9].y = 97;
	g_pNpc[9].nBmpID = -1;
	g_pNpc[9].nFuncID = 0;

	g_pNpc[10].nID  = 2009;
	g_pNpc[10].nMapCode = 200;
	g_pNpc[10].x	= 44;
	g_pNpc[10].y = 97;
	g_pNpc[10].nBmpID = -1;
	g_pNpc[10].nFuncID = 0;

	g_pNpc[11].nID  = 3009;
	g_pNpc[11].nMapCode = 300;
	g_pNpc[11].x	= 44;
	g_pNpc[11].y = 97;
	g_pNpc[11].nBmpID = -1;
	g_pNpc[11].nFuncID = 0;

	g_pNpc[12].nID  = 4009;
	g_pNpc[12].nMapCode = 400;
	g_pNpc[12].x	= 44;
	g_pNpc[12].y = 97;
	g_pNpc[12].nBmpID = -1;
	g_pNpc[12].nFuncID = 0;

	g_pNpc[13].nID  = 5009;
	g_pNpc[13].nMapCode = 500;
	g_pNpc[13].x	= 44;
	g_pNpc[13].y = 97;
	g_pNpc[13].nBmpID = -1;
	g_pNpc[13].nFuncID = 0;

	g_pNpc[14].nID  = 6009;
	g_pNpc[14].nMapCode = 600;
	g_pNpc[14].x	= 44;
	g_pNpc[14].y = 97;
	g_pNpc[14].nBmpID = -1;
	g_pNpc[14].nFuncID = 0;

	g_pNpc[15].nID  = 7009;
	g_pNpc[15].nMapCode = 700;
	g_pNpc[15].x	= 44;
	g_pNpc[15].y = 97;
	g_pNpc[15].nBmpID = -1;
	g_pNpc[15].nFuncID = 0;

	g_pNpc[16].nID  = 8009;
	g_pNpc[16].nMapCode = 800;
	g_pNpc[16].x	= 44;
	g_pNpc[16].y = 97;
	g_pNpc[16].nBmpID = -1;
	g_pNpc[16].nFuncID = 0;

	g_pNpc[17].nID  = 9009;
	g_pNpc[17].nMapCode = 900;
	g_pNpc[17].x	= 44;
	g_pNpc[17].y = 97;
	g_pNpc[17].nBmpID = -1;
	g_pNpc[17].nFuncID = 0;
	return hr;
}


//-----------------------------------------------------------------------------
// Name: fnMailStep1()
// Desc: request mail body from client
//-----------------------------------------------------------------------------
HRESULT	 fnMailStep1( APP_PLAYER_INFO* pPlayerInfo,char* szToMail )
{
	HRESULT hr = S_OK;	

	DPNID dpnidTarget	= pPlayerInfo->dpnidPlayer; 

    PK_MAIL_STEP1 msg;
    msg.wID = PK_ID_MAIL_STEP1;
	strcpy ( msg.szToMail, szToMail );

    DPN_BUFFER_DESC bufferDesc;
    bufferDesc.dwBufferSize = sizeof(PK_MAIL_STEP1);
    bufferDesc.pBufferData  = (BYTE*) &msg;

    // DirectPlay will tell via the message handler 
    // if there are any severe errors, so ignore any errors 
    DPNHANDLE hAsync;
    g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
                         0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

	return hr;
}

//-----------------------------------------------------------------------------
// Name: fnSendMail()
// Desc: NPC send e-mail
//-----------------------------------------------------------------------------
HRESULT	 fnSendMail( APP_PLAYER_INFO* pPlayerInfo, PK_MAIL_STEP2* pMsg)
{
	HRESULT hr = S_OK;

	DB_PLAYER_INFO* dbPlayerInfo;
	dbPlayerInfo = (DB_PLAYER_INFO*)g_pDatabase->GetUserInfo( pPlayerInfo->szPlayerName ); 

	char szFromName[12]	="";
	char szFromMail[30]	="";
	char szToMail[30]	="";
	char szSubject[30]	="";
	char szBody[512]	="";

	sprintf( szFromName, "%s %s", dbPlayerInfo->szUsername );
	sprintf( szFromMail, "%s", dbPlayerInfo->szEmail );
	sprintf( szToMail, "%s", pMsg->szToMail );
	sprintf( szSubject, "%s", pMsg->szSubject );
	sprintf( szBody, "%s", pMsg->szBody );
	

	CVRSmtp mail;

	if (mail.ConnectServer("161.246.10.21")) {
		mail.SetSenderName( szFromName );
		mail.SetSenderEmail( szFromMail );
		mail.SetReplyTo( szFromMail );
		mail.SetSubject( szSubject );

		mail.AddRecipient( szToMail );
		mail.AddCCRecipient("");
		mail.AddBCCRecipient("");

		mail.SetMessageBody( szBody );
    
		if (mail.GetConnectStatus()) {        
			printf(mail.Send() ? "Send was a success!" : "Send failed!");
			mail.Disconnect();                    
		}
	}   	

	return hr;
}



//-----------------------------------------------------------------------------
// Name: fnNpcTalk()
// Desc: check talkid cased stateid and gen msg to reply
//-----------------------------------------------------------------------------
HRESULT	 fnNpcTalk( APP_PLAYER_INFO* pPlayerInfo,DPNID dpnidTarget, PK_REQUEST_NPCTALK* pNpc )
{
	HRESULT hr = S_OK;
	int nNpcID = pNpc->nNpcID;
	int nNextStateID = -1;
	int nNextTalkID = 0;
	int nNextCaseID = -1;
	char szCase[256];
	char szGreeting[256];
	strcpy ( szGreeting, "" );
	strcpy ( szCase, "") ;
	

	switch ( nNpcID )
	{	
	// NPC LIFT
	case 1009:
	case 2009:
	case 3009:
	case 4009:
	case 5009:
	case 6009:
	case 7009:
	case 8009:
	case 9009:
		switch ( pNpc->nStateID )
		{
		case 0:
			nNextStateID = 1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Lift]\r\nเลือกชั้นที่ต้องการไป" );
			strcpy ( szCase, "1,2,3,4,5,6,7,8,9") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		case 1:
		{
			nNextStateID = -1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			sprintf ( szGreeting, "[Lift]\r\nโชคดีคะ" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );

			int nMapcode = 0;
			int nPosX = 44;
			int nPosY = 102;
			char szMapcode[3];
			sprintf ( szMapcode,"%d00", pNpc->nCaseID + 1 );
			nMapcode = atoi(szMapcode);
				
			SendMapToPlayer( pPlayerInfo->dpnidPlayer, pPlayerInfo->szPlayerName ,nMapcode, nPosX,nPosY );
			break;
		}
		default:
			break;
		}
		break;
	// NPC Email
	case 9001:
	case 9002:
	case 9003:
	case 9004:
		switch ( pNpc->nStateID )
		{
		case 0:
			nNextStateID = 1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Mail Sender]\r\nคุณต้องการส่ง E-Mail ถึงใครหรือเปล่าคะ?" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );

			break;
		case 1:
			nNextStateID = 2;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Mail Sender]\r\nนี่คือรายการ E-Mail Address ที่คุณสามารถส่งไปถึงได้คะ" );
			strcpy ( szCase, "Mr.Somkait,Mr.Somsak,VRCampus,..,..,..,..,..,..,End") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		case 2:
		{

			nNextStateID = 3;
			nNextTalkID = 0;
			nNextCaseID = -1;
			sprintf ( szGreeting, "[Mail Sender]\r\nเขียนข้อความที่ต้องการส่งได้เลยคะ" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );

			char szToMail[30] = "";
			switch (pNpc->nCaseID)
			{
			case 0:
				sprintf ( szToMail, "kwsomkai@kmitl.ac.th" );
				break;
			case 1:
				sprintf ( szToMail, "kwsomsak@kmitl.ac.th" );
				break;
			default :
				sprintf ( szToMail, "vrcampus@hotmail.com" );
				break;
			}
						
			fnMailStep1( pPlayerInfo, szToMail );
			break;
		}
		case 3:
			nNextStateID = -1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			sprintf ( szGreeting, "[Mail Sender]\r\nเราจะทำการส่งให้ถึงมือผู้รับ (ถ้าเป็นไปได้นะคะ)" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		default:
			break;
		}
		break;


	// Guide
	case 100:
		switch ( pNpc->nStateID )
		{
		case 0:
			nNextStateID = 1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nยินดีต้อนรบับสู้แคมปัสเสมือนจริง Virtual Campus ซึ่งจะนำพาคุณไปสู้รูปแบบจะลอง 3 มิติของอาคารปฏิบัติการรวมวิศวกรรมศาสตร์ ECC Building" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		case 1:
			nNextStateID = -1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nเชิญขึ้นลิฟท์ได้เลยคะ ถ้าด้านหน้าแน่นคุณสามารถขึ้นลิฟท์ 2 ตัวด้านหลังคะ" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		default:
			break;
		}
		break;


	// Guide
	case 600:
		switch ( pNpc->nStateID )
		{
		case 0:
			nNextStateID = 1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nชั้นนี้จะมีห้องวิจัยงาน ESL" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		case 1:
			nNextStateID = -1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nคุณสามารถหารายละเอียดเพิ่มเติมได้จาก www.ce.kmitl.ac.th" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		default:
			break;
		}
		break;

	// Guide
	case 700:
		switch ( pNpc->nStateID )
		{
		case 0:
			nNextStateID = 1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nชั้นนี้คุณจะได้พบกับห้องวิจัย และห้องต่าๆ ดังเช่น Information Security Advisory Group (ISAG), ICL, ห้องคอมพิวเตอร์กลาง, ห้องปฏิบัติการคอมพิวเตอร์ " );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		case 1:
			nNextStateID = -1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nคุณสามารถหารายละเอียดเพิ่มเติมได้จาก www.ce.kmitl.ac.th\r\nisag.ce.kmitl.ac.th" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		default:
			break;
		}
		break;

	// Guide
	case 800:
		switch ( pNpc->nStateID )
		{
		case 0:
			nNextStateID = 1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nชั้นนี้จะมีห้องวิจัยงาน และห้องต่างๆดังต่อไปนี้\r\nMultimedia, Olala, Hardware, Granduate" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		case 1:
			nNextStateID = -1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nคุณสามารถหารายละเอียดเพิ่มเติมได้จาก www.ce.kmitl.ac.th" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		default:
			break;
		}
		break;

	// Guide
	case 900:
		switch ( pNpc->nStateID )
		{
		case 0:
			nNextStateID = 1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nชั้นนี้คุณจะได้พบกับ ห้องหัวหน้าภาควิชา ห้องธุระการภาควิชา และห้องพักอาจารย์ ซึ่งชั้นนี้เป็นชั้นที่คุณสามารติดต่อกับทางภาควิชาวิศวกรรมคอมพิวเตอร์ได้" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		case 1:
			nNextStateID = -1;
			nNextTalkID = 0;
			nNextCaseID = -1;
			strcpy ( szGreeting, "[Guide]\r\nคุณสามารถหารายละเอียดเพิ่มเติมได้จาก www.ce.kmitl.ac.th" );
			strcpy ( szCase, "") ;
			SendNpcTalkToPlayer(dpnidTarget, nNpcID, nNextStateID, szGreeting, szCase );
			break;
		default:
			break;
		}
		break;


	case 2:
		break;

	default:
		break;
	}


	return hr;
}


//-----------------------------------------------------------------------------
// Name: DlgServerProc()
// Desc: Handles dialog messages
//-----------------------------------------------------------------------------
INT_PTR CALLBACK DlgServerProc( HWND hDlg, UINT msg, 
                                WPARAM wParam, LPARAM lParam )
{
    switch( msg ) 
    {
        case WM_INITDIALOG:
        {
            g_hDlg = hDlg;

            // Load and set the icon
            HICON hIcon = LoadIcon( g_hInst, MAKEINTRESOURCE( IDI_ICON1 ) );
            SendMessage( hDlg, WM_SETICON, ICON_BIG,   (LPARAM) hIcon );  // Set big icon
            SendMessage( hDlg, WM_SETICON, ICON_SMALL, (LPARAM) hIcon );  // Set small icon
            SetDlgItemText( hDlg, IDC_SESSION_NAME, g_strSessionName );
			SetDlgItemText( hDlg, IDC_DATABASE_IP, g_strDatabaseIP );
            SetDlgItemInt( hDlg, IDC_PORT, g_dwPort, FALSE );
            SetDlgItemText( hDlg, IDC_STATUS, TEXT("Server stoped.") );
            PostMessage( hDlg, WM_APP_UPDATE_STATS, 0, 0 );
            break;
        }

        case WM_APP_UPDATE_STATS:
        {
            // Update the number of players in the game
            TCHAR strNumberPlayers[32];

            wsprintf( strNumberPlayers, TEXT("%d"), g_lNumberOfActivePlayers );
            SetDlgItemText( hDlg, IDC_NUM_PLAYERS, strNumberPlayers );
            DisplayPlayers( hDlg );
            break;
        }

        case WM_COMMAND:
        {
            switch( LOWORD(wParam) )
            {
                case IDC_START:
                    if( !g_bServerStarted )
                    {
                        if( FAILED( g_hrDialog = StartServer( hDlg ) ) )
                        {
                            DXTRACE_ERR( TEXT("StartServer"), g_hrDialog );
                            EndDialog( hDlg, 0 );
                        }
						SetDlgItemText( hDlg, IDC_START, TEXT("Stop Server") );
						g_pcvrmtStatus->AddString( "Server started" );
                    }
                    else
                    {
                        StopServer( hDlg );
						SetDlgItemText( hDlg, IDC_START, TEXT("Start Server") );
						g_pcvrmtStatus->AddString( "Server started" );

                    }

                    break;

                case IDCANCEL:
                    StopServer( hDlg );
                    EndDialog( hDlg, 0 );
                    return TRUE;
            }
            break;
        }
    }

    return FALSE; // Didn't handle message
}




//-----------------------------------------------------------------------------
// Name: ServerMessageHandler
// Desc: Handler for DirectPlay messages.  This function is called by
//       the DirectPlay message handler pool of threads, so be careful of thread
//       synchronization problems with shared memory
//-----------------------------------------------------------------------------
HRESULT WINAPI ServerMessageHandler( PVOID pvUserContext, 
                                         DWORD dwMessageId, 
                                         PVOID pMsgBuffer )
{
    switch( dwMessageId )
    {
        case DPN_MSGID_CREATE_PLAYER:
        {
            HRESULT hr;
            PDPNMSG_CREATE_PLAYER pCreatePlayerMsg;
            pCreatePlayerMsg = (PDPNMSG_CREATE_PLAYER)pMsgBuffer;

            // Get the peer info and extract its name
            DWORD dwSize = 0;
            DPN_PLAYER_INFO* pdpPlayerInfo = NULL;
            hr = g_pDPServer->GetClientInfo( pCreatePlayerMsg->dpnidPlayer, 
                                             pdpPlayerInfo, &dwSize, 0 );
            if( FAILED(hr) && hr != DPNERR_BUFFERTOOSMALL )
            {
                if( hr == DPNERR_INVALIDPLAYER )
                {   // Ignore this message if this is for the host
                    break;
                }

                return DXTRACE_ERR( TEXT("GetClientInfo"), hr );
            }

            pdpPlayerInfo = (DPN_PLAYER_INFO*) new BYTE[ dwSize ];
            ZeroMemory( pdpPlayerInfo, dwSize );
            pdpPlayerInfo->dwSize = sizeof(DPN_PLAYER_INFO);
            hr = g_pDPServer->GetClientInfo( pCreatePlayerMsg->dpnidPlayer, 
                                       pdpPlayerInfo, &dwSize, 0 );
            if( FAILED(hr) )
                return DXTRACE_ERR( TEXT("GetClientInfo"), hr );

			// Authorization
			char szUsername[12];
			char szPassword[12];
			int	 nAuthorize;
			wcstombs(szUsername, pdpPlayerInfo->pwszName, MAX_PLAYER_NAME );
			strcpy(szPassword, (char*)pdpPlayerInfo->pvData);
			nAuthorize = g_pDatabase->ChkAuthorize( szUsername, szPassword );
			switch ( nAuthorize )
			{ 
			case 1:	// User not found, Log in as guest
				SendLoginToPlayer( pCreatePlayerMsg->dpnidPlayer, 1 );
				break;
			case 2:	// Wrong password
				SAFE_DELETE_ARRAY( pdpPlayerInfo );
				SendLoginToPlayer( pCreatePlayerMsg->dpnidPlayer, 2 );
				return S_OK;
				break;
			default: // Successed
				SendLoginToPlayer( pCreatePlayerMsg->dpnidPlayer, 0 );
				break;
			}


            // Create a new and fill in a APP_PLAYER_INFO
            APP_PLAYER_INFO* pPlayerInfo = new APP_PLAYER_INFO;
            ZeroMemory( pPlayerInfo, sizeof(APP_PLAYER_INFO) );
            pPlayerInfo->lRefCount   = 1;
            pPlayerInfo->dpnidPlayer = pCreatePlayerMsg->dpnidPlayer;

            // This stores a extra TCHAR copy of the player name for 
            // easier access.  This will be redundent copy since DPlay 
            // also keeps a copy of the player name in GetClientInfo()
			wcstombs(pPlayerInfo->szPlayerName, pdpPlayerInfo->pwszName, MAX_PLAYER_NAME );
			strcpy(pPlayerInfo->szPlayerPassword, (char*)pdpPlayerInfo->pvData);


			switch ( nAuthorize )
			{ 
			case 1:	// User not found, Log in as guest
				SendLoginToPlayer( pCreatePlayerMsg->dpnidPlayer, 1 );
				pPlayerInfo->nMapcode = 100;
	//			pPlayerInfo->dwAction = AC_STAND;	
	//			pPlayerInfo->nFrameAngle = 0;
				pPlayerInfo->xPos =	35;
				pPlayerInfo->yPos = 100;
				pPlayerInfo->nSuit = 0;
				strcpy(pPlayerInfo->szPlayerName, "Guest" );
				strcpy(pPlayerInfo->szPlayerPassword, "" );
				break;
			case 2:	// Wrong password
				SAFE_DELETE_ARRAY( pdpPlayerInfo );
				SendLoginToPlayer( pCreatePlayerMsg->dpnidPlayer, 2 );
				return S_OK;
				break;
			default: // Successed
				SendLoginToPlayer( pCreatePlayerMsg->dpnidPlayer, 0 );
				pPlayerInfo->nMapcode = g_pDatabase->GetMapCode( szUsername ) ;
				pPlayerInfo->xPos =	g_pDatabase->GetPosX( szUsername ) ;
				pPlayerInfo->yPos = g_pDatabase->GetPosY( szUsername ) ;
				pPlayerInfo->nSuit = g_pDatabase->GetSuit( szUsername );
				break;
			}			


            SAFE_DELETE_ARRAY( pdpPlayerInfo );

			// Tell DirectPlay to store this pPlayerInfo 
            // pointer in the pvPlayerContext.
            pCreatePlayerMsg->pvPlayerContext = pPlayerInfo;


            // Tell this new player about the world state
            SendWorldStateToNewPlayer( pPlayerInfo, pCreatePlayerMsg->dpnidPlayer );

            // Send all connected players a message telling about this new player
            // SendCreatePlayerMsg( pPlayerInfo, DPNID_ALL_PLAYERS_GROUP );

            // Update the number of active players, and 
            // post a message to the dialog thread to update the 
            // UI.  This keeps the DirectPlay message handler 
            // from blocking
            InterlockedIncrement( &g_lNumberOfActivePlayers );
            if( g_hDlg != NULL )
                PostMessage( g_hDlg, WM_APP_UPDATE_STATS, 0, 0 );

            break;
        }

        case DPN_MSGID_DESTROY_PLAYER:
        {
            PDPNMSG_DESTROY_PLAYER pDestroyPlayerMsg;
            pDestroyPlayerMsg = (PDPNMSG_DESTROY_PLAYER)pMsgBuffer;
            APP_PLAYER_INFO* pPlayerInfo = (APP_PLAYER_INFO*) pDestroyPlayerMsg->pvPlayerContext;

            // Ignore this message if this is the host player
            if( pPlayerInfo == NULL )
                break; 

            // Send all connected players a message telling about this destroyed player
            SendDestroyPlayerMsg( pPlayerInfo, DPNID_ALL_PLAYERS_GROUP );

            PLAYER_LOCK();                  // enter player context CS
            PLAYER_RELEASE( pPlayerInfo );  // Release player and cleanup if needed
            PLAYER_UNLOCK();                // leave player context CS

            // Update the number of active players, and 
            // post a message to the dialog thread to update the 
            // UI.  This keeps the DirectPlay message handler 
            // from blocking
            InterlockedDecrement( &g_lNumberOfActivePlayers );
            if( g_hDlg != NULL )
                PostMessage( g_hDlg, WM_APP_UPDATE_STATS, 0, 0 );

            break;
        }

        case DPN_MSGID_TERMINATE_SESSION:
        {
            PDPNMSG_TERMINATE_SESSION pTerminateSessionMsg;
            pTerminateSessionMsg = (PDPNMSG_TERMINATE_SESSION)pMsgBuffer;

            g_hrDialog = DPNERR_CONNECTIONLOST;
            EndDialog( g_hDlg, 0 );
            break;
        }

        case DPN_MSGID_RECEIVE:
        {
            PDPNMSG_RECEIVE pReceiveMsg;
            pReceiveMsg = (PDPNMSG_RECEIVE)pMsgBuffer;

            APP_PLAYER_INFO* pPlayerInfo = (APP_PLAYER_INFO*) pReceiveMsg->pvPlayerContext;

			PK_GENERIC* pMsg = (PK_GENERIC*) pReceiveMsg->pReceiveData;
            switch (pMsg->wID )
			{	
				case PK_ID_REQUEST_MAP:
				{	
					PK_REQUEST_MAP* pRequestMapMsg = (PK_REQUEST_MAP*) pReceiveMsg->pReceiveData;
					SendMapToPlayer( pPlayerInfo->dpnidPlayer, pPlayerInfo->szPlayerName , pRequestMapMsg->nMapcode, pRequestMapMsg->nPosX,pRequestMapMsg->nPosY );
					break;
				}

				case PK_ID_PLAYER_WALK:
				{	
					PK_PLAYER_WALK* pWalkMsg = (PK_PLAYER_WALK*) pReceiveMsg->pReceiveData;
					SendWalkMessageToMap( pWalkMsg->dpnidPlayer, pPlayerInfo->szPlayerName , pWalkMsg->nFrameAngle, pWalkMsg->xDes, pWalkMsg->yDes, pWalkMsg->xPos, pWalkMsg->yPos, pPlayerInfo->nMapcode );
					break;
				}

				case PK_ID_PLAYER_CHAT:
				{	
					PK_PLAYER_CHAT* pChatMsg = (PK_PLAYER_CHAT*) pReceiveMsg->pReceiveData;
					SendChatMessage( pChatMsg->dpnidPlayer,pChatMsg->szChatMessage,pChatMsg->szReceiveName,pChatMsg->nMapcode );
					break;
				}

				case PK_ID_REQUEST_NPCTALK:
				{	
					PK_REQUEST_NPCTALK* pMsg = (PK_REQUEST_NPCTALK*) pReceiveMsg->pReceiveData;
					fnNpcTalk( pPlayerInfo, pPlayerInfo->dpnidPlayer,pMsg );
					break;
				}

				case PK_ID_MAIL_STEP2:
				{	
					PK_MAIL_STEP2* pMsg = (PK_MAIL_STEP2*) pReceiveMsg->pReceiveData;
					fnSendMail( pPlayerInfo, pMsg );
					break;
				}

				case PK_ID_REQUEST_PLAYERINFO:
				{	
					PK_REQUEST_PLAYERINFO* pMsg = (PK_REQUEST_PLAYERINFO*) pReceiveMsg->pReceiveData;
					SendPlayerInfoToPlayer( pPlayerInfo->dpnidPlayer, pMsg->szUsername );
					break;
				}
			}


				
			/*GAMEMSG_GENERIC* pMsg = (GAMEMSG_GENERIC*) pReceiveMsg->pReceiveData;
            if( pMsg->dwType == GAME_MSGID_WAVE )
                SendWaveMessageToAll( pPlayerInfo->dpnidPlayer );
			*/
			
            break;
        }
    }

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: StartServer
// Desc: 
//-----------------------------------------------------------------------------
HRESULT StartServer( HWND hDlg )
{
    HRESULT hr;

	GetDlgItemText( hDlg, IDC_DATABASE_IP, g_strDatabaseIP, 255);
	g_pDatabase		= new CVRDatabase( (char*)g_strDatabaseIP,"root","","VRcampus");
	g_pDatabase->Connect();

	hr = fnLoadMapInfo();


    PDIRECTPLAY8ADDRESS pDP8AddrLocal = NULL;

	g_pcvrmtStatus->AddString( "Starting server..." );
    SetDlgItemText( hDlg, IDC_STATUS, (LPCTSTR)g_pcvrmtStatus->Retrieve() );
    SetCursor( LoadCursor(NULL, IDC_WAIT) );

    WCHAR wszSessionName[12];
	mbstowcs(wszSessionName,g_strSessionName,strlen(g_strSessionName)+1);

    // Create IDirectPlay8Server
    if( FAILED( hr = CoCreateInstance( CLSID_DirectPlay8Server, NULL, 
                                       CLSCTX_INPROC_SERVER,
                                       IID_IDirectPlay8Server, 
                                       (LPVOID*) &g_pDPServer ) ) )
        return DXTRACE_ERR( TEXT("CoCreateInstance"), hr );

    // Init IDirectPlay8Server
    if( FAILED( hr = g_pDPServer->Initialize( NULL, ServerMessageHandler, 0 ) ) )
        return DXTRACE_ERR( TEXT("Initialize"), hr );

    hr = CoCreateInstance( CLSID_DirectPlay8Address, NULL, 
                           CLSCTX_ALL, IID_IDirectPlay8Address, 
                           (LPVOID*) &pDP8AddrLocal );
    if( FAILED(hr) )
    {
        DXTRACE_ERR( TEXT("CoCreateInstance"), hr );
        goto LCleanup;
    }

    hr = pDP8AddrLocal->SetSP( &CLSID_DP8SP_TCPIP );
    if( FAILED(hr) )
    {
        DXTRACE_ERR( TEXT("SetSP"), hr );
        goto LCleanup;
    }

    // Add the port to pDP8AddrLocal, if the port is non-zero.
    // If the port is 0, then DirectPlay will pick a port, 
    // Games will typically hard code the port so the 
	if( FAILED( hr = pDP8AddrLocal->AddComponent( DPNA_KEY_PORT, 
                                           &g_dwPort, sizeof(g_dwPort),
                                           DPNA_DATATYPE_DWORD ) ) )
            return DXTRACE_ERR( TEXT("AddComponent"), hr );


    DPN_APPLICATION_DESC dpnAppDesc;
    ZeroMemory( &dpnAppDesc, sizeof(DPN_APPLICATION_DESC) );
    dpnAppDesc.dwSize           = sizeof( DPN_APPLICATION_DESC );
    dpnAppDesc.dwFlags          = DPNSESSION_CLIENT_SERVER;
    dpnAppDesc.guidApplication  = g_guidApp;
    dpnAppDesc.pwszSessionName  = wszSessionName;

    hr = g_pDPServer->Host( &dpnAppDesc, &pDP8AddrLocal, 1, NULL, NULL, NULL, 0  );
    if( FAILED(hr) )
    {
        DXTRACE_ERR( TEXT("Host"), hr );
        goto LCleanup;
    }

    SetCursor( LoadCursor(NULL, IDC_ARROW) );
    g_bServerStarted = TRUE;
	g_pcvrmtStatus->AddString( "Server started" );
	SetDlgItemText( hDlg, IDC_STATUS, g_pcvrmtStatus->Retrieve() );

LCleanup:
    SAFE_RELEASE( pDP8AddrLocal );

    return hr;
}




//-----------------------------------------------------------------------------
// Name: StopServer
// Desc: 
//-----------------------------------------------------------------------------
VOID StopServer( HWND hDlg )
{
	SAFE_DELETE_ARRAY( g_pMap );
	SAFE_DELETE_ARRAY( g_pWrap );

	g_pcvrmtStatus->AddString( "Stopping server..." );
	if (hDlg) SetDlgItemText( hDlg, IDC_STATUS, g_pcvrmtStatus->Retrieve() );
    SetCursor( LoadCursor(NULL, IDC_WAIT) );

    if( g_pDPServer )
    {
        g_pDPServer->Close(0);
        SAFE_RELEASE( g_pDPServer );
    }
    g_bServerStarted = FALSE;

    SetCursor( LoadCursor(NULL, IDC_ARROW) );
	g_pcvrmtStatus->AddString( "Server stoped" );
	if (hDlg) SetDlgItemText( hDlg, IDC_STATUS, g_pcvrmtStatus->Retrieve() );

	g_pDatabase->Close();
	//SAFE_DELETE( g_pDatabase );
}



    
//-----------------------------------------------------------------------------
// Name: DisplayPlayers
// Desc: 
//-----------------------------------------------------------------------------
VOID DisplayPlayers( HWND hDlg )
{
    HRESULT hr;
    DWORD dwNumPlayers = 0;
    DPNID* aPlayers = NULL;

    SendMessage( GetDlgItem(hDlg, IDC_PLAYER_LIST), LB_RESETCONTENT, 0, 0 );

    if( NULL == g_pDPServer )
        return;

    // Enumerate all the connected players
    while( TRUE )
    {
        hr = g_pDPServer->EnumPlayersAndGroups( aPlayers, &dwNumPlayers, DPNENUM_PLAYERS );
        if( SUCCEEDED(hr) )
            break;

        if( FAILED(hr) && hr != DPNERR_BUFFERTOOSMALL )
            return;

        SAFE_DELETE_ARRAY( aPlayers );
        aPlayers = new DPNID[ dwNumPlayers ];
    }

    // For each player, send a "create player" message to the new player
    for( DWORD i = 0; i<dwNumPlayers; i++ )
    {
        APP_PLAYER_INFO* pPlayerInfo = NULL;

        do
        {
            // Get the player context accosicated with this DPNID
            // Call GetPlayerContext() until it returns something other than DPNERR_NOTREADY
            // DPNERR_NOTREADY will be returned if the callback thread has not 
            // yet returned from DPN_MSGID_CREATE_PLAYER, which sets the player's context
            hr = g_pDPServer->GetPlayerContext( aPlayers[i], (LPVOID*) &pPlayerInfo, 0 );
        } 
        while( hr == DPNERR_NOTREADY ); 
                
        // Ignore this player if we can't get the context
        if( pPlayerInfo == NULL || FAILED(hr) )
            continue; 
        
        TCHAR strTemp[MAX_PATH];
        wsprintf( strTemp, TEXT("[DPNID: 0x%0.8x] [User: %s] [Pass: %s]"), pPlayerInfo->dpnidPlayer, pPlayerInfo->szPlayerName, pPlayerInfo->szPlayerPassword  );
        int nIndex = (int)SendMessage( GetDlgItem(hDlg, IDC_PLAYER_LIST), LB_ADDSTRING, 
                                       0, (LPARAM)strTemp );
    }

    SAFE_DELETE_ARRAY( aPlayers );
}



    
//-----------------------------------------------------------------------------
// Name: SendCreatePlayerMsg
// Desc: Send the target player a creation message about the player identified
//       in the APP_PLAYER_INFO struct.
//-----------------------------------------------------------------------------
HRESULT SendCreatePlayerMsg( APP_PLAYER_INFO* pPlayerAbout, DPNID dpnidTarget )
{
    PK_CREATE_PLAYER msgCreatePlayer;
    msgCreatePlayer.wID = PK_ID_CREATE_PLAYER;
    msgCreatePlayer.dpnidPlayer = pPlayerAbout->dpnidPlayer;
	msgCreatePlayer.nMapcode = pPlayerAbout->nMapcode ;
	msgCreatePlayer.xPos = pPlayerAbout->xPos ;
	msgCreatePlayer.yPos = pPlayerAbout->yPos ;
	msgCreatePlayer.nSuit = pPlayerAbout->nSuit ;
    strcpy( msgCreatePlayer.szUsername , pPlayerAbout->szPlayerName );

    DPN_BUFFER_DESC bufferDesc;
    bufferDesc.dwBufferSize = sizeof(PK_CREATE_PLAYER);
    bufferDesc.pBufferData  = (BYTE*) &msgCreatePlayer;

    // DirectPlay will tell via the message handler 
    // if there are any severe errors, so ignore any errors 
    DPNHANDLE hAsync;
    g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
                         0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

    return S_OK;
}



    
//-----------------------------------------------------------------------------
// Name: SendWorldStateToNewPlayer
// Desc: Send the world state to the new player.  For this sample, it is just
//       "create player" message for every connected player
//-----------------------------------------------------------------------------
HRESULT SendWorldStateToNewPlayer( APP_PLAYER_INFO* pPlayerInfo, DPNID dpnidNewPlayer )
{
    HRESULT hr = S_OK;
    DWORD dwNumPlayers = 0;
    DPNID* aPlayers = NULL;

    // Tell this player the dpnid of itself
    PK_SET_ID msgSetID;
    msgSetID.wID		 = PK_ID_SET_ID;
    msgSetID.dpnidPlayer = pPlayerInfo->dpnidPlayer ;
	msgSetID.nMapcode	 = pPlayerInfo->nMapcode ;
	strcpy(msgSetID.szMapname, pPlayerInfo->szMapname ); 
	msgSetID.xPos		 = pPlayerInfo->xPos ;
	msgSetID.yPos		 = pPlayerInfo->yPos ;
	msgSetID.nSuit 		 = pPlayerInfo->nSuit ;

    DPN_BUFFER_DESC bufferDesc;
    bufferDesc.dwBufferSize = sizeof(PK_SET_ID);
    bufferDesc.pBufferData  = (BYTE*) &msgSetID;

    // DirectPlay will tell via the message handler 
    // if there are any severe errors, so ignore any errors 
    DPNHANDLE hAsync;
    g_pDPServer->SendTo( dpnidNewPlayer, &bufferDesc, 1,
                         0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );
/*
    // Enumerate all the connected players
    while( TRUE )
    {
        hr = g_pDPServer->EnumPlayersAndGroups( aPlayers, &dwNumPlayers, DPNENUM_PLAYERS );
        if( SUCCEEDED(hr) )
            break;

        if( FAILED(hr) && hr != DPNERR_BUFFERTOOSMALL )
            return DXTRACE_ERR( TEXT("EnumPlayersAndGroups"), hr );

        SAFE_DELETE_ARRAY( aPlayers );
        aPlayers = new DPNID[ dwNumPlayers ];
    }

    // For each player, send a "create player" message to the new player
    for( DWORD i = 0; i<dwNumPlayers; i++ )
    {
        APP_PLAYER_INFO* pPlayerInfo = NULL;

        // Don't send a create msg to the new player about itself.  This will 
        // be already done when we sent one to DPNID_ALL_PLAYERS_GROUP
        if( aPlayers[i] == dpnidNewPlayer )
            continue;  

        // Get the player context accosicated with this DPNID
        hr = g_pDPServer->GetPlayerContext( aPlayers[i], (LPVOID*) &pPlayerInfo, 0 );

        // Ignore this player if we can't get the context
        if( pPlayerInfo == NULL || FAILED(hr) )
            continue; 

        SendCreatePlayerMsg( pPlayerInfo, dpnidNewPlayer );
    }

    SAFE_DELETE_ARRAY( aPlayers );
*/
    return hr;
}




//-----------------------------------------------------------------------------
// Name: SendDestroyPlayerMsg
// Desc: 
//-----------------------------------------------------------------------------
HRESULT SendDestroyPlayerMsg( APP_PLAYER_INFO* pPlayerInfo,DPNID dpnidTarget  )
{
    PK_DESTROY_PLAYER msgDestroyPlayer;
	msgDestroyPlayer.wID = PK_ID_DESTROY_PLAYER;
    msgDestroyPlayer.dpnidPlayer = pPlayerInfo->dpnidPlayer;

    DPN_BUFFER_DESC bufferDesc;
    bufferDesc.dwBufferSize = sizeof(PK_DESTROY_PLAYER);
    bufferDesc.pBufferData  = (BYTE*) &msgDestroyPlayer;

    // DirectPlay will tell via the message handler 
    // if there are any severe errors, so ignore any errors 
    DPNHANDLE hAsync;
    g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
                         0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

    return S_OK;
}




//-----------------------------------------------------------------------------
// Name: SendWaveMessageToAll
// Desc: 
//-----------------------------------------------------------------------------
HRESULT SendWaveMessageToAll( DPNID dpnidFrom )
{
    GAMEMSG_WAVE msgWave;
    msgWave.dwType = GAME_MSGID_WAVE;
    msgWave.dpnidPlayer = dpnidFrom;

    DPN_BUFFER_DESC bufferDesc;
    bufferDesc.dwBufferSize = sizeof(GAMEMSG_WAVE);
    bufferDesc.pBufferData  = (BYTE*) &msgWave;

    // DirectPlay will tell via the message handler 
    // if there are any severe errors, so ignore any errors 
    DPNHANDLE hAsync;
    g_pDPServer->SendTo( DPNID_ALL_PLAYERS_GROUP, &bufferDesc, 1,
                         0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

    return S_OK;
}



//-----------------------------------------------------------------------------
// Name: SendChatMessage
// Desc: 
//-----------------------------------------------------------------------------
HRESULT	 SendChatMessage( DPNID dpnidFrom, char* szChatMessage, char* szRecieveName, UINT nMapcode )
{
	HRESULT hr = S_OK;
	
	PK_PLAYER_CHAT msgChat;
	msgChat.wID = PK_ID_PLAYER_CHAT;
	msgChat.dpnidPlayer = dpnidFrom;
	msgChat.nMapcode = nMapcode;
	strcpy( msgChat.szReceiveName, szRecieveName );
	strcpy( msgChat.szChatMessage, szChatMessage );

    DPN_BUFFER_DESC bufferDesc;
    bufferDesc.dwBufferSize = sizeof(PK_PLAYER_CHAT);
    bufferDesc.pBufferData  = (BYTE*) &msgChat;
    
    APP_PLAYER_INFO* pCurPlayerInfo = NULL;
    // Get the player context accosicated with this DPNID
    hr = g_pDPServer->GetPlayerContext( dpnidFrom, (LPVOID*) &pCurPlayerInfo, 0 );
	nMapcode = pCurPlayerInfo->nMapcode ;


	if( strcmp(szRecieveName,"ALL") == 0 )
	{
		DPNHANDLE hAsync;
		g_pDPServer->SendTo( DPNID_ALL_PLAYERS_GROUP , &bufferDesc, 1,
							 0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );
	}
	else if( strcmp(szRecieveName,"MAP") == 0 )
	{
		// Enumerate all the connected players
		DWORD dwNumPlayers = 0;
		DPNID* aPlayers = NULL;
		while( TRUE )
		{
			hr = g_pDPServer->EnumPlayersAndGroups( aPlayers, &dwNumPlayers, DPNENUM_PLAYERS );
			if( SUCCEEDED(hr) )
				break;

			if( FAILED(hr) && hr != DPNERR_BUFFERTOOSMALL )
				return DXTRACE_ERR( TEXT("EnumPlayersAndGroups"), hr );

			SAFE_DELETE_ARRAY( aPlayers );
			aPlayers = new DPNID[ dwNumPlayers ];
		}


		for( DWORD i = 0; i<dwNumPlayers; i++ )
		{
			APP_PLAYER_INFO* pPlayerInfo = NULL;

			// Get the player context accosicated with this DPNID
			hr = g_pDPServer->GetPlayerContext( aPlayers[i], (LPVOID*) &pPlayerInfo, 0 );

			// Ignore this player if we can't get the context
			if( pPlayerInfo == NULL || FAILED(hr) || pPlayerInfo->nMapcode != nMapcode)
				continue; 

			// DirectPlay will tell via the message handler 
			// if there are any severe errors, so ignore any errors 
			DPNHANDLE hAsync;
			g_pDPServer->SendTo( pPlayerInfo->dpnidPlayer , &bufferDesc, 1,
								 0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );
		}

		SAFE_DELETE_ARRAY( aPlayers );
	} else
	{
		// Enumerate all the connected players
		DWORD dwNumPlayers = 0;
		DPNID* aPlayers = NULL;
		while( TRUE )
		{
			hr = g_pDPServer->EnumPlayersAndGroups( aPlayers, &dwNumPlayers, DPNENUM_PLAYERS );
			if( SUCCEEDED(hr) )
				break;

			if( FAILED(hr) && hr != DPNERR_BUFFERTOOSMALL )
				return DXTRACE_ERR( TEXT("EnumPlayersAndGroups"), hr );

			SAFE_DELETE_ARRAY( aPlayers );
			aPlayers = new DPNID[ dwNumPlayers ];
		}


		for( DWORD i = 0; i<dwNumPlayers; i++ )
		{
			APP_PLAYER_INFO* pPlayerInfo = NULL;

			// Get the player context accosicated with this DPNID
			hr = g_pDPServer->GetPlayerContext( aPlayers[i], (LPVOID*) &pPlayerInfo, 0 );

			// Ignore this player if we can't get the context
			if( pPlayerInfo == NULL || FAILED(hr) || strcmp( pPlayerInfo->szPlayerName ,szRecieveName ) )
				continue; 

			// DirectPlay will tell via the message handler 
			// if there are any severe errors, so ignore any errors 
			DPNHANDLE hAsync;
			g_pDPServer->SendTo( pPlayerInfo->dpnidPlayer , &bufferDesc, 1,
							 0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

			g_pDPServer->SendTo( dpnidFrom , &bufferDesc, 1,
							 0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );
		}

		SAFE_DELETE_ARRAY( aPlayers );
	}

    TCHAR strTemp[MAX_PATH];
    wsprintf( strTemp, TEXT("[DPNID: 0x%0.8x] [Chat:%s]"), dpnidFrom, szChatMessage );
	g_pcvrmtStatus->AddString( strTemp );
    SetDlgItemText( g_hDlg, IDC_STATUS, g_pcvrmtStatus->Retrieve() );

	return hr;
}



//-----------------------------------------------------------------------------
// Name: SendWalkMessageToMap
// Desc: 
//-----------------------------------------------------------------------------
HRESULT	 SendWalkMessageToMap( DPNID dpnidFrom, char* szUsername, int nFrameAngle, int xDes, int yDes, int xPos, int yPos, UINT nMapcode )
{
	g_pDatabase->UpdatePosition (szUsername, xDes, yDes);
	
	HRESULT hr = S_OK;
    DWORD dwNumPlayers = 0;
    DPNID* aPlayers = NULL;

	PK_PLAYER_WALK msgWalk;
	msgWalk.wID = PK_ID_PLAYER_WALK;
	msgWalk.dpnidPlayer = dpnidFrom;
	msgWalk.nFrameAngle = nFrameAngle;
	msgWalk.xDes = xDes;
	msgWalk.yDes = yDes;
	msgWalk.xPos = xPos;
	msgWalk.yPos = yPos;


    DPN_BUFFER_DESC bufferDesc;
    bufferDesc.dwBufferSize = sizeof(PK_PLAYER_WALK);
    bufferDesc.pBufferData  = (BYTE*) &msgWalk;


    // Enumerate all the connected players
    while( TRUE )
    {
        hr = g_pDPServer->EnumPlayersAndGroups( aPlayers, &dwNumPlayers, DPNENUM_PLAYERS );
        if( SUCCEEDED(hr) )
            break;

        if( FAILED(hr) && hr != DPNERR_BUFFERTOOSMALL )
            return DXTRACE_ERR( TEXT("EnumPlayersAndGroups"), hr );

        SAFE_DELETE_ARRAY( aPlayers );
        aPlayers = new DPNID[ dwNumPlayers ];
    }

    // For each player, send a "walk player" message to mapcode player
    for( DWORD i = 0; i<dwNumPlayers; i++ )
    {
        APP_PLAYER_INFO* pPlayerInfo = NULL;

        // Get the player context accosicated with this DPNID
        hr = g_pDPServer->GetPlayerContext( aPlayers[i], (LPVOID*) &pPlayerInfo, 0 );


        // Ignore this player if we can't get the context
        if( pPlayerInfo == NULL || FAILED(hr) || pPlayerInfo->nMapcode != nMapcode)
            continue; 

		// Update Database
		if ( pPlayerInfo->dpnidPlayer == dpnidFrom )
		{	pPlayerInfo->nFrameAngle = nFrameAngle;
			pPlayerInfo->xPos = xPos;
			pPlayerInfo->yPos = yPos;
		}

		// DirectPlay will tell via the message handler 
		// if there are any severe errors, so ignore any errors 
		DPNHANDLE hAsync;
		g_pDPServer->SendTo( pPlayerInfo->dpnidPlayer , &bufferDesc, 1,
							 0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );
    }

    SAFE_DELETE_ARRAY( aPlayers );

    TCHAR strTemp[MAX_PATH];
    wsprintf( strTemp, TEXT("[DPNID: 0x%0.8x] [Move:%d:%d]"), dpnidFrom, xDes, yDes  );
	g_pcvrmtStatus->AddString( strTemp );
    SetDlgItemText( g_hDlg, IDC_STATUS, g_pcvrmtStatus->Retrieve() );
	return hr;
}
	
	

//-----------------------------------------------------------------------------
// Name: SendLoginToPlayer
// Desc: 
//-----------------------------------------------------------------------------
HRESULT	 SendLoginToPlayer( DPNID dpnidTarget, int nType )
{
	PK_RESPONSE_LOGIN msg;
	msg.wID = PK_ID_RESPONSE_LOGIN;
	msg.nReturn = nType;

	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(PK_RESPONSE_LOGIN);
	bufferDesc.pBufferData  = (BYTE*) &msg;

	// DirectPlay will tell via the message handler 
	// if there are any severe errors, so ignore any errors 
	DPNHANDLE hAsync;
	g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
					  0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

	return S_OK;
}



//-----------------------------------------------------------------------------
// Name: SendMapToPlayer
// Desc: 
//-----------------------------------------------------------------------------
HRESULT	 SendMapToPlayer(DPNID dpnidTarget, char* szUsername, UINT nMapcode, int nPosX, int nPosY )
{
	HRESULT hr = S_OK;
    DWORD dwNumPlayers = 0;
    DPNID* aPlayers = NULL;
	
	UINT nOldMapcode = 0;

	PK_RESPONSE_MAP msg;
	msg.wID = PK_ID_RESPONSE_MAP;
	msg.nPosX = nPosX;
	msg.nPosY = nPosY;

	for ( int j=0; j<g_nMapCount; j++ )
	{
		if (g_pMap[j].nMapCode == nMapcode)
		{	
			strcpy( msg.szMapname , g_pMap[j].szMapName );

			DPN_BUFFER_DESC bufferDesc;
			bufferDesc.dwBufferSize = sizeof(PK_RESPONSE_MAP);
			bufferDesc.pBufferData  = (BYTE*) &msg;

			// DirectPlay will tell via the message handler 
			// if there are any severe errors, so ignore any errors 
			DPNHANDLE hAsync;
			g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
								 0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

			SendWrapToPlayer( dpnidTarget, nMapcode );
			SendNpcToPlayer( dpnidTarget, nMapcode );

			break;
		}
	}


	// Update Database
	g_pDatabase->UpdateMap (szUsername, nMapcode);

    APP_PLAYER_INFO* pCurPlayerInfo = NULL;
    // Get the player context accosicated with this DPNID
    hr = g_pDPServer->GetPlayerContext( dpnidTarget, (LPVOID*) &pCurPlayerInfo, 0 );
	nOldMapcode = pCurPlayerInfo->nMapcode ;
	pCurPlayerInfo->nMapcode = nMapcode ;
	


	// Tell player for map state
    // Enumerate all the connected players
    while( TRUE )
    {
        hr = g_pDPServer->EnumPlayersAndGroups( aPlayers, &dwNumPlayers, DPNENUM_PLAYERS );
        if( SUCCEEDED(hr) )
            break;

        if( FAILED(hr) && hr != DPNERR_BUFFERTOOSMALL )
            return DXTRACE_ERR( TEXT("EnumPlayersAndGroups"), hr );

        SAFE_DELETE_ARRAY( aPlayers );
        aPlayers = new DPNID[ dwNumPlayers ];
    }

    // For each player, send a "create player" message to the new player
	// And Send Destory for other old map mate player
    for( DWORD i = 0; i<dwNumPlayers; i++ )
    {
        APP_PLAYER_INFO* pPlayerInfo = NULL;

        // Don't send a create msg to the new player about itself.  This will 
        // be already done when we sent one to DPNID_ALL_PLAYERS_GROUP
        if( aPlayers[i] == dpnidTarget )
            continue;  

        // Get the player context accosicated with this DPNID
        hr = g_pDPServer->GetPlayerContext( aPlayers[i], (LPVOID*) &pPlayerInfo, 0 );

        // Ignore this player if we can't get the context
        if( pPlayerInfo == NULL || FAILED(hr))
            continue; 

		if ( pPlayerInfo->nMapcode == nOldMapcode )
			SendDestroyPlayerMsg( pPlayerInfo, dpnidTarget  );

		if ( pPlayerInfo->nMapcode == nOldMapcode )
			SendDestroyPlayerMsg( pCurPlayerInfo, pPlayerInfo->dpnidPlayer  );


		if ( pPlayerInfo->nMapcode == nMapcode )
			SendCreatePlayerMsg( pCurPlayerInfo, pPlayerInfo->dpnidPlayer );

		if ( pPlayerInfo->nMapcode == nMapcode )
        SendCreatePlayerMsg( pPlayerInfo, dpnidTarget );
		//SendCreatePlayerMsg( pCurPlayerInfo, pPlayerInfo->dpnidPlayer );
    }

    SAFE_DELETE_ARRAY( aPlayers );


	TCHAR strTemp[MAX_PATH];
    wsprintf( strTemp, TEXT("[DPNID: 0x%0.8x] [Change Map:%d]"), dpnidTarget, nMapcode );
	g_pcvrmtStatus->AddString( strTemp );
    SetDlgItemText( g_hDlg, IDC_STATUS, g_pcvrmtStatus->Retrieve() );

	return S_OK;
}




//-----------------------------------------------------------------------------
// Name: SendWrapToPlayer
// Desc: send wrap to player
//-----------------------------------------------------------------------------
HRESULT	 SendWrapToPlayer(DPNID dpnidTarget, UINT nMapcode )
{
	PK_RESPONSE_WRAP msg;
	msg.wID = PK_ID_RESPONSE_WRAP;


	for ( int i=0; i<g_nWrapCount; i++ )
	{
		if (g_pWrap[i].nSrcMapCode == nMapcode)
		{	
			msg.nSrcMapCode = g_pWrap[i].nSrcMapCode;
			msg.nSrcX = g_pWrap[i].nSrcX;
			msg.nSrcY = g_pWrap[i].nSrcY;
			msg.nDestMapCode = g_pWrap[i].nDestMapCode;
			msg.nDestX = g_pWrap[i].nDestX;
			msg.nDestY = g_pWrap[i].nDestY;

			DPN_BUFFER_DESC bufferDesc;
			bufferDesc.dwBufferSize = sizeof(PK_RESPONSE_WRAP);
			bufferDesc.pBufferData  = (BYTE*) &msg;

			// DirectPlay will tell via the message handler 
			// if there are any severe errors, so ignore any errors 
			DPNHANDLE hAsync;
			g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
							  0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

		}
	}

	return S_OK;
}


//-----------------------------------------------------------------------------
// Name: SendNpcToPlayer
// Desc: send NPC to player
//-----------------------------------------------------------------------------
HRESULT	 SendNpcToPlayer(DPNID dpnidTarget, UINT nMapcode )
{
	PK_RESPONSE_NPC msg;
	msg.wID = PK_ID_RESPONSE_NPC;


	//int nNpcCount = sizeof(g_pNpc);
	int nNpcCount = g_nNpcCount;
	for ( int i=0; i<nNpcCount; i++ )
	{
		if (g_pNpc[i].nMapCode == nMapcode)
		{	
			msg.nNpcID	 = g_pNpc[i].nID ;
			msg.nMapCode = g_pNpc[i].nMapCode ;
			msg.x		 = g_pNpc[i].x;
			msg.y		 = g_pNpc[i].y;
			msg.nBmpID	 = g_pNpc[i].nBmpID ;
			msg.nFuncID  = g_pNpc[i].nFuncID ;
			strcpy(msg.szGreeting00,"");
			strcpy(msg.szGreeting01,"");
			strcpy(msg.szGreeting02,"");

			DPN_BUFFER_DESC bufferDesc;
			bufferDesc.dwBufferSize = sizeof(PK_RESPONSE_NPC);
			bufferDesc.pBufferData  = (BYTE*) &msg;

			// DirectPlay will tell via the message handler 
			// if there are any severe errors, so ignore any errors 
			DPNHANDLE hAsync;
			g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
							  0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );

		}
	}

	return S_OK;
}


//-----------------------------------------------------------------------------
// Name: SendNpcTalkToPlayer
// Desc: send NPC Talk response  to player
//-----------------------------------------------------------------------------
HRESULT SendNpcTalkToPlayer(DPNID dpnidTarget, int nNpcID, int nNextStateID, char* szGreeting, char* szCase )
{

	PK_RESPONSE_NPCTALK msg;
	msg.wID = PK_ID_RESPONSE_NPCTALK;

	msg.nNpcID = nNpcID;
	msg.nNextStateID = nNextStateID;
	strcpy ( msg.szCase , szCase );
	strcpy ( msg.szGreeting , szGreeting );


	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(PK_RESPONSE_NPCTALK);
	bufferDesc.pBufferData  = (BYTE*) &msg;

	// DirectPlay will tell via the message handler 
	// if there are any severe errors, so ignore any errors 
	DPNHANDLE hAsync;
	g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
					  0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );



	return S_OK;
}





//-----------------------------------------------------------------------------
// Name: SendPlayerInfoToPlayer
// Desc: send player information response  to player
//-----------------------------------------------------------------------------
HRESULT SendPlayerInfoToPlayer(DPNID dpnidTarget, char* szUsername )
{
	DB_PLAYER_INFO* dbPlayerInfo;

	dbPlayerInfo = (DB_PLAYER_INFO*)g_pDatabase->GetUserInfo( szUsername ); 

	PK_RESPONSE_PLAYERINFO msg;
	msg.wID = PK_ID_RESPONSE_PLAYERINFO;
	msg.dbPlayerInfo = *dbPlayerInfo;

	DPN_BUFFER_DESC bufferDesc;
	bufferDesc.dwBufferSize = sizeof(PK_RESPONSE_PLAYERINFO);
	bufferDesc.pBufferData  = (BYTE*) &msg;

	// DirectPlay will tell via the message handler 
	// if there are any severe errors, so ignore any errors 
	DPNHANDLE hAsync;
	g_pDPServer->SendTo( dpnidTarget, &bufferDesc, 1,
					  0, NULL, &hAsync, DPNSEND_NOLOOPBACK | DPNSEND_GUARANTEED );



	return S_OK;
}

