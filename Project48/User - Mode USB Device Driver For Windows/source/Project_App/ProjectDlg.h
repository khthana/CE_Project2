// ProjectDlg.h : header file
//

#if !defined(AFX_PROJECTDLG_H__3C5F3B30_508F_4856_8D52_4B47031C84E8__INCLUDED_)
#define AFX_PROJECTDLG_H__3C5F3B30_508F_4856_8D52_4B47031C84E8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CProjectDlg dialog

class CProjectDlg : public CDialog
{
// Construction
public:
	CProjectDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CProjectDlg)
	enum { IDD = IDD_PROJECT_DIALOG };
	CString	m_edit1;
	CString	m_count;
	CString	m_output;
	CString	m_addr;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProjectDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
	int convertHexToInt4(char*);
	int convertHexToInt2(char*);
	void invert(char*,int);
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CProjectDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnClose();
	afx_msg void OnWrite();
	afx_msg void OnClear();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROJECTDLG_H__3C5F3B30_508F_4856_8D52_4B47031C84E8__INCLUDED_)
