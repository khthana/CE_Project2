#if !defined(AFX_DATADIALOG_H__3893D6E0_FAD4_11D3_AF23_28FB07C10000__INCLUDED_)
#define AFX_DATADIALOG_H__3893D6E0_FAD4_11D3_AF23_28FB07C10000__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DataDialog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDataDialog dialog

class CDataDialog : public CDialog
{
// Construction
public:
	CDataDialog(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDataDialog)
	enum { IDD = IDD_DATADIALOG };
	CString	m_data;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDataDialog)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDataDialog)
		// NOTE: the ClassWizard will add member functions here
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DATADIALOG_H__3893D6E0_FAD4_11D3_AF23_28FB07C10000__INCLUDED_)
