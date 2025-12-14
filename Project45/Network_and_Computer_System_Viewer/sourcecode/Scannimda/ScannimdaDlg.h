// ScannimdaDlg.h : header file
//

#if !defined(AFX_SCANNIMDADLG_H__396642DB_7C60_4859_B00B_B1BE7EA8F06B__INCLUDED_)
#define AFX_SCANNIMDADLG_H__396642DB_7C60_4859_B00B_B1BE7EA8F06B__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CScannimdaDlg dialog

class CScannimdaDlg : public CDialog
{
// Construction
public:
	CScannimdaDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CScannimdaDlg)
	enum { IDD = IDD_SCANNIMDA_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CScannimdaDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CScannimdaDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SCANNIMDADLG_H__396642DB_7C60_4859_B00B_B1BE7EA8F06B__INCLUDED_)
