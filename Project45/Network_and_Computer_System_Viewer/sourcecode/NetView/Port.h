#if !defined(AFX_PORT_H__DA5E3907_6BE5_4464_91EB_427A58E8D94E__INCLUDED_)
#define AFX_PORT_H__DA5E3907_6BE5_4464_91EB_427A58E8D94E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Port.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPort dialog

//##ModelId=3E9ABEEF0296
class CPort : public CDialog
{
// Construction
public:
	//##ModelId=3E9ABEEF02A4
	CPort(CWnd* pParent = NULL);   // standard constructor
	//##ModelId=3E9ABEEF02A0
	CString Oport;
// Dialog Data
	//{{AFX_DATA(CPort)
	enum { IDD = IDD_Port };
	//##ModelId=3E9ABEEF0298
	CString	m_OpenPort;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPort)
	protected:
	//##ModelId=3E9ABEEF02A2
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPort)
	//##ModelId=3E9ABEEF02A1
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PORT_H__DA5E3907_6BE5_4464_91EB_427A58E8D94E__INCLUDED_)
