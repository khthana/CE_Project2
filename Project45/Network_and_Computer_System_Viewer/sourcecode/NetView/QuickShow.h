#if !defined(AFX_QUICKSHOW_H__D8F9A64D_8C4E_4E89_99A2_1B943F421084__INCLUDED_)
#define AFX_QUICKSHOW_H__D8F9A64D_8C4E_4E89_99A2_1B943F421084__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// QuickShow.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CQuickShow dialog

//##ModelId=3E9ABEE801B0
class CQuickShow : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEE801C4
	void DoCommand(CString ThisIP);
	//##ModelId=3E9ABEE801BF
	CQuickShow(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CQuickShow)
	enum { IDD = IDD_QUICKSHOW };
	//##ModelId=3E9ABEE801BA
	CEdit	m_Output;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CQuickShow)
	protected:
	//##ModelId=3E9ABEE801BD
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CQuickShow)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_QUICKSHOW_H__D8F9A64D_8C4E_4E89_99A2_1B943F421084__INCLUDED_)
