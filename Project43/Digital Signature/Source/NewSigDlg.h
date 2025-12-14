#if !defined(AFX_NEWSIGDLG_H__718C64E4_FFA5_11D4_81BC_A5C82D87BF5F__INCLUDED_)
#define AFX_NEWSIGDLG_H__718C64E4_FFA5_11D4_81BC_A5C82D87BF5F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// NewSigDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CNewSigDlg dialog

class CNewSigDlg : public CDialog
{
// Construction
public:
	CNewSigDlg(CWnd* pParent = NULL);   // standard constructor
	CString m_picfile;
	BYTE m_algid, m_sigsize;
// Dialog Data
	//{{AFX_DATA(CNewSigDlg)
	enum { IDD = IDD_NEWSIG };
	CComboBox	m_ctrlsigsize;
	CButton	m_txtsigpic;
	CButton	m_browsebutt;
	CStatic	m_ctrlthum;
	CEdit	m_ctrlsurname;
	CEdit	m_ctrlname;
	CString	m_name;
	CString	m_surname;
	BOOL	m_usepic;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNewSigDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CNewSigDlg)
	virtual BOOL OnInitDialog();
	virtual void OnOK();
	afx_msg void OnBrowse();
	afx_msg void OnUsepic();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NEWSIGDLG_H__718C64E4_FFA5_11D4_81BC_A5C82D87BF5F__INCLUDED_)
