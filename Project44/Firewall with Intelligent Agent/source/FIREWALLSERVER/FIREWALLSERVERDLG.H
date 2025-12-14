// FirewallServerDlg.h : header file
//

#if !defined(AFX_FIREWALLSERVERDLG_H__D1C6D9A7_C53D_4C7F_95DE_56B798199105__INCLUDED_)
#define AFX_FIREWALLSERVERDLG_H__D1C6D9A7_C53D_4C7F_95DE_56B798199105__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CFirewallServerDlg dialog

class CFirewallServerDlg : public CDialog
{
// Construction
public:
	CFirewallServerDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CFirewallServerDlg)
	enum { IDD = IDD_FIREWALLSERVER_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirewallServerDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CFirewallServerDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIREWALLSERVERDLG_H__D1C6D9A7_C53D_4C7F_95DE_56B798199105__INCLUDED_)
