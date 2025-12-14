// IpFrame.cpp : implementation of the CInPlaceFrame class
//

#include "stdafx.h"
#include "Signature.h"

#include "IpFrame.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CInPlaceFrame

IMPLEMENT_DYNCREATE(CInPlaceFrame, COleDocIPFrameWnd)

BEGIN_MESSAGE_MAP(CInPlaceFrame, COleDocIPFrameWnd)
	//{{AFX_MSG_MAP(CInPlaceFrame)
	ON_WM_CREATE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CInPlaceFrame construction/destruction

CInPlaceFrame::CInPlaceFrame()
{
}

CInPlaceFrame::~CInPlaceFrame()
{
}

int CInPlaceFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (COleIPFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;

	if (!m_wndResizeBar.Create(this))
	{
		TRACE0("Failed to create resize bar\n");
		return -1;      // fail to create
	}

	m_dropTarget.Register(this);
	theApp.m_pIpFrame = this;

	return 0;
}

BOOL CInPlaceFrame::OnCreateControlBars(CFrameWnd* pWndFrame, CFrameWnd* pWndDoc)
{
	UNREFERENCED_PARAMETER(pWndDoc);

	m_wndToolBar.SetOwner(this);

	if (!m_wndToolBar.CreateEx(pWndFrame, TBSTYLE_FLAT,WS_CHILD | WS_VISIBLE | CBRS_TOP
		| CBRS_GRIPPER | CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC) ||
		!m_wndToolBar.LoadToolBar(IDR_SRVR_INPLACE))
	{
		TRACE0("Failed to create toolbar\n");
		return FALSE;
	}

	m_wndToolBar.EnableDocking(CBRS_ALIGN_ANY);
	pWndFrame->EnableDocking(CBRS_ALIGN_ANY);
	pWndFrame->DockControlBar(&m_wndToolBar);

	return TRUE;
}

BOOL CInPlaceFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	return COleIPFrameWnd::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CInPlaceFrame diagnostics

#ifdef _DEBUG
void CInPlaceFrame::AssertValid() const
{
	COleIPFrameWnd::AssertValid();
}

void CInPlaceFrame::Dump(CDumpContext& dc) const
{
	COleIPFrameWnd::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CInPlaceFrame commands
