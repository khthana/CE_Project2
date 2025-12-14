#if !defined(AFX_SELECTDB_H__24AA0BFA_CB9D_4A5C_99BF_6F9404B4CFFA__INCLUDED_)
#define AFX_SELECTDB_H__24AA0BFA_CB9D_4A5C_99BF_6F9404B4CFFA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SelectDB.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSelectDB dialog

class CSelectDB : public CDialog
{
// Construction
public:
	CSelectDB(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSelectDB)
	enum { IDD = IDD_DIALOGSELECTDB };
	CListBox	m_ListDB;
	CEdit	m_EditSelectDB;
	CString	m_data;
	CString	m_EditData;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSelectDB)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSelectDB)
	virtual BOOL OnInitDialog();
	afx_msg void OnSelchangeListdb();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SELECTDB_H__24AA0BFA_CB9D_4A5C_99BF_6F9404B4CFFA__INCLUDED_)
