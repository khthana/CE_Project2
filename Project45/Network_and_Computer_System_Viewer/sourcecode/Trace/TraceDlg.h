// TraceDlg.h : header file
//

#if !defined(AFX_TRACEDLG_H__900DE09C_6974_4CDF_B72D_1D71C080C9A2__INCLUDED_)
#define AFX_TRACEDLG_H__900DE09C_6974_4CDF_B72D_1D71C080C9A2__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CTraceDlg dialog

class CTraceDlg : public CDialog
{
// Construction
public:
	CTraceDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CTraceDlg)
	enum { IDD = IDD_TRACE_DIALOG };
	CEdit	m_hostInput;
	CString	m_Output;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTraceDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CTraceDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButton1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TRACEDLG_H__900DE09C_6974_4CDF_B72D_1D71C080C9A2__INCLUDED_)
