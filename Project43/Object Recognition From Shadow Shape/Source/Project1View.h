// Project1View.h : interface of the CProject1View class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_PROJECT1VIEW_H__C17F6FAD_01F4_11D5_B914_FA9A480DD735__INCLUDED_)
#define AFX_PROJECT1VIEW_H__C17F6FAD_01F4_11D5_B914_FA9A480DD735__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CProject1View : public CScrollView
{
public:
	struct EdgePt { 
		double X,Y,Rad,RadNrml,Deg;
	} VChainCode[PICSIZE];
	
	int VNumChainPt;
	int VMaxRadPt;

	CSize sizeTotal;
	
public:
	void GetVChainCode();
	void CalcVChainRotate(double deg);


protected: // create from serialization only
	CProject1View();
	DECLARE_DYNCREATE(CProject1View)

// Attributes
public:
	CProject1Doc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CProject1View)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual void OnInitialUpdate(); // called first time after construct
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CProject1View();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CProject1View)
	afx_msg void OnButtonClass();
	afx_msg void OnButtonClear();
	afx_msg void OnButtonSave();
	afx_msg void OnUpdateButtonClass(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtonClear(CCmdUI* pCmdUI);
	afx_msg void OnUpdateButtonSave(CCmdUI* pCmdUI);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in Project1View.cpp
inline CProject1Doc* CProject1View::GetDocument()
   { return (CProject1Doc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROJECT1VIEW_H__C17F6FAD_01F4_11D5_B914_FA9A480DD735__INCLUDED_)
