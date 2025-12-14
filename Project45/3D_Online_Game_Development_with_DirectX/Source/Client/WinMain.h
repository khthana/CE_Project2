#ifndef _WINMAIN_H_
#define _WINMAIN_H_

#define STATE_GAMEINIT			0
#define STATE_GAMESTART			1
#define STATE_GAMECONNECT		2
#define STATE_GAMEWAITCONNECT	3
#define STATE_GAMELOGIN			4
#define STATE_GAMEWAITLOGIN		5
#define STATE_GAMETIMEOUT		6
#define STATE_GAMEHALT			7
#define STATE_GAMELOADBK		8
#define STATE_GAMELOADMAP		9
#define STATE_GAMELOADCHARACTER 10
#define STATE_GAMELOOP			11

#include "cLandscape.h"
#include "cRelCamera.h"
#include "cNumber.h"
#include "cPlayer.h"
#include "cMonster.h"
#include "cStatusBar.h"
#include "cMiniMap.h"

#include "cChatDialog.h"
#include "cDisplayDialog.h"
#include "cReturnDialog.h"

class MainPlayer
{	public :
		DPNID ID;
		char name[16];
		int HP;
		int HPMAX;
		int MP;
		int MPMAX;
		int EXP;
		long Money;
		int Level;
		int STR;
		int AGI;
		int VIT;
		int INT;
		int DEX;
		int LUK;
		int head,body;
		STATE State;
		int x,y,z,angle;
		int targetx,targetz;
		int targetID;
		DPNID targetPID;	
		bool IsMonster;
};

class cClient : public cNetworkClient
{
	private:
		BOOL ConnectComplete(DPNMSG_CONNECT_COMPLETE *Msg);
		BOOL Receive(DPNMSG_RECEIVE *Msg);
};

class cApp : public cApplication
{
	private:
		cGraphics			Graphic;
		cRelativeCamera		RelCamera;

		cLandscape			Land;
		cPlayerList			PList;
		cMonsterArray		MArray;
		cTexture			NumberTex;
		cStatusBar			StatusBar;
		cMiniMap			MiniMap;
		
		MainPlayer			player;
				
		cInput				Input;
		cInputDevice		Keyboard;
		cInputDevice		Mouse;

		cChatDialog			m_ChatDialog;	
		cDisplayDialog		m_DisplayDialog;
		cReturnDialog		m_ReturnDialog;

		cClient				m_Client;
		cTiles				m_Tiles;

		char				m_HostIP[16];
		char				m_Name[32];
		char				m_Pwd[16];
		long				m_Port;

	public:
		cApp();
		//~cApp();

		BOOL Init();
		BOOL Shutdown();
		BOOL Frame();
		
		BOOL InitializeGame();
		BOOL GameLoad();
		BOOL GameLoadEX();
		BOOL ClipMouse();
		BOOL DoState();

		BOOL Receive(DPNMSG_RECEIVE *Msg);
};

#endif
