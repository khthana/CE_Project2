// NidsForWin.h : main header file for the NIDSFORWIN application
//

#if !defined(AFX_NIDSFORWIN_H__85B3CDA5_8F37_4442_A65B_0391A3AC46C6__INCLUDED_)
#define AFX_NIDSFORWIN_H__85B3CDA5_8F37_4442_A65B_0391A3AC46C6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CNidsForWinApp:
// See NidsForWin.cpp for the implementation of this class
//

class CNidsForWinApp : public CWinApp
{
public:
	CNidsForWinApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNidsForWinApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CNidsForWinApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NIDSFORWIN_H__85B3CDA5_8F37_4442_A65B_0391A3AC46C6__INCLUDED_)
