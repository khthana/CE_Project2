#include <afxwin.h>
#include <afxdb.h>
#include <mmsystem.h>
#include <fstream.h>
#include "Core_Global.h"
#include "GameServer.h"
#include "cPacket.h"
#include "resource.h"

BOOL cServer::CreatePlayer(DPNMSG_CREATE_PLAYER *Msg)
{	
	g_Application->CreatePlayer(Msg);
	return TRUE;
}

BOOL cServer::DestroyPlayer(DPNMSG_DESTROY_PLAYER *Msg)
{
	g_Application->DestroyPlayer(Msg);
	return TRUE;
}

BOOL cServer::Receive(DPNMSG_RECEIVE *Msg)
{	
	g_Application->Receive(Msg);
	return TRUE;
}

PlayerConnected::PlayerConnected()
{
	State = NO_STATE;
	HPINC = 0;
}

Monster::Monster()
{
	time = timeGetTime();
	State = NO_STATE;
}

cApp::cApp()
{
	m_Width  = 800;
	m_Height = 600;
	m_Style  = WS_OVERLAPPEDWINDOW | WS_CLIPCHILDREN | WS_CLIPSIBLINGS;
	m_wcex.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
	strcpy(m_Class, "Game Server");
	strcpy(m_Caption, "Game Server");
	g_Application = this;
	g_Adapters    = &m_Adapters;
	timenow = timeGetTime();
	num = 0;
	counter = 0;
}

int cApp::FindID(DPNID id)
{	
	int ans = -1;
	for (int i=0;i<num;i++)
	{
		if (p[i].id == id)
		{
			ans = i;
			break;
		}
	}
	return ans;
}

int cApp::CalculateDamage(Stat Att, Stat Def)
{
	int Damage = Att.STR - Def.VIT;
	int random = rand()%Att.LUK;
	Damage+=random;
	if (Damage <=0)
		Damage = 1;
	random = rand()%100+1;
	int hit = Att.DEX*2 - Def.AGI;
	if (hit <= 0)
		hit = 5;
	hit = hit *3;
	if (hit >= 100);
		hit = 95;
	if (random >= hit)
		Damage = 0;
	return Damage;
}

Stat cApp::FillPlayerStat(int index)
{
	Stat ans;
	ans.Level	= p[index].Level;
	ans.STR		= p[index].STR;
	ans.AGI		= p[index].AGI;
	ans.VIT		= p[index].VIT;
	ans.INT		= p[index].INT;
	ans.DEX		= p[index].DEX;
	ans.LUK		= p[index].LUK;
	return ans;
}

Stat cApp::FillMonsterStat(int index)
{
	Stat ans;
	int type	= mon[index].type - 1;
	ans.Level	= MInfo[type].Level;
	ans.STR		= MInfo[type].STR;
	ans.AGI		= MInfo[type].AGI;
	ans.VIT		= MInfo[type].VIT;
	ans.INT		= MInfo[type].INT;
	ans.DEX		= MInfo[type].DEX;
	ans.LUK		= MInfo[type].LUK;
	return ans;
}

void cApp::UpdatePlayer()
{	
	for (int i=0;i<num;i++)
	{	if (p[i].State != NO_STATE)
		{	
			if (p[i].State != DIE)
			{
				p[i].HPINC++;
				if (p[i].HPINC >= 4)
				{	
					p[i].HPINC = 0;
					if (p[i].HP < p[i].HPMax)
						p[i].HP++;
				}
			}
			PacketUpdatePlayer PUP;
			PUP.dwSize	= sizeof(PacketUpdatePlayer);
			PUP.dwType	= MSG_UPDATEPLAYER;
			PUP.State	= p[i].State;
			PUP.HP		= p[i].HP;
			PUP.MP		= p[i].MP;
			PUP.EXP		= p[i].EXP;
			PUP.Money	= p[i].Money;	
			if (p[i].State == STAND)
			{	
				PUP.x	= p[i].x;
				PUP.z	= p[i].z;
			}
			else
			if (p[i].State == WALK)
			{
				PUP.x	= p[i].targetx;
				PUP.z	= p[i].targetz;
				p[i].x	= p[i].targetx;
				p[i].z  = p[i].targetz;
				p[i].State = STAND;
			}
			else
			{
				PUP.x	= p[i].x;
				PUP.z	= p[i].z;
			}
			m_Server.Send(p[i].id,(void *)&PUP,PUP.dwSize,DPNSEND_GUARANTEED);
				
		}
	}
}

void cApp::UpdateSpawnPlayer()
{
	for (int i=0;i<num;i++)
	{	
		if (p[i].State!= NO_STATE)
			for (int j=0;j<num;j++)
			{	
				if(p[j].State!= NO_STATE && p[i].id!=p[j].id)
				{
					PacketUpdateSpawnPlayer PUSP;
					PUSP.dwSize  = sizeof(PacketUpdateSpawnPlayer);
					PUSP.dwType  = MSG_UPDATESPAWNPLAYER;
					PUSP.id		= p[j].id;
					PUSP.State	= p[j].State;
					PUSP.x		= p[j].x;
					PUSP.z		= p[j].z;
					PUSP.head	= p[j].head;
					PUSP.body	= p[j].body;
					m_Server.Send(p[i].id,(void *)&PUSP,PUSP.dwSize,DPNSEND_GUARANTEED);
				}
			}
		
	}
}

void cApp::UpdateMonster(int index)
{
	PacketUpdateMonster PUM;
	PUM.dwSize = sizeof(PacketUpdateMonster);
	PUM.dwType = MSG_UPDATEMONSTER;
	PUM.id	   = mon[index].id;
	PUM.State  = mon[index].State;	
	if (mon[index].State != ATTACK)
	{	
		int newx = rand()%10 -5;
		int newz = rand()%10 -5;
		newx = mon[index].x+newx;
		newz = mon[index].z+newz;
		while (CanMove(newx, newz) == FALSE)
		{
			newx = rand()%10 -5;
			newz = rand()%10 -5;
			newx = mon[index].x+newx;
			newz = mon[index].z+newz;
		}
		mon[index].x = newx;
		mon[index].z = newz;
		PUM.x	   = mon[index].x;
		PUM.z	   = mon[index].z;
	}
	else
	{
		int id = FindID(mon[index].targetID);
		/*
		if (mon[index].x == p[id].x)
		{	
			PUM.x = mon[index].x = p[id].x;
			if (mon[index].z > p[id].z)
				PUM.z = mon[index].z = p[id].z - 1;
			else PUM.z = mon[index].z = p[id].z + 1;
		}
		else
		if (mon[index].x > p[id].x)
		{
			PUM.x = mon[index].x = p[id].x + 1;
			if (mon[index].z == p[id].z)
				PUM.z = mon[index].z = p[id].z;
			else
			if (mon[index].z > p[id].z)
				PUM.z = mon[index].z = p[id].z + 1;	
			else
				PUM.z = mon[index].z = p[id].z - 1;
		}
		else
		{	PUM.x = mon[index].x = p[id].x - 1;
			if (mon[index].z == p[id].z)
				PUM.z = mon[index].z = p[id].z;
			else
			if (mon[index].z > p[id].z)
				PUM.z = mon[index].z = p[id].z + 1;	
			else
				PUM.z = mon[index].z = p[id].z - 1;
		}
		*/
		int newx = rand()%3-1;
		int newz = rand()%3-1;
		while (newx ==0 && newz ==0)
		{
			newx = rand()%3-1;
			newz = rand()%3-1;
		}
		PUM.x = mon[index].x = p[id].x + newx;
		PUM.z = mon[index].z = p[id].z + newz;	
	}

	for (int i=0;i<num;i++)
		if (p[i].State != NO_STATE)
			m_Server.Send(p[i].id,(void *)&PUM,PUM.dwSize,DPNSEND_GUARANTEED);
}

void cApp::UpdatePlayerAttack(int index)
{	
	int target = p[index].targetID;
	PacketUpdatePlayerAttack PUPA;
	PUPA.dwSize	= sizeof(PacketUpdatePlayerAttack);
	PUPA.dwType = MSG_UPDATEPLAYERATTACK;
	PUPA.idAttacker = p[index].id;
	PUPA.idDefender = p[index].targetID;
	PUPA.damage		= CalculateDamage(FillPlayerStat(index),FillMonsterStat(p[index].targetID));
	for(int i=0;i<num;i++)
		if (p[i].State != NO_STATE)
			m_Server.Send(p[i].id, (void *)&PUPA, PUPA.dwSize, DPNSEND_GUARANTEED);

	/*if (p[index].mode == ATTACK_ONCE)
		p[index].State = STAND;*/
	
	mon[target].HP = mon[target].HP - PUPA.damage;
	if (mon[target].HP <=0)
	{
		mon[target].HP	  = 0;
		mon[target].State = DIE;
		mon[target].time  = timeGetTime();
		p[index].EXP += MInfo[mon[target].type -1].exp;
		p[index].Money += MInfo[mon[target].type -1].money;
		p[index].State	  = STAND;
		PacketRemoveMonster PRM;
		PRM.dwSize	= sizeof(PacketRemoveMonster);
		PRM.dwType	= MSG_REMOVEMONSTER;
		PRM.id		= mon[target].id;
		for(int i=0;i<num;i++)
			if (p[i].State != NO_STATE)
				m_Server.Send(p[i].id, (void *)&PRM, PRM.dwSize, DPNSEND_GUARANTEED);
	}
}

void cApp::UpdatePVP(int index)
{
	PacketUpdatePVP PVP;
	PVP.dwSize = sizeof(PacketUpdatePVP);
	PVP.dwType = MSG_UPDATEPVP;
	PVP.idAttacker = p[index].id;
	PVP.idDefender = p[p[index].targetID].id;
	PVP.damage	   = CalculateDamage(FillPlayerStat(index),FillPlayerStat(p[index].targetID));
	for(int i=0;i<num;i++)
		if (p[i].State != NO_STATE)
			m_Server.Send(p[i].id, (void *)&PVP, PVP.dwSize, DPNSEND_GUARANTEED);

	/*if (p[index].mode == ATTACK_ONCE)
		p[index].State = STAND;*/

	int id = p[index].targetID;
	if (id != -1)
	{
		p[id].HP = p[id].HP - PVP.damage;
		if (p[id].HP <=0)
		{
			p[id].HP	= 0;
			p[id].State = DIE;
			PacketPlayerDied PPD;
			PPD.dwSize = sizeof(PacketPlayerDied);
			PPD.dwType = MSG_PLAYERDIED;
			PPD.id	   = p[id].id;
			for(int i=0;i<num;i++)
				if (p[i].State != NO_STATE)
					m_Server.Send(p[i].id, (void *)&PPD, PPD.dwSize, DPNSEND_GUARANTEED);
		}
	}
}

void cApp::UpdateMonsterAttack(int index)
{
	PacketUpdateMonsterAttack PUMA;
	PUMA.dwSize = sizeof(PacketUpdateMonsterAttack);
	PUMA.dwType = MSG_UPDATEMONSTERATTACK;
	PUMA.idAttacker =  mon[index].id;
	PUMA.idDefender =  mon[index].targetID;
	int id = FindID(mon[index].targetID);
	if (id != -1)
	{
		PUMA.damage		=  CalculateDamage(FillMonsterStat(index),FillPlayerStat(id));
		for(int i=0;i<num;i++)
		if (p[i].State != NO_STATE)
			m_Server.Send(p[i].id, (void *)&PUMA, PUMA.dwSize, DPNSEND_GUARANTEED);

		if (p[id].State != ATTACK)
			p[id].State	= ATTACK_WAIT;
		p[id].HP = p[id].HP - PUMA.damage;
		if (p[id].HP <=0)
		{
			p[id].HP	= 0;
			p[id].State = DIE;
			PacketPlayerDied PPD;
			PPD.dwSize = sizeof(PacketPlayerDied);
			PPD.dwType = MSG_PLAYERDIED;
			PPD.id	   = p[id].id;
			for(int i=0;i<num;i++)
				if (p[i].State != NO_STATE)
					m_Server.Send(p[i].id, (void *)&PPD, PPD.dwSize, DPNSEND_GUARANTEED);
		}
	}
}

void cApp::RebornMonster(int index)
{
	int newx = rand()%120 - 59;
	int newz = rand()%120 - 59;
	while (CanMove(newx, newz) == FALSE)
	{
		newx = rand()%120 - 59;
		newz = rand()%120 - 59;	
	}
	mon[index].x     = newx;
	mon[index].z	 = newz;
	mon[index].State = STAND;
	mon[index].HP    = MInfo[mon[index].type - 1].HP;
	PacketRebornMonster PReborn;
	PReborn.dwSize	= sizeof(PacketRebornMonster);
	PReborn.dwType  = MSG_REBORNMONSTER;
	PReborn.id		= mon[index].id;
	PReborn.x		= mon[index].x;
	PReborn.z		= mon[index].z;
	PReborn.State   = mon[index].State;
	for(int i=0;i<num;i++)
		if (p[i].State != NO_STATE)
			m_Server.Send(p[i].id, (void *)&PReborn, PReborn.dwSize, DPNSEND_GUARANTEED);
}

BOOL cApp::IsNearTarget(int indexP,int indexM)
{
	if ((p[indexP].x  == mon[indexM].x) && (p[indexP].z  == mon[indexM].z))
		
		return TRUE;

	// Left & Right
	if (p[indexP].z  == mon[indexM].z)
		if ((p[indexP].x == mon[indexM].x + 1)||(p[indexP].x == mon[indexM].x - 1))
			return TRUE;

	// Up & Down
	if (p[indexP].x  == mon[indexM].x)
		if ((p[indexP].z == mon[indexM].z + 1)||(p[indexP].z == mon[indexM].z - 1))
			return TRUE;

	// Upper-Left, Upper-Right, Down-Left, Down-Right
	if ((p[indexP].x == mon[indexM].x + 1)&&(p[indexP].z == mon[indexM].z + 1))
		return TRUE;	
	if ((p[indexP].x == mon[indexM].x + 1)&&(p[indexP].z == mon[indexM].z - 1))
		return TRUE;	
	if ((p[indexP].x == mon[indexM].x - 1)&&(p[indexP].z == mon[indexM].z + 1))
		return TRUE;	
	if ((p[indexP].x == mon[indexM].x - 1)&&(p[indexP].z == mon[indexM].z - 1))
		return TRUE;
	
	return FALSE;
}

BOOL cApp::IsNearTargetPlayer(int Att,int Def)
{
	if ((p[Att].x  == p[Def].x) && (p[Att].z  == p[Def].z))
		
		return TRUE;

	// Left & Right
	if (p[Att].z  == p[Def].z)
		if ((p[Att].x == p[Def].x + 1)||(p[Att].x == p[Def].x - 1))
			return TRUE;

	// Up & Down
	if (p[Att].x  == p[Def].x)
		if ((p[Att].z == p[Def].z + 1)||(p[Att].z == p[Def].z - 1))
			return TRUE;

	// Upper-Left, Upper-Right, Down-Left, Down-Right
	if ((p[Att].x == p[Def].x + 1)&&(p[Att].z == p[Def].z + 1))
		return TRUE;	
	if ((p[Att].x == p[Def].x + 1)&&(p[Att].z == p[Def].z - 1))
		return TRUE;	
	if ((p[Att].x == p[Def].x - 1)&&(p[Att].z == p[Def].z + 1))
		return TRUE;	
	if ((p[Att].x == p[Def].x - 1)&&(p[Att].z == p[Def].z - 1))
		return TRUE;
	
	return FALSE;
}

BOOL cApp::CanMove(float XPos, float ZPos){
	int xMap, zMap;		// For Map Array
	xMap = (int)(XPos + 60.0f);
	zMap = (int)(ZPos + 60.0f);

	// Out Bound
	if(xMap < 0 || zMap < 0 || xMap >= 120 || zMap >= 120)
		return FALSE;

		// Compare with mapArray whether position can move to or not
	if (m_MapArray[xMap][zMap] != 0)
		return FALSE;

	return TRUE;
}

BOOL cApp::Init()
{	
	HBITMAP Bitmap;
	HDC hDC, BackDC;
	hDC		= GetDC(GethWnd());
	BackDC	= CreateCompatibleDC(hDC);
	Bitmap	= (HBITMAP)LoadBitmap(GethInst(), MAKEINTRESOURCE(IDB_BITMAP1));
	SelectObject(BackDC,Bitmap);
	StretchBlt(hDC, 0, 0, 800, 600, BackDC, 0, 0, 640, 480, SRCCOPY);
	ReleaseDC(GethWnd(), hDC);
	hDlg = CreateDialog(GethInst(),(LPCTSTR)IDD_DIALOG1,GethWnd(),(DLGPROC)MyDialog1);
	ShowWindow(hDlg, SW_SHOW);	
	DatabaseInit();
	MonsterInit();
	MapInit(1);
	m_Adapters.Init();
	m_guidAdapter = m_Adapters.GetGUID(0);
	m_Server.Init();
	if (m_Server.Host(m_guidAdapter,6000,"Prinya",NULL,1000) == E_FAIL)
		MessageBox(NULL,"Fail to host","ERROR",MB_OK);
	else 	
		MessageBox(NULL,"TCP INITED","Host",MB_OK);
	return TRUE;
}

BOOL cApp::Shutdown()
{
	Database.Close();
	m_Server.Disconnect();
	m_Server.Shutdown();
	m_Adapters.Shutdown();
	return TRUE;
}

BOOL cApp::MapInit(int MID)
{
	sprintf(text, "Data\\Map%d.txt", MID);
	fstream mapFile(text, ios::in | ios::binary );
	if( !mapFile )
		 return false;
	const unsigned int BUFF_SIZE = 122;
	unsigned char buff[ BUFF_SIZE ];
	int line = 119;
	while( !mapFile.eof() && line >=0){
		mapFile.read( ( char* )buff, BUFF_SIZE );
		unsigned int buffsize = mapFile.gcount();
		for(int i=0 ; i<120 ; i++){
		  if (buff[i] == '0')
			  m_MapArray[i][line] = 0;
		  else if (buff[i] == '1')
			  m_MapArray[i][line] = 1;
		}
	line--;
	}
	return true;
}

BOOL cApp::DatabaseInit()
{
	Database.SetLoginTimeout(10);
	CString St("ODBC;DRIVER={MICROSOFT ACCESS DRIVER (*.mdb)};DSN='';DBQ=GameDatabase.mdb");
	if (!Database.Open(NULL, FALSE, FALSE, St))
		return FALSE;
	return TRUE;
}

BOOL cApp::MonsterInit()
{
	Recordset1 = new CRecordset(&Database);
	CDBVariant DBVariant;
	CString sztemp;
	char Query[255];
	sprintf(Query,"Select * from Monster");
	if (!Recordset1->Open(CRecordset::forwardOnly, Query))
		return FALSE;
	int i = 0;
	while (!Recordset1->IsEOF())
	{
		Recordset1->GetFieldValue((short)0, DBVariant);
		MInfo[i].type = DBVariant.m_lVal;
		Recordset1->GetFieldValue(1, sztemp);
		strcpy(MInfo[i].name, sztemp);
		Recordset1->GetFieldValue(2, DBVariant);
		MInfo[i].HP = DBVariant.m_lVal;
		Recordset1->GetFieldValue(3, DBVariant);
		MInfo[i].Level = DBVariant.m_lVal;
		Recordset1->GetFieldValue(4, DBVariant);
		MInfo[i].STR = DBVariant.m_lVal;
		Recordset1->GetFieldValue(5, DBVariant);
		MInfo[i].AGI = DBVariant.m_lVal;
		Recordset1->GetFieldValue(6, DBVariant);
		MInfo[i].VIT = DBVariant.m_lVal;
		Recordset1->GetFieldValue(7, DBVariant);
		MInfo[i].INT = DBVariant.m_lVal;
		Recordset1->GetFieldValue(8, DBVariant);
		MInfo[i].DEX = DBVariant.m_lVal;
		Recordset1->GetFieldValue(9, DBVariant);
		MInfo[i].LUK = DBVariant.m_lVal;
		Recordset1->GetFieldValue(10, DBVariant);
		MInfo[i].exp = DBVariant.m_lVal;
		Recordset1->GetFieldValue(11, DBVariant);
		MInfo[i].money = DBVariant.m_lVal;
		i++;
		Recordset1->MoveNext();
	}
	Recordset1->Close();
	nummonster		= 30;
	for (i=0; i<10 ; i++)
	{	
		mon[i].id		= i;
		mon[i].State	= STAND;
		mon[i].type		= MInfo[0].type;
		mon[i].x		= i+5;
		mon[i].z		= 10;
		mon[i].HP		= MInfo[0].HP;
		mon[i].time	    = timeGetTime()-rand()%1000;
	}
	for (; i<20 ; i++)
	{	
		mon[i].id		= i;
		mon[i].State	= STAND;
		mon[i].type		= MInfo[1].type;
		mon[i].x		= i+5;
		mon[i].z		= 10;
		mon[i].HP		= MInfo[1].HP;
		mon[i].time	    = timeGetTime()-rand()%1000;
	}
	for (; i<30 ; i++)
	{	
		mon[i].id		= i;
		mon[i].State	= STAND;
		mon[i].type		= MInfo[2].type;
		mon[i].x		= i+5;
		mon[i].z		= 10;
		mon[i].HP		= MInfo[2].HP;
		mon[i].time	    = timeGetTime()-rand()%1000;
	}
	return TRUE;
}

BOOL cApp::CreatePlayer(DPNMSG_CREATE_PLAYER *Msg)
{
	return TRUE;
}

BOOL cApp::DestroyPlayer(DPNMSG_DESTROY_PLAYER *Msg)
{
	int id = FindID(Msg->dpnidPlayer);
	if (id!=-1)
	{	
		CString strSQL;
		strSQL.Format("UPDATE Character SET HP = %d,MP = %d,EXP = %d,X = %d,Z = %d WHERE Username = '%s'", p[id].HP, p[id].MP, p[id].EXP, p[id].x, p[id].z,p[id].name);
		TRY{ Database.ExecuteSQL( strSQL ); }
		CATCH(CDBException, e) {return FALSE;}
		END_CATCH
		p[id].State = NO_STATE;
		for (int i= 0; i<num;i++)
			if (p[i].State != NO_STATE && p[i].IsMonster == false)
				if ( p[i].targetID == id)
					p[i].State = ATTACK_WAIT;
		for (i = 0;i<nummonster; i++)
			if (mon[i].State != NO_STATE && mon[i].targetID == p[id].id )
				mon[i].State = STAND;
		sprintf(text," %s Logout ",p[id].name);
		SendDlgItemMessage(hDlg,IDC_LIST1,LB_INSERTSTRING,-1,(LPARAM)text);
		PacketRemoveSpawnPlayer PRSP;
		PRSP.dwType = MSG_REMOVESPAWNPLAYER;
		PRSP.dwSize = sizeof(PacketRemoveSpawnPlayer);
		PRSP.id		= Msg->dpnidPlayer;
		for (i=0;i<num;i++)
			if (p[i].State != NO_STATE)
				m_Server.Send(p[i].id,(void *)&PRSP,PRSP.dwSize,DPNSEND_GUARANTEED);
	
	}
	return TRUE;
}

BOOL cApp::Receive(DPNMSG_RECEIVE *Msg)
{
	cPacket* P = (cPacket *)Msg->pReceiveData;
	if (P->dwType == MSG_LOGIN)
	{	
		Recordset1 = new CRecordset(&Database);
		Recordset2 = new CRecordset(&Database);
		PacketLogin* PL = (PacketLogin *)P;
		char Query[255];
		sprintf(Query,"Select Password from Account where Username='%s'",PL->name);
		if (!Recordset1->Open(CRecordset::forwardOnly, Query))
			return FALSE;
		CString pass;
		if (Recordset1->GetRecordCount()!=0)
		{	Recordset1->GetFieldValue("Password", pass);
			if (pass.Compare(PL->pass)== 0)
			{
				PacketPlayer PP;
				CDBVariant DBVariant;
				PP.dwSize = sizeof(PacketPlayer);
				PP.dwType = MSG_PLAYER;
				PP.ID	  = Msg->dpnidSender;
				sprintf(Query,"Select * from Character where Username='%s'",PL->name);
				Recordset2->Open(CRecordset::forwardOnly, Query);
				Recordset2->GetFieldValue((short)0, pass);
				strcpy(PP.name,pass);
				Recordset2->GetFieldValue(1, DBVariant);
				PP.HP = DBVariant.m_lVal;
				Recordset2->GetFieldValue(2, DBVariant);
				PP.HPMAX = DBVariant.m_lVal;
				Recordset2->GetFieldValue(3, DBVariant);
				PP.MP = DBVariant.m_lVal;
				Recordset2->GetFieldValue(4, DBVariant);
				PP.MPMAX = DBVariant.m_lVal;
				Recordset2->GetFieldValue(5, DBVariant);
				PP.EXP = DBVariant.m_lVal;
				Recordset2->GetFieldValue(6, DBVariant);
				PP.Money = DBVariant.m_lVal;
				Recordset2->GetFieldValue(7, DBVariant);
				PP.Level = DBVariant.m_lVal;
				Recordset2->GetFieldValue(8, DBVariant);
				PP.STR = DBVariant.m_lVal;
				Recordset2->GetFieldValue(9, DBVariant);
				PP.AGI = DBVariant.m_lVal;
				Recordset2->GetFieldValue(10, DBVariant);
				PP.VIT = DBVariant.m_lVal;
				Recordset2->GetFieldValue(11, DBVariant);
				PP.INT = DBVariant.m_lVal;
				Recordset2->GetFieldValue(12, DBVariant);
				PP.DEX = DBVariant.m_lVal;
				Recordset2->GetFieldValue(13, DBVariant);
				PP.LUK = DBVariant.m_lVal;
				Recordset2->GetFieldValue(14, DBVariant);
				PP.X = DBVariant.m_lVal;
				Recordset2->GetFieldValue(15, DBVariant);
				PP.Z = DBVariant.m_lVal;
				Recordset2->GetFieldValue(16, pass);
				strcpy(PP.mapname,pass);
				Recordset2->GetFieldValue(17, DBVariant);
				PP.head = DBVariant.m_lVal;
				Recordset2->GetFieldValue(18, DBVariant);
				PP.body = DBVariant.m_lVal;

				m_Server.Send(Msg->dpnidSender,(void *)&PP,PP.dwSize,DPNSEND_GUARANTEED);
				Recordset2->Close();
				p[num].id		= Msg->dpnidSender;
				strcpy(p[num].name,PL->name);
				p[num].HP		= PP.HP;
				p[num].MP		= PP.MP;
				p[num].HPMax    = PP.HPMAX;
				p[num].MPMax	= PP.MPMAX;
				p[num].Money	= PP.Money; 
				p[num].EXP		= PP.EXP;
				p[num].x		= PP.X;
				p[num].z		= PP.Z;
				p[num].targetx	= PP.X;
				p[num].targetz	= PP.Z;
				p[num].head		= PP.head;
				p[num].body		= PP.body;
				p[num].Level	= PP.Level;
				p[num].STR		= PP.STR;
				p[num].AGI		= PP.AGI;
				p[num].VIT		= PP.VIT;
				p[num].INT		= PP.INT;
				p[num].DEX		= PP.DEX;
				p[num].LUK		= PP.LUK;
				p[num].State	= NO_STATE;
				num++;
				sprintf(text,"%s Login ",PL->name);
				SendDlgItemMessage(hDlg,IDC_LIST1,LB_INSERTSTRING,-1,(LPARAM)text);
			}
			else 
			{	//Password Wrong
				PacketPasswordInvalid PPI;
				PPI.dwSize = sizeof(PacketPasswordInvalid);
				PPI.dwType = MSG_PASSWORDINVALID;
				m_Server.Send(Msg->dpnidSender,(void *)&PPI,PPI.dwSize,DPNSEND_GUARANTEED);
			}	
		}
		
		else
		{	//User invalid
			PacketUserInvalid PUI;
			PUI.dwSize = sizeof(PacketUserInvalid);
			PUI.dwType = MSG_USERINVALID;
			m_Server.Send(Msg->dpnidSender,(void *)&PUI,PUI.dwSize,DPNSEND_GUARANTEED);
		}
		Recordset1->Close();
	}
	else
	if (P->dwType == MSG_INITCOMPLETE)
	{
		PacketCreateMonster PCM;
		PCM.dwSize = sizeof(PacketCreateMonster);
		PCM.dwType = MSG_CREATEMONSTER;
		PCM.number = nummonster;
		for (int i=0;i<nummonster; i++)
		{	
			PCM.monster[i].id	 = mon[i].id;
			PCM.monster[i].State = mon[i].State;
			PCM.monster[i].type	 = mon[i].type;
			PCM.monster[i].x	 = mon[i].x;
			PCM.monster[i].z	 = mon[i].z;
		}
		m_Server.Send(Msg->dpnidSender,(void *)&PCM,PCM.dwSize,DPNSEND_GUARANTEED);
		
	}
	else
	if (P->dwType == MSG_CREATEMONSTERCOMPLETE)
	{
		int id = FindID(Msg->dpnidSender);
		if (id !=-1)
			p[id].State = STAND;
	}
	else 
	if (P->dwType == MSG_REQUESTMOVE)
	{	
		int id = FindID(Msg->dpnidSender);
		if (id != -1)
		{	
			if (p[id].State != DIE)
			{
				PacketRequestMove* PRM = (PacketRequestMove *)P;
				sprintf(text," %s move from %d , %d to %d , %d",p[id].name,p[id].x,p[id].z,PRM->x,PRM->z);
				p[id].State	= WALK;
				p[id].targetx= PRM->x;
				p[id].targetz= PRM->z;
				SendDlgItemMessage(hDlg,IDC_LIST1,LB_INSERTSTRING,-1,(LPARAM)text);
			}
		}
		
	}
	else
	if (P->dwType == MSG_CHAT)
	{	
		int id = FindID(Msg->dpnidSender);
		if (id != -1)
		{
			PacketChat* PC = (PacketChat *)P;
			PacketChatBroadCast PCBC;
			PCBC.dwSize = sizeof(PacketChatBroadCast);
			PCBC.dwType = MSG_CHATBROADCAST;
			PCBC.id		= Msg->dpnidSender;
			strcpy(PCBC.name,p[id].name);
			strcpy(PCBC.chat,PC->chat);
			for (int i=0;i<num;i++)
				m_Server.Send(p[i].id,(void *)&PCBC,PCBC.dwSize,DPNSEND_GUARANTEED);
		}
		
	}
	else
	if (P->dwType == MSG_REQUESTNAME)
	{
		PacketRequestName* PRN = (PacketRequestName *)P;
		int id = FindID(PRN->id);
		if (id != -1)
		{
			PacketName PN;
			PN.dwSize = sizeof(PacketName);
			PN.dwType = MSG_NAME;
			PN.id	  = PRN->id;
			strcpy(PN.name,p[id].name);
			m_Server.Send(Msg->dpnidSender,(void *)&PN,PN.dwSize,DPNSEND_GUARANTEED);
		}
	}
	else
	if (P->dwType == MSG_ATTACK)
	{	PacketAttack* PA = (PacketAttack*)P;
		int id = FindID(Msg->dpnidSender);
		p[id].IsMonster = PA->IsMonster;
		if (PA->IsMonster == true)
		{	if (id != -1 && mon[PA->monid].State != DIE)
			{
				p[id].State		= ATTACK;
				p[id].mode		= PA->mode;
				p[id].targetID	= PA->monid;
				p[id].time		= timeGetTime();
				if (mon[p[id].targetID].State != ATTACK)
				{	
					mon[p[id].targetID].State	 = ATTACK;
					mon[p[id].targetID].targetID = Msg->dpnidSender;
					mon[p[id].targetID].time	 = timeGetTime(); 
				}
				sprintf(text,"%s Attack %d", p[id].name, PA->monid);
				SendDlgItemMessage(hDlg,IDC_LIST1,LB_INSERTSTRING,-1,(LPARAM)text);
			}
		}
		else
		{	
			int iddef = FindID(PA->pid);
			if (iddef != -1 && p[iddef].State != DIE)
			{
				if (p[iddef].State != ATTACK)
					p[iddef].State	= ATTACK_WAIT;
				p[id].State		= ATTACK;
				p[id].mode		= PA->mode;
				p[id].targetID	= iddef;
				p[id].time		= timeGetTime();
				sprintf(text,"%s Attack %s", p[id].name, p[iddef].name);
				SendDlgItemMessage(hDlg,IDC_LIST1,LB_INSERTSTRING,-1,(LPARAM)text);
			}
		}
	}
	else
	if (P->dwType == MSG_RETURNTOLASTSAVEPOINT)
	{
		int id = FindID(Msg->dpnidSender);
		if (id != -1)
		{
			p[id].HP	= p[id].HPMax / 2;
			p[id].x		= 10;
			p[id].z		= 10;
			p[id].State = STAND;
		}
	}
	return TRUE;
}

BOOL cApp::Frame()
{	
	DWORD Time=timeGetTime();
	if (Time >= timenow+500)
	{	
		timenow = Time;
		counter++;
		sprintf(text,"%d",counter);
		HDC hDC = GetDC(hDlg);
		TextOut(hDC,10,10,text,strlen(text));
		UpdateSpawnPlayer();
		UpdatePlayer();
	}

	for (int i=0; i<num; i++)
		if (p[i].State == ATTACK)
			if (p[i].IsMonster == true)
			{
				if (mon[p[i].targetID].State == DIE)
				{
					p[i].time = Time;
					p[i].State = STAND;
				}
				else
				if (Time >= p[i].time+1000)
				{
					p[i].time = Time;
					UpdatePlayerAttack(i);
				}
			}
			else
			{
				if (p[p[i].targetID].State == DIE)
				{
					p[i].time = Time;
					p[i].State = STAND;
				}
				else
				if (IsNearTargetPlayer(i, p[i].targetID) == TRUE)
				{	if (Time >= p[i].time+1000)
					{
						p[i].time = Time;
						UpdatePVP(i);
					}
				}
			}
	for (i=0; i<nummonster; i++)
	{	
		if (mon[i].State == DIE)
		{
			if (Time >= mon[i].time+2000)
			{	
				mon[i].time = Time;
				RebornMonster(i);
			}
		}
		else
		if (mon[i].State == ATTACK)
		{	
			int id = FindID(mon[i].targetID);
			if (p[id].State == DIE)
			{	
				mon[i].time = Time;
				mon[i].State = STAND;
			}
			else
			if (IsNearTarget(id, i) == TRUE)
			{	if (Time >= mon[i].time+2000)
				{
					mon[i].time = Time;
					UpdateMonsterAttack(i);
				}
			}
			else 
			if (Time >= mon[i].time+2000)
			{
				mon[i].time = Time;
				UpdateMonster(i);
			}
		}
		else
		if (Time >= mon[i].time+5000)
		{
			mon[i].time = Time;
			UpdateMonster(i);
		}
	}
	return TRUE;
}

FAR PASCAL cApp::MsgProc(HWND hWnd, UINT uMsg,                
                         WPARAM wParam, LPARAM lParam)
{
  switch(uMsg) {
		case WM_PAINT:
				PAINTSTRUCT ps;
				HBITMAP Bitmap;
				HDC hDC, BackDC;
				hDC = BeginPaint(hWnd,&ps);
				BackDC	= CreateCompatibleDC(hDC);
				Bitmap	= (HBITMAP)LoadBitmap(GethInst(), MAKEINTRESOURCE(IDB_BITMAP1));
				SelectObject(BackDC,Bitmap);
				StretchBlt(hDC, 0, 0, 800, 600, BackDC, 0, 0, 640, 480, SRCCOPY);
				EndPaint(hWnd,&ps);
   				break;

		case WM_DESTROY:
				EndDialog(hDlg,0);
				PostQuitMessage(0);
		break;
    default: return DefWindowProc(hWnd, uMsg, wParam, lParam);
  }

  return 0;
}    

int WINAPI WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{	
	cApp App;
	return g_Application->Run();
}

LRESULT CALLBACK MyDialog1(HWND hWnd,UINT message,WPARAM wParam,LPARAM lParam)
{	switch(message)
	{	case WM_INITDIALOG :
			
			return TRUE;
		case WM_COMMAND :
			switch (LOWORD(wParam))
			{	
				case IDEXIT :
					EndDialog(hWnd,0);
					PostQuitMessage(0);
				default : break;
			}
			break;
		case WM_CLOSE :
			EndDialog(hWnd,0);
			PostQuitMessage(0);
			break;
	}
	return 0;
}