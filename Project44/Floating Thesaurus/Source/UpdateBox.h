#if !defined(AFX_UPDATEBOX_H__7E59525E_D60F_4E4E_86EF_35BAD316CCEF__INCLUDED_)
#define AFX_UPDATEBOX_H__7E59525E_D60F_4E4E_86EF_35BAD316CCEF__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// UpdateBox.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CUpdateBox dialog

class CUpdateBox : public CDialog
{
// Construction
public:
	CUpdateBox(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CUpdateBox)
	enum { IDD = IDD_UPDATE_VOCAB };
	CString	m_editvocab;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CUpdateBox)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CUpdateBox)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_UPDATEBOX_H__7E59525E_D60F_4E4E_86EF_35BAD316CCEF__INCLUDED_)
