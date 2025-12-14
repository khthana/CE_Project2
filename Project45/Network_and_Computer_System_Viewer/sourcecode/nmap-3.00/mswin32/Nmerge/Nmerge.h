// Nmerge.h : main header file for the NMERGE application
//

#if !defined(AFX_NMERGE_H__AB7BC081_5BB9_4891_B343_72B90A494609__INCLUDED_)
#define AFX_NMERGE_H__AB7BC081_5BB9_4891_B343_72B90A494609__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CNmergeApp:
// See Nmerge.cpp for the implementation of this class
//

class CNmergeApp : public CWinApp
{
public:
	CNmergeApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNmergeApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CNmergeApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NMERGE_H__AB7BC081_5BB9_4891_B343_72B90A494609__INCLUDED_)
