#if !defined(AFX_TRACER_H__75D1871C_B10C_4D83_82D5_8A4514B9B5B5__INCLUDED_)
#define AFX_TRACER_H__75D1871C_B10C_4D83_82D5_8A4514B9B5B5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Tracer.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CTracer dialog

//##ModelId=3E9ABEE80051
class CTracer : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEE80067
	CTracer(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CTracer)
	enum { IDD = IDD_TRACER };
	//##ModelId=3E9ABEE8005E
	CEdit	m_Output;
	//##ModelId=3E9ABEE8005B
	CString	m_Ip;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTracer)
	protected:
	//##ModelId=3E9ABEE80065
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CTracer)
	//##ModelId=3E9ABEE80061
	afx_msg void OnTrace();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TRACER_H__75D1871C_B10C_4D83_82D5_8A4514B9B5B5__INCLUDED_)
