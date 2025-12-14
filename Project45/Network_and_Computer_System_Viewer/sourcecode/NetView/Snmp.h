#if !defined(AFX_SNMP_H__DD50373C_6A93_475A_939C_A3B5129CEE2D__INCLUDED_)
#define AFX_SNMP_H__DD50373C_6A93_475A_939C_A3B5129CEE2D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Snmp.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSnmp dialog

//##ModelId=3E9ABEEB0377
class CSnmp : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEEB03A3
	CSnmp(CWnd* pParent = NULL);   // standard constructor
	//##ModelId=3E9ABEEB0396
	CString nIP;
	//##ModelId=3E9ABEEB0395
	CString snmp[8];
// Dialog Data
	//{{AFX_DATA(CSnmp)
	enum { IDD = IDD_Snmp };
	//##ModelId=3E9ABEEB038D
	CEdit	m_Edit2;
	//##ModelId=3E9ABEEB0385
	CTreeCtrl	m_ctree;
	//##ModelId=3E9ABEEB0382
	CString	m_snmp;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSnmp)
	protected:
	//##ModelId=3E9ABEEB03A1
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSnmp)
	//##ModelId=3E9ABEEB03A0
	virtual BOOL OnInitDialog();
	//##ModelId=3E9ABEEB0397
	afx_msg void OnSelchangedTree1(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SNMP_H__DD50373C_6A93_475A_939C_A3B5129CEE2D__INCLUDED_)
