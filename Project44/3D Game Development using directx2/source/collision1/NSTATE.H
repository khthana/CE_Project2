#pragma warning(disable:4786)
#ifndef _NSTATE_H
#define _NSTATE_H

#include <string>
#include <vector>
#include <queue>
#include "ng.h"

using namespace std;

enum GAME_SUBSTATE
{
	wstart		= 0,
	wstate		= 1,
	wend		= 4,
	wworld		= 1001,
	wmenu		= 1002,
	wbattle		= 1003,
	
	wmmain		= 2001,
	wmitem		= 2002,
	wmmagic		= 2003,
	wmstatus	= 2004,
	wmequip		= 2005,
	wmability	= 2006,
	wmparty		= 2007,
	wmconfig	= 2008,
	wmdata		= 2009,
	wmmove		= 2010,

	wbcommand	= 3001,
	wbrun		= 3002,
	wbattack	= 3003,
	wbwait		= 3004,
	wbexp		= 3005,

	werror		= 0xffffffff
};

enum GAME_CONTROLSTATE
{
	cpre		= 0,
	cnormal		= 1,
	cpost		= 2
};

enum GAME_STATE
{
	gstart		= 0,
	gworld		= 1,
	gbattle		= 2,
	gdead		= 3,
	gquit		= 4,
	gmenu		= 5,
	gend		= 6,
	gerror		= 0xffffffff
};

struct NGAME_QSTATE
{
	GAME_CONTROLSTATE	control;
	GAME_SUBSTATE		state;

	NGAME_QSTATE()
	{
		control	= cpre;
		state	= wstart;
	}

	NGAME_QSTATE(GAME_CONTROLSTATE	c, GAME_SUBSTATE s)
	{
		control	= c;
		state	= s;
	}
};

struct NGAME_WEAPON
{
	string		strName;
	string		strType;

	DWORD		dwAtt;
	DWORD		dwHit;
	DWORD		dwCritical;
	DWORD		dwWeight;

	NGMODEL*	pWeapon;

	DWORD		dwCharacter;
};

struct NGAME_MAGIC
{
	string		name;
	BOOL		bDead;
	BOOL		bMaxHP;	
	BOOL		bMaxMP;
	DWORD		dwHP;
	DWORD		dwMP;

	DWORD		dwMAtt;
	DWORD		dwFire;
	DWORD		dwWater;
	DWORD		dwBolt;
	DWORD		dwWind;
	DWORD		dwEarth;
};

struct NGAME_ITEM
{
	string		name;
	BOOL		bDead;			// cure dead
	BOOL		bMaxHP;	
	BOOL		bMaxMP;
	DWORD		dwHP;
	DWORD		dwMP;

	NGAME_MAGIC* pMagic;		// magic?
};

struct NGAME_CHARACTER
{
	string		strName;
	//string		strSurName;
	//string		strJob;
	
	//LPDIRECT3DTEXTURE8	lpImage;

	//DWORD		dwWeapon;

	// Post cal
	DWORD		dwAttack;
	DWORD		dwHit;
	DWORD		dwAvoid;
	DWORD		dwCritical;
	DWORD		dwDef;

	DWORD		dwMAttack;
	DWORD		dwMHit;
	DWORD		dwMAvoid;
	DWORD		dwMCritical;
	DWORD		dwMDef;

	DWORD		dwSpeed;

	// Pre cal

	DWORD		dwLev;
	DWORD		dwMaxLev;

	DWORD		dwExp;
	DWORD		dwNextExp;
	
	DWORD		dwHP;
	DWORD		dwMaxHP;

	DWORD		dwMP;
	DWORD		dwMaxMP;

	DWORD		dwStr;
	DWORD		dwSkl;
	DWORD		dwAgl;
	DWORD		dwMag;
	DWORD		dwLuk;

	vector<NGAME_MAGIC>	magic;

	VOID FindValue()
	{
		FLOAT	str	= dwStr;
		FLOAT	skl	= dwSkl;
		FLOAT	agl	= dwAgl;
		FLOAT	mag	= dwMag;
		FLOAT	luk	= dwLuk;

		dwAttack	= (DWORD)((str*0.6 + skl*0.3 + agl*0.1));
		dwHit		= (DWORD)((skl*0.4 + agl*0.4	+ luk*0.2)*5);
		dwAvoid		= (DWORD)(skl*0.1	+ agl*0.3	+ luk*0.6);
		dwCritical	= (DWORD)((skl*0.5	+ luk*0.5)*0.1);	
		dwDef		= (DWORD)((str*0.7	+ skl*0.2)*0.8);

		dwMAttack	= (DWORD)(mag*0.6 + skl*0.3 + agl*0.1);
		dwMHit		= (DWORD)((skl*0.8 + luk*0.2) * 6);
		dwMAvoid	= (DWORD)((skl*0.7	+ luk*0.3) * 0.2);
		dwMCritical	= (DWORD)((skl*0.8	+ luk*0.2) * 0.1);
		dwMDef		= (DWORD)((str*0.1	+ mag*0.8 + skl*0.1)*0.6);

		dwSpeed		= (DWORD)(skl*0.4 + agl*0.6);
	}

	VOID SetData(	string name,	
					DWORD	Lev,	DWORD MLev,
					DWORD	Exp,	DWORD MExp,
					DWORD	HP,		DWORD MHP,
					DWORD	MP,		DWORD MMP,
					DWORD	Str,	DWORD Skl,  DWORD Agl,	DWORD Mag, DWORD Luk)
	{
		strName		= name;
		dwLev		= Lev;		dwMaxLev= MLev;
		dwExp		= Exp;		dwNextExp = MExp;
		dwHP		= HP;		dwMaxHP	= MHP;	
		dwMP		= MP;		dwMaxMP	= MMP;
		dwStr		= Str;		dwSkl	= Skl;	dwAgl	= Agl;	dwMag = Mag;	dwLuk = Luk;

		FindValue();
	}
};

class NSTATE
{
protected:
	// Grobal
	HWND				m_hWnd;

	// Graphics
	NG3D*				m_p3d;
	LPDIRECT3DDEVICE8	m_device;

	// Input
	NIDEVICEOUTPUT*		m_pData;

	// Music
	NMUSIC*				m_pMusic;

	// Time
	FLOAT				m_CurTime;
	FLOAT				m_PrevTime;
	FLOAT				m_fTime;

	// State
	GAME_SUBSTATE		m_state;
	GAME_SUBSTATE		m_state2;

	// Control
	queue<NGAME_QSTATE>	m_queue;
	NGAME_QSTATE		m_qstate;
	queue<NGAME_QSTATE>	m_queue2;
	NGAME_QSTATE		m_qstate2;

public:
	NSTATE();
	~NSTATE();

	DWORD				Create(HWND, NG3D*, NIDEVICEOUTPUT*, NMUSIC*);
	virtual	DWORD		DoCreateState();
	virtual	DWORD		DoInitState(FLOAT);
	virtual DWORD		DoState(FLOAT);
	virtual DWORD		DoDestroyState();
	virtual DWORD		DoRender();

	DWORD	AdvanceTo(GAME_SUBSTATE);
	DWORD	StartFrom(GAME_SUBSTATE);
	DWORD	WaitFor(GAME_SUBSTATE);
	DWORD	Reset();
};

class NSTATE_MAINMENU:NSTATE
{
	// Game
	NGSCENE*			m_scene;	// create new
	NGCAMERA*			m_camera;	// retreive

	BOOL				m_bReady;

public:
	NSTATE_MAINMENU();
	~NSTATE_MAINMENU() {};

	DWORD	DoCreateState();
	DWORD	DoInitState(FLOAT);
	DWORD	DoState(FLOAT);
	DWORD	DoDestroyState();
	DWORD	DoRender();
};

class NSTATE_WORLD:public NSTATE
{
	
	// Game
	NGSCENE*			m_scene;	// create new
	NGCAMERA*			m_camera;	// retreive

public:
	NSTATE_WORLD();
	~NSTATE_WORLD() {};

	GAME_SUBSTATE		m_state;

	DWORD	DoCreateState();
	DWORD	DoInitState(FLOAT);
	DWORD	DoState(FLOAT);
	DWORD	DoDestroyState();
	DWORD	DoRender();
};

struct NBATTLE
{
	INT	HP;
	INT	MHP;
	INT	Att;
};

class NSTATE_BATTLE:public NSTATE
{
	// Game
	NGSCENE*			m_scene;	// create new
	NGCAMERA*			m_camera;	// retreive
	D3DXMATRIX			m_matCamera;

	NGPANEL*			m_command;
	NGPANEL*			m_attack;
	NGPANEL*			m_magic;
	NGPANEL*			m_item;

	LPDIRECT3DTEXTURE8	m_tcom;
	LPDIRECT3DTEXTURE8	m_tatt1;
	LPDIRECT3DTEXTURE8	m_tatt2;
	LPDIRECT3DTEXTURE8	m_tmag1;
	LPDIRECT3DTEXTURE8	m_tmag2;
	LPDIRECT3DTEXTURE8	m_titem1;
	LPDIRECT3DTEXTURE8	m_titem2;

	DWORD	DoPreState(GAME_SUBSTATE);
	DWORD	DoPostState(GAME_SUBSTATE);
	DWORD	DoStated(GAME_SUBSTATE);

public:
	NSTATE_BATTLE();
	~NSTATE_BATTLE();

	DWORD	DoCreateState();
	DWORD	DoInitState(FLOAT);
	DWORD	DoState(FLOAT);
	DWORD	DoDestroyState();
	DWORD	DoRender();
	DWORD	DoPostRender(LPDIRECT3DSURFACE8);

	DWORD	SetData(vector<NGAME_CHARACTER*>*, vector<NGAME_ITEM*>*);
};

class NSTATE_MENU:public NSTATE
{
	// Game
	NGPANEL*			m_panel1;
	NGPANEL*			m_panel2;
	NGPANEL*			m_panel3;
	NGPANEL*			m_panel4;
	NGPANEL*			m_panel5;
	NGPANEL*			m_panel6;
	NGPANEL*			m_panel7;
	NGPANEL*			m_panel8;
	NGPANEL*			m_bg;
	NGPANEL*			m_pointer;
	
	NGTEXT*				m_text1;
	NGTEXT*				m_text2;
	NGTEXT*				m_text3;
	NGTEXT*				m_text4;
	NGTEXT*				m_text5;

	NGTEXT*				m_txLev1;
	NGTEXT*				m_txLev2;
	NGTEXT*				m_txLev3;

	NGTEXT*				m_txHP1;
	NGTEXT*				m_txHP2;
	NGTEXT*				m_txHP3;

	NGTEXT*				m_txMP1;
	NGTEXT*				m_txMP2;
	NGTEXT*				m_txMP3;

	NGTEXT*				m_txEXP1;
	NGTEXT*				m_txEXP2;
	NGTEXT*				m_txEXP3;

	NGPACKAGE*			m_pack1;
	NGPACKAGE*			m_pack2;
	NGPACKAGE*			m_pack3;

	vector<NGPOINT>		m_location;
	DWORD				m_dwPos;
	DWORD				m_dwNext;

	
	
	DWORD	DoPreState(GAME_SUBSTATE);
	DWORD	DoPostState(GAME_SUBSTATE);
	DWORD	DoStated(GAME_SUBSTATE);

public:
	NSTATE_MENU();
	~NSTATE_MENU();

	DWORD	DoCreateState();
	DWORD	DoInitState(FLOAT);
	DWORD	DoState(FLOAT);
	DWORD	DoDestroyState();
	DWORD	DoRender();
	DWORD	DoPostRender(LPDIRECT3DSURFACE8);

	DWORD	SetData(vector<NGAME_CHARACTER*>*, vector<NGAME_ITEM*>*);	
};


#endif 
