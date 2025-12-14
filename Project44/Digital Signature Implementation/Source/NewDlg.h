#if !defined(AFX_NEWDLG_H__F65842FE_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
#define AFX_NEWDLG_H__F65842FE_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// NewDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CNewDlg dialog

class CNewDlg : public CDialog
{
// Construction
public:
	CNewDlg(CWnd* pParent = NULL);   // standard constructor
	CString m_picfile;
	BYTE m_algid, m_sigsize;

// Dialog Data
	//{{AFX_DATA(CNewDlg)
	enum { IDD = IDD_DIALOG1 };
	CButton	m_browsebutt;
	CEdit	m_ctrlsurname;
	CEdit	m_ctrlname;
	CButton	m_txtsigpic;
	CStatic	m_ctrlthum;
	CString	m_name;
	CString	m_surname;
	BOOL	m_usepic;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNewDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CNewDlg)
	virtual BOOL OnInitDialog();
	virtual void OnOK();
	afx_msg void OnUsepic();
	afx_msg void OnBrowse();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NEWDLG_H__F65842FE_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
