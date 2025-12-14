#if !defined(AFX_DLGENTERCLASS_H__E36BA9E1_022F_11D5_B914_A3BEDAFD8433__INCLUDED_)
#define AFX_DLGENTERCLASS_H__E36BA9E1_022F_11D5_B914_A3BEDAFD8433__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgEnterClass.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgEnterClass dialog

class CDlgEnterClass : public CDialog
{
// Construction
public:
	CDlgEnterClass(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgEnterClass)
	enum { IDD = IDD_DIALOG_ENTER_CLASS };
	CEdit	m_Edit1;
	CButton	m_ButtonOk;
	CString	m_ClassName;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgEnterClass)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgEnterClass)
	virtual BOOL OnInitDialog();
	afx_msg void OnChangeEdit1();
	afx_msg void OnMaxtextEdit1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGENTERCLASS_H__E36BA9E1_022F_11D5_B914_A3BEDAFD8433__INCLUDED_)
