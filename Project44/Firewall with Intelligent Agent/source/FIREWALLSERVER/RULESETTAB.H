#if !defined(AFX_RULESETTAB_H__7E6F44D2_8D5C_4491_9B04_9293853BC1C8__INCLUDED_)
#define AFX_RULESETTAB_H__7E6F44D2_8D5C_4491_9B04_9293853BC1C8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// RulesetTab.h : header file
//
#include "GroupRecord.h"

/////////////////////////////////////////////////////////////////////////////
// CRulesetTab dialog

class CRulesetTab : public CDialog
{
// Construction
public:
	CRulesetTab(CWnd* pParent = NULL);   // standard constructor
	CGroupRecord* m_pGroupRecord;

// Dialog Data
	//{{AFX_DATA(CRulesetTab)
	enum { IDD = IDD_RULESETTAB };
	CButton	m_bOK;
	CButton	m_bNew;
	CListBox	m_rulelist;
	CListBox	m_grouplist;
	CString	m_group;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRulesetTab)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CRulesetTab)
	afx_msg void OnDblclkListgp();
	afx_msg void OnNewgroup();
	virtual BOOL OnInitDialog();
	afx_msg void OnOk();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CRecordset rs;
	CString m_row;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RULESETTAB_H__7E6F44D2_8D5C_4491_9B04_9293853BC1C8__INCLUDED_)
