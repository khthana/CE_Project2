// PersonalFirewallDlg.h : header file
//

#if !defined(AFX_PERSONALFIREWALLDLG_H__89B33F3E_CA96_400C_9837_4D8EDF58C042__INCLUDED_)
#define AFX_PERSONALFIREWALLDLG_H__89B33F3E_CA96_400C_9837_4D8EDF58C042__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "DlgMain.h"
#include "DlgRule.h"

/////////////////////////////////////////////////////////////////////////////
// CPersonalFirewallDlg dialog

class CPersonalFirewallDlg : public CDialog
{
// Construction
public:
	CPersonalFirewallDlg(CWnd* pParent = NULL);	// standard constructor


	NOTIFYICONDATA m_notifyIconData;
	CDlgMain m_dDlgMain;
	CDlgRule m_dDlgRule;

	void ShowWindowNumber(int number);

// Dialog Data
	//{{AFX_DATA(CPersonalFirewallDlg)
	enum { IDD = IDD_PERSONALFIREWALL_DIALOG };
	CTabCtrl	m_cTab;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPersonalFirewallDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CPersonalFirewallDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnSelchangeTab(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg LONG OnSystrayNotify(WPARAM wParam, LPARAM lParam);
	afx_msg void OnSystrayOpen();
	afx_msg void OnSystrayClose();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
	CRect m_rSettingsRect;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PERSONALFIREWALLDLG_H__89B33F3E_CA96_400C_9837_4D8EDF58C042__INCLUDED_)
