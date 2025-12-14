// SrvrItem.h : interface of the CIsagSrvrItem class
//

#if !defined(AFX_SRVRITEM_H__8A5F6390_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
#define AFX_SRVRITEM_H__8A5F6390_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "IsagSig.h"

class CIsagSrvrItem : public COleServerItem
{
	DECLARE_DYNAMIC(CIsagSrvrItem)

// Constructors
public:
	CIsagSrvrItem(CIsagSignDoc* pContainerDoc);
	CIsagSig *m_pisagsig;

// Attributes
	CIsagSignDoc* GetDocument() const
		{ return (CIsagSignDoc*)COleServerItem::GetDocument(); }

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CIsagSrvrItem)
	public:
	virtual BOOL OnDraw(CDC* pDC, CSize& rSize);
	virtual BOOL OnGetExtent(DVASPECT dwDrawAspect, CSize& rSize);
	//}}AFX_VIRTUAL

// Implementation
public:
	~CIsagSrvrItem();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:
	virtual void Serialize(CArchive& ar);   // overridden for document i/o
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SRVRITEM_H__8A5F6390_F56B_11D4_B029_0050BF0BFEF1__INCLUDED_)
