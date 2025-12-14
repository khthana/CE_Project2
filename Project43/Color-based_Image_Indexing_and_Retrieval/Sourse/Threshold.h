#if !defined(AFX_THRESHOLD_H__04D50F61_FB4A_11D3_BC21_CD3E66401221__INCLUDED_)
#define AFX_THRESHOLD_H__04D50F61_FB4A_11D3_BC21_CD3E66401221__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Threshold.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CThreshold dialog

class CThreshold : public CDialog
{
// Construction
public:
	CThreshold(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CThreshold)
	enum { IDD = IDD_THERSBOX };
	CString	m_threshold;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CThreshold)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CThreshold)
	afx_msg void OnChangeTreshold();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_THRESHOLD_H__04D50F61_FB4A_11D3_BC21_CD3E66401221__INCLUDED_)
