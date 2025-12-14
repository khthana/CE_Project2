#if !defined(AFX_ADDSCRIPT_H__D8D4E403_2D5F_4183_BDBD_34A08B102FF6__INCLUDED_)
#define AFX_ADDSCRIPT_H__D8D4E403_2D5F_4183_BDBD_34A08B102FF6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// AddScript.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CAddScript dialog

//##ModelId=3E9ABEF0003F
class CAddScript : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEF00068
	CAddScript(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CAddScript)
	enum { IDD = IDD_ADDSCRIPT };
	//##ModelId=3E9ABEF00055
	CEdit	m_Output;
	//##ModelId=3E9ABEF0004D
	CListBox	m_List;
	//##ModelId=3E9ABEF0004A
	CString	m_Command;
	//##ModelId=3E9ABEF00049
	CString	m_Quick;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAddScript)
	protected:
	//##ModelId=3E9ABEF00061
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CAddScript)
	//##ModelId=3E9ABEF00060
	afx_msg void OnAdd();
	//##ModelId=3E9ABEF0005F
	afx_msg void OnExe();
	//##ModelId=3E9ABEF0005E
	afx_msg void OnAddquickrun();
	//##ModelId=3E9ABEF0005D
	afx_msg void OnDel();
	//##ModelId=3E9ABEF00059
	afx_msg void OnClose();
	//##ModelId=3E9ABEF00058
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ADDSCRIPT_H__D8D4E403_2D5F_4183_BDBD_34A08B102FF6__INCLUDED_)
