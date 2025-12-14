// NidsForWinDlg.cpp : implementation file
//

#include "stdafx.h"
#include "NidsForWin.h"
#include "NidsForWinDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "Sniff.h"
#include "SelectAdapter.h"
#include "Analysis.h"

#define TIME_ELAP 1000
#define WM_SYSTRAYNOTIFY (WM_USER + 200)

CSniff Sniffer;
BOOL StatusStop = TRUE;
CAnalysis AnalyPacket;

UINT Thread_Analysis(LPVOID pParam)
{
	CString T_Type,T_Src,T_Dst,T_Time;
	while((!StatusStop))
	{
		Header_Packet Packet;
		if (::Sniffer.GetPacket(Packet))
		{
			if (::AnalyPacket.Check(Packet))
			{
				::Sniffer.ClearSniff();
			}
		}
		else
			Sleep(1);
	}
	return 0;
}

UINT Thread_Sniff(LPVOID pParam)
{
	while((!StatusStop))
	{
		::Sniffer.PacketFromDevice();
	}
	return 0;
}

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
// CNidsForWinDlg dialog

CNidsForWinDlg::CNidsForWinDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CNidsForWinDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CNidsForWinDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CNidsForWinDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CNidsForWinDlg)
	DDX_Control(pDX, IDOK, m_IDOK);
	DDX_Control(pDX, IDC_LIST, m_List);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CNidsForWinDlg, CDialog)
	//{{AFX_MSG_MAP(CNidsForWinDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_DESTROY()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_STOP, OnStop)
	ON_COMMAND(ID_Select_Adap, OnSelectAdap)
	ON_COMMAND(ID_OPEN, OnSysTrayOpen)
	ON_COMMAND(ID_CLOSE, OnSysTrayClose)
	ON_WM_SIZE()
	ON_BN_CLICKED(IDC_PAUSE, OnPause)
	ON_COMMAND(IDSaveAs, OnSaveAs)
	ON_COMMAND(IDSave, OnSave)
	ON_COMMAND(IDOpen, OnOpen)
	ON_COMMAND(IDClearAll, OnClearAll)
	ON_COMMAND(ID_HELP_CONTENTS, OnHelpContents)
	ON_COMMAND(ID_HELP_ABOUT, OnHelpAbout)
	ON_BN_CLICKED(IDOK, OnButton)
	//}}AFX_MSG_MAP
	ON_MESSAGE(WM_SYSTRAYNOTIFY, OnSystrayNotify)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CNidsForWinDlg message handlers

BOOL CNidsForWinDlg::OnInitDialog()
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
	NumberAdapter = -1 ;
	m_notifyIconData.cbSize	= sizeof(NOTIFYICONDATA);
	m_notifyIconData.hWnd	= GetSafeHwnd();
	m_notifyIconData.uID	= IDI_NORMAL;
	m_notifyIconData.uFlags = NIF_ICON | NIF_MESSAGE | NIF_TIP;
	m_notifyIconData.uCallbackMessage = WM_SYSTRAYNOTIFY;
	m_notifyIconData.hIcon	= (HICON) LoadImage(AfxGetApp()->m_hInstance, 
		MAKEINTRESOURCE(IDI_NORMAL), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR); //AfxGetApp()->LoadIcon(IDR_MAINFRAME);
	strcpy(m_notifyIconData.szTip, "Nids For Windows");
//	Shell_NotifyIcon(NIM_ADD, &m_notifyIconData);

	(void)m_List.SetExtendedStyle( LVS_EX_FULLROWSELECT );
	m_List.SetHeadings( _T("Type,120;Source,100;Dest,100;Time,80") );
	m_List.LoadColumnInfo();
	
	FileFlag  = 0 ;
	OpenAdapter = 0 ;
	SetDlgItemText( IDOK , "Start" ) ;
	ButtonFlag = 0 ;
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CNidsForWinDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CNidsForWinDlg::OnDestroy()
{
	WinHelp(0L, HELP_QUIT);
	CDialog::OnDestroy();
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CNidsForWinDlg::OnPaint() 
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
HCURSOR CNidsForWinDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CNidsForWinDlg::OnTimer(UINT nIDEvent) 
{
	CString Type,Src,Dst,Time;
	if (::AnalyPacket.GetResult(Type,Src,Dst,Time))
	{

		(void)m_List.AddItem( _T(Type), _T(Src), _T(Dst) , _T(Time) );

		m_notifyIconData.hIcon	= (HICON) LoadImage(AfxGetApp()->m_hInstance, 
		MAKEINTRESOURCE(IDI_ALERT), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR); //AfxGetApp()->LoadIcon(IDR_MAINFRAME);
//		strcpy(m_notifyIconData.szTip, "Nids For Windows");
		Shell_NotifyIcon(NIM_MODIFY, &m_notifyIconData);
//		::Attack = FALSE;
	}
	// TODO: Add your message handler code here and/or call default
	
	CDialog::OnTimer(nIDEvent);
}

void CNidsForWinDlg::OnStart()
{
	if(::Sniffer.GetStatusPromiscuous() == FALSE )
	{
		UpdateData(FALSE);
		if(::Sniffer.OpenPromiscuous(NumberAdapter))
		{
			SetTimer(1,TIME_ELAP,NULL);
			StatusStop = FALSE;
			MessageBox("Hello") ;
		}
		AfxBeginThread((AFX_THREADPROC)Thread_Analysis,GetSafeHwnd(),THREAD_PRIORITY_IDLE);
		AfxBeginThread((AFX_THREADPROC)Thread_Sniff,GetSafeHwnd(),THREAD_PRIORITY_IDLE);
	}
	
//	CDialog::OnOK();
}

void CNidsForWinDlg::OnCancel() 
{
	KillTimer(1);
	StatusStop = TRUE;
	if ( ::Sniffer.GetStatusPromiscuous() == TRUE )
	{
		char show_buffer[350];
		LONG SumPacket,SumLost;
		::Sniffer.GetStatusPacket(SumPacket,SumLost);
		sprintf(show_buffer,"%ld packets received.\r\n%ld Packets lost.\r\n",SumPacket,SumLost);
		MessageBox(show_buffer);
		UpdateData(FALSE);
		::Sniffer.ClearSniff();
		::Sniffer.ClosePromiscuous();
	}
	Shell_NotifyIcon(NIM_DELETE, &m_notifyIconData);
//	SetWindowPos(&wndTop, 0, 0, 0, 0, SWP_NOMOVE | SWP_HIDEWINDOW | SWP_NOSIZE);
	// TODO: Add extra cleanup here
	
	CDialog::OnCancel();
}

void CNidsForWinDlg::OnStop() 
{
	KillTimer(1);
	StatusStop = TRUE;
	
	// TODO: Add your control notification handler code here
	
}

void CNidsForWinDlg::OnSelectAdap() 
{
	KillTimer(1);
	StatusStop = TRUE;
	if ( ::Sniffer.GetStatusPromiscuous() == TRUE )
	{
		::Sniffer.ClearSniff();
		::Sniffer.ClosePromiscuous();
	}
	CSelectAdapter dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
		NumberAdapter = dlg.GetNumAdapSelect();
		OpenAdapter = 1 ;
		// TODO: Place code here to handle when the dialog is
		//  dismissed with OK
	}
	else if (nResponse == IDCANCEL)
	{
		// TODO: Place code here to handle when the dialog is
		//  dismissed with Cancel
	}
	// TODO: Add your command handler code here
	
	SetDlgItemText( IDOK , "Start") ;
}

LONG CNidsForWinDlg::OnSystrayNotify(WPARAM wParam, LPARAM lParam)
{
	POINT pt;
	CMenu menu;
	CMenu* subMenu;

	switch(lParam)
	{
		case WM_LBUTTONDBLCLK:
			OnSysTrayOpen();
		break;

		case WM_RBUTTONUP:
			::GetCursorPos(&pt);
			menu.LoadMenu(IDR_MENUTRAY);
			subMenu = menu.GetSubMenu(0);
			subMenu->SetDefaultItem(0, TRUE);
			subMenu->TrackPopupMenu(TPM_LEFTBUTTON | TPM_RIGHTBUTTON | TPM_LEFTALIGN,
								pt.x, pt.y, this, NULL);
			menu.DestroyMenu();
			break;

		default:
			return FALSE;
	}

	return 0;

}

void CNidsForWinDlg::OnSysTrayOpen()
{
	SetWindowPos(&wndTop, 0, 0, 0, 0, SWP_NOMOVE | SWP_SHOWWINDOW | SWP_NOSIZE);
	ShowWindow(SW_RESTORE);
	Shell_NotifyIcon(NIM_DELETE, &m_notifyIconData);

}

void CNidsForWinDlg::OnSysTrayClose()
{
	Shell_NotifyIcon(NIM_DELETE, &m_notifyIconData);
	PostMessage(WM_QUIT, 0, 0);
	CNidsForWinDlg::OnCancel();

}

void CNidsForWinDlg::OnSize(UINT nType, int cx, int cy) 
{
	switch(nType)
	{
		case SIZE_MINIMIZED :
			m_notifyIconData.hIcon	= (HICON) LoadImage(AfxGetApp()->m_hInstance, 
			MAKEINTRESOURCE(IDI_NORMAL), IMAGE_ICON, 16, 16, LR_DEFAULTCOLOR); //AfxGetApp()->LoadIcon(IDR_MAINFRAME);
			Shell_NotifyIcon(NIM_ADD, &m_notifyIconData);
			SetWindowPos(&wndTop, 0, 0, 0, 0, SWP_NOMOVE | SWP_HIDEWINDOW | SWP_NOSIZE);
		break;
	}

	CDialog::OnSize(nType, cx, cy);
	
	// TODO: Add your message handler code here
	
}


void CNidsForWinDlg::OnPause() 
{
	// TODO: Add your control notification handler code here
	
}

void CNidsForWinDlg::OnSaveAs() 
{
	int n_Item ;
	CString buffer ;
		
	CFileDialog fd(FALSE , NULL , NULL , OFN_OVERWRITEPROMPT ,"NIDS Log *.log||") ;
	fd.DoModal() ;
	fname = fd.GetPathName() ;
	if ( (fname.GetLength( ) ) != 0)
	{
			CStdioFile logFile( fname , CFile::modeCreate | CFile::modeWrite ) ;
			logFile.WriteString( "NIDS Log File\n" ) ;				// Header file 
			n_Item = m_List.GetItemCount() ;
			for(int i=0 ; i < n_Item ; i++)
			{
					buffer = m_List.GetItemText(i,0)  ;
					buffer += '#' ;
					buffer += m_List.GetItemText(i,1)  ;
					buffer += '#' ;
					buffer += m_List.GetItemText(i,2)  ;
					buffer += '#' ;
					buffer += m_List.GetItemText(i,3)  ;
					buffer += '\n' ;
					logFile.WriteString( buffer ) ;	
				}
			FileFlag = 1 ;
			logFile.Close() ;
	}
}

void CNidsForWinDlg::OnSave() 
{
	int n_Item ;
	CString buffer ;

	if (FileFlag == 1)
	{
			CStdioFile logFile( fname , CFile::modeCreate | CFile::modeWrite ) ;
			logFile.WriteString( "NIDS Log File\n" ) ;				// Header file 
			n_Item = m_List.GetItemCount() ;
			for(int i=0 ; i < n_Item ; i++)
			{
					buffer = m_List.GetItemText(i,0)  ;
					buffer += '#' ;
					buffer += m_List.GetItemText(i,1)  ;
					buffer += '#' ;
					buffer += m_List.GetItemText(i,2)  ;
					buffer += '#' ;
					buffer += m_List.GetItemText(i,3)  ;
					buffer += '\n' ;
					logFile.WriteString( buffer ) ;	
				}
			logFile.Close() ;
	}
	else
	{
			OnSaveAs() ;
	}
}

void CNidsForWinDlg::OnOpen() 
{
	CString Lfname ;
	CString buffer ;
	CString Type ;
	CString Source ;
	CString Destination ;
	CString Time ;
	int i , iNew ;
	
	CFileDialog fd(FALSE , NULL , NULL , NULL ,"NIDS Log *.log||") ;
	fd.DoModal() ;
	Lfname = fd.GetPathName() ;
	CStdioFile logFile( Lfname , CFile::modeRead ) ;
	logFile.ReadString( buffer ) ;
	if ( buffer == "NIDS Log File" )		// as NIDS log file format ?
	{
		logFile.ReadString( buffer ) ;
		while ( ! feof( logFile.m_pStream) )
		{
				i = buffer.Find( '#' , 0 ) ;
				Type = buffer.Mid( 0 , i ) ;
				iNew = buffer.Find( '#' , i+1 ) ;
				Source = buffer.Mid( i+1 , iNew - i - 1 ) ;
				i = iNew ;
				iNew = buffer.Find( '#' , i+1 ) ;
				Destination = buffer.Mid( i+1 , iNew - i - 1 ) ;
				i = iNew ;
				Time = buffer.Mid( i+1 ) ;
				(void)m_List.AddItem( _T( Type ), _T( Source ), _T( Destination ) , _T( Time ) );
				logFile.ReadString( buffer ) ;
		}
		logFile.Close() ;
	}
	
}

void CNidsForWinDlg::OnClearAll() 
{
		m_List.DeleteAllItems() ;	
}

void CNidsForWinDlg::OnHelpContents() 
{
	
		OnHelp( );
}

void CNidsForWinDlg::OnHelpAbout() 
{
		CAboutDlg  About ;
		About.DoModal() ;
}

void CNidsForWinDlg::OnButton() 
{
	if(OpenAdapter == 0)
	{
		MessageBox("Please Select Device first !!") ;
		OnSelectAdap() ;
	}
	else
	{
			if(ButtonFlag == 0)	
			{
					SetDlgItemText( IDOK , "Stop" ) ;
					OnStart() ;
					ButtonFlag = 1 ;
			}
			else
			{
					SetDlgItemText( IDOK , "Start" ) ;
					OnStop() ;
					ButtonFlag = 0 ;
			}
	}
	
}
