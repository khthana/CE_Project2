// PersonalFirewallDlg.cpp : implementation file
//

#include "stdafx.h"
#include "PersonalFirewall.h"
#include "PersonalFirewallDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#define WM_SYSTRAYNOTIFY (WM_USER + 200)

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPersonalFirewallDlg dialog

CPersonalFirewallDlg::CPersonalFirewallDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CPersonalFirewallDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CPersonalFirewallDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CPersonalFirewallDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPersonalFirewallDlg)
	DDX_Control(pDX, IDC_TAB, m_cTab);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CPersonalFirewallDlg, CDialog)
	//{{AFX_MSG_MAP(CPersonalFirewallDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_NOTIFY(TCN_SELCHANGE, IDC_TAB, OnSelchangeTab)
	ON_WM_SIZE()	
	ON_COMMAND(ID_OPEN, OnSystrayOpen)
	ON_COMMAND(ID_CLOSE, OnSystrayClose)
	//}}AFX_MSG_MAP
	ON_MESSAGE(WM_SYSTRAYNOTIFY, OnSystrayNotify)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPersonalFirewallDlg message handlers

BOOL CPersonalFirewallDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
// Set up Tab Control	
	CRect tabRect;

	m_cTab.GetWindowRect(tabRect);

	// Set the size and location of the child windows based on the tab control
	m_rSettingsRect.left = 1;
	m_rSettingsRect.top = 21;
	m_rSettingsRect.right = tabRect.Width() - 2;
	m_rSettingsRect.bottom = tabRect.Height() - 22;

	// Create the child windows for the main window class
	m_dDlgMain.Create(IDD_DIALOG_MAIN, this);
	m_dDlgRule.Create(IDD_DIALOG_RULE, this);

	// This is redundant with the default value, considering what OnShowWindow does
	ShowWindowNumber(0);

	// Set the titles for each tab
	TCITEM tabItem;
	tabItem.mask = TCIF_TEXT;

	tabItem.pszText = _T("  Main   ");
	m_cTab.InsertItem(0, &tabItem);

	tabItem.pszText = _T("  Rule   ");
	m_cTab.InsertItem(1, &tabItem);	


	//System Tray

	m_notifyIconData.cbSize	= sizeof(NOTIFYICONDATA);
	m_notifyIconData.hWnd	= GetSafeHwnd();
	m_notifyIconData.uID	= IDR_MAINFRAME;
	m_notifyIconData.uFlags = NIF_ICON | NIF_MESSAGE | NIF_TIP;
	m_notifyIconData.uCallbackMessage = WM_SYSTRAYNOTIFY;
	m_notifyIconData.hIcon	= (HICON) LoadImage(AfxGetApp()->m_hInstance, 
		MAKEINTRESOURCE(IDR_MAINFRAME), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR); //AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	strcpy(m_notifyIconData.szTip, "Isag Personal Firewall");
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CPersonalFirewallDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CPersonalFirewallDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CPersonalFirewallDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CPersonalFirewallDlg::ShowWindowNumber(int number)
{
	// This example uses four windows
	int windowCount = 2;

	// Validate the parameter
	if ((number >= 0) && (number < windowCount))
	{
		// Create and assign pointers to each window
		CDialog *m_dPointer[2];

		m_dPointer[0] = &m_dDlgMain;
		m_dPointer[1] = &m_dDlgRule;

		// Hide every window except for the chosen one
		for (int count = 0; count < windowCount; count++)
		{
			if (count != number)
			{
				m_dPointer[count]->ShowWindow(SW_HIDE);
			}
			else if (count == number)
			{
				if (count == 1) // rule page
				{
					m_dDlgRule.ruleGroup = m_dDlgMain.ruleGroup;
					m_dDlgRule.UpdateGroupRuleList();
				}

				// Show the chosen window and set it's location
				m_dPointer[count]->SetWindowPos(&wndTop, m_rSettingsRect.left,
					m_rSettingsRect.top, m_rSettingsRect.right,
					m_rSettingsRect.bottom, SWP_SHOWWINDOW);

				m_cTab.SetCurSel(count);
			}
		}
	}
}

void CPersonalFirewallDlg::OnSelchangeTab(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// Get the number of the currently selected tab, and show it
	ShowWindowNumber(m_cTab.GetCurFocus());

	// Do something with the "formal parameters" so the compiler is happy in warning level 4
	pNMHDR = NULL;
	pResult = NULL;
}

void CPersonalFirewallDlg::OnSize(UINT nType, int cx, int cy) 
{
	CDialog::OnSize(nType, cx, cy);
	
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

LONG CPersonalFirewallDlg::OnSystrayNotify(WPARAM wParam, LPARAM lParam)
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



void CPersonalFirewallDlg::OnSystrayOpen() 
{
	// TODO: Add your command handler code here
	ShowWindow(SW_RESTORE);
}

void CPersonalFirewallDlg::OnSystrayClose() 
{
	// TODO: Add your command handler code here
	Shell_NotifyIcon(NIM_DELETE, &m_notifyIconData);
	PostMessage(WM_QUIT, 0, 0);
	CPersonalFirewallDlg::OnCancel();
}
