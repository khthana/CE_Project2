// WizDDX.h : main header file for the WIZDDX application
//

#if !defined(AFX_WIZDDX_H__1BB96804_24D2_4ED3_B7D6_8F1942261D21__INCLUDED_)
#define AFX_WIZDDX_H__1BB96804_24D2_4ED3_B7D6_8F1942261D21__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CWizDDXApp:
// See WizDDX.cpp for the implementation of this class
//

class CWizDDXApp : public CWinApp
{
public:
	CWizDDXApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizDDXApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CWizDDXApp)
	afx_msg void OnAppAbout();
	afx_msg void OnAppWizard();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WIZDDX_H__1BB96804_24D2_4ED3_B7D6_8F1942261D21__INCLUDED_)
