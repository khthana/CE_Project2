#if !defined(AFX_CLIENTINFO_H__0F7D2EDB_10FA_46AE_8AE4_B9F39A97F20F__INCLUDED_)
#define AFX_CLIENTINFO_H__0F7D2EDB_10FA_46AE_8AE4_B9F39A97F20F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ClientInfo.h : header file
//
#include "DBconnect.h"
#include "ClientInfo.h"

/////////////////////////////////////////////////////////////////////////////
// CClientInfo dialog

class CClientInfo : public CDialog
{
// Construction
public:
	CClientInfo(CWnd* pParent = NULL);   // standard constructor
	void GetIPAddr(CString ip);

// Dialog Data
	//{{AFX_DATA(CClientInfo)
	enum { IDD = IDD_CLIENTINFO };
	CListBox	m_rulelist;
	CEdit	m_cngroup;
	CString	m_group;
	CString	m_ipaddr;
	CString	m_row;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CClientInfo)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CClientInfo)
	afx_msg void OnChangeGroup();
	virtual BOOL OnInitDialog();
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
	CString ipaddr;
	CRecordset rs;
	int i;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CLIENTINFO_H__0F7D2EDB_10FA_46AE_8AE4_B9F39A97F20F__INCLUDED_)
