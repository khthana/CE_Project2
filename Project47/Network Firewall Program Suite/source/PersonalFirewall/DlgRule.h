#if !defined(AFX_DLGRULE_H__C381286F_4830_428A_A0A9_C5AB2B801D37__INCLUDED_)
#define AFX_DLGRULE_H__C381286F_4830_428A_A0A9_C5AB2B801D37__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgRule.h : header file
//
#include "RuleManage.h"
#include "PacketFilter.h"

/////////////////////////////////////////////////////////////////////////////
// CDlgRule dialog

class CDlgRule : public CDialog
{
// Construction
public:
	CDlgRule(CWnd* pParent = NULL);   // standard constructor
	BOOL OnInitDialog();

	void UpdateGroupRuleList();

	CRuleManage* ruleGroup;
// Dialog Data
	//{{AFX_DATA(CDlgRule)
	enum { IDD = IDD_DIALOG_RULE };
	CListCtrl	m_cListRule;
	CString	m_sHostAddress;
	CString	m_sNumberOfGroupRule;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgRule)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	void AddGroupRuleToList(	unsigned long srcIp, 
								unsigned long srcMask,
								unsigned short srcPort, 
								unsigned long dstIp, 
								unsigned long dstMask,
								unsigned short dstPort, 
								unsigned int protocol, 
								int action 
							);
	// Generated message map functions
	//{{AFX_MSG(CDlgRule)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGRULE_H__C381286F_4830_428A_A0A9_C5AB2B801D37__INCLUDED_)
