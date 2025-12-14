// PersonalFirewall.h : main header file for the PERSONALFIREWALL application
//

#if !defined(AFX_PERSONALFIREWALL_H__E7E33217_E6C9_4E82_82B1_AC968160332A__INCLUDED_)
#define AFX_PERSONALFIREWALL_H__E7E33217_E6C9_4E82_82B1_AC968160332A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CPersonalFirewallApp:
// See PersonalFirewall.cpp for the implementation of this class
//

class CPersonalFirewallApp : public CWinApp
{
public:
	CPersonalFirewallApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPersonalFirewallApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CPersonalFirewallApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PERSONALFIREWALL_H__E7E33217_E6C9_4E82_82B1_AC968160332A__INCLUDED_)
