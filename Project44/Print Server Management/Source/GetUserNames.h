// GetUserNames.h : main header file for the GETUSERNAMES application
//

#if !defined(AFX_GETUSERNAMES_H__36706990_444A_11D5_9EAD_000102FB9990__INCLUDED_)
#define AFX_GETUSERNAMES_H__36706990_444A_11D5_9EAD_000102FB9990__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CGetUserNamesApp:
// See GetUserNames.cpp for the implementation of this class
//

class CGetUserNamesApp : public CWinApp
{
public:
	CGetUserNamesApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CGetUserNamesApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CGetUserNamesApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_GETUSERNAMES_H__36706990_444A_11D5_9EAD_000102FB9990__INCLUDED_)
