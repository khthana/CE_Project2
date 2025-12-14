// Project1.h : main header file for the PROJECT1 application
//

#if !defined(AFX_PROJECT1_H__C17F6FA5_01F4_11D5_B914_FA9A480DD735__INCLUDED_)
#define AFX_PROJECT1_H__C17F6FA5_01F4_11D5_B914_FA9A480DD735__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CProject1App:
// See Project1.cpp for the implementation of this class
//

class CProject1App : public CWinApp
{
public:
	CProject1App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProject1App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CProject1App)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROJECT1_H__C17F6FA5_01F4_11D5_B914_FA9A480DD735__INCLUDED_)
