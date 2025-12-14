// first.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "first.h"

#include "MainFrm.h"
#include "ChildFrm.h"
#include "firstDoc.h"
#include "firstView.h"
#include "DirDlg.h"
#include "ProgressDlg.h"
#include <io.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFirstApp

BEGIN_MESSAGE_MAP(CFirstApp, CWinApp)
	//{{AFX_MSG_MAP(CFirstApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	ON_COMMAND(ID_LIST_OPEN, OnListOpen)
	//}}AFX_MSG_MAP
	// Standard file based document commands
	ON_COMMAND(ID_FILE_NEW, CWinApp::OnFileNew)
	ON_COMMAND(ID_FILE_OPEN, CWinApp::OnFileOpen)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirstApp construction

CFirstApp::CFirstApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CFirstApp object

CFirstApp theApp;
int file_count=0;
CString file_path[30];
CString prog_path,pic_path;
//POSITION p;
int event =0;
BOOL open_list;

int threshold,full_threshold;
int grad[1000][700];
int H[256],His[256];
int row[1000];
int col[1000];
int stand[1000][1000];
int output[50][50];
int pc[100];
int ur[50][50];
int dr[50][50];
int tr[50];
int success = 0;
int l,r,u,d,tc;


/////////////////////////////////////////////////////////////////////////////
// CFirstApp initialization

BOOL CFirstApp::InitInstance()
{
	AfxEnableControlContainer();

	// Standard initialization
	// If you are not using these features and wish to reduce the size
	//  of your final executable, you should remove from the following
	//  the specific initialization routines you do not need.

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when linking to MFC statically
#endif

	// Change the registry key under which our settings are stored.
	// TODO: You should modify this string to be something appropriate
	// such as the name of your company or organization.
	SetRegistryKey(_T("Local AppWizard-Generated Applications"));

	LoadStdProfileSettings();  // Load standard INI file options (including MRU)

	// Register the application's document templates.  Document templates
	//  serve as the connection between documents, frame windows and views.

	CMultiDocTemplate* pDocTemplate;
	pDocTemplate = new CMultiDocTemplate(
		IDR_FIRSTTYPE,
		RUNTIME_CLASS(CFirstDoc),
		RUNTIME_CLASS(CChildFrame), // custom MDI child frame
		RUNTIME_CLASS(CFirstView));
	AddDocTemplate(pDocTemplate);

	// create main MDI Frame window
	CMainFrame* pMainFrame = new CMainFrame;
	if (!pMainFrame->LoadFrame(IDR_MAINFRAME))
		return FALSE;
	m_pMainWnd = pMainFrame;

	// Parse command line for standard shell commands, DDE, file open
	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);

	// Dispatch commands specified on the command line
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;

	// The main window has been initialized, so show and update it.
	pMainFrame->ShowWindow(SW_SHOWMAXIMIZED);
	pMainFrame->UpdateWindow();

	char p[50];
	::GetCurrentDirectory(50,p);
	prog_path=p;
	open_list = FALSE;

	return TRUE;
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
		// No message handlers
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

// App command to run the dialog
void CFirstApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

/////////////////////////////////////////////////////////////////////////////
// CFirstApp message handlers


void CFirstApp::OnListOpen() 
{
	DirDlg dirdlg;
	file_count=0;
	event=0;
	//start at directory which program run
	::SetCurrentDirectory(prog_path);
	
	struct _finddata_t c_file;
	long hFile;

	if (dirdlg.DoModal()==IDOK)
	{
		// Find first .c file in current directory
		if( (hFile = _findfirst("*.bmp", &c_file )) == -1L )
			AfxMessageBox("No *.bmp files in this directory!" );
		else
		{
			open_list = TRUE;
			file_path[file_count]=pic_path;
			file_path[file_count]+="\\";
			file_path[file_count]+=c_file.name;
			//AfxMessageBox(file_path[file_count]);
			file_count=file_count+1;
			// Find the rest of the .bmp files
			while(_findnext(hFile, &c_file) == 0 )
	        {
				file_path[file_count]=pic_path;
				file_path[file_count]+="\\";
				file_path[file_count]+=c_file.name;
				file_count=file_count+1;
			}
			_findclose( hFile );
			if (file_count > 0)
			{
				ProgressDlg progressdlg;
				progressdlg.DoModal();
			}
		}

		//set to program path again
		::SetCurrentDirectory(prog_path);
	}
	
}



/*void CFirstApp::OnGo() 
{
	//extern BOOL open_list;
	//extern int file_count;
	//extern CString file_path[30];
	//extern int event;


	if (open_list)
	{
		while (event < file_count)
		{	
			if (hDIB != NULL)
			{
				::GlobalFree((HGLOBAL) hDIB);
			}
			if (pPalDIB != NULL)
			{
				delete pPalDIB;
			}
			
			file_name = file_path[event];
			//open first file in list
			::LoadBMP(file_path[event],&hDIB,pPalDIB,&bmHeight,&bmWidth);

			OnExecute();
			//point to next file
			event = event+1;
		}
		if (event == file_count)
		{
			open_list=FALSE;
			event = 0;
			file_count =0;
			CAboutDlg aboutDlg;
			aboutDlg.DoModal();
		}
	}
}*/

/*void CFirstApp::OnExecute()
{
	extern int l,r,u,d,threshold;
	extern int stand[1000][1000],tr[50];
	CPoint start_point,end_point;
	CPoint point;
	int width,height;
	
	start_point.x=0;
	start_point.y=0;
	end_point.x=bmWidth-1;
	end_point.y=bmHeight-1;
	
	int x1,x2,y1,y2,i1,j1;
	
	for (i1=0;i1<=50;i1++) tr[i1]=0;

	for (i1=0;i1<1000;i1++)
		for (j1=0;j1<1000;j1++)
			stand[i1][j1]=9;


	x1 = start_point.x;
	x2 = end_point.x;
	y1 = start_point.y;
	y2 = end_point.y;

	l=x1;
	r=x2;
	u=y1;
	d=y2;

	

	threshold = ::findThreshold(hDIB,pPalDIB,x1,x2,y1,y2,2,2);
	::Binarization1(hDIB,pPalDIB,x1,x2,y1,y2);

	//Invalidate();

	::Find_Col(hDIB,pPalDIB);
//	::Find_Row();
//	::Total_Row();
//	Print_col(pDoc->hDIB);
	
//	Print_cr(pDoc->hDIB);

	::Initial_stand();	
	::Sub_Exe(hDIB,pPalDIB);
//	Invalidate();
	::Find_Row();

	::Total_Row();

//	Print_col(pDoc-> hDIB);
//	Print_cr(pDoc-> hDIB);


	::Binary_Row(hDIB,pPalDIB,file_name);

	/*BOOL success;
	success = WriteDIB(pDoc->hDIB);
	if (success == false)
		AfxMessageBox("Can not write bitmap");*/

/*}*/
