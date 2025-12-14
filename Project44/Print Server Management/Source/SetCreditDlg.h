#if !defined(AFX_SETCREDITDLG_H__5C621572_0180_448E_B89D_11548BDBC47F__INCLUDED_)
#define AFX_SETCREDITDLG_H__5C621572_0180_448E_B89D_11548BDBC47F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SetCreditDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSetCreditDlg dialog

class CSetCreditDlg : public CDialog
{
// Construction
public:
	CSetCreditDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSetCreditDlg)
	enum { IDD = IDD_SETCREDIT_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSetCreditDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSetCreditDlg)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SETCREDITDLG_H__5C621572_0180_448E_B89D_11548BDBC47F__INCLUDED_)
