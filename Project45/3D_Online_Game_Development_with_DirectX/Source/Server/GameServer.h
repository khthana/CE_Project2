#ifndef _GAMESERVER_H_
#define _GAMESERVER_H_

class cServer : public cNetworkServer
{	
	private :
		BOOL Receive(DPNMSG_RECEIVE *Msg);
		BOOL CreatePlayer(DPNMSG_CREATE_PLAYER *Msg);
		BOOL DestroyPlayer(DPNMSG_DESTROY_PLAYER *Msg);

};

class PlayerConnected 
{	
	public :
		PlayerConnected();	
		DPNID id;
		char name[16];
		int HPINC;
		int x;
		int z;
		int targetx,targetz;
		int HP,MP,EXP;
		int HPMax,MPMax;
		STATE State;
		long Money;
		int head,body;
		// Status
		int Level, STR, AGI, VIT, INT, DEX, LUK;
		// Attack zone
		int targetID;
		bool IsMonster;
		AttackType mode;
		DWORD time;
};

class Monster
{
	public :
		Monster();
		int HP;
		int id;
		STATE State;
		int type;
		int x,z;
		DPNID targetID;
		DWORD time;
};

class MonsterInfo
{
	public :
		int type;
		char name[16];
		int HP, Level;
		int STR, AGI, VIT, INT, DEX, LUK;
		int exp, money;
};

class Stat
{
	public :
		int Level;
		int STR;
		int AGI;
		int VIT;
		int INT;
		int DEX;
		int LUK;
};

class cApp : public cApplication
{
	private : 
		cServer			m_Server;
		cNetworkAdapter m_Adapters;
		GUID            *m_guidAdapter;
		CDatabase		Database;
		CRecordset		*Recordset1, *Recordset2;
		PlayerConnected	p[100];
		Monster			mon[30];
		MonsterInfo		MInfo[10];
		int				num;
		int				nummonster;
		DWORD			timenow;
		int				counter;
		char			text[128];
		BYTE			m_MapArray[120][120];	// Array of Map

		int FindID(DPNID id);
		int CalculateDamage(Stat Att, Stat Def);
		Stat FillPlayerStat(int index);
		Stat FillMonsterStat(int index);
		void UpdatePlayer();
		void UpdateSpawnPlayer();
		void UpdateMonster(int index);
		void UpdatePlayerAttack(int index);
		void UpdatePVP(int index);
		void UpdateMonsterAttack(int index);
		void RebornMonster(int index);
		BOOL IsNearTarget(int indexP, int indexM);
		BOOL IsNearTargetPlayer(int Att, int Def);
		BOOL CanMove(float XPos, float ZPos);
	
	public :
		cApp();

		BOOL Init();
		BOOL MapInit(int MID);
		BOOL DatabaseInit();
		BOOL MonsterInit();
		BOOL Shutdown();
		BOOL Receive(DPNMSG_RECEIVE *Msg);
		BOOL CreatePlayer(DPNMSG_CREATE_PLAYER *Msg);
		BOOL DestroyPlayer(DPNMSG_DESTROY_PLAYER *Msg);
		BOOL Frame();
		
		FAR PASCAL MsgProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);

};

int PASCAL WinMain(HINSTANCE hInst, HINSTANCE hPrev, LPSTR szCmdLine, int nCmdShow);
LRESULT CALLBACK MyDialog1(HWND hWnd,UINT message,WPARAM wParam,LPARAM lParam);

cApp            *g_Application; 
cNetworkAdapter *g_Adapters;
int counter=0;
HWND hDlg;
DWORD Timenow=0;

#endif