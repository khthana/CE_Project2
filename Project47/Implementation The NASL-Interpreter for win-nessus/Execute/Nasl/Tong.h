// Tong.h : main header file for the TONG application
//

#if !defined(AFX_TONG_H__BB9C5C23_EBAE_4FC1_B396_C6EF177A4CC0__INCLUDED_)
#define AFX_TONG_H__BB9C5C23_EBAE_4FC1_B396_C6EF177A4CC0__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CTongApp:
// See Tong.cpp for the implementation of this class
//

class CTongApp : public CWinApp
{
public:	
	CTongApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTongApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CTongApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TONG_H__BB9C5C23_EBAE_4FC1_B396_C6EF177A4CC0__INCLUDED_)
