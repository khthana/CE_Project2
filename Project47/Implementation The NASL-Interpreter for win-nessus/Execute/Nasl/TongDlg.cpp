// TongDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Tong.h"
#include "TongDlg.h"
#include <process.h>
#include <direct.h>
#include <stdlib.h>
#include <string.h>
#include <Winbase.h>
#include <Afxwin.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

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
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTongDlg dialog

CTongDlg::CTongDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CTongDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTongDlg)
	m_Edit_Str = _T("");
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CTongDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTongDlg)
	DDX_Control(pDX, IDC_EDIT1, m_Edit_Con);
	DDX_Text(pDX, IDC_EDIT1, m_Edit_Str);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CTongDlg, CDialog)
	//{{AFX_MSG_MAP(CTongDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDPARSE, OnParse)
	ON_BN_CLICKED(IDEXIT, OnExit)
	ON_BN_CLICKED(IDC_OPEN, OnOpen)
	ON_BN_CLICKED(IDC_LEX_FILE, OnLexFile)
	ON_BN_CLICKED(IDC_PARSE_FILE, OnParseFile)
	ON_BN_CLICKED(IDC_TREE_FILE, OnTreeFile)
	ON_BN_CLICKED(IDC_SCRIPT_FILE, OnScriptFile)
	ON_COMMAND(IDM_ABOUT, OnAbout)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTongDlg message handlers

BOOL CTongDlg::OnInitDialog()
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
	//------------------------
	menu.LoadMenu(IDR_MENU1);
	SetMenu(&menu);
	menu.Detach();
	//------------------------
	/*
	char dirname[_MAX_PATH];
	if(_getcwd(dirname, _MAX_PATH)==NULL)
		MessageBox("_getcwd error");
	else
	{
		strcat(dirname,"Debug");
		_chdir( dirname);
	}
	*/
	//----------------------------------------------------------------
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CTongDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CTongDlg::OnPaint() 
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
HCURSOR CTongDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CTongDlg::OnParse() 
{
	// TODO: Add your control notification handler code here
    int id = m_Edit_Con.GetDlgCtrlID();
	char path[255]; 
	if(m_Edit_Con.GetWindowTextLength() != 0)		
	{
	GetDlgItemText(id,path,255);
	
	//pdest = strchr( string, ch );
	int ch = '\\';
	char * file = strrchr(path,ch);
	file++;
	//MessageBox(file);		
	//_spawnlp(_P_NOWAIT,"Show_parse_tree","Show_parse_tree",file,NULL);	
	//--------------------------------------------------
	STARTUPINFO	si;
	PROCESS_INFORMATION pi;
	GetStartupInfo(&si);

	/*	The system does not display the general-protection-fault message box.
	This flag should only be set by debugging applications that handle 
	general protection (GP) faults themselves with an exception handler.*/	
	//SetErrorMode(SEM_NOGPFAULTERRORBOX);
	//-------------------------------------
	CString cmd = "Show_parse_tree ";
	cmd+= file;
		
	
	CreateProcess(NULL,cmd.GetBuffer(0),
			NULL,
			NULL,
			FALSE,
			CREATE_NO_WINDOW,        //will be CREATE_NO_WINDOW
			"Tong",
			NULL,
			&si,
			&pi);	
	//--------------------------------------------------
	//WinExec("Show_parse_tree",SW_SHOWNORMAL);
	//MessageBox(GetCommandLine ());
	MessageBox( "          Done.", "NASL-Interpret", MB_OK );

	//MessageBox("Done.");
	}
	else
	MessageBox("Please Select Script File!!", "NASL-Interpret", MB_OK );
	
}

void CTongDlg::OnExit() 
{
	this->EndDialog(0);	
}

void CTongDlg::OnOpen() 
{
	CFileDialog fd(TRUE,NULL,NULL,OFN_HIDEREADONLY,"ALL File (*.*)|*.*||");
	if(fd.DoModal()==IDOK){
		CString pName = fd.GetPathName();
		int id = m_Edit_Con.GetDlgCtrlID();
		SetDlgItemText(id,pName);
	}	
}

void CTongDlg::OnLexFile() 
{
	
	  _spawnlp(_P_NOWAIT,"gvim","gvim","lexer_act.txt",NULL);
}

void CTongDlg::OnParseFile() 
{
	  _spawnlp(_P_NOWAIT,"gvim","gvim","parser_act.txt",NULL);
	
}

void CTongDlg::OnTreeFile() 
{
	  _spawnlp(_P_NOWAIT,"gvim","gvim","output.txt",NULL);
	
}

void CTongDlg::OnScriptFile() 
{
	int id = m_Edit_Con.GetDlgCtrlID();
	char path[255]; 
	if(m_Edit_Con.GetWindowTextLength() != 0)		
	{
	  GetDlgItemText(id,path,255);
	  int ch = '\\';
	  char * file = strrchr(path,ch);
	  file++;
	  //MessageBox(file);
	  _spawnlp(_P_NOWAIT,"gvim","gvim",file,"-c","\"set nu\"",NULL);
	}
	else
	MessageBox("Please Select Script File!!", "NASL-Interpret", MB_OK );

	
}

void CTongDlg::OnAbout() 
{
	CAboutDlg adlg;
	CString str;
	//SetDlgItemText(IDC_EDIT_ABOUT,"test");
	adlg.DoModal();  
  
}


