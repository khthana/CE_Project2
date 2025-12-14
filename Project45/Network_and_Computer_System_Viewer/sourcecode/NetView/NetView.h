// NetView.h : main header file for the NETVIEW application
//

#if !defined(AFX_NETVIEW_H__5331C45C_48FE_40C5_A653_C40A42D21F52__INCLUDED_)
#define AFX_NETVIEW_H__5331C45C_48FE_40C5_A653_C40A42D21F52__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CNetViewApp:
// See NetView.cpp for the implementation of this class
//

//##ModelId=3E9ABEE600C6
class CNetViewApp : public CWinApp
{
public:
	//##ModelId=3E9ABEE600D4
	CNetViewApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNetViewApp)
	public:
	//##ModelId=3E9ABEE600D3
	virtual BOOL InitInstance();
	//##ModelId=3E9ABEE600D2
	virtual int ExitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CNetViewApp)
	//##ModelId=3E9ABEE600D1
	afx_msg void OnAppAbout();

		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
protected:

};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NETVIEW_H__5331C45C_48FE_40C5_A653_C40A42D21F52__INCLUDED_)
