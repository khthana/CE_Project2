// BasicDlg.h : header file
//

#if !defined(AFX_BASICDLG_H__BACEB66B_D2B0_45C8_B792_44F63840015F__INCLUDED_)
#define AFX_BASICDLG_H__BACEB66B_D2B0_45C8_B792_44F63840015F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CBasicDlg dialog

class CBasicDlg : public CDialog
{
// Construction
public:
	CBasicDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CBasicDlg)
	enum { IDD = IDD_BASIC_DIALOG };
	CListBox	m_clistbox;
	CString	m_message;
	CString	m_szServer;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CBasicDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CBasicDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnLimit();
	afx_msg void OnAdd();
	afx_msg void OnCharge();
	afx_msg void OnHistory();
	afx_msg void OnExit();
	afx_msg void OnSet();
	afx_msg void OnSelchangeListbox();
	afx_msg void OnDblclkListbox();
	afx_msg void OnSetbalance();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_BASICDLG_H__BACEB66B_D2B0_45C8_B792_44F63840015F__INCLUDED_)
