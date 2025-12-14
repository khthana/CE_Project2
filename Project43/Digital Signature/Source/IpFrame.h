// IpFrame.h : interface of the CInPlaceFrame class
//

#if !defined(AFX_IPFRAME_H__8A5F6392_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
#define AFX_IPFRAME_H__8A5F6392_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CInPlaceFrame : public COleIPFrameWnd
{
	DECLARE_DYNCREATE(CInPlaceFrame)

public:
	CInPlaceFrame();
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CInPlaceFrame)
	public:
	virtual BOOL OnCreateControlBars(CFrameWnd* pWndFrame, CFrameWnd* pWndDoc);
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CInPlaceFrame();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	CToolBar    m_wndToolBar;
	COleDropTarget	m_dropTarget;
	COleResizeBar   m_wndResizeBar;
	
// Generated message map functions
protected:
	//{{AFX_MSG(CInPlaceFrame)
	afx_msg int OnCreate(LPCREATESTRUCT lpCreateStruct);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_IPFRAME_H__8A5F6392_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
