// FirewallAgentView.cpp : implementation of the CFirewallAgentView class
//

#include "stdafx.h"
#include "FirewallAgent.h"

#include "FirewallAgentDoc.h"
#include "FirewallAgentView.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentView

IMPLEMENT_DYNCREATE(CFirewallAgentView, CView)

BEGIN_MESSAGE_MAP(CFirewallAgentView, CView)
	//{{AFX_MSG_MAP(CFirewallAgentView)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentView construction/destruction

CFirewallAgentView::CFirewallAgentView()
{
	// TODO: add construction code here

}

CFirewallAgentView::~CFirewallAgentView()
{
}

BOOL CFirewallAgentView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentView drawing

void CFirewallAgentView::OnDraw(CDC* pDC)
{
	CFirewallAgentDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
}

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentView diagnostics

#ifdef _DEBUG
void CFirewallAgentView::AssertValid() const
{
	CView::AssertValid();
}

void CFirewallAgentView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CFirewallAgentDoc* CFirewallAgentView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CFirewallAgentDoc)));
	return (CFirewallAgentDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CFirewallAgentView message handlers
