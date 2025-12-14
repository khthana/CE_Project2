#if !defined(AFX_PGM_H__803C0741_A22E_11D4_89C6_00D009037179__INCLUDED_)
#define AFX_PGM_H__803C0741_A22E_11D4_89C6_00D009037179__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PGM.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// PGM dialog

class PGM : public CDialog
{
// Construction
public:
	PGM(CWnd* pParent = NULL);   // standard constructor
	unsigned int wpic,hpic;
	int *k1;
	
// Dialog Data
	//{{AFX_DATA(PGM)
	enum { IDD = IDD_DIALOG5 };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(PGM)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(PGM)
	afx_msg void OnPaint();
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PGM_H__803C0741_A22E_11D4_89C6_00D009037179__INCLUDED_)
