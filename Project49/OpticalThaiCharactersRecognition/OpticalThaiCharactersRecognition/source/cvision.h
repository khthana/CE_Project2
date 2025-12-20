// cvision.h : main header file for the CVISION application
//

#if !defined(AFX_CVISION_H__668CCB86_1BC5_47C2_B797_8F00C520024B__INCLUDED_)
#define AFX_CVISION_H__668CCB86_1BC5_47C2_B797_8F00C520024B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CCvisionApp:
// See cvision.cpp for the implementation of this class
//

class CCvisionApp : public CWinApp
{
public:
	CCvisionApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CCvisionApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CCvisionApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CVISION_H__668CCB86_1BC5_47C2_B797_8F00C520024B__INCLUDED_)
