#pragma warning(disable:4786)
#ifndef __NGAME_H
#define __NGAME_H

#include <string>
#include <vector>
#include "ng.h"
#include "nstate.h"

using namespace std;


class NGAME
{
private:
	// Other
	HWND				m_hWnd;

	// Graphics
	NG3D*				m_NG3d;
	LPDIRECT3DDEVICE8	m_device;

	// Game
	NGSCENE*			m_scene; 
	NGPANEL*			m_panel;
	NGTEXT*				m_text;
	NGCAMERA*			m_camera;

	// Input
	NINPUT*				m_pInput;
	NIMAP				m_kb;
	NIDEVICEOUTPUT		m_Data;

	// Music
	NMUSIC*				m_pMusic;

	// Time
	FLOAT				m_CurTime;
	FLOAT				m_PrevTime;
	FLOAT				m_TempTime;

	// State
	GAME_STATE			m_stGame;
//	GAME_WORLDSTATE		m_stWorld;
	
	NSTATE_MENU			m_Menu;
	NSTATE_WORLD		m_World;
	NSTATE_BATTLE		m_Battle;

	// character
	NGAME_CHARACTER		m_Siegfried;
	NGAME_CHARACTER		m_Orfina;

	// item
	vector<NGAME_ITEM*>	m_Item;


	DWORD	Wait(FLOAT);
	DWORD	DoInitState();
	DWORD	DoStateRender();
	DWORD	DoStatePostRender(LPDIRECT3DSURFACE8);

public:
	NGAME();
	~NGAME();

	DWORD	InitGraphic(NGCREATEINFO*);
	DWORD	InitInput();
	DWORD	InitSound();
	DWORD	InitMusic();
	DWORD	InitVideo();
	DWORD	InitGame();
	DWORD	GetInput();
	DWORD	Update(FLOAT);
	DWORD	Render();

	DWORD	DoState();
	
};


#endif