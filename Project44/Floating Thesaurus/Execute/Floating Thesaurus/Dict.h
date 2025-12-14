// Dict.h : main header file for the DICT application
//

#if !defined(AFX_DICT_H__106A08FE_B192_47B1_B327_D80E951A10A5__INCLUDED_)
#define AFX_DICT_H__106A08FE_B192_47B1_B327_D80E951A10A5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CDictApp:
// See Dict.cpp for the implementation of this class
//

class CDictApp : public CWinApp
{
public:
	CDictApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDictApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CDictApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DICT_H__106A08FE_B192_47B1_B327_D80E951A10A5__INCLUDED_)
