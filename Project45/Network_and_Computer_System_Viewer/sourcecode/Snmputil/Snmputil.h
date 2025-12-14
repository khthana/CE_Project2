// Snmputil.h : main header file for the SNMPUTIL application
//

#if !defined(AFX_SNMPUTIL_H__7F2CF751_AD1F_4B66_8E3C_32C3BE75B0E2__INCLUDED_)
#define AFX_SNMPUTIL_H__7F2CF751_AD1F_4B66_8E3C_32C3BE75B0E2__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CSnmputilApp:
// See Snmputil.cpp for the implementation of this class
//

class CSnmputilApp : public CWinApp
{
public:
	CSnmputilApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSnmputilApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CSnmputilApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SNMPUTIL_H__7F2CF751_AD1F_4B66_8E3C_32C3BE75B0E2__INCLUDED_)
