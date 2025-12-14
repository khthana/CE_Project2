// FirewallServer.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "FirewallServer.h"
#include "FirewallServerDlg.h"
#include "masteragent.h"
#include "DBpartDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFirewallServerApp

BEGIN_MESSAGE_MAP(CFirewallServerApp, CWinApp)
	//{{AFX_MSG_MAP(CFirewallServerApp)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirewallServerApp construction

CFirewallServerApp::CFirewallServerApp()
{
	// TODO: add construction code here,
	// Place all significant initialization in InitInstance
	m_pMasterAgent = new CMasterAgent();
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CFirewallServerApp object

CFirewallServerApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CFirewallServerApp initialization

BOOL CFirewallServerApp::InitInstance()
{
	if (!AfxSocketInit())
	{
		AfxMessageBox(IDP_SOCKETS_INIT_FAILED);
		return FALSE;
	}

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

    m_db.Open(_T("PFdb"),FALSE);// PFdb is the Data Source name defineed in ODBC
	m_pMasterAgent->GoOnline(MASTER_PORT);
	
	
	CDBpartDlg dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
	}
	else if (nResponse == IDCANCEL)
	{
	}
	return FALSE;
}

void CFirewallServerApp::SendRuleSet(CString clientIP)
{
    
	m_pMasterAgent->SendRuleSet(clientIP);
}

void CFirewallServerApp::StopFilter(CString clientIP)
{
	m_pMasterAgent->SendCommand(clientIP, SLAVE_PORT,
		"STOP_FILTER_REQUEST");
}

void CFirewallServerApp::SendLogRequest(CString clientIP)
{
	m_pMasterAgent->SendCommand(clientIP, SLAVE_PORT,
		"LOG_REQUEST");
}
