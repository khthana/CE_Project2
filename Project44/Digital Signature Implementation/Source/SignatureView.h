// SignatureView.h : interface of the CSignatureView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_SIGNATUREVIEW_H__F65842F0_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
#define AFX_SIGNATUREVIEW_H__F65842F0_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define _WIN32_WINNT 0x0400

#include "MsWord8.h"
#include "wincrypt.h"
#include "IsagSig.h"
#include "SignatureDoc.h"
#include "Signature.h"

class CSignatureView : public CListView
{
protected: // create from serialization only
	CSignatureView();
	DECLARE_DYNCREATE(CSignatureView)

// Attributes
public:

	CImageList m_imlist;
	CString m_user;
	CWnd* m_pParentWnd, *test;
	int m_itemnum;

	CSignatureDoc* GetDocument();
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
	//{{AFX_VIRTUAL(CSignatureView)
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
	virtual ~CSignatureView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CSignatureView)
	afx_msg void OnCancelEditSrvr();
	afx_msg void OnEditCut();
	afx_msg void OnSignatureNewsignature();
	afx_msg void OnFileNew();
	afx_msg void OnSignatureRemovesignature();
	afx_msg void OnSignatureSignsignature();
	afx_msg void OnSignatureVerifysignature();
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()

private:
	_Application m_objApp;
	_Document m_objDoc;
	Documents m_objDocs;
	CIsagSig *m_pisagsig;
};

#ifndef _DEBUG  // debug version in SignatureView.cpp
inline CSignatureDoc* CSignatureView::GetDocument()
   { return (CSignatureDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SIGNATUREVIEW_H__F65842F0_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
