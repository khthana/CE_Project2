#if !defined(AFX_SETBALANCEDLG_H__83E00D5E_F321_48A0_9B1F_DCD82624FC6A__INCLUDED_)
#define AFX_SETBALANCEDLG_H__83E00D5E_F321_48A0_9B1F_DCD82624FC6A__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SetBalanceDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSetBalanceDlg dialog

class CSetBalanceDlg : public CDialog
{
// Construction
public:
	CSetBalanceDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSetBalanceDlg)
	enum { IDD = IDD_SETBALANCE_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSetBalanceDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSetBalanceDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETBALANCEDLG_H__83E00D5E_F321_48A0_9B1F_DCD82624FC6A__INCLUDED_)
