// Timer.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Timer.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTimer dialog


CTimer::CTimer(CWnd* pParent /*=NULL*/)
	: CDialog(CTimer::IDD, pParent)
{
	//{{AFX_DATA_INIT(CTimer)
	m_InputTime = 1;
	m_InputTimeMin = 0;
	//}}AFX_DATA_INIT
}


void CTimer::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CTimer)
	DDX_Text(pDX, IDC_EDIT1, m_InputTime);
	DDV_MinMaxInt(pDX, m_InputTime, 1, 72);
	DDX_Text(pDX, IDC_EDIT2, m_InputTimeMin);
	DDV_MinMaxInt(pDX, m_InputTimeMin, 1, 59);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CTimer, CDialog)
	//{{AFX_MSG_MAP(CTimer)
	ON_BN_CLICKED(IDOK, OnSetTimer)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTimer message handlers

void CTimer::OnSetTimer() 
{
	// TODO: Add your control notification handler code here
	UpdateData(TRUE);
	Time = m_InputTime;
	CDialog::OnOK();
}
