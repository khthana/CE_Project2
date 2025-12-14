#if !defined(AFX_RULERECORD_H__27DE9D6C_19E7_4646_8709_FDDBAAD4EDAD__INCLUDED_)
#define AFX_RULERECORD_H__27DE9D6C_19E7_4646_8709_FDDBAAD4EDAD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// RuleRecord.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CRuleRecord dialog

class CRuleRecord : public CDialog
{
// Construction
public:
	void GetRule(CString m_row);
	CRuleRecord(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CRuleRecord)
	enum { IDD = IDD_RULERECORD };
	CButton	m_bUpdate;
	CButton	m_bOK;
	CButton	m_bDel;
	CButton	m_bAdd;
	CString	m_dprange;
	CString	m_dstaddr;
	CString	m_dstmask;
	CString	m_dstport;
	CString	m_ptcol;
	CString	m_rule;
	CString	m_sprange;
	CString	m_srcaddr;
	CString	m_srcmask;
	CString	m_srcport;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRuleRecord)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CRuleRecord)
	virtual BOOL OnInitDialog();
	afx_msg void OnAdd();
	afx_msg void OnDelete();
	afx_msg void OnOk();
	afx_msg void OnUpdate();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CString m_rulerow;
	CRecordset rs;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RULERECORD_H__27DE9D6C_19E7_4646_8709_FDDBAAD4EDAD__INCLUDED_)
