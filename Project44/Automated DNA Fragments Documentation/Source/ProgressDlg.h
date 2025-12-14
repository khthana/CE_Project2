#if !defined(AFX_PROGRESSDLG_H__DAEB8AA2_3835_11D6_9031_FA4FC3B8B664__INCLUDED_)
#define AFX_PROGRESSDLG_H__DAEB8AA2_3835_11D6_9031_FA4FC3B8B664__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ProgressDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// ProgressDlg dialog

class ProgressDlg : public CDialog
{
// Construction
public:
	void OnExecute();
	HGLOBAL hDIB;
	CPalette* pPalDIB;
	int bmHeight,bmWidth;
	CString file_name;
	ProgressDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(ProgressDlg)
	enum { IDD = IDD_PROGRESS };
	CListBox	m_output;
	CProgressCtrl	m_progress;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(ProgressDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(ProgressDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnStart();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROGRESSDLG_H__DAEB8AA2_3835_11D6_9031_FA4FC3B8B664__INCLUDED_)
