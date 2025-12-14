#if !defined(AFX_LOGDLG_H__0D5CF50D_3ABE_4700_A35D_A4E6F5385095__INCLUDED_)
#define AFX_LOGDLG_H__0D5CF50D_3ABE_4700_A35D_A4E6F5385095__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// LogDlg.h : header file
//
#include "W2kFilter.h"
/////////////////////////////////////////////////////////////////////////////
// CLogDlg dialog

class CLogDlg : public CDialog
{
// Construction
public:
	CString Log;
	void GetLog(CString buffer);


	CLogDlg(CWnd* pParent = NULL);   // standard constructor



// Dialog Data
	//{{AFX_DATA(CLogDlg)
	enum { IDD = IDD_LOG };
	CListBox	m_loglist;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLogDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CLogDlg)
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
	CString m_nofilter;


};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LOGDLG_H__0D5CF50D_3ABE_4700_A35D_A4E6F5385095__INCLUDED_)
