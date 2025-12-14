// Basic.cpp : Defines the class behaviors for the application.
//

#include "stdafx.h"
#include "Basic.h"
#include "BasicDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CBasicApp

BEGIN_MESSAGE_MAP(CBasicApp, CWinApp)
	//{{AFX_MSG_MAP(CBasicApp)
	//}}AFX_MSG
	ON_COMMAND(ID_HELP, CWinApp::OnHelp)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CBasicApp construction

CBasicApp::CBasicApp()
{
}

/////////////////////////////////////////////////////////////////////////////
// The one and only CBasicApp object

CBasicApp theApp;

/////////////////////////////////////////////////////////////////////////////
// CBasicApp initialization

BOOL CBasicApp::InitInstance()
{
	// Standard initialization

#ifdef _AFXDLL
	Enable3dControls();			// Call this when using MFC in a shared DLL
#else
	Enable3dControlsStatic();	// Call this when linking to MFC statically
#endif

	CBasicDlg dlg;
	m_pMainWnd = &dlg;
	int nResponse = dlg.DoModal();
	if (nResponse == IDOK)
	{
	}
	else if (nResponse == IDCANCEL)
	{
	}

	// Since the dialog has been closed, return FALSE so that we exit the
	//  application, rather than start the application's message pump.
	return FALSE;
}
