#if !defined(AFX_NEWSIGDLG_H__AB40AA61_0D8D_11D6_BB32_00E07D0326BE__INCLUDED_)
#define AFX_NEWSIGDLG_H__AB40AA61_0D8D_11D6_BB32_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// NewSigDlg.h : header file
//

#include "WaitDlg.h"
#include "Resource.h"
#include "SrvrItem.h"
#include "SignatureView.h"
#include "SignatureDoc.h"
#include "Signature.h"
/////////////////////////////////////////////////////////////////////////////
// NewSigDlg dialog

class NewSigDlg : public CDialog
{
// Construction
public:
	NewSigDlg(CWnd* pParent = NULL);   // standard constructor
	CString m_picfile;
	BYTE m_algid, m_sigsize;
// Dialog Data
	//{{AFX_DATA(NewSigDlg)
	enum { IDD = IDD_NEWSIG };
	CEdit	m_ctrlsurname;
	CEdit	m_ctrlname;
	CButton	m_txtsigpic;
	CStatic	m_ctrlthum;
	CComboBox	m_ctrlsigsize;
	CButton	m_browsebutt;
	CString	m_name;
	CString	m_surname;
	BOOL	m_usepic;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(NewSigDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(NewSigDlg)
	virtual void OnOK();
	virtual BOOL OnInitDialog();
	afx_msg void OnUsepic();
	afx_msg void OnBrowse();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NEWSIGDLG_H__AB40AA61_0D8D_11D6_BB32_00E07D0326BE__INCLUDED_)
