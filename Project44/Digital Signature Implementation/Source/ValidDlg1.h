#if !defined(AFX_VALIDDLG1_H__31A1BDA1_37B5_11D6_94C5_00E07D0326BE__INCLUDED_)
#define AFX_VALIDDLG1_H__31A1BDA1_37B5_11D6_94C5_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ValidDlg1.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CValidDlg dialog

class CValidDlg : public CDialog
{
// Construction
public:
	CValidDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CValidDlg)
	enum { IDD = IDD_VALID };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CValidDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CValidDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_VALIDDLG1_H__31A1BDA1_37B5_11D6_94C5_00E07D0326BE__INCLUDED_)
