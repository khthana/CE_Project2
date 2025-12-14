#if !defined(AFX_WWAITTHREAD_H__CA136810_C182_4AC2_8A21_A0A73193830A__INCLUDED_)
#define AFX_WWAITTHREAD_H__CA136810_C182_4AC2_8A21_A0A73193830A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// WWaitThread.h : header file
//
#include <afxmt.h>


/////////////////////////////////////////////////////////////////////////////
// CWWaitThread thread

//##ModelId=3E9ABEE703DF
class CWWaitThread : public CWinThread
{
	DECLARE_DYNCREATE(CWWaitThread)
protected:
	//##ModelId=3E9ABEE80018
	CWWaitThread();           // protected constructor used by dynamic creation

// Attributes
public:
	//##ModelId=3E9ABEE8000D
   CWWaitThread	    *m_Thread;
	//##ModelId=3E9ABEE80006
   CEvent			*m_Event;
	//##ModelId=3E9ABEE80003
   CString           m_Eventname;
	//##ModelId=3E9ABEE80002
   bool           m_bShowCancelButton;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWWaitThread)
	public:
	//##ModelId=3E9ABEE80017
	virtual BOOL InitInstance();
	//##ModelId=3E9ABEE80016
	virtual int ExitInstance();
	//}}AFX_VIRTUAL

// Implementation
protected:
	//##ModelId=3E9ABEE80015
	virtual ~CWWaitThread();

	// Generated message map functions
	//{{AFX_MSG(CWWaitThread)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WWAITTHREAD_H__CA136810_C182_4AC2_8A21_A0A73193830A__INCLUDED_)
