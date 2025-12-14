/////////////////////////////////////////////////////
//                                                 //
// firstView.h : interface of the CFirstView class //
//                                                 //
/////////////////////////////////////////////////////

#if !defined(AFX_FIRSTVIEW_H__1F94C5EE_7B54_11D4_9031_97D250F96D68__INCLUDED_)
#define AFX_FIRSTVIEW_H__1F94C5EE_7B54_11D4_9031_97D250F96D68__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CFirstView : public CView
{
protected: // create from serialization only
	CFirstView();
	DECLARE_DYNCREATE(CFirstView)

// Attributes
public:
	CFirstDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFirstView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	void Hist_Equalize(HGLOBAL hDIB);
	BOOL WriteDIB(HGLOBAL hDIB);
	void DrawDIB( CDC* pDC, HGLOBAL hDIB, CPalette *pPal );

	CDC *pDC1;

	COLORREF boxColor;
	void Print_cr(HGLOBAL hDIB);
	void Print_col(HGLOBAL hDIB);
	//int AvgBright(int x1,int x2,int y1,int y2);
	void Text_Draw(HGLOBAL hDIB, CPalette *pPal);

	
	RGBQUAD pix_color;
	virtual ~CFirstView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CFirstView)
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	afx_msg void OnSelectArea();
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	afx_msg void OnUpdateSelectArea(CCmdUI* pCmdUI);
	afx_msg void OnExecute();
	afx_msg void OnSmooth();
	afx_msg void OnHistEqua();
	afx_msg void OnSelectframecolor();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in firstView.cpp
inline CFirstDoc* CFirstView::GetDocument()
   { return (CFirstDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FIRSTVIEW_H__1F94C5EE_7B54_11D4_9031_97D250F96D68__INCLUDED_)
