#if !defined(AFX_RULETAB_H__729E306F_B4D3_4CFC_A7A1_F7A5052E7FD3__INCLUDED_)
#define AFX_RULETAB_H__729E306F_B4D3_4CFC_A7A1_F7A5052E7FD3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// RuleTab.h : header file
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
	CButton	m_bNew;
	CListBox	m_rulelist;
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
	afx_msg void OnDblclkRulelist();
	virtual BOOL OnInitDialog();
	afx_msg void OnNew();
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

#endif // !defined(AFX_RULETAB_H__729E306F_B4D3_4CFC_A7A1_F7A5052E7FD3__INCLUDED_)
