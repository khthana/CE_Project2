#if !defined(AFX_INVALIDDLG_H__015F5042_37AA_11D6_94C5_00E07D0326BE__INCLUDED_)
#define AFX_INVALIDDLG_H__015F5042_37AA_11D6_94C5_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// InvalidDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CInvalidDlg dialog

class CInvalidDlg : public CDialog
{
// Construction
public:
	CInvalidDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CInvalidDlg)
	enum { IDD = IDD_INVALID };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInvalidDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CInvalidDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_INVALIDDLG_H__015F5042_37AA_11D6_94C5_00E07D0326BE__INCLUDED_)
