#if !defined(AFX_RESULTDLG_H__EEACC721_E602_11D3_BC21_97E189E7AD2F__INCLUDED_)
#define AFX_RESULTDLG_H__EEACC721_E602_11D3_BC21_97E189E7AD2F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ResultDlg.h : header file
#include "dibapi.h"

//
/////////////////////////////////////////////////////////////////////////////
// CResultDlg dialog

class CResultDlg : public CDialog
{
// Construction
public:
	CResultDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CResultDlg)
	enum { IDD = IDD_DIALOG };
	CString	m_name1;
	CString	m_name2;
	CString	m_name3;
	CString	m_name4;
	CString	m_name5;
	CString m_matching1;
	CString m_matching2;
	CString m_matching3;
	CString m_matching4;
	CString m_matching5;
	CString	m_data1;
	CString	m_data2;
	CString	m_data3;
	CString	m_data4;
	CString	m_data5;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CResultDlg)
	public:
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	virtual BOOL DestroyWindow();
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
public:

	void InitPath(CString filepath,CString name,float match,CString detail,BOOL reset);
	CString Convert(float match);

protected:

	HDIB m_hDIB1;
	HDIB m_hDIB2;
	HDIB m_hDIB3;
	HDIB m_hDIB4;
	HDIB m_hDIB5;

	CPalette* m_palDIB1;
	CPalette* m_palDIB2;
	CPalette* m_palDIB3;
	CPalette* m_palDIB4;
	CPalette* m_palDIB5;
//	CSize m_sizeDoc;
	int no;

	// Generated message map functions
	//{{AFX_MSG(CResultDlg)
	afx_msg void OnPaint();
	virtual void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()


};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RESULTDLG_H__EEACC721_E602_11D3_BC21_97E189E7AD2F__INCLUDED_)
