// TongDlg.h : header file
//

#if !defined(AFX_TONGDLG_H__6877C57A_4B0A_4EDB_ABBD_C63709893A8D__INCLUDED_)
#define AFX_TONGDLG_H__6877C57A_4B0A_4EDB_ABBD_C63709893A8D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CTongDlg dialog

class CTongDlg : public CDialog
{
// Construction
public:
	CTongDlg(CWnd* pParent = NULL);	// standard constructor
	
// Dialog Data
	//{{AFX_DATA(CTongDlg)
	enum { IDD = IDD_TONG_DIALOG };
	CEdit	m_Edit_Con;
	CString	m_Edit_Str;	
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTongDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CTongDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnParse();
	afx_msg void OnExit();
	afx_msg void OnOpen();
	afx_msg void OnLexFile();
	afx_msg void OnParseFile();
	afx_msg void OnTreeFile();
	afx_msg void OnScriptFile();
	afx_msg void OnAbout();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
//	
	CMenu menu;
	
	
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TONGDLG_H__6877C57A_4B0A_4EDB_ABBD_C63709893A8D__INCLUDED_)
