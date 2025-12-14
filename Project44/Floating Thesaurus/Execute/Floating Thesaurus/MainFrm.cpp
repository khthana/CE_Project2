// MainFrm.cpp : implementation of the CMainFrame class
//

#include "stdafx.h"
#include "Dict.h"

#include "MainFrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define	WM_ICON_NOTIFY			WM_APP+10

#define NIIF_WARNING 0

/////////////////////////////////////////////////////////////////////////////
// CMainFrame

IMPLEMENT_DYNCREATE(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)
	//{{AFX_MSG_MAP(CMainFrame)
	ON_WM_CREATE()
	ON_COMMAND(IDC_SHOW_ICON, OnShowIcon)
	ON_COMMAND(IDC_HIDE_ICON, OnHideIcon)
	ON_UPDATE_COMMAND_UI(IDC_SHOW_ICON, OnUpdateShowIcon)
	ON_UPDATE_COMMAND_UI(IDC_HIDE_ICON, OnUpdateHideIcon)
	ON_COMMAND(ID_DEMO_MAXIMISE, OnDemoMaximise)
	ON_COMMAND(ID_DEMO_MINIMISE, OnDemoMinimise)
	ON_UPDATE_COMMAND_UI(ID_DEMO_MAXIMISE, OnUpdateDemoMaximise)
	ON_UPDATE_COMMAND_UI(ID_DEMO_MINIMISE, OnUpdateDemoMinimise)
	ON_COMMAND(ID_DEMO_GIF, OnShowGif)
	ON_COMMAND(ID_HANGMAN, OnHangman)
	//}}AFX_MSG_MAP
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
	m_pModeless = NULL;
}

CMainFrame::~CMainFrame()
{
    if (m_pModeless)
    {
        if (::IsWindow(m_pModeless->GetSafeHwnd()))
            m_pModeless->EndDialog(IDCANCEL);
        delete m_pModeless;
    }
	OnClose();
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;
	
	if (!m_wndToolBar.CreateEx(this, TBSTYLE_FLAT, WS_CHILD | WS_VISIBLE | CBRS_TOP
		| CBRS_GRIPPER | CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC) ||
		!m_wndToolBar.LoadToolBar(IDR_MAINFRAME))
	{
		TRACE0("Failed to create toolbar\n");
		return -1;      // fail to create
	}

	if (!m_wndStatusBar.Create(this) ||
		!m_wndStatusBar.SetIndicators(indicators,
		  sizeof(indicators)/sizeof(UINT)))
	{
		TRACE0("Failed to create status bar\n");
		return -1;      // fail to create
	}

	HICON hIcon = ::LoadIcon(AfxGetResourceHandle(), MAKEINTRESOURCE(IDR_MAINFRAME));  // Icon to use
	
	if (!m_TrayIcon.Create(
						NULL,                            // Let icon deal with its own messages
                        WM_ICON_NOTIFY,                  // Icon notify message to use
                        _T("Floating Thesaurus - Right click on me!"),  // tooltip
                        hIcon,
                        IDR_POPUP_MENU,                  // ID of tray icon
                        FALSE ))
    {
		return -1;
    }

    m_TrayIcon.SetMenuDefaultItem(3, TRUE);

	// TODO: Delete these three lines if you don't want the toolbar to
	//  be dockable
	m_wndToolBar.EnableDocking(CBRS_ALIGN_ANY);
	EnableDocking(CBRS_ALIGN_ANY);
	DockControlBar(&m_wndToolBar);

	return 0;
}

BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	cs.style &= ~FWS_ADDTOTITLE;
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


void CMainFrame::OnShowIcon() 
{
    m_TrayIcon.ShowIcon();
}

void CMainFrame::OnHideIcon() 
{
    m_TrayIcon.HideIcon();
}

void CMainFrame::OnUpdateShowIcon(CCmdUI* pCmdUI) 
{
    pCmdUI->Enable ( !m_TrayIcon.Visible() );
}

void CMainFrame::OnUpdateHideIcon(CCmdUI* pCmdUI) 
{
    pCmdUI->Enable ( m_TrayIcon.Visible() );
}

void CMainFrame::OnClose() 
{
    m_TrayIcon.RemoveIcon();	
	CFrameWnd::OnClose();
}

void CMainFrame::OnDemoMaximise() 
{
    CSystemTray::MaximiseFromTray(this);
}

void CMainFrame::OnDemoMinimise() 
{
    CSystemTray::MinimiseToTray(this);
}

void CMainFrame::OnUpdateDemoMaximise(CCmdUI* pCmdUI) 
{
    pCmdUI->Enable(!IsIconic() && !IsWindowVisible());
}

void CMainFrame::OnUpdateDemoMinimise(CCmdUI* pCmdUI) 
{
    pCmdUI->Enable(!IsIconic() && IsWindowVisible());
}

void CMainFrame::OnShowGif() 
{
	OnModeLess();
}

void CMainFrame::OnModeLess()
{
    if (!m_pModeless)
        m_pModeless = new CGifAnimation;

    if (!::IsWindow(m_pModeless->GetSafeHwnd()))
        m_pModeless->Create(IDD_GIF_DIALOG, this);

    m_pModeless->ShowWindow(SW_SHOW);
}

void CMainFrame::OnHangman() 
{
	OnModeLess();	
}
