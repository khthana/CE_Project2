// GifAnimation.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "GifAnimation.h"
#include "HangmanTutor.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CGifAnimation dialog


CGifAnimation::CGifAnimation(CWnd* pParent /*=NULL*/)
	: CDialog(CGifAnimation::IDD, pParent)
{
	//{{AFX_DATA_INIT(CGifAnimation)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	hCursor = AfxGetApp()->LoadCursor(IDC_OVERGIF);
}

void CGifAnimation::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CGifAnimation)
	DDX_Control(pDX, IDC_GIF, m_picture);
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CGifAnimation, CDialog)
	//{{AFX_MSG_MAP(CGifAnimation)
	//ON_MESSAGE(WM_MOUSEHOVER, OnMouseHover)
	ON_WM_SETCURSOR()
	ON_WM_LBUTTONDOWN()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CGifAnimation message handlers
BOOL CGifAnimation::OnInitDialog() 
{
	CDialog::OnInitDialog();
	if (m_picture.Load(MAKEINTRESOURCE(IDR_APE),_T("GIF")))
		m_picture.Draw();

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CGifAnimation::OnMouseHover()
{
	AfxMessageBox("Hover", MB_OK);
}

void CGifAnimation::OnOK() 
{
	CDialog::OnOK();
}

void CGifAnimation::OnCancel() 
{
	CDialog::OnCancel();
}

BOOL CGifAnimation::OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message) 
{
	CRect rect;
	m_picture.GetWindowRect(&rect);
	ScreenToClient(&rect);

	CPoint point;
	GetCursorPos(&point);
	ScreenToClient(&point);

	if (rect.PtInRect(point) && hCursor)
	{
		SetCursor(hCursor);
		return TRUE;
	};

	return CDialog::OnSetCursor(pWnd, nHitTest, message);
}

void CGifAnimation::OnLButtonDown(UINT nFlags, CPoint point) 
{
	CRect rect;
	m_picture.GetWindowRect(&rect);
	ScreenToClient(&rect);
	
	if (rect.PtInRect(point))
	{
		CHangmanTutor Game;
		if (Game.GetNumber() != 0)
			Game.DoModal();
		else
			AfxMessageBox("No History File",MB_OK);
	}
	CDialog::OnLButtonDown(nFlags, point);
}
