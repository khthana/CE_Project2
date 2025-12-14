#if !defined(AFX_DLGSHOW_H__E36BA9E2_022F_11D5_B914_A3BEDAFD8433__INCLUDED_)
#define AFX_DLGSHOW_H__E36BA9E2_022F_11D5_B914_A3BEDAFD8433__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgShow.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgShow dialog

class CDlgShow : public CDialog
{
// Construction
public:
	CDlgShow(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgShow)
	enum { IDD = IDD_DIALOG_SHOW };
	CListCtrl	m_List2;
	CListCtrl	m_List1;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgShow)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgShow)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGSHOW_H__E36BA9E2_022F_11D5_B914_A3BEDAFD8433__INCLUDED_)
