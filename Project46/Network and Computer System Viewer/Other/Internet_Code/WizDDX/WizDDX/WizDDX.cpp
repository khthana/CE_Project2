// WizDDX.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "WizDDX.h"

#include "MainFrm.h"
#include "WizDDXDoc.h"
#include "WizDDXView.h"

#include "WizardSheet.h"
#include "WizardPage.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWizDDXApp

BEGIN_MESSAGE_MAP(CWizDDXApp, CWinApp)
	//{{AFX_MSG_MAP(CWizDDXApp)
	ON_COMMAND(ID_APP_ABOUT, OnAppAbout)
	ON_COMMAND(ID_APP_WIZARD, OnAppWizard)
	//}}AFX_MSG_MAP
	// Standard file based document commands
	ON_COMMAND(ID_FILE_NEW, CWinApp::OnFileNew)
	ON_COMMAND(ID_FILE_OPEN, CWinApp::OnFileOpen)
	// Standard print setup command
	ON_COMMAND(ID_FILE_PRINT_SETUP, CWinApp::OnFilePrintSetup)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizDDXApp construction

CWizDDXApp::CWizDDXApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CWizDDXApp object

CWizDDXApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CWizDDXApp initialization

BOOL CWizDDXApp::InitInstance()
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

	CSingleDocTemplate* pDocTemplate;
	pDocTemplate = new CSingleDocTemplate(
		IDR_MAINFRAME,
		RUNTIME_CLASS(CWizDDXDoc),
		RUNTIME_CLASS(CMainFrame),       // main SDI frame window
		RUNTIME_CLASS(CWizDDXView));
	AddDocTemplate(pDocTemplate);

	// Parse command line for standard shell commands, DDE, file open
	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);

	// Dispatch commands specified on the command line
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;

	// The one and only window has been initialized, so show and update it.
	m_pMainWnd->ShowWindow(SW_SHOW);
	m_pMainWnd->UpdateWindow();

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
void CWizDDXApp::OnAppAbout()
{
	CAboutDlg aboutDlg;
	aboutDlg.DoModal();
}

/////////////////////////////////////////////////////////////////////////////
// CWizDDXApp message handlers


void CWizDDXApp::OnAppWizard() 
{
	// TODO: Add your command handler code here
	   CString strLabel=_T(""),strCountry=_T("CA"),strOrganization=_T("");
       CString strUnit=_T(""),strCommonName=_T(""),strEmail=_T(""),strURL=_T("");
	   bool email,file,server,client,software,timestampe,certlist;
	   CString strKeySize=_T(""),strPassword=_T(""),strPassword2=_T("");
	   CDTPickerEx TimeBegin, TimeEnd;


	  CWizardSheet MakeCertSheet(IDS_CREATE_CERT, NULL, 0, NULL, NULL, NULL);
      CWizardPage  MakeCertPages[3];
	  for(int n=0; n<3; n++) {

		 MakeCertPages[n].Construct(1601+n, IDS_CREATE_CERT, IDS_STEP1+n, 0);
	  }

	   BEGIN_DDX_MAP(MakeCert)
			  DDX_ENTRY(MakeCertPages[0], IDC_LABEL, Edit, strLabel)
			  DDX_ENTRY(MakeCertPages[0], 1000, CheckBox, email)
	          DDX_ENTRY(MakeCertPages[0], 1001, CheckBox, file)
			  DDX_ENTRY(MakeCertPages[0], 1002, CheckBox, server)
			  DDX_ENTRY(MakeCertPages[0], 1004, CheckBox, client)
			  DDX_ENTRY(MakeCertPages[0], 1005, CheckBox, software)
			  DDX_ENTRY(MakeCertPages[0], 1006, CheckBox, timestampe)
			  DDX_ENTRY(MakeCertPages[0], 1007, CheckBox, certlist)
			  DDX_ENTRY(MakeCertPages[0], IDC_KEYSIZE, ComboBoxTxt, strKeySize)
			  DDX_ENTRY(MakeCertPages[1], IDC_COUNTRY, Edit, strCountry)
			  DDX_ENTRY(MakeCertPages[1], IDC_ORGANIZATION, Edit, strOrganization)
			  DDX_ENTRY(MakeCertPages[1], IDC_UNIT, Edit, strUnit)
			  DDX_ENTRY(MakeCertPages[1], IDC_COMMONNAME, Edit, strCommonName)
			  DDX_ENTRY(MakeCertPages[1], IDC_EMAIL, Edit, strEmail)
			  DDX_ENTRY(MakeCertPages[1], IDC_URL, Edit, strURL)
			  DDX_ENTRY(MakeCertPages[2], IDC_PASSWORD1, Edit, strPassword)
			  DDX_ENTRY(MakeCertPages[2], IDC_PASSWORD2, Edit, strPassword2)
			  DDX_ENTRY(MakeCertPages[2], IDC_DTPICKER_BEGIN, DateTimePicker, TimeBegin)
			  DDX_ENTRY(MakeCertPages[2], IDC_DTPICKER_END, DateTimePicker, TimeEnd)

	   END_DDX_MAP()
       
	  ASSOCIATE_DDX_MAP(MakeCertSheet,MakeCert);

	  for(n=0; n<3; n++) {

		   MakeCertSheet.AddPage(&MakeCertPages[n]);
	  }

      if(MakeCertSheet.DoModal())
	  {//Get all values...

	  }
	
}
