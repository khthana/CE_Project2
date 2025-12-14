#include "Core_Global.h"
#include "WinMain.h"

#include "cLoginDialog.h"
#include "cMessageDlg.h"

#include "cPacket.h"

//=============================================
// Global variables
//=============================================
int					g_State;
BOOL				g_LoadMonsterComplete	= FALSE;
cApp				*g_Application;
cLoginDialog		*g_LoginDlg				= NULL;
cMessageDlg			*g_MessageDlg1			= NULL;
cNetworkAdapter		g_Adapter;
DWORD				ElapsedTime;

//===========================================================
// cApp : Consturctor
//===========================================================
cApp::cApp()
{
	m_Width = 700;
	m_Height = 525;
	m_Style = WS_SYSMENU|WS_CLIPCHILDREN|WS_CLIPSIBLINGS;
	strcpy(m_Class, "ClientClass");
	strcpy(m_Caption, "Olala Online");
	
	m_XPos = (GetSystemMetrics(SM_CXSCREEN)-m_Width)/2;
	m_YPos = (GetSystemMetrics(SM_CYSCREEN)-m_Height)/2;
	g_Application = this;
}

//===========================================================
// cApp : Init()
//===========================================================
BOOL cApp::Init()
{
	if (InitializeGame() == FALSE)
		return FALSE;

	return TRUE;
}

//===========================================================
// cApp : Shutdown()
//===========================================================
BOOL cApp::Shutdown()
{
	Keyboard.Free();
	Mouse.Free();
	Input.Shutdown();
	
	/*
	PList.Free();
	MArray.Free();
	Land.Free();
	*/

	m_Client.Disconnect();

	if (g_LoginDlg != NULL)
	{
		g_LoginDlg->Close();
		delete g_LoginDlg;
		g_LoginDlg = NULL;
	}

	if (g_MessageDlg1 != NULL)
	{
		g_MessageDlg1->Close();
		delete g_MessageDlg1;
		g_MessageDlg1 = NULL;
	}

	Graphic.Shutdown();

	return TRUE;
}

//===========================================================
// cApp : InitializeGame()
//===========================================================
BOOL cApp::InitializeGame()
{
	if (Graphic.Init() == FALSE)
		return FALSE;

	Graphic.SetMode(GethWnd(), TRUE, TRUE, 0, 0, 16);
	Graphic.SetPerspective(D3DX_PI/4, 1.3333f, 1.0f, 1000.0f);
	Graphic.EnableZBuffer(TRUE);

	RelCamera.Create(&Graphic);

	Input.Init(GethWnd(), GethInst());
	Keyboard.Create(&Input, KEYBOARD, TRUE);
	Mouse.Create(&Input, MOUSE, TRUE);

	m_Tiles.Create(&Graphic, 2);
	m_Tiles.Load(0, ".\\Picture\\Background.bmp");
	m_Tiles.Load(1, ".\\Picture\\Background1.bmp");

	// Set game state
	g_State = STATE_GAMEINIT;

	// Init DirectPlay
	g_Adapter.Init();
	m_Client.Init();

	// Set animate cursor
	HCURSOR Normal_Cursor = LoadCursorFromFile(".\\Cursor\\Normal_Select.ani");
	SetClassLong(GethWnd(), GCL_HCURSOR, (LONG) Normal_Cursor);

	return TRUE;
}

//===========================================================
// cApp : GameLoad()
//===========================================================
// Load before create monster
BOOL cApp::GameLoad()
{
	Land.Create(&Graphic, 1);
	Land.EnableMouseOver();
	
	NumberTex.Load(&Graphic, "Data\\number.bmp", 0xffff00ff);
	PList.Create(&Graphic, &RelCamera, &Land, &NumberTex);
	PList.AddMainPlayer(player.ID, player.head, player.body, player.x, player.z, 0);

	MArray.Create(&Graphic, &RelCamera, &Land, &NumberTex);

	cPlayer* temp;
	if(PList.GetMainPlayer(&temp)){
		temp->SetName(player.name);
	}

	PacketInitComplete PIC;
	PIC.dwSize	= sizeof(PacketInitComplete);
	PIC.dwType	= MSG_INITCOMPLETE;
	m_Client.Send((void*) &PIC, PIC.dwSize);

	return TRUE;
}

// Load after crate monster / before render world
BOOL cApp::GameLoadEX(){
	
	float Start = 9.0f;    // Linear fog distances
	float End   = 75.0f;
	
	Graphic.GetDeviceCOM()->SetRenderState(D3DRS_FOGENABLE, TRUE);
 	Graphic.GetDeviceCOM()->SetRenderState(D3DRS_FOGCOLOR, 0x00EEFFEE);
	Graphic.GetDeviceCOM()->SetRenderState(D3DRS_FOGTABLEMODE, D3DFOG_LINEAR);
    Graphic.GetDeviceCOM()->SetRenderState(D3DRS_FOGSTART, *(DWORD *)(&Start));
    Graphic.GetDeviceCOM()->SetRenderState(D3DRS_FOGEND,   *(DWORD *)(&End));
	
	m_ChatDialog.ShowDialog(GethInst(), IDD_CHAT, IDD_CHATMESSAGE, GethWnd());

	m_DisplayDialog.ShowDialog(GethInst(), IDD_DISPLAY, GethWnd());
	m_DisplayDialog.SetAllValue(player.HP, player.HPMAX, player.MP, player.MPMAX, player.Level, 
		player.Money, "TestJob", player.name);

	cPlayer *temp;
	if(PList.GetMainPlayer(&temp)){
		StatusBar.Create(&Graphic, &RelCamera, temp);
		StatusBar.SetStatus(player.HP, player.HPMAX, player.MP, player.MPMAX);

		MiniMap.Create(&Graphic, temp);
	}

	m_ReturnDialog.Create(GethInst(), IDD_RETURN, GethWnd());

	return TRUE;
}

//===========================================================
// cApp : ClipMouse()
//===========================================================
BOOL cApp::ClipMouse()
{
	POINT Point;
	Point.x = 0;
	Point.y = 0;
	ClientToScreen(GethWnd(), &Point);

	RECT rect;
	rect.left = Point.x;
	rect.top = Point.y;
	rect.right = Point.x + m_Width;
	rect.bottom = Point.y + m_Height;

	ClipCursor(&rect);
	
	return TRUE;
}

//===========================================================
// cApp : DoState()
//===========================================================
BOOL cApp::DoState()
{
	switch(g_State)
	{
		case STATE_GAMEINIT:
		{
			if (g_LoginDlg != NULL)
			{
				g_LoginDlg->Close();
//				delete g_LoginDlg;
			}

			g_LoginDlg = new cLoginDialog;
			g_LoginDlg->Create(GethInst(), IDD_DLGLOGIN, GethWnd());
			
			g_State = STATE_GAMESTART;
		} break;
		case STATE_GAMESTART:
		{
			if (g_LoginDlg->LoginButtonPress())
			{
				g_State = STATE_GAMECONNECT;
				g_LoginDlg->Close();
			}
		} break;
		case STATE_GAMECONNECT:
		{
			char IP[20];
			char Temp[10];
			int Port;
			char Username[16];
			
			GetDlgItemText(g_LoginDlg->GethWnd(), IDC_IP, IP, 19);
			GetDlgItemText(g_LoginDlg->GethWnd(), IDC_PORT, Temp, 15);
			Port = atoi(Temp);
			GetDlgItemText(g_LoginDlg->GethWnd(), IDC_USER, Username, 15);

			if (g_MessageDlg1 != NULL)
			{
				g_MessageDlg1->Close();
				delete g_MessageDlg1;
				g_MessageDlg1 = NULL;
			}
			
			g_MessageDlg1 = new cMessageDlg;
			g_MessageDlg1->ShowDialog(GethInst(), IDD_MESSAGE, GethWnd());
			g_MessageDlg1->SetMessage(IDC_MESSAGE, "Wait for connect.");

			m_Client.Connect(g_Adapter.GetGUID(0), IP, Port, Username, "Prinya");

			ElapsedTime = timeGetTime();

			g_State = STATE_GAMELOGIN;
		} break;
		case STATE_GAMELOGIN:
		{
			char Username[16];
			char Password[16];

			GetDlgItemText(g_LoginDlg->GethWnd(), IDC_USER, Username, 15);
			GetDlgItemText(g_LoginDlg->GethWnd(), IDC_PASS, Password, 15);

			PacketLogin Packet;
			Packet.dwType = MSG_LOGIN;
			Packet.dwSize = sizeof(PacketLogin);
			strcpy(Packet.name, Username);
			strcpy(Packet.pass, Password);
			
			m_Client.Send((void *)&Packet, Packet.dwSize);//, DPNSEND_NOLOOPBACK);

			g_State = STATE_GAMEWAITLOGIN;
		} break;
		case STATE_GAMEWAITLOGIN:
		{
			DWORD CurrentTime = timeGetTime();
			if (CurrentTime > ElapsedTime+9000)
				g_State = STATE_GAMETIMEOUT;
		} break;
		case STATE_GAMETIMEOUT:
		{
			g_MessageDlg1->SetMessage(IDC_MESSAGE, "Timeout.");

			g_State = STATE_GAMEHALT;
		} break;
		case STATE_GAMEHALT:
		{
			if (GetAsyncKeyState(VK_RETURN)&0x8000?1:0)
			{
				g_State = STATE_GAMEINIT;

				delete g_LoginDlg;
				g_LoginDlg = NULL;

				g_MessageDlg1->Close();
				delete g_MessageDlg1;
				g_MessageDlg1 = NULL;
			}
		} break;
		case STATE_GAMELOADBK:
		{
			delete g_LoginDlg;
			g_LoginDlg = NULL;

			g_MessageDlg1->Close();
			delete g_MessageDlg1;
			g_MessageDlg1 = NULL;
		
			g_State = STATE_GAMELOADMAP;
		} break;
		case STATE_GAMELOADMAP:
		{
			//Init player and Load map
			GameLoad();
			g_State = STATE_GAMELOADCHARACTER;
		} break;
		case STATE_GAMELOADCHARACTER:
		{
			if (g_LoadMonsterComplete == TRUE){
				GameLoadEX();
				g_State = STATE_GAMELOOP;
			}
		} break;
	}

	return TRUE;
}
//===========================================================
// cApp : Frame()
//===========================================================
BOOL cApp::Frame()
{
	Mouse.Read();

	if (GetFocus()==GethWnd())
		ClipMouse();
	else
		ClipCursor(NULL);

	if (g_State <= 10)
		DoState();
	else 
	{
		if (GetFocus()==GethWnd())
		{	
			cPlayer* tempP;
			cMonster* tempM;
			//Read Input Device
			Keyboard.Read();
		
			Land.EnableMouseOver();
			D3DXVECTOR3 position;
			Land.MouseOnMap(Mouse.GetXPos(),Mouse.GetYPos(),&position);
			RECT Rect;
			GetClientRect(GethWnd(), &Rect);
			long X = Mouse.GetXPos();
			long Y = Mouse.GetYPos();
		
			//================\ If Mouse in ClientRect /=====================
			if ((X>=Rect.left)&&(X<=Rect.right)&&(Y>=Rect.top)&&(Y<=Rect.bottom)){

				//====================\ Control Camera /=========================
				// Zoom in-out by mouse wheel
				float zDelta = (float)Mouse.GetZDelta();
				if (zDelta != 0)
					RelCamera.AddLength(zDelta*0.005f);

				if (Mouse.GetButtonState(MOUSE_RBUTTON) == TRUE){
					// Face Up-Down
					if (Keyboard.GetKeyState(KEY_SHIFT) == TRUE){
						int Angle = Mouse.GetYDelta();
						RelCamera.AddZeta((int)Angle / 5);
					}// Zoom In-Out
					else if (Keyboard.GetKeyState(KEY_CTRL) == TRUE){
						int Angle = Mouse.GetYDelta();
						RelCamera.AddLength((float)Angle * 0.025f);
					}// Rotate
					else{
						int Angle = Mouse.GetXDelta();
						RelCamera.AddAlpha(-1*Angle);
					}
				}

				//====================\ Control Charactor /=====================
				if (Mouse.GetButtonState(MOUSE_LBUTTON) == TRUE){
					if (MArray.GetMonsterByMouse(Mouse.GetXPos(), Mouse.GetYPos(), &tempM) == TRUE)
					{	if(Keyboard.GetKeyState(KEY_CTRL) == TRUE)
						{
							PList.GetMainPlayer(&tempP);
							tempP->SetEnermy(tempM,ATTACK_CONTINUE);
							player.targetID = tempM->GetMID();
							player.IsMonster = true;
						}
						else
						{	
							PList.GetMainPlayer(&tempP);
							tempP->SetEnermy(tempM,ATTACK_ONCE);
							player.targetID = tempM->GetMID();
							player.IsMonster = true;
						}
					}
					else
					if (PList.GetPlayerByMouse(Mouse.GetXPos(), Mouse.GetYPos(), &tempP) == TRUE)
					{	if(Keyboard.GetKeyState(KEY_SHIFT) == TRUE)
						{
							cPlayer* temp;
							PList.GetMainPlayer(&temp);
							if (temp->GetPID() != tempP->GetPID()){
								temp->SetEnermy(tempP,ATTACK_CONTINUE);
								player.targetPID = tempP->GetPID();
								player.IsMonster = false;
							}
						}
					}
					else
					if(Land.MouseOnMap(Mouse.GetXPos(),Mouse.GetYPos(),&position)){
						PacketRequestMove PRM;
						PRM.dwSize	= sizeof(PacketRequestMove);
						PRM.dwType	= MSG_REQUESTMOVE;
						PRM.x		= (int)position.x;
						PRM.z		= (int)position.z;
						if( PRM.x != player.x || PRM.z != player.z)
							if (player.State != DIE)
							{	
								player.targetx = PRM.x;
								player.targetz = PRM.z;
								m_Client.Send((void*) &PRM, PRM.dwSize);
							}
						PList.GetMainPlayer(&tempP);
						tempP->ResetEnermy();
					}
					
				}
				
				PList.GetMainPlayer(&tempP);
				if (tempP->IsAttack() != NOT_ATTACK && player.State != ATTACK && player.State != DIE)
				{	
					if (tempP->IsNearEnermy() == TRUE)
					{	
						
						PacketAttack PA;
						PA.dwSize		= sizeof(PacketAttack);
						PA.dwType		= MSG_ATTACK;
						PA.mode			= tempP->IsAttack();				
						if (player.IsMonster == true)
							PA.monid		= player.targetID;
						else
							PA.pid			= player.targetPID;
						PA.IsMonster	= player.IsMonster;
						m_Client.Send((void*) &PA, PA.dwSize);
					}
					else 
					{	
						PacketRequestMove PRM;
						PRM.dwSize	= sizeof(PacketRequestMove);
						PRM.dwType	= MSG_REQUESTMOVE;
						if (player.IsMonster == true)
						{
							MArray.GetMonsterByID(player.targetID, &tempM);
							if (tempP->GetXPos() == tempM->GetXPos())
							{	
								PRM.x = tempM->GetXPos();
								if (tempP->GetZPos() > tempM->GetZPos())
									PRM.z = tempM->GetZPos() - 1;
								else PRM.z = tempM->GetZPos() + 1;
							}
							else
							if (tempP->GetXPos() > tempM->GetXPos())
							{
								PRM.x = tempM->GetXPos() + 1;
								if (tempP->GetZPos() == tempM->GetZPos())
									PRM.z = tempM->GetZPos();
								else
								if (tempP->GetZPos() > tempM->GetZPos())
									PRM.z = tempM->GetZPos() + 1;	
								else
									PRM.z = tempM->GetZPos() - 1;
							}
							else
							{	PRM.x = tempM->GetXPos() - 1;
								if (tempP->GetZPos() == tempM->GetZPos())
									PRM.z = tempM->GetZPos();
								else
								if (tempP->GetZPos() > tempM->GetZPos())
									PRM.z = tempM->GetZPos() + 1;	
								else
									PRM.z = tempM->GetZPos() - 1;

							}
							m_Client.Send((void*) &PRM, PRM.dwSize);
						}
						else 
						{
							cPlayer* tempM;
							PList.GetPlayerByID(player.targetPID, &tempM);
							if (tempP->GetXPos() == tempM->GetXPos())
							{	
								PRM.x = tempM->GetXPos();
								if (tempP->GetZPos() > tempM->GetZPos())
									PRM.z = tempM->GetZPos() - 1;
								else PRM.z = tempM->GetZPos() + 1;
							}
							else
							if (tempP->GetXPos() > tempM->GetXPos())
							{
								PRM.x = tempM->GetXPos() + 1;
								if (tempP->GetZPos() == tempM->GetZPos())
									PRM.z = tempM->GetZPos();
								else
								if (tempP->GetZPos() > tempM->GetZPos())
									PRM.z = tempM->GetZPos() + 1;	
								else
									PRM.z = tempM->GetZPos() - 1;
							}
							else
							{	PRM.x = tempM->GetXPos() - 1;
								if (tempP->GetZPos() == tempM->GetZPos())
									PRM.z = tempM->GetZPos();
								else
								if (tempP->GetZPos() > tempM->GetZPos())
									PRM.z = tempM->GetZPos() + 1;	
								else
									PRM.z = tempM->GetZPos() - 1;

							}
							m_Client.Send((void*) &PRM, PRM.dwSize);
						}
						
						
						
					}
				}

				//====================\ Show Charactor name /=====================
				if (PList.GetPlayerByMouse(Mouse.GetXPos(), Mouse.GetYPos(), &tempP) == TRUE)
				{
					if (strcmp(tempP->GetName(),"") != 0)
					{
						tempP->ShowName();
					}
					else
					{
						PacketRequestName PRN;
						PRN.dwSize = sizeof(PacketRequestName);
						PRN.dwType = MSG_REQUESTNAME;
						PRN.id	   = tempP->GetPID();
						m_Client.Send((void *)&PRN,PRN.dwSize);
					}
				}
				if (MArray.GetMonsterByMouse(Mouse.GetXPos(), Mouse.GetYPos(), &tempM) == TRUE)
				{
					tempM->ShowName();
				}
				

			// Move //
			cPlayer* temp;
			PList.GetMainPlayer(&temp);
			if (player.State != ATTACK && player.State != ATTACK_WAIT)
				temp->MoveTo(player.x, player.z);
			}
		
		}

		//=============================\ Chat DiaLog /=============================
		if (GetActiveWindow()==m_ChatDialog.GethWndChat())
		{
			char Str[128];
			if (GetAsyncKeyState(VK_RETURN)&0x8000)
			{	GetDlgItemText(m_ChatDialog.GethWndChat(), IDC_EDITMESSAGE, Str, 128);
				if (strcmp(Str,"")!=0)
				{	
					PacketChat PC;
					PC.dwType = MSG_CHAT;
					PC.dwSize = sizeof(PacketChat);
					strcpy(PC.chat,Str);
					m_Client.Send((void*) &PC, PC.dwSize);
				}
				SetDlgItemText(m_ChatDialog.GethWndChat(), IDC_EDITMESSAGE, "");
			}
		}

		//==========================\ Return DiaLog /=============================
		if (m_ReturnDialog.GetIsClickReturn() == TRUE){
			m_ReturnDialog.Hide();
			SetFocus(GethWnd());
			PacketReturnToLastSavePoint PReturn;
			PReturn.dwSize = sizeof(PacketReturnToLastSavePoint);
			PReturn.dwType = MSG_RETURNTOLASTSAVEPOINT;
			m_Client.Send((void*) &PReturn, PReturn.dwSize);
		}
			

		//============================\ Set Camera /==============================
		cPlayer* temp;
		if (PList.GetMainPlayer(&temp))
			RelCamera.RelateTo(temp->GetXPos(), temp->GetYPos(), temp->GetZPos());
		RelCamera.Update();
		Graphic.SetCamera(RelCamera.GetCamera());
	}

	//===========================\ Render scene /=============================
	Graphic.Clear(200);
	if (Graphic.BeginScene() == TRUE)
	{
		if ((g_State >= STATE_GAMESTART)&&(g_State <= STATE_GAMEHALT))
		{
			m_Tiles.Draw(0, 0, 0, 0, RGB(0,0,0), 0.689f, 1.039f);
		}
		else
		if ((g_State==STATE_GAMELOADBK)||(g_State==STATE_GAMELOADMAP)||(g_State==STATE_GAMELOADCHARACTER))
		{
			m_Tiles.Draw(1, 0, 0, 0, RGB(0,0,0), 0.689f, 1.039f);
		}
		else
		if (g_State == STATE_GAMELOOP)
		{	
			Land.Render();
			PList.Render();
			MArray.Render();

			MArray.RenderFont();
			PList.RenderFont();

			MArray.RenderNumber();
			PList.RenderNumber();

			StatusBar.RenderBar();
			MiniMap.RenderMap(GethWnd());

			m_DisplayDialog.UpdateData();
		}
		Graphic.EndScene();
	}
	Graphic.Display();

	return TRUE;
}

//===========================================================
// cApp : Recieve()
//===========================================================
BOOL cApp::Receive(DPNMSG_RECEIVE *Msg)
{
	cPacket *MsgPtr;
	MsgPtr = (cPacket*)Msg->pReceiveData;

	switch (MsgPtr->dwType)
	{
		case MSG_USERINVALID:
		{
			g_MessageDlg1->SetMessage(IDC_MESSAGE, "Invalid Username");
			g_State = STATE_GAMEHALT;
		} break;
		case MSG_PASSWORDINVALID:
		{
			g_MessageDlg1->SetMessage(IDC_MESSAGE, "Invalid Password");
			g_State = STATE_GAMEHALT;
		} break;
		case MSG_PLAYER:
		{
			PacketPlayer *MsgPlayer = (PacketPlayer *)MsgPtr;
			//Get Player Status
			strcpy(player.name,MsgPlayer->name);
			player.ID	 = MsgPlayer->ID;
			player.HP	 = MsgPlayer->HP;
			player.MP	 = MsgPlayer->MP;
			player.HPMAX = MsgPlayer->HPMAX;
			player.MPMAX = MsgPlayer->MPMAX;
			player.EXP	 = MsgPlayer->EXP;
			player.Money = MsgPlayer->Money;
			player.Level = MsgPlayer->Level;
			player.STR	 = MsgPlayer->STR;
			player.AGI	 = MsgPlayer->AGI;
			player.VIT	 = MsgPlayer->VIT;
			player.DEX	 = MsgPlayer->DEX;
			player.LUK	 = MsgPlayer->LUK;
			player.x	 = MsgPlayer->X;
			player.y	 = 0;
			player.z	 = MsgPlayer->Z;
			player.head  = MsgPlayer->head;
			player.body  = MsgPlayer->body;
			player.State = STAND;
			
			g_State = STATE_GAMELOADBK;
		} break;

		case MSG_UPDATEPLAYER :
		{
			PacketUpdatePlayer* PUP = (PacketUpdatePlayer*)MsgPtr;
			player.HP	= PUP->HP;
			player.MP	= PUP->MP;
			player.EXP	= PUP->EXP;
			player.Money= PUP->Money;
			player.State= PUP->State;
			player.x	= PUP->x;
			player.z	= PUP->z;
			cPlayer* temp;
			PList.GetMainPlayer(&temp);
			if (temp->IsAlive() == FALSE && player.State != DIE)
			{	temp->Reborn();
				temp->SetPosition(player.x, player.z);
			}
			m_DisplayDialog.SetAllValue(player.HP, player.HPMAX, player.MP, player.MPMAX, 
									 player.Level, player.Money, "TestJob", player.name);
			StatusBar.SetStatus(player.HP, player.HPMAX, player.MP, player.MPMAX);
		}	break;
		
		case MSG_UPDATESPAWNPLAYER :
		{	
			PacketUpdateSpawnPlayer* PSP = (PacketUpdateSpawnPlayer*)MsgPtr;
			bool ans = false;
			
			cPlayer* temp;
			if(PList.GetPlayerByID(PSP->id, &temp))
			{
				if (temp->IsAlive() == FALSE && PSP->State != DIE)
				{	temp->Reborn();
					temp->SetPosition(PSP->x, PSP->z);
				}
				if (PSP->State != ATTACK && PSP->State != ATTACK_WAIT){
					temp->MoveTo(PSP->x,PSP->z);
				}
			}
			else
			{
				PList.AddNode(PSP->id,PSP->head,PSP->body,PSP->x,PSP->z,50);
			}
			
		}	break;
		
		case MSG_REMOVESPAWNPLAYER :
		{
			PacketRemoveSpawnPlayer* PRP = (PacketRemoveSpawnPlayer*)MsgPtr;
			cPlayer* temp;
			PList.GetPlayerByID(PRP->id, &temp);
			PList.ResetEnermyForAll((cCreature*)temp);
			MArray.ResetEnermyForAll((cCreature*)temp);
			PList.DeletePlayerByID(PRP->id);			
		}	break;
		
		case MSG_PLAYERDIED :
		{
			PacketPlayerDied* PPD = (PacketPlayerDied*)MsgPtr;
			cPlayer* tempP;
			if (PList.GetPlayerByID(PPD->id, &tempP))
			{
				tempP->Die();
				if (tempP->GetPID() == player.ID)
					m_ReturnDialog.Show();
			}
			
		}	break;

		case MSG_CREATEMONSTER :
		{	
			PacketCreateMonster* PCM = (PacketCreateMonster*)MsgPtr;
			for (int i=0;i<PCM->number;i++)
			{	
				MArray.AddMonster(PCM->monster[i].id,PCM->monster[i].type,PCM->monster[i].x,PCM->monster[i].z, 0);
			}
			PacketCreateMonsterComplete PCMC;
			PCMC.dwSize = sizeof(PacketCreateMonsterComplete);
			PCMC.dwType = MSG_CREATEMONSTERCOMPLETE;
			m_Client.Send((void *)&PCMC, PCMC.dwSize);

			g_LoadMonsterComplete = TRUE;	// Set this flag to change state to GAME_LOOP
		}	break;

		case MSG_UPDATEMONSTER :
		{		
			PacketUpdateMonster* PUM = (PacketUpdateMonster*)MsgPtr;
			cMonster* temp;
			if (MArray.GetMonsterByID(PUM->id, &temp))
				temp->MoveTo(PUM->x, PUM->z);
		}	break;
		
		case MSG_REMOVEMONSTER :
		{
			PacketRemoveMonster* PRM = (PacketRemoveMonster*)MsgPtr;
			cMonster* tempM;
			if (MArray.GetMonsterByID(PRM->id, &tempM))
				tempM->Die();
			if (player.targetID == PRM->id)
			{
				cPlayer* tempP;
				PList.GetMainPlayer(&tempP);
				tempP->ResetEnermy();
			}
		}	break;
		
		case MSG_REBORNMONSTER :
		{
			PacketRebornMonster* PReborn = (PacketRebornMonster*)MsgPtr;
			cMonster* tempM;
			if (MArray.GetMonsterByID(PReborn->id, &tempM))
			{
				tempM->Reborn();
				tempM->SetPosition(PReborn->x, PReborn->z);
			}
		}	break;

		case MSG_CHATBROADCAST :
		{	
			PacketChatBroadCast* PCBC = (PacketChatBroadCast*)MsgPtr;
			cPlayer* temp;
			char text[128];
			sprintf(text,"%s : %s",PCBC->name,PCBC->chat);
			m_ChatDialog.AddMessage(text);
			if(PList.GetPlayerByID(PCBC->id, &temp))
			{
				temp->SetName(PCBC->name);
				temp->SayMessage(PCBC->chat);
			}
		}	break;

		case MSG_NAME :
		{
			PacketName* PN = (PacketName*)MsgPtr;
			cPlayer* temp;
			if (PList.GetPlayerByID(PN->id, &temp))
			{	
				temp->SetName(PN->name);
			}
		}	break;
		
		case MSG_UPDATEPLAYERATTACK :
		{	
			PacketUpdatePlayerAttack* PUPA = (PacketUpdatePlayerAttack*)MsgPtr;
			cPlayer* tempP;
			cMonster* tempM;
			if (PList.GetPlayerByID(PUPA->idAttacker, &tempP))
			{
				if (MArray.GetMonsterByID(PUPA->idDefender, &tempM))
					tempM->Attacked();
				if (tempP->IsAttack() == NOT_ATTACK)
				{	
					tempP->SetEnermy(tempM, ATTACK_CONTINUE);
				}
				tempP->Attack();
				if (PUPA->damage == 0)
				{	tempP->ShowNumber(0);
				}
				else
				{	
					tempM->ShowNumber(PUPA->damage);
				}
			}
			
		}	break;
		
		case MSG_UPDATEPVP :
		{
			PacketUpdatePVP* PVP = (PacketUpdatePVP*)MsgPtr;
			cPlayer* tempAtt;
			cPlayer* tempDef;
			if (PList.GetPlayerByID(PVP->idAttacker, &tempAtt))
			{
				if (PList.GetPlayerByID(PVP->idDefender, &tempDef))
					tempDef->Attacked();
				if (tempAtt->IsAttack() == NOT_ATTACK)
				{	
					tempAtt->SetEnermy(tempDef, ATTACK_CONTINUE);
				}
				tempAtt->Attack();
				if (PVP->damage == 0)
				{	tempAtt->ShowNumber(0);
				}
				else
				{	
					tempDef->ShowNumber(PVP->damage);
				}
			}
		}	break;

		case MSG_UPDATEMONSTERATTACK :
		{	
			
			PacketUpdateMonsterAttack* PUMA = (PacketUpdateMonsterAttack*)MsgPtr;
			cPlayer* tempP;
			cMonster* tempM;
			if (PList.GetPlayerByID(PUMA->idDefender, &tempP))
			{
				tempP->Attacked();
				if (MArray.GetMonsterByID(PUMA->idAttacker, &tempM))
				{
					if (tempM->IsAttack() == NOT_ATTACK)
						tempM->SetEnermy(tempP, ATTACK_CONTINUE);
					tempM->Attack();
				}
				if (PUMA->damage == 0)
					tempM->ShowNumber(0);
				else
					tempP->ShowNumber(PUMA->damage);
			}
		}	break;
	}
	return FALSE;
}

//===========================================================
// Others
//===========================================================
int PASCAL WinMain(HINSTANCE hInst, HINSTANCE hPrev,
                   LPSTR szCmdLine, int nCmdShow)
{
	cApp App;

	return App.Run();
}

BOOL cClient::ConnectComplete(DPNMSG_CONNECT_COMPLETE *Msg)
{
	g_State = STATE_GAMELOGIN;

	return TRUE;
}

BOOL cClient::Receive(DPNMSG_RECEIVE *Msg)
{
	if(g_Application != NULL)
		g_Application->Receive(Msg);

	return TRUE;
}
