// WizDDXView.cpp : implementation of the CWizDDXView class
//

#include "stdafx.h"
#include "WizDDX.h"

#include "WizDDXDoc.h"
#include "WizDDXView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWizDDXView

IMPLEMENT_DYNCREATE(CWizDDXView, CView)

BEGIN_MESSAGE_MAP(CWizDDXView, CView)
	//{{AFX_MSG_MAP(CWizDDXView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWizDDXView construction/destruction

CWizDDXView::CWizDDXView()
{
	// TODO: add construction code here

}

CWizDDXView::~CWizDDXView()
{
}

BOOL CWizDDXView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CWizDDXView drawing

void CWizDDXView::OnDraw(CDC* pDC)
{
	CWizDDXDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CWizDDXView printing

BOOL CWizDDXView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CWizDDXView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CWizDDXView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CWizDDXView diagnostics

#ifdef _DEBUG
void CWizDDXView::AssertValid() const
{
	CView::AssertValid();
}

void CWizDDXView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CWizDDXDoc* CWizDDXView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CWizDDXDoc)));
	return (CWizDDXDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CWizDDXView message handlers
