#if !defined(AFX_NEWCLIENT_H__60A3D85B_7F15_4180_A3C2_30DC9F063FF4__INCLUDED_)
#define AFX_NEWCLIENT_H__60A3D85B_7F15_4180_A3C2_30DC9F063FF4__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// NewClient.h : header file
//


/////////////////////////////////////////////////////////////////////////////
// CNewClient dialog

class CNewClient : public CDialog
{
// Construction
public:
	CNewClient(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CNewClient)
	enum { IDD = IDD_NEWCLIENT };
	CButton	m_bCancel;
	CButton	m_bOK;
	CButton	m_bDetail;
	CString	m_group;
	CString	m_ipaddr;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNewClient)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CNewClient)
	afx_msg void OnDetail();
	afx_msg void OnOk();
	virtual BOOL OnInitDialog();
	afx_msg void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NEWCLIENT_H__60A3D85B_7F15_4180_A3C2_30DC9F063FF4__INCLUDED_)
