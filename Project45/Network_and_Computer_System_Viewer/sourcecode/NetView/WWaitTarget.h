#if !defined(AFX_WWAITTARGET_H__F9048600_C50E_47F9_BF87_327894CC32CD__INCLUDED_)
#define AFX_WWAITTARGET_H__F9048600_C50E_47F9_BF87_327894CC32CD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// WWaitTarget.h : header file
//

#include "WWaitThread.h"

/////////////////////////////////////////////////////////////////////////////
// CWWaitTarget command target

//##ModelId=3E9ABEED0225
class CWWaitTarget : public CCmdTarget
{
	DECLARE_DYNCREATE(CWWaitTarget)

	//##ModelId=3E9ABEED023C
	CWWaitTarget();           // protected constructor used by dynamic creation

// Attributes
public:
	//##ModelId=3E9ABEED0235
   CWWaitThread	   *m_Thread;
	//##ModelId=3E9ABEED0232
   HANDLE            m_Event;
	//##ModelId=3E9ABEED0231
   CString           m_EventName;
	//##ModelId=3E9ABEED0230
   bool           m_bShowCancelButton;

// Operations
public:
	//##ModelId=3E9ABEED023B
	void Close();
	//##ModelId=3E9ABEED023A
	void Show();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWWaitTarget)
	//}}AFX_VIRTUAL

// Implementation
public: 
	//##ModelId=3E9ABEED0239
	virtual ~CWWaitTarget();
protected:

	// Generated message map functions
	//{{AFX_MSG(CWWaitTarget)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WWAITTARGET_H__F9048600_C50E_47F9_BF87_327894CC32CD__INCLUDED_)
