// DibV1.h : main header file for the DIBV1 application
//

#if !defined(AFX_DIBV1_H__486383F4_B1CE_4507_BE1D_2279ACB64FF9__INCLUDED_)
#define AFX_DIBV1_H__486383F4_B1CE_4507_BE1D_2279ACB64FF9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CDibV1App:
// See DibV1.cpp for the implementation of this class
//

class CDibV1App : public CWinApp
{
public:
	CDibV1App();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDibV1App)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CDibV1App)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DIBV1_H__486383F4_B1CE_4507_BE1D_2279ACB64FF9__INCLUDED_)
