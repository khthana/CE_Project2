// DlgProxy.cpp : implementation file
//

#include "stdafx.h"
#include "Test.h"
#include "DlgProxy.h"
#include "TestDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTestDlgAutoProxy

IMPLEMENT_DYNCREATE(CTestDlgAutoProxy, CCmdTarget)

CTestDlgAutoProxy::CTestDlgAutoProxy()
{
	EnableAutomation();
	
	// To keep the application running as long as an automation 
	//	object is active, the constructor calls AfxOleLockApp.
	AfxOleLockApp();

	// Get access to the dialog through the application's
	//  main window pointer.  Set the proxy's internal pointer
	//  to point to the dialog, and set the dialog's back pointer to
	//  this proxy.
	ASSERT (AfxGetApp()->m_pMainWnd != NULL);
	ASSERT_VALID (AfxGetApp()->m_pMainWnd);
	ASSERT_KINDOF(CTestDlg, AfxGetApp()->m_pMainWnd);
	m_pDialog = (CTestDlg*) AfxGetApp()->m_pMainWnd;
	m_pDialog->m_pAutoProxy = this;
}

CTestDlgAutoProxy::~CTestDlgAutoProxy()
{
	// To terminate the application when all objects created with
	// 	with automation, the destructor calls AfxOleUnlockApp.
	//  Among other things, this will destroy the main dialog
	if (m_pDialog != NULL)
		m_pDialog->m_pAutoProxy = NULL;
	AfxOleUnlockApp();
}

void CTestDlgAutoProxy::OnFinalRelease()
{
	// When the last reference for an automation object is released
	// OnFinalRelease is called.  The base class will automatically
	// deletes the object.  Add additional cleanup required for your
	// object before calling the base class.

	CCmdTarget::OnFinalRelease();
}

BEGIN_MESSAGE_MAP(CTestDlgAutoProxy, CCmdTarget)
	//{{AFX_MSG_MAP(CTestDlgAutoProxy)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BEGIN_DISPATCH_MAP(CTestDlgAutoProxy, CCmdTarget)
	//{{AFX_DISPATCH_MAP(CTestDlgAutoProxy)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_DISPATCH_MAP
END_DISPATCH_MAP()

// Note: we add support for IID_ITest to support typesafe binding
//  from VBA.  This IID must match the GUID that is attached to the 
//  dispinterface in the .ODL file.

// {D831AA5D-4B78-46E9-839E-F3709A273D46}
static const IID IID_ITest =
{ 0xd831aa5d, 0x4b78, 0x46e9, { 0x83, 0x9e, 0xf3, 0x70, 0x9a, 0x27, 0x3d, 0x46 } };

BEGIN_INTERFACE_MAP(CTestDlgAutoProxy, CCmdTarget)
	INTERFACE_PART(CTestDlgAutoProxy, IID_ITest, Dispatch)
END_INTERFACE_MAP()

// The IMPLEMENT_OLECREATE2 macro is defined in StdAfx.h of this project
// {319FB3B4-0D2D-4539-A282-8729ACA8B0EA}
IMPLEMENT_OLECREATE2(CTestDlgAutoProxy, "Test.Application", 0x319fb3b4, 0xd2d, 0x4539, 0xa2, 0x82, 0x87, 0x29, 0xac, 0xa8, 0xb0, 0xea)

/////////////////////////////////////////////////////////////////////////////
// CTestDlgAutoProxy message handlers
