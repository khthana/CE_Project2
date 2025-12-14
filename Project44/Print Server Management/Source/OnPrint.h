#if !defined(AFX_ONPRINT_H__868FB674_356C_4545_8406_EA4C40297537__INCLUDED_)
#define AFX_ONPRINT_H__868FB674_356C_4545_8406_EA4C40297537__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// OnPrint.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// OnPrint dialog

class OnPrint : public CDialog
{
// Construction
public:
	OnPrint(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(OnPrint)
	enum { IDD = _UNKNOWN_RESOURCE_ID_ };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(OnPrint)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(OnPrint)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ONPRINT_H__868FB674_356C_4545_8406_EA4C40297537__INCLUDED_)
