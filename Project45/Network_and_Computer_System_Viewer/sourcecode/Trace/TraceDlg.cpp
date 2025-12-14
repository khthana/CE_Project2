// TraceDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Trace.h"
#include "TraceDlg.h"
#include <winsock2.h>
#include "ping.h"
#include "tracer.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

BOOL g_bResolveAddresses;


//Class derived to implement Trace Route
class CMyTraceRoute : public CTraceRoute
{
  virtual BOOL OnSingleHostResult(int nHostNum, const CHostTraceMultiReply& htmr);
};

BOOL CMyTraceRoute::OnSingleHostResult(int nHostNum, const CHostTraceMultiReply& htmr)
{
  if (htmr.dwError == 0)
  {
    hostent* phostent = NULL;
    if (g_bResolveAddresses)
      phostent = gethostbyaddr((char *)&htmr.Address.S_un.S_addr, 4, PF_INET);

    if (phostent)
	    _tprintf(_T("  %d\t%d ms\t%d ms\t%d ms\t%s [%d.%d.%d.%d]\n"), nHostNum, htmr.minRTT, htmr.avgRTT, 
               htmr.maxRTT, phostent->h_name, htmr.Address.S_un.S_un_b.s_b1, htmr.Address.S_un.S_un_b.s_b2, 
               htmr.Address.S_un.S_un_b.s_b3, htmr.Address.S_un.S_un_b.s_b4);
    else
	    _tprintf(_T("  %d\t%d ms\t%d ms\t%d ms\t%d.%d.%d.%d\n"), nHostNum, htmr.minRTT, htmr.avgRTT, htmr.maxRTT,
               htmr.Address.S_un.S_un_b.s_b1, htmr.Address.S_un.S_un_b.s_b2, htmr.Address.S_un.S_un_b.s_b3, 
		  		     htmr.Address.S_un.S_un_b.s_b4);
  }
  else
    _tprintf(_T("  %d\t*\t*\t*\tError:%d\n"), nHostNum, htmr.dwError);

  return TRUE;
}

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
// CTraceDlg dialog

CTraceDlg::CTraceDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTraceDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTraceDlg)
	m_Output = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTraceDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTraceDlg)
	DDX_Control(pDX, IDC_EDIT2, m_hostInput);
	DDX_Text(pDX, IDC_EDIT1, m_Output);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTraceDlg, CDialog)
	//{{AFX_MSG_MAP(CTraceDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTraceDlg message handlers

BOOL CTraceDlg::OnInitDialog()
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
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CTraceDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CTraceDlg::OnPaint() 
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
HCURSOR CTraceDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CTraceDlg::OnButton1() 
{
	// TODO: Add your control notification handler code here
	/*WSADATA wsa;
	if (WSAStartup(MAKEWORD(2, 0), &wsa) != 0)
  {
    _tprintf(_T("Failed to initialize Winsock 2 Stack\n"));
    return;
  }

  //Print the intro comment
  //_tprintf(_T("\nTracing route to %s\nover a maximum of %d hops:\n\n"), rCmdInfo.m_sHost, rCmdInfo.m_nHopCount);

  //Do the actual trace route
  CTraceRouteReply trr;
  CMyTraceRoute tr;
	
  
  CString host;
  m_hostInput.GetWindowText(host);
  tr.Trace(host,trr,30,30000,3);


  WSACleanup();*/


}
