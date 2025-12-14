// MainFrm.h : interface of the CMainFrame class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_MAINFRM_H__1D57BC4A_8FA2_4063_A6AC_B25DD93156C3__INCLUDED_)
#define AFX_MAINFRM_H__1D57BC4A_8FA2_4063_A6AC_B25DD93156C3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

//##ModelId=3E9ABEE501E7
class CMainFrame : public CFrameWnd
{
protected: // create from serialization only
	//##ModelId=3E9ABEE50209
	CMainFrame();
	DECLARE_DYNCREATE(CMainFrame)	

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMainFrame)
	//##ModelId=3E9ABEE50207
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//}}AFX_VIRTUAL

// Implementation
public:

	//##ModelId=3E9ABEE50206
	virtual ~CMainFrame();
#ifdef _DEBUG
	//##ModelId=3E9ABEE50205
	virtual void AssertValid() const;
	//##ModelId=3E9ABEE501FD
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:  // control bar embedded members
	//##ModelId=3E9ABEE501F8
	CStatusBar  m_wndStatusBar;
	//##ModelId=3E9ABEE501F3
	CToolBar    m_wndToolBar;

// Generated message map functions
protected:
	//{{AFX_MSG(CMainFrame)
	//##ModelId=3E9ABEE501FB
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAINFRM_H__1D57BC4A_8FA2_4063_A6AC_B25DD93156C3__INCLUDED_)
