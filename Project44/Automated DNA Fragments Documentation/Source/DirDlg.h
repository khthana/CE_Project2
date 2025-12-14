#if !defined(AFX_DIRDLG_H__60DB1DE0_375C_11D6_9031_FA2F9024DD67__INCLUDED_)
#define AFX_DIRDLG_H__60DB1DE0_375C_11D6_9031_FA2F9024DD67__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DirDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// DirDlg dialog

class DirDlg : public CDialog
{
// Construction
public:
	DirDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(DirDlg)
	enum { IDD = IDD_DIR };
	CComboBox	m_combo;
	CListBox	m_dir;
	CString	m_data;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(DirDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(DirDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnDblclkDir();
	virtual void OnOK();
	virtual void OnCancel();
	afx_msg void OnCloseupSelDrive();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DIRDLG_H__60DB1DE0_375C_11D6_9031_FA2F9024DD67__INCLUDED_)
