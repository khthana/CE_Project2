// SrvrItem.cpp : implementation of the CIsagSrvrItem class
//

#include "stdafx.h"
#include "IsagSign.h"

#include "IsagSignDoc.h"
#include "SrvrItem.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CIsagSrvrItem implementation

IMPLEMENT_DYNAMIC(CIsagSrvrItem, COleServerItem)

CIsagSrvrItem::CIsagSrvrItem(CIsagSignDoc* pContainerDoc)
	: COleServerItem(pContainerDoc, TRUE)
{
}

CIsagSrvrItem::~CIsagSrvrItem()
{
}

void CIsagSrvrItem::Serialize(CArchive& ar)
{
	if (!IsLinkedItem())
	{
		CIsagSignDoc* pDoc = GetDocument();
		ASSERT_VALID(pDoc);
		pDoc->Serialize(ar);
	}
}

BOOL CIsagSrvrItem::OnGetExtent(DVASPECT dwDrawAspect, CSize& rSize)
{
	if (dwDrawAspect != DVASPECT_CONTENT)
		return COleServerItem::OnGetExtent(dwDrawAspect, rSize);

	CIsagSignDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	rSize = CSize(5400, 2200);   // HIMETRIC units

	return TRUE;
}

BOOL CIsagSrvrItem::OnDraw(CDC* pDC, CSize& rSize)
{	CBrush mybrush(RGB(0, 0, 255));
	HICON hicon = NULL;

	UNREFERENCED_PARAMETER(rSize);

	CIsagSignDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	

//	pDC->SetMapMode(MM_ANISOTROPIC);
	pDC->SetMapMode(MM_TEXT);
	pDC->SetWindowOrg(0,0);
	pDC->SetWindowExt(50, 10);
	
	if (theApp.m_pic != NULL)
	{	pDC->DrawState(CPoint(0,0), CSize(280, 80), theApp.m_pic, NULL);
	}
	else
	{	hicon = AfxGetApp()->LoadIcon(IDI_ICON1);
		pDC->DrawIcon(CPoint(0, 0), hicon);
		pDC->SetBkColor(RGB(255, 255, 255));
		pDC->SetTextColor(RGB(0, 0, 255));
		pDC->TextOut(50, 0, "IsagSign");
	}

	return TRUE;
}

/////////////////////////////////////////////////////////////////////////////
// CIsagSrvrItem diagnostics

#ifdef _DEBUG
void CIsagSrvrItem::AssertValid() const
{
	COleServerItem::AssertValid();
}

void CIsagSrvrItem::Dump(CDumpContext& dc) const
{
	COleServerItem::Dump(dc);
}
#endif

/////////////////////////////////////////////////////////////////////////////
