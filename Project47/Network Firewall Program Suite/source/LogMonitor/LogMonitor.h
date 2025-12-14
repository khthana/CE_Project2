// LogMonitor.h : main header file for the LOGMONITOR application
//

#if !defined(AFX_LOGMONITOR_H__1C518D77_004A_45F9_A5B9_7898B83E1FAF__INCLUDED_)
#define AFX_LOGMONITOR_H__1C518D77_004A_45F9_A5B9_7898B83E1FAF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorApp:
// See LogMonitor.cpp for the implementation of this class
//

class CLogMonitorApp : public CWinApp
{
public:
	CLogMonitorApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogMonitorApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CLogMonitorApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGMONITOR_H__1C518D77_004A_45F9_A5B9_7898B83E1FAF__INCLUDED_)
