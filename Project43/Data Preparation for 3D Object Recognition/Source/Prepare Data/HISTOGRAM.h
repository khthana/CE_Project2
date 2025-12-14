#if !defined(AFX_HISTOGRAM_H__803C0743_A22E_11D4_89C6_00D009037179__INCLUDED_)
#define AFX_HISTOGRAM_H__803C0743_A22E_11D4_89C6_00D009037179__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// HISTOGRAM.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CHISTOGRAM dialog

class CHISTOGRAM : public CDialog
{
// Construction
public:
	CHISTOGRAM(CWnd* pParent = NULL);   // standard constructor
	int color[255];
	int *k1;
	int wpic,hpic;
// Dialog Data
	//{{AFX_DATA(CHISTOGRAM)
	enum { IDD = IDD_DIALOG7 };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CHISTOGRAM)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CHISTOGRAM)
	afx_msg void OnPaint();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_HISTOGRAM_H__803C0743_A22E_11D4_89C6_00D009037179__INCLUDED_)
