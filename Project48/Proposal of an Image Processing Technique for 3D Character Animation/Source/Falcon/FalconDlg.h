// FalconDlg.h : header file
//
//{{AFX_INCLUDES()
#include "videoocx.h"
//}}AFX_INCLUDES

#if !defined(AFX_FALCONDLG_H__DA29CF18_30B2_4DD8_8CB6_EA8B21BBE9E6__INCLUDED_)
#define AFX_FALCONDLG_H__DA29CF18_30B2_4DD8_8CB6_EA8B21BBE9E6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CFalconDlg dialog

class CFalconDlg : public CDialog
{
// Construction
public:
	CFalconDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CFalconDlg)
	enum { IDD = IDD_FALCON_DIALOG };
	CListBox	m_list02;
	CListBox	m_list01;
	CVideoOCX	m_vdoocx;
	BOOL	m_preview;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFalconDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	int m_himg01;
	int m_himg02;

	// Generated message map functions
	//{{AFX_MSG(CFalconDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnPreview();
	afx_msg void OnProcess01();
	afx_msg void OnMouseMoveVDOOCX(short Button, short Shift, long x, long y);
	afx_msg void OnCloseVDOOCX();
	afx_msg void OnInitVDOOCX();
	afx_msg void OnOriginal();
	afx_msg void OnThreshold();
	afx_msg void OnProcess02();
	DECLARE_EVENTSINK_MAP()
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FALCONDLG_H__DA29CF18_30B2_4DD8_8CB6_EA8B21BBE9E6__INCLUDED_)
