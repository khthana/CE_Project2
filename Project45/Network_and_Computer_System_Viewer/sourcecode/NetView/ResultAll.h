
#if !defined(AFX_RESULTALL_H__2FD12A91_5AE6_4B87_B7F3_2A4392250643__INCLUDED_)
#define AFX_RESULTALL_H__2FD12A91_5AE6_4B87_B7F3_2A4392250643__INCLUDED_


//#include "Redirect.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ResultAll.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CResultAll dialog

//##ModelId=3E9ABEE60171
class CResultAll : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEE6019A
	CResultAll(CWnd* pParent = NULL);   // standard constructor
	//##ModelId=3E9ABEE60187
	CString nIP;
	//##ModelId=3E9ABEE60199
	void FindOS();
	//##ModelId=3E9ABEE60186
	int sec;
	//##ModelId=3E9ABEE60185
	int TimerNUM;
// Dialog Data
	//{{AFX_DATA(CResultAll)
	enum { IDD = IDD_Showall };
	//##ModelId=3E9ABEE60180
	CEdit	m_Edit1;
	//##ModelId=3E9ABEE6017B
	CListCtrl	m_clist;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CResultAll)
	protected:
	//##ModelId=3E9ABEE60193
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CResultAll)
	//##ModelId=3E9ABEE60192
	virtual BOOL OnInitDialog();
	//##ModelId=3E9ABEE60191
	afx_msg void OnClose();
	//##ModelId=3E9ABEE6018F
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RESULTALL_H__2FD12A91_5AE6_4B87_B7F3_2A4392250643__INCLUDED_)


