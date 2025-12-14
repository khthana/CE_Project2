// Scannimda.h : main header file for the SCANNIMDA application
//

#if !defined(AFX_SCANNIMDA_H__7AB11B14_6FCC_4EB8_8085_DA73F0C4F813__INCLUDED_)
#define AFX_SCANNIMDA_H__7AB11B14_6FCC_4EB8_8085_DA73F0C4F813__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CScannimdaApp:
// See Scannimda.cpp for the implementation of this class
//

class CScannimdaApp : public CWinApp
{
public:
	CScannimdaApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CScannimdaApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CScannimdaApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SCANNIMDA_H__7AB11B14_6FCC_4EB8_8085_DA73F0C4F813__INCLUDED_)
