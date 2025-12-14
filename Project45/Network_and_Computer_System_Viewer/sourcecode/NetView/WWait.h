#if !defined(AFX_WWAIT_H__7F20E587_8E3A_4B18_A120_41836AA36C79__INCLUDED_)
#define AFX_WWAIT_H__7F20E587_8E3A_4B18_A120_41836AA36C79__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// WWait.h : header file
//

#include "WWaitThread.h"

/////////////////////////////////////////////////////////////////////////////
// CWWait dialog

//##ModelId=3E9ABEE8015F
class CWWait : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEE80179
	CWWait(CWnd* pParent = NULL);   // standard constructor
	//##ModelId=3E9ABEE8016D
	CWWaitThread	   *m_Thread;
	//##ModelId=3E9ABEE8016A
	bool           m_bShowCancelButton;

// Dialog Data
	//{{AFX_DATA(CWWait)
	enum { IDD = IDD_WWAIT };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWWait)
	protected:
	//##ModelId=3E9ABEE80177
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CWWait)
	//##ModelId=3E9ABEE80175
	afx_msg void OnTimer(UINT nIDEvent);
	//##ModelId=3E9ABEE80174
	virtual void OnOK();
	//##ModelId=3E9ABEE80170
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WWAIT_H__7F20E587_8E3A_4B18_A120_41836AA36C79__INCLUDED_)
