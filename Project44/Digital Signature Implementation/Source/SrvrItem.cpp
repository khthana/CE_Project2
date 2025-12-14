// SrvrItem.cpp : implementation of the CSignatureSrvrItem class
//

#include "stdafx.h"
#include "Signature.h"

#include "SignatureDoc.h"
#include "SrvrItem.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSignatureSrvrItem implementation

IMPLEMENT_DYNAMIC(CSignatureSrvrItem, CDocObjectServerItem)

CSignatureSrvrItem::CSignatureSrvrItem(CSignatureDoc* pContainerDoc)
	: CDocObjectServerItem(pContainerDoc, TRUE)
{
}

CSignatureSrvrItem::~CSignatureSrvrItem()
{
}

void CSignatureSrvrItem::Serialize(CArchive& ar)
{
	if (!IsLinkedItem())
	{
		CSignatureDoc* pDoc = GetDocument();
		ASSERT_VALID(pDoc);
		pDoc->Serialize(ar);
	}
}

BOOL CSignatureSrvrItem::OnGetExtent(DVASPECT dwDrawAspect, CSize& rSize)
{
	if (dwDrawAspect != DVASPECT_CONTENT)
		return CDocObjectServerItem::OnGetExtent(dwDrawAspect, rSize);

	CSignatureDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	rSize = CSize(5400, 2200);   // 3000 x 3000 HIMETRIC units

	return TRUE;
}

BOOL CSignatureSrvrItem::OnDraw(CDC* pDC, CSize& rSize)
{
	CBrush mybrush(RGB(0, 0, 255));
	HICON hicon = NULL;

	UNREFERENCED_PARAMETER(rSize);

	CSignatureDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	

//	pDC->SetMapMode(MM_ANISOTROPIC);
	pDC->SetMapMode(MM_TEXT);
	pDC->SetWindowOrg(0,0);
	pDC->SetWindowExt(50, 10);
	
	if (theApp.m_pic != NULL)
	{	
		pDC->DrawState(CPoint(0,0), CSize(280, 80), theApp.m_pic, NULL);
	}
	else
	{	
		hicon = AfxGetApp()->LoadIcon(IDI_ICON1);
		pDC->DrawIcon(CPoint(0, 0), hicon);
		pDC->SetBkColor(RGB(255, 255, 255));
		pDC->SetTextColor(RGB(0, 0, 255));
		pDC->TextOut(50, 0, "IsagSignature");
	}

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CSignatureSrvrItem diagnostics

#ifdef _DEBUG
void CSignatureSrvrItem::AssertValid() const
{
	CDocObjectServerItem::AssertValid();
}

void CSignatureSrvrItem::Dump(CDumpContext& dc) const
{
	CDocObjectServerItem::Dump(dc);
}
#endif

/////////////////////////////////////////////////////////////////////////////
