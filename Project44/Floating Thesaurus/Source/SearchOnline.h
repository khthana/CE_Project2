#if !defined(AFX_SEARCHONLINE_H__5F60A1AE_362F_4B7B_99D7_0C42D8F96ADF__INCLUDED_)
#define AFX_SEARCHONLINE_H__5F60A1AE_362F_4B7B_99D7_0C42D8F96ADF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SearchOnline.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSearchOnline dialog

class CSearchOnline : public CDialog
{
// Construction
public:
	CSearchOnline(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CSearchOnline)
	enum { IDD = IDD_SEARCHONLINE };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSearchOnline)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSearchOnline)
	afx_msg void OnOnlineOK();
	afx_msg void OnOnlineCANCEL();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SEARCHONLINE_H__5F60A1AE_362F_4B7B_99D7_0C42D8F96ADF__INCLUDED_)
