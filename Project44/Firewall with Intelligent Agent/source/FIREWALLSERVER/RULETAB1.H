#if !defined(AFX_RULETAB1_H__11008769_19DE_432A_A2BB_C39AD230F8DE__INCLUDED_)
#define AFX_RULETAB1_H__11008769_19DE_432A_A2BB_C39AD230F8DE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// RuleTab1.h : header file
//
#include "RuleRecord.h"
/////////////////////////////////////////////////////////////////////////////
// CRuleTab dialog

class CRuleTab : public CDialog
{
// Construction
public:
	CRuleTab(CWnd* pParent = NULL);   // standard constructor
	CRuleRecord* m_pRuleRecord;


// Dialog Data
	//{{AFX_DATA(CRuleTab)
	enum { IDD = IDD_RULETAB };
	CListBox	m_rulelist;
	CButton	m_bNew;
	CString	m_row;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRuleTab)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CRuleTab)
	virtual BOOL OnInitDialog();
	afx_msg void OnNew();
	afx_msg void OnDblclkRulelist();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CString	m_dprange;
	CString	m_dstaddr;
	CString	m_dstmask;
	CString	m_dstport;
	CString	m_protocol;
	CString	m_sprange;
	CString	m_rule;
	CString	m_srcmask;
	CString	m_srcaddr;
	CString	m_srcport;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RULETAB1_H__11008769_19DE_432A_A2BB_C39AD230F8DE__INCLUDED_)
