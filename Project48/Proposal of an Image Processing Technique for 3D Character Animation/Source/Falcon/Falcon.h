// Falcon.h : main header file for the FALCON application
//

#if !defined(AFX_FALCON_H__90D08320_6AA8_4D6D_9694_3918BD254189__INCLUDED_)
#define AFX_FALCON_H__90D08320_6AA8_4D6D_9694_3918BD254189__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CFalconApp:
// See Falcon.cpp for the implementation of this class
//

class CFalconApp : public CWinApp
{
public:
	CFalconApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFalconApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CFalconApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FALCON_H__90D08320_6AA8_4D6D_9694_3918BD254189__INCLUDED_)
