// NidsForWinDlg.h : header file
//

#if !defined(AFX_NIDSFORWINDLG_H__DDDA2486_91BD_47DC_9233_50974E4D3232__INCLUDED_)
#define AFX_NIDSFORWINDLG_H__DDDA2486_91BD_47DC_9233_50974E4D3232__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "SortListCtrl.h"
/////////////////////////////////////////////////////////////////////////////
// CNidsForWinDlg dialog

class CNidsForWinDlg : public CDialog
{
// Construction
public:
	CNidsForWinDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CNidsForWinDlg)
	enum { IDD = IDD_NIDSFORWIN_DIALOG };
	CButton	m_IDOK;
	CSortListCtrl	m_List;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNidsForWinDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	NOTIFYICONDATA m_notifyIconData;
	int NumberAdapter;
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CNidsForWinDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnDestroy();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	virtual void OnCancel();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnStop();
	afx_msg void OnSelectAdap();
	afx_msg LONG OnSystrayNotify(WPARAM wParam, LPARAM lParam);
	afx_msg void OnSysTrayOpen();
	afx_msg void OnSysTrayClose();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnPause();
	afx_msg void OnSaveAs();
	afx_msg void OnSave();
	afx_msg void OnOpen();
	afx_msg void OnClearAll();
	afx_msg void OnHelpContents();
	afx_msg void OnHelpAbout();
	afx_msg void OnButton();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	void OnStart();
	int OpenAdapter ;
	int ButtonFlag ;
	CString fname ;
	int  FileFlag ;
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NIDSFORWINDLG_H__DDDA2486_91BD_47DC_9233_50974E4D3232__INCLUDED_)
