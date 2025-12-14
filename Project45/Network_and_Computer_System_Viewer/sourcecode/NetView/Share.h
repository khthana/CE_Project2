#if !defined(AFX_SHARE_H__A3B0E9A5_D62F_4434_93C1_35DEC5CC1630__INCLUDED_)
#define AFX_SHARE_H__A3B0E9A5_D62F_4434_93C1_35DEC5CC1630__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Share.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CShare dialog

//##ModelId=3E9ABEED00D0
class CShare : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEED00EF
	CShare(CWnd* pParent = NULL);   // standard constructor
	//##ModelId=3E9ABEED00E5
	CString nIP;
// Dialog Data
	//{{AFX_DATA(CShare)
	enum { IDD = IDD_Share_Folder };
	//##ModelId=3E9ABEED00DC
	CEdit	m_Edit1;
	//##ModelId=3E9ABEED00D4
	CListCtrl	m_clist;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CShare)
	protected:
	//##ModelId=3E9ABEED00E7
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CShare)
	//##ModelId=3E9ABEED00E6
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SHARE_H__A3B0E9A5_D62F_4434_93C1_35DEC5CC1630__INCLUDED_)
