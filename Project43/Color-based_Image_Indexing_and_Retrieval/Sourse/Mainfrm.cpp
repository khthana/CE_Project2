// mainfrm.cpp : implementation of the CMainFrame class
//
// This is a part of the Microsoft Foundation Classes C++ library.
// Copyright (C) 1992-1998 Microsoft Corporation
// All rights reserved.
//
// This source code is only intended as a supplement to the
// Microsoft Foundation Classes Reference and related
// electronic documentation provided with the library.
// See these sources for detailed information regarding the
// Microsoft Foundation Classes product.

#include "stdafx.h"
#include "diblook.h"

#include "mainfrm.h"

#ifdef _DEBUG
#undef THIS_FILE
static char BASED_CODE THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMainFrame

IMPLEMENT_DYNAMIC(CMainFrame, CMDIFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CMDIFrameWnd)
	//{{AFX_MSG_MAP(CMainFrame)
	ON_WM_CREATE()
	ON_WM_PALETTECHANGED()
	ON_WM_QUERYNEWPALETTE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// arrays of IDs used to initialize control bars
// toolbar buttons - IDs are command buttons
static UINT BASED_CODE buttons[] =
{
	// same order as in the bitmap 'toolbar.bmp'
	ID_FILE_OPEN,
	ID_SELECTDB_SELECTUSEDB,
	ID_TOOL_DATABASE,
	ID_FILE_PRINT,
		ID_SEPARATOR,
	ID_MATCHING_COLORONLY,
	ID_MATCHING_SEGMENT,
	ID_MATCHING_SEGMENTANDROTATION,
	ID_OPTION_SETBOXCOLOR,
		ID_SEPARATOR,
	ID_ELEMENT_RECTANGLE,
	ID_ELEMENT_CIRCLE,
	ID_ELEMENT_SELECTALL,
		ID_SEPARATOR,
	ID_APP_ABOUT,	
};

static UINT BASED_CODE indicators[] =
{
	ID_SEPARATOR,           // status line indicator
	ID_INDICATOR_CAPS,
	ID_INDICATOR_NUM,
	ID_INDICATOR_SCRL,
};

/////////////////////////////////////////////////////////////////////////////
// CMainFrame construction/destruction

CMainFrame::CMainFrame()
{
}

CMainFrame::~CMainFrame()
{
}

int CMainFrame::OnCreate(LPCREATESTRUCT lpCreateStruct)
{
	if (CMDIFrameWnd::OnCreate(lpCreateStruct) == -1)
		return -1;
	
	if (!m_wndToolBar.CreateEx(this, TBSTYLE_FLAT, WS_CHILD | WS_VISIBLE | CBRS_TOP
		| CBRS_GRIPPER | CBRS_TOOLTIPS | CBRS_FLYBY | CBRS_SIZE_DYNAMIC) ||
		!m_wndToolBar.LoadToolBar(IDR_MAINFRAME)||
		!m_wndToolBar.SetButtons(buttons,
		 sizeof(buttons)/sizeof(UINT)))
	{
		TRACE0("Failed to create toolbar\n");
		return -1;      // fail to create
	}

	if (!m_wndStatusBar.Create(this) ||
		!m_wndStatusBar.SetIndicators(indicators,
		  sizeof(indicators)/sizeof(UINT)))
	{
		TRACE0("Failed to create status bar\n");
		return -1;      // fail to create
	}

	// TODO: Delete these three lines if you don't want the toolbar to
	//  be dockable
	m_wndToolBar.EnableDocking(CBRS_ALIGN_ANY);
	EnableDocking(CBRS_ALIGN_ANY);
	DockControlBar(&m_wndToolBar);

	return 0;
}


/////////////////////////////////////////////////////////////////////////////
// CMainFrame commands


void CMainFrame::OnPaletteChanged(CWnd* pFocusWnd)
{
	CMDIFrameWnd::OnPaletteChanged(pFocusWnd);

	// always realize the palette for the active view
	CMDIChildWnd* pMDIChildWnd = MDIGetActive();
	if (pMDIChildWnd == NULL)
		return; // no active MDI child frame
	CView* pView = pMDIChildWnd->GetActiveView();
	ASSERT(pView != NULL);

	// notify all child windows that the palette has changed
	SendMessageToDescendants(WM_DOREALIZE, (WPARAM)pView->m_hWnd);
}



BOOL CMainFrame::OnQueryNewPalette()
{
	// always realize the palette for the active view
	CMDIChildWnd* pMDIChildWnd = MDIGetActive();
	if (pMDIChildWnd == NULL)
		return FALSE; // no active MDI child frame (no new palette)
	CView* pView = pMDIChildWnd->GetActiveView();
	ASSERT(pView != NULL);

	// just notify the target view
	pView->SendMessage(WM_DOREALIZE, (WPARAM)pView->m_hWnd);
	return TRUE;
}

