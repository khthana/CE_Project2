// NetViewView.h : interface of the CNetViewView class
//
/////////////////////////////////////////////////////////////////////////////

#include "winsock2.h"
#include "Arp.h"

#if !defined(AFX_NETVIEWVIEW_H__E3124396_A2EC_4B92_AA10_B8EDC9EF9147__INCLUDED_)
#define AFX_NETVIEWVIEW_H__E3124396_A2EC_4B92_AA10_B8EDC9EF9147__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


//##ModelId=3E9ABEF002A1
class CNetViewView : public CScrollView
{
protected: // create from serialization only
	//##ModelId=3E9ABEF00325
	CNetViewView();
	DECLARE_DYNCREATE(CNetViewView)

// Attributes
public:
	//##ModelId=3E9ABEF00324
	CNetViewDoc* GetDocument();
	//##ModelId=3E9ABEF002CD
	int check_first;
	//##ModelId=3E9ABEF002CC
	bool isSetTimer;
// Operations
public:
	//##ModelId=3E9ABEF00320
	COLORREF GetRandColor();
	//##ModelId=3E9ABEF0031E
	UINT GetRandPoint(UINT nRandom);
	//##ModelId=3E9ABEF0031B
	void CmdRouteMenu(CWnd* pWnd,CMenu* pPopupMenu);
	//##ModelId=3E9ABEF00313
	void DrawRect(int start,int stop,CDC* pDC,int color);
// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CNetViewView)
	public:
	//##ModelId=3E9ABEF00311
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	//##ModelId=3E9ABEF0030C
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//##ModelId=3E9ABEF0030B
	virtual void OnInitialUpdate();
	protected:
	//##ModelId=3E9ABEF00307
	virtual void OnActivateView(BOOL bActivate, CView* pActivateView, CView* pDeactiveView);
	//}}AFX_VIRTUAL

// Implementation
public:
	//##ModelId=3E9ABEF002CB
	int HourSet;
	//##ModelId=3E9ABEF002CA
	int sec;
	//##ModelId=3E9ABEF002C2
	int hour;
	//##ModelId=3E9ABEF002C1
	int min;
	//##ModelId=3E9ABEF002C0
	UINT TimerNUM;
	//##ModelId=3E9ABEF00306
	void OnTime();
	//##ModelId=3E9ABEF00301
	virtual ~CNetViewView();
#ifdef _DEBUG
	//##ModelId=3E9ABEF00300
	virtual void AssertValid() const;
	//##ModelId=3E9ABEF002FE
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
// Generated message map functions
protected:
	//{{AFX_MSG(CNetViewView)
	//##ModelId=3E9ABEF002F7
	afx_msg void OnRButtonDown(UINT nFlags, CPoint point);
	//##ModelId=3E9ABEF002F6
	afx_msg void OnViewHost();
	//##ModelId=3E9ABEF002F5
	afx_msg void OnTrace();
	//##ModelId=3E9ABEF002F4
	afx_msg void OnRefresh();
	//##ModelId=3E9ABEF002F3
	afx_msg void OnGraph();
	//##ModelId=3E9ABEF002F2
	afx_msg void OnFileNew();
	//##ModelId=3E9ABEF002EC
	afx_msg void OnExport();
	//##ModelId=3E9ABEF002EB
	afx_msg void OnImport();
	//##ModelId=3E9ABEF002EA
	afx_msg void OnTGraph();
	//##ModelId=3E9ABEF002E9
	afx_msg void OnTRefresh();
	//##ModelId=3E9ABEF002E8
	afx_msg void OnTReport();
	//##ModelId=3E9ABEF002E2
	afx_msg void OnTImport();
	//##ModelId=3E9ABEF002E1
	afx_msg void OnOptionAutorefreshNone();
	//##ModelId=3E9ABEF002DF
	afx_msg void OnUpdateOptionAutorefreshNone(CCmdUI* pCmdUI);
	//##ModelId=3E9ABEF002DE
	afx_msg void OnOptionAutorefreshSet();
	//##ModelId=3E9ABEF002D8
	afx_msg void OnUpdateOptionAutorefreshSet(CCmdUI* pCmdUI);
	//##ModelId=3E9ABEF002D7
	afx_msg void OnOptionAddscript();
	//##ModelId=3E9ABEF002D5
	afx_msg void OnTimer(UINT nIDEvent);
	//##ModelId=3E9ABEF002D4
	afx_msg void OnOptionClearstatisticdatabase();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	//##ModelId=3E9ABEF002B7
	CBitmap bmCom;
	//##ModelId=3E9ABEF002AE
	CDC memdcCom;
};

#ifndef _DEBUG  // debug version in NetViewView.cpp
inline CNetViewDoc* CNetViewView::GetDocument()
   { return (CNetViewDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_NETVIEWVIEW_H__E3124396_A2EC_4B92_AA10_B8EDC9EF9147__INCLUDED_)
