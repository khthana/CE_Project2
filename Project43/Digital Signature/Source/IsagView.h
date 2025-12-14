// IsagView.h : interface of the CIsagSignView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_ISAGSIGNVIEW_H__8A5F638D_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
#define AFX_ISAGSIGNVIEW_H__8A5F638D_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define _WIN32_WINNT 0x0400

#include "MsWord8.h"
#include "wincrypt.h"
#include "IsagSig.h"
#include "IsagSignDoc.h"
#include "IsagSign.h"

//class _Application;
//class _Document;
//class Documents;
//class CIsagSig;




class CIsagSignView : public CListView
{
protected: // create from serialization only
	CIsagSignView();
	DECLARE_DYNCREATE(CIsagSignView)

// Attributes
public:
	CImageList m_imlist;
	CString m_user;
	CWnd* m_pParentWnd, *test;
	int m_itemnum;

	CIsagSignDoc* GetDocument();
	void Init();
	void addIcon(CString inp);
	void deleteIcon(CString inp);
	void Refresh();
	void ClearView();
	void getSel();
	void SignSignature(CString name);
	
	_Application* GetobjApp();
	_Document* GetobjDoc();
	Documents* GetobjDocs();
	CString GetActiveFilename();
	
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIsagSignView)
	public:
	virtual void OnDraw(CDC* pDC);  // overridden to draw this view
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	protected:
	virtual void OnInitialUpdate(); // called first time after construct
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CIsagSignView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
// Generated message map functions
protected:
	//{{AFX_MSG(CIsagSignView)
	afx_msg void OnCancelEditSrvr();
	afx_msg void OnSignatureSignsignature();
	afx_msg void OnSignatureVerifysignature();
	afx_msg void OnSignatureTest();
	afx_msg void OnNewsignature();
	afx_msg void OnEditCut();
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnRemovesignature();
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
	_Application m_objApp;
	_Document m_objDoc;
	Documents m_objDocs;
	CIsagSig *m_pisagsig;
};

#ifndef _DEBUG  // debug version in IsagView.cpp
inline CIsagSignDoc* CIsagSignView::GetDocument()
   { return (CIsagSignDoc*)m_pDocument; }
#endif


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ISAGVIEW_H__8A5F638D_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
