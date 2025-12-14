// MainFrm.cpp : implementation of the CMainFrame class
//

#include "stdafx.h"
#include "LogMonitor.h"

#include "MainFrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define WM_SYSTRAYNOTIFY (WM_USER + 200)
/////////////////////////////////////////////////////////////////////////////
// CMainFrame

IMPLEMENT_DYNCREATE(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
	//{{AFX_MSG_MAP(CMainFrame)
	ON_WM_CREATE()
	ON_WM_SIZE()
	ON_COMMAND(ID_OPEN, OnSystrayOpen)
	ON_COMMAND(ID_CLOSE, OnSystrayClose)
	//}}AFX_MSG_MAP
	ON_MESSAGE(WM_SYSTRAYNOTIFY, OnSystrayNotify)
END_MESSAGE_MAP()

static UINT indicators[] =
{
	ID_SEPARATOR,           // status line indicator
	ID_INDICATOR_CAPS,
	ID_INDICATOR_NUM,
	ID_INDICATOR_SCRL,
};

/////////////////////////////////////////////////////////////////////////////
// CMainFrame construction/destruction

CMainFrame::CMainFrame()
{
	// TODO: add member initialization code here
	
}

CMainFrame::~CMainFrame()
{
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;

	if (!m_wndStatusBar.Create(this) ||
		!m_wndStatusBar.SetIndicators(indicators,
		  sizeof(indicators)/sizeof(UINT)))
	{
		TRACE0("Failed to create status bar\n");
		return -1;      // fail to create
	}

//Systemtray Paht
	m_notifyIconData.cbSize	= sizeof(NOTIFYICONDATA);
	m_notifyIconData.hWnd	= GetSafeHwnd();
	m_notifyIconData.uID	= IDR_MAINFRAME;
	m_notifyIconData.uFlags = NIF_ICON | NIF_MESSAGE | NIF_TIP;
	m_notifyIconData.uCallbackMessage = WM_SYSTRAYNOTIFY;
	m_notifyIconData.hIcon	= (HICON) LoadImage(AfxGetApp()->m_hInstance, 
		MAKEINTRESOURCE(IDR_MAINFRAME), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR); //AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	strcpy(m_notifyIconData.szTip, "Isag Personal Firewall");

	return 0;
}

BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	if( !CFrameWnd::PreCreateWindow(cs) )
		return FALSE;
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CMainFrame diagnostics

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
	CFrameWnd::AssertValid();
}

void CMainFrame::Dump(CDumpContext& dc) const
{
	CFrameWnd::Dump(dc);
}

#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CMainFrame message handlers


void CMainFrame::OnSize(UINT nType, int cx, int cy) 
{
	CFrameWnd::OnSize(nType, cx, cy);
	
	// TODO: Add your message handler code here
	switch(nType)
	{
		case SIZE_MINIMIZED :
			//AfxMessageBox("Minimize");
			m_notifyIconData.hIcon	= (HICON) LoadImage(AfxGetApp()->m_hInstance, 
			MAKEINTRESOURCE(IDR_MAINFRAME), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR); //AfxGetApp()->LoadIcon(IDR_MAINFRAME);
			Shell_NotifyIcon(NIM_ADD, &m_notifyIconData);
			SetWindowPos(&wndTop, 0, 0, 0, 0, SWP_NOMOVE | SWP_HIDEWINDOW | SWP_NOSIZE);
		break;
	}
}

LONG CMainFrame::OnSystrayNotify(WPARAM wParam, LPARAM lParam)
{
	POINT pt;
	CMenu menu;
	CMenu* subMenu;

	switch(lParam)
	{
		case WM_LBUTTONDBLCLK:
			OnSystrayOpen() ;
		break;

		case WM_RBUTTONUP:
			::GetCursorPos(&pt);
			menu.LoadMenu(IDR_MENUTRAY);
			subMenu = menu.GetSubMenu(0);
			subMenu->SetDefaultItem(0, TRUE);
			subMenu->TrackPopupMenu(TPM_LEFTBUTTON | TPM_RIGHTBUTTON | TPM_LEFTALIGN, pt.x, pt.y, this, NULL);
			menu.DestroyMenu();
			break;

		default:
			return FALSE;
	}

	return 0;
}

void CMainFrame::OnSystrayOpen() 
{
	// TODO: Add your command handler code here
	ShowWindow(SW_RESTORE);
}

void CMainFrame::OnSystrayClose() 
{
	// TODO: Add your command handler code here
	Shell_NotifyIcon(NIM_DELETE, &m_notifyIconData);
	PostMessage(WM_QUIT, 0, 0);
}