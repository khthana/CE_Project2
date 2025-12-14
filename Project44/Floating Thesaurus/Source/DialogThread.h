#if !defined(AFX_DIALOGTHREAD_H__F1696099_EF49_49D8_AB71_726FBB9AD8D4__INCLUDED_)
#define AFX_DIALOGTHREAD_H__F1696099_EF49_49D8_AB71_726FBB9AD8D4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DialogThread.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDialogThread thread

class CDialogThread : public CWinThread
{
	DECLARE_DYNCREATE(CDialogThread)
protected:
	CDialogThread();           // protected constructor used by dynamic creation

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDialogThread)
	public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();
	//}}AFX_VIRTUAL

// Implementation
protected:
	virtual ~CDialogThread();

	// Generated message map functions
	//{{AFX_MSG(CDialogThread)
		// NOTE - the ClassWizard will add and remove member functions here.
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DIALOGTHREAD_H__F1696099_EF49_49D8_AB71_726FBB9AD8D4__INCLUDED_)
