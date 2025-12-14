// Trace.h : main header file for the TRACE application
//

#if !defined(AFX_TRACE_H__8FE94FD1_9D62_489E_A473_1BA4F89CA0CA__INCLUDED_)
#define AFX_TRACE_H__8FE94FD1_9D62_489E_A473_1BA4F89CA0CA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols
#include "Trace_i.h"

/////////////////////////////////////////////////////////////////////////////
// CTraceApp:
// See Trace.cpp for the implementation of this class
//

class CTraceApp : public CWinApp
{
public:
	CTraceApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTraceApp)
	public:
	virtual BOOL InitInstance();
		virtual int ExitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CTraceApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	BOOL m_bATLInited;
private:
	BOOL InitATL();
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TRACE_H__8FE94FD1_9D62_489E_A473_1BA4F89CA0CA__INCLUDED_)
