// WizDDXView.h : interface of the CWizDDXView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_WIZDDXVIEW_H__82449082_02F7_4FBC_8E69_0DE6835FC8B5__INCLUDED_)
#define AFX_WIZDDXVIEW_H__82449082_02F7_4FBC_8E69_0DE6835FC8B5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CWizDDXView : public CView
{
protected: // create from serialization only
	CWizDDXView();
	DECLARE_DYNCREATE(CWizDDXView)

// Attributes
public:
	CWizDDXDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWizDDXView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CWizDDXView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CWizDDXView)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in WizDDXView.cpp
inline CWizDDXDoc* CWizDDXView::GetDocument()
   { return (CWizDDXDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WIZDDXVIEW_H__82449082_02F7_4FBC_8E69_0DE6835FC8B5__INCLUDED_)
