#if !defined(AFX_TIMER_H__1CA245C1_EE13_4D13_BC88_99BB1598A53C__INCLUDED_)
#define AFX_TIMER_H__1CA245C1_EE13_4D13_BC88_99BB1598A53C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Timer.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTimer dialog

//##ModelId=3E9ABEE40358
class CTimer : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEE40365
	int Time;
	//##ModelId=3E9ABEE40369
	CTimer(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CTimer)
	enum { IDD = IDD_TIMER };
	//##ModelId=3E9ABEE40364
	int		m_InputTime;
	//##ModelId=3E9ABEE40363
	int		m_InputTimeMin;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTimer)
	protected:
	//##ModelId=3E9ABEE40367
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CTimer)
	//##ModelId=3E9ABEE40366
	afx_msg void OnSetTimer();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TIMER_H__1CA245C1_EE13_4D13_BC88_99BB1598A53C__INCLUDED_)
