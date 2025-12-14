// NmergeDlg.h : header file
//

#if !defined(AFX_NMERGEDLG_H__F7C6DCFF_823D_4086_8E0B_F633EE27DAFB__INCLUDED_)
#define AFX_NMERGEDLG_H__F7C6DCFF_823D_4086_8E0B_F633EE27DAFB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CNmergeDlg dialog

class CNmergeDlg : public CDialog
{
// Construction
public:
	CNmergeDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CNmergeDlg)
	enum { IDD = IDD_NMERGE_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNmergeDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CNmergeDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NMERGEDLG_H__F7C6DCFF_823D_4086_8E0B_F633EE27DAFB__INCLUDED_)
