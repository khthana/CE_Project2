// SrvrItem.h : interface of the CSignatureSrvrItem class
//

#if !defined(AFX_SRVRITEM_H__F65842F3_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
#define AFX_SRVRITEM_H__F65842F3_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CSignatureSrvrItem : public CDocObjectServerItem
{
	DECLARE_DYNAMIC(CSignatureSrvrItem)

// Constructors
public:
	CSignatureSrvrItem(CSignatureDoc* pContainerDoc);

// Attributes
	CSignatureDoc* GetDocument() const
		{ return (CSignatureDoc*)CDocObjectServerItem::GetDocument(); }

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSignatureSrvrItem)
	public:
	virtual BOOL OnDraw(CDC* pDC, CSize& rSize);
	virtual BOOL OnGetExtent(DVASPECT dwDrawAspect, CSize& rSize);
	//}}AFX_VIRTUAL

// Implementation
public:
	~CSignatureSrvrItem();
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

#endif // !defined(AFX_SRVRITEM_H__F65842F3_0F2E_11D6_BB32_00E07D0326BE__INCLUDED_)
