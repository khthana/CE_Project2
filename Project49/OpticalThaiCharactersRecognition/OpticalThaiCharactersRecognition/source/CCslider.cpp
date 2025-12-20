// CCslider.cpp : implementation file
//

#include "stdafx.h"
#include "ImgProc.h"
#include "CCslider.h"
#include ".\ccslider.h"


// CCCslider dialog

IMPLEMENT_DYNAMIC(CCCslider, CSliderCtrl)
CCCslider::CCCslider(CWnd* pParent /*=NULL*/)
//	: CDialog(CCCslider::IDD, pParent)
{
	m_pBuddyWnd = NULL;
	m_brWhiteBrush.CreateStockObject( WHITE_BRUSH );
}

CCCslider::~CCCslider()
{
}

void CCCslider::DoDataExchange(CDataExchange* pDX)
{
//	CDialog::DoDataExchange(pDX);
}


BEGIN_MESSAGE_MAP(CCCslider, CSliderCtrl)
//	ON_BN_CLICKED(IDC_START, OnBnClickedStart)
//	ON_BN_CLICKED(IDC_REFRESH, OnBnClickedRefresh)
ON_BN_CLICKED(IDC_BUTTON3, OnBnClickedButton3)
ON_BN_CLICKED(IDC_Loadweight, OnBnClickedLoadweight)
ON_BN_CLICKED(IDOK, OnBnClickedOk)
END_MESSAGE_MAP()

HWND CCCslider::SetBuddy(CWnd *pBuddyWnd)
{
	ASSERT( ::IsWindow(pBuddyWnd->m_hWnd) );
	m_pBuddyWnd = pBuddyWnd;
	pBuddyWnd->SetOwner( this );
	pBuddyWnd->ShowWindow( SW_SHOW );
	HWND hWnd = (HWND) SendMessage( TBM_SETBUDDY, (WPARAM)FALSE, (LPARAM)pBuddyWnd->m_hWnd );
	ReflectedScrollMessage();	// in order to get the initial display of text
	return hWnd;
}

void CCCslider::ReflectedScrollMessage()
{
	// update buddy's text, if there is a buddy
	if ( m_pBuddyWnd != NULL )
	{
		int iPos = GetPos();
		int iMax = GetRangeMax();
		CString text;
		text.Format( "%d", iMax - iPos);	// BAD!!! Because of top-to-bottom orientation of slider
		m_pBuddyWnd->SetWindowText( text );
	}
}

void CCCslider::SetPos(int nPos)
{
	CSliderCtrl::SetPos( nPos );

	ReflectedScrollMessage();
}


// CCCslider message handlers

//void CCCslider::OnBnClickedStart()
//{
	// TODO: Add your control notification handler code here
//}

//void CCCslider::OnBnClickedRefresh()
//{
	// TODO: Add your control notification handler code here
//}

void CCCslider::OnBnClickedButton3()
{
	// TODO: Add your control notification handler code here
}

void CCCslider::OnBnClickedLoadweight()
{
	// TODO: Add your control notification handler code here
}

void CCCslider::OnBnClickedOk()
{
	// TODO: Add your control notification handler code here
}
