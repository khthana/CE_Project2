#if !defined(AFX_CHARGEDLG_H__50E378F9_EC48_48BF_8170_C7B10ECCB01F__INCLUDED_)
#define AFX_CHARGEDLG_H__50E378F9_EC48_48BF_8170_C7B10ECCB01F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ChargeDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CChargeDlg dialog

class CChargeDlg : public CDialog
{
// Construction
public:
	CChargeDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CChargeDlg)
	enum { IDD = IDD_CHARGE_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CChargeDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CChargeDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CHARGEDLG_H__50E378F9_EC48_48BF_8170_C7B10ECCB01F__INCLUDED_)
