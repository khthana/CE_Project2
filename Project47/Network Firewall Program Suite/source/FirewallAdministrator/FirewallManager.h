// FirewallManager.h : main header file for the FIREWALLMANAGER application
//

#if !defined(AFX_FIREWALLMANAGER_H__8318DA59_1BF8_482D_A219_CE3C7CA789E8__INCLUDED_)
#define AFX_FIREWALLMANAGER_H__8318DA59_1BF8_482D_A219_CE3C7CA789E8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CFirewallManagerApp:
// See FirewallManager.cpp for the implementation of this class
//

class CFirewallManagerApp : public CWinApp
{
public:
	CFirewallManagerApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallManagerApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CFirewallManagerApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLMANAGER_H__8318DA59_1BF8_482D_A219_CE3C7CA789E8__INCLUDED_)
