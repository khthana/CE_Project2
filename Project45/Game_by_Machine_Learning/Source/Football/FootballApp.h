// FootballApp.h: interface for the CFootballApp class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FOOTBALLAPP_H__1EC3A7AD_6C5D_49D4_993B_6E882A8B0C07__INCLUDED_)
#define AFX_FOOTBALLAPP_H__1EC3A7AD_6C5D_49D4_993B_6E882A8B0C07__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

enum {MODE_HUMAN,MODE_COMPUTER,MODE_LEARNING};

class CFootballApp 
{
private:
	// Window Variables
	HWND					m_hWnd;
	HINSTANCE				m_hInstance;
	TCHAR*					m_lpszWindowTitle;
	DWORD					m_dwWindowStyle;
	// Application Variables
	BOOL					m_bActive;
	BOOL					m_bWindowed;
	RECT					m_rcWindowRect;
	RECT					m_rcClientRect;
	DWORD					m_dwLastTick;
	DWORD					m_dwCurrTick;
	// Football Variables
	CFootballMatch*			m_pMatch;
	CSurface*				m_pClipSurface;
	RECT					m_rcClipSurface;
	POINT					m_ptBorder;
	// DirectDraw Variables
	CDisplay*				m_pDisplay;
	DWORD					m_dwScreenWidth;
	DWORD					m_dwScreenHeight;
	DWORD					m_dwScreenBPP;
	// DirectInput Variables
	LPDIRECTINPUT8			m_pDI;
	LPDIRECTINPUTDEVICE8	m_pKeyboard;
	// DirectSound Variables
	SoundObject*			m_pKickSound;
	SoundObject*			m_pWhistleSound;
	SoundObject*			m_pGoalSound;
public:
	CFootballApp();
	virtual ~CFootballApp();

	HRESULT Create(HINSTANCE);
	LRESULT MsgProc(HWND hWnd,UINT Msg,WPARAM wParam,LPARAM lParam);
	int		Run();

	void	PlayKickSound();
	void	PlayWhitleSound();
	void	PlayGoalSound();
public:
	DWORD m_PassDataItem;
	
	BOOL GameLoadOption();
	BOOL GameSaveOption();

	void MenuNewGame();
	static void MenuLoadGame(HWND hWnd,CFootballMatch* Match);
	static void MenuSaveGame(HWND hWnd,CFootballMatch* Match);
    static TCHAR strFileName[MAX_PATH];
    static TCHAR strPath[MAX_PATH];

	static LRESULT CALLBACK MenuGameOptionDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam);
	static DWORD	m_PlayerAType;
	static DWORD	m_PlayerBType;
	static BOOL		m_TrainAtStart;

	static void MenuLoadNeural(HWND hWnd);
	static void MenuSaveNeural(HWND hWnd);
	static LRESULT CALLBACK MenuTrainNeuralDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam);
	static LRESULT CALLBACK MenuTrainProcessDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam);
	static DWORD WINAPI MenuTrainProcessThreadProc(LPVOID lpParameter);
	static CNetwork	m_Network;
	static TCHAR	m_DataFilename[_MAX_PATH];
	static TCHAR	m_NeuralFilename[_MAX_PATH];
	static DWORD	m_MaxPatterns;

	static LRESULT CALLBACK MenuTrainOptionDlgProc(HWND hDlg,UINT msg,WPARAM wParam,LPARAM lParam);
	static DOUBLE	m_LearningRate;
	static DOUBLE	m_ErrorTolerance;
	static DOUBLE	m_MomentumConst;
	static DOUBLE	m_NoiseFactor;
	static DWORD	m_MaxCycles;
	static BOOL		m_UnlimitsCycles;
	
	inline HWND	GetHWND()			{ ASSERT(m_hWnd);	return m_hWnd; };
	inline RECT GetAppClientRect()	{ return m_rcClientRect; };
	inline CFootballMatch* GetMatch()	{ ASSERT(m_pMatch); return m_pMatch; };
private:
	HRESULT DisplayFrame();
	HRESULT RestoreSurfaces();
	HRESULT ProcessNextFrame();
	HRESULT ReadImmediateData(HWND hWnd);
	void	OnTimer(UINT nIDEvent);

	HRESULT CreateDeviceObject();
	HRESULT CreateDirectInput();
	HRESULT CreateDirectDraw();
	HRESULT CreateSurface();

	void FreeDeviceObject();
	void FreeDirectInput();
	void FreeDirectDraw();
	void FreeSurface();

};

extern CFootballApp* g_App;

#endif // !defined(AFX_FOOTBALLAPP_H__1EC3A7AD_6C5D_49D4_993B_6E882A8B0C07__INCLUDED_)
