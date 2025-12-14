#if !defined(AFX_LIMITDLG_H__4739FE91_4F04_43B6_A9B5_1BAA310D624C__INCLUDED_)
#define AFX_LIMITDLG_H__4739FE91_4F04_43B6_A9B5_1BAA310D624C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// LimitDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CLimitDlg dialog

class CLimitDlg : public CDialog
{
// Construction
public:
	CLimitDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CLimitDlg)
	enum { IDD = IDD_SETLIMIT_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLimitDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CLimitDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LIMITDLG_H__4739FE91_4F04_43B6_A9B5_1BAA310D624C__INCLUDED_)
