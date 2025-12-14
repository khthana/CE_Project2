#if !defined(AFX_SHOW_H__A4FE67B8_7173_41A9_80D3_A65269590CFF__INCLUDED_)
#define AFX_SHOW_H__A4FE67B8_7173_41A9_80D3_A65269590CFF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Show.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// Show dialog

class Show : public CDialog
{
// Construction
public:
	Show(CWnd* pParent = NULL);   // standard constructor
	unsigned int wpic,hpic;
	int *k1;

// Dialog Data
	//{{AFX_DATA(Show)
	enum { IDD = IDD_DIALOG1 };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(Show)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(Show)
	afx_msg void OnPaint();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SHOW_H__A4FE67B8_7173_41A9_80D3_A65269590CFF__INCLUDED_)
