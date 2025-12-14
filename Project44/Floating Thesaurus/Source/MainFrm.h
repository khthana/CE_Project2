// MainFrm.h : interface of the CMainFrame class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_MAINFRM_H__C0FB40D5_BE3A_4EC1_A90D_663F7FD352D9__INCLUDED_)
#define AFX_MAINFRM_H__C0FB40D5_BE3A_4EC1_A90D_663F7FD352D9__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "SystemTray.h"
#include "GifAnimation.h"

class CMainFrame : public CFrameWnd
{
	
protected: // create from serialization only
	CMainFrame();
	DECLARE_DYNCREATE(CMainFrame)

// Attributes
public:
	CSystemTray m_TrayIcon;
	CGifAnimation* m_pModeless;

private:
	void OnModeLess();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMainFrame)
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CMainFrame();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:  // control bar embedded members
	CStatusBar  m_wndStatusBar;
	CToolBar    m_wndToolBar;
// Generated message map functions
protected:
	//{{AFX_MSG(CMainFrame)
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	afx_msg void OnShowIcon();
	afx_msg void OnHideIcon();
	afx_msg void OnUpdateShowIcon(CCmdUI* pCmdUI);
	afx_msg void OnUpdateHideIcon(CCmdUI* pCmdUI);
	afx_msg void OnDemoMaximise();
	afx_msg void OnDemoMinimise();
	afx_msg void OnUpdateDemoMaximise(CCmdUI* pCmdUI);
	afx_msg void OnUpdateDemoMinimise(CCmdUI* pCmdUI);
	afx_msg void OnShowGif();
	afx_msg void OnClose();
	afx_msg void OnUpdateEnOnline(CCmdUI* pCmdUI);
	afx_msg void OnUpdateDisOnline(CCmdUI* pCmdUI);
	afx_msg void OnHangman();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAINFRM_H__C0FB40D5_BE3A_4EC1_A90D_663F7FD352D9__INCLUDED_)
