// SnmputilDlg.h : header file
//

#if !defined(AFX_SNMPUTILDLG_H__E9FC30CF_8B54_49BE_81C5_1BFFDCAF432E__INCLUDED_)
#define AFX_SNMPUTILDLG_H__E9FC30CF_8B54_49BE_81C5_1BFFDCAF432E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CSnmputilDlg dialog

class CSnmputilDlg : public CDialog
{
// Construction
public:
	CSnmputilDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CSnmputilDlg)
	enum { IDD = IDD_SNMPUTIL_DIALOG };
	CListBox	m_Out2;
	CString	m_Output;
	CString	m_SNMPCommand;
	CString	m_IPAddress;
	CString	m_CommuName;
	CString	m_ObjID;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSnmputilDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CSnmputilDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg int OnSNMP();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SNMPUTILDLG_H__E9FC30CF_8B54_49BE_81C5_1BFFDCAF432E__INCLUDED_)
