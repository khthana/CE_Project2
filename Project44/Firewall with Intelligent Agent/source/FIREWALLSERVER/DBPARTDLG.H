#if !defined(AFX_DBPARTDLG_H__63DF15BB_2CC8_4674_878F_BE1DF35857B4__INCLUDED_)
#define AFX_DBPARTDLG_H__63DF15BB_2CC8_4674_878F_BE1DF35857B4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DBpartDlg.h : header file
//
#include "DBconnect.h"
#include "ClientInfo.h"

/////////////////////////////////////////////////////////////////////////////
// CDBpartDlg dialog

class CDBpartDlg : public CDialog
{
// Construction
public:
	CDBpartDlg(CWnd* pParent = NULL);   // standard constructor
	CDBconnect* m_pDBconnect;
	CClientInfo* m_pClientInfo;

// Dialog Data
	//{{AFX_DATA(CDBpartDlg)
	enum { IDD = IDD_DBPART_DIALOG };
	CButton	m_bOK;
	CButton	m_bSent;
	CButton	m_bStop;
	CButton	m_ruletable;
	CButton	m_bRemove;
	CButton	m_bNew;
	CButton	m_grouptable;
	CListCtrl	m_Client;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDBpartDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:


	// Generated message map functions
	//{{AFX_MSG(CDBpartDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnClickClientlist(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDblclkClientlist(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnGrouptab();
	afx_msg void OnNewclient();
	afx_msg void OnRemoveclient();
	afx_msg void OnRuletab();
	afx_msg void OnSendrule();
	afx_msg void OnStopfilter();
	afx_msg void OnOk();
	afx_msg void OnGetLog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CString ipsending;
	CString ip;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DBPARTDLG_H__63DF15BB_2CC8_4674_878F_BE1DF35857B4__INCLUDED_)
