#ifndef __NGINPUT_H
#define __NGINPUT_H

#include <dinput.h>
#include <vector>

using namespace std;

#define NIKB_BUFFERSIZE 8
#define NIMOUSE_BUFFERSIZE	16
#define NI_KEYBOARD		-1

BOOL CALLBACK EnumAxesCallback(const DIDEVICEOBJECTINSTANCE*, VOID*);
BOOL CALLBACK EnumJoysticksCallback(const DIDEVICEINSTANCE*, VOID*);

/*
typedef struct _NIOUTPUT
{
	BOOL	state;	// 0 is release 1 is press
	FLOAT	prev;	// time after previous state
	FLOAT	time;	// time of this state
} NIOUTPUT;
*/

typedef struct _NIMAP
{
	union
	{
		struct
		{
			DWORD	up;
			DWORD	down;
			DWORD	left;
			DWORD	right;

			DWORD	pink;	// square
			DWORD	blue;	// cross
			DWORD	green;	// triangle
			DWORD	red;	// circle

			DWORD	r1;
			DWORD	r2;
			DWORD	l1;
			DWORD	l2;

			DWORD	select;
			DWORD	start;
		};
		DWORD i[14];
	};

	_NIMAP()
	{
		ZeroMemory(this, sizeof(NIMAP));
	};

} NIMAP;

// use for keyboard and joystick
typedef struct _NIDEVICEOUTPUT
{
	// 0 is release
	// 1 is press
	union
	{
		struct
		{
			BOOL	up;
			BOOL	down;
			BOOL	left;
			BOOL	right;

			BOOL	pink;	// square
			BOOL	blue;	// cross
			BOOL	green;	// triangle
			BOOL	red;	// circle

			BOOL	r1;
			BOOL	r2;
			BOOL	l1;
			BOOL	l2;

			BOOL	select;
			BOOL	start;
		};
		BOOL i[14];
	};

	_NIDEVICEOUTPUT()
	{
		ZeroMemory(this, sizeof(NIDEVICEOUTPUT));
	};

} NIDEVICEOUTPUT;

// Support only immediate read
class NINPUT
{
private:
	HWND	m_hWnd;

	NIDEVICEOUTPUT			m_niop;

	LPDIRECTINPUT8			m_pDI;

	LPDIRECTINPUTDEVICE8	m_pKB;
	LPDIRECTINPUTDEVICE8	m_pMouse;
	LPDIRECTINPUTDEVICE8	m_pJS;

	// Keyboard
	BYTE					m_diks[256];

	// Mouse
	DIMOUSESTATE2			m_dims2;

	// Joystick
	DIJOYSTATE2				m_dijs2; 

	HRESULT				InitialInput(HWND);

public:
	NINPUT();
	~NINPUT();

	HRESULT				CreateInput(HWND);

	HRESULT				Pool();

	HRESULT				CreateKeyboard(BOOL bEx=TRUE, BOOL bFG=TRUE, BOOL bWK=TRUE);
	HRESULT				CreateMouse(BOOL bEX=TRUE, BOOL bFG=TRUE);
	HRESULT				CreateJoystick();

	HRESULT				SetMapData(INT, DWORD*, DWORD);

	NIDEVICEOUTPUT*		GetMapData()		{ return &m_niop;};
	BYTE*				GetKBData()			{ return m_diks;};
	DIMOUSESTATE2*		GetMouseData()		{ return &m_dims2;};
	DIJOYSTATE2*		GetJSData(DWORD i=0){ return &m_dijs2;};
};

/*
class NIKEYBOARD
{
private:
	// flag
	HWND		m_hWnd;

	BOOL		m_bExclusive;
	BOOL		m_bForeground;
	BOOL		m_bImmediate;
	BOOL		m_bWinKey;
	DWORD		m_Flags;

	BYTE				m_diks[256];
	DIDEVICEOBJECTDATA	m_didod[NIKB_BUFFERSIZE];

	LPDIRECTINPUT8       m_pDI;         
	LPDIRECTINPUTDEVICE8 m_pKB;

public:
	NIKEYBOARD()
	{	
		m_bExclusive	= TRUE;
		m_bForeground	= TRUE;
		m_bImmediate	= TRUE;
		m_bWinKey		= TRUE;
	};
	~NIKEYBOARD(){};

	HRESULT		CreateDevice(HWND hWnd);
	HRESULT		ReadImmediateData();
	HRESULT		ReadBufferedData();
	VOID		FreeDirectInput();

	LPVOID		GetInput(BOOL buffer=FALSE);
};

BOOL CALLBACK EnumAxesCallback(const DIDEVICEOBJECTINSTANCE*, VOID*);
BOOL CALLBACK EnumJoysticksCallback(const DIDEVICEINSTANCE*, VOID*);

class NIJOYSTICK
{
private:
	HWND	m_hWnd;

	DIDEVCAPS				m_diCaps;
	LPDIRECTINPUT8			m_pDI;         
	LPDIRECTINPUTDEVICE8	m_pJS;
	DIJOYSTATE2				m_dijs2;           // DInput joystick state 
	

public:

	~NIJOYSTICK()
	{
		Clear();
	}
	
	HRESULT	CreateDevice(HWND);
	HRESULT	Pool();
	LPVOID	GetInput(BOOL buffer=FALSE);
	VOID	Clear();
};

class NIMOUSE
{
private:
	HWND		m_hWnd;

	BOOL		m_bExclusive;
	BOOL		m_bForeground;
	BOOL		m_bImmediate;
	BOOL		m_bWinKey;
	DWORD		m_Flags;

	DIMOUSESTATE2		m_dims2;
	DIDEVICEOBJECTDATA	m_didod[NIMOUSE_BUFFERSIZE];

	LPDIRECTINPUT8       m_pDI;         
	LPDIRECTINPUTDEVICE8 m_pMouse;

public:
	NIMOUSE()
	{	
		m_bExclusive	= TRUE;
		m_bForeground	= TRUE;
		m_bImmediate	= TRUE;
		m_bWinKey		= TRUE;
	};
	~NIMOUSE(){};

	HRESULT		CreateDevice(HWND hWnd);
	HRESULT		ReadImmediateData();
	HRESULT		ReadBufferedData();
	VOID		FreeDirectInput();

	LPVOID		GetInput(BOOL buffer=FALSE);
};
*/
#endif
