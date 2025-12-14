#if !defined(AFX_ADDCREDITDLG_H__5232BC38_F699_4BC8_8E21_58E0DCA86737__INCLUDED_)
#define AFX_ADDCREDITDLG_H__5232BC38_F699_4BC8_8E21_58E0DCA86737__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// AddcreditDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CAddcreditDlg dialog

class CAddcreditDlg : public CDialog
{
// Construction
public:
	CAddcreditDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CAddcreditDlg)
	enum { IDD = IDD_ADDCREDIT_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAddcreditDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CAddcreditDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ADDCREDITDLG_H__5232BC38_F699_4BC8_8E21_58E0DCA86737__INCLUDED_)
