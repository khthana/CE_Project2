// WWait.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "WWait.h"
#include <afxmt.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWWait dialog


CWWait::CWWait(CWnd* pParent /*=NULL*/)
	: CDialog(CWWait::IDD, pParent)
{
	//{{AFX_DATA_INIT(CWWait)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CWWait::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CWWait)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CWWait, CDialog)
	//{{AFX_MSG_MAP(CWWait)
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWWait message handlers

void CWWait::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	CSingleLock lock(m_Thread->m_Event, FALSE);

   if (lock.Lock(0))
      {
      CDialog::OnOK();
      }
	//CDialog::OnTimer(nIDEvent);
}

void CWWait::OnOK() 
{
	// TODO: Add extra validation here
	if (m_bShowCancelButton)
      {
	   m_Thread->m_Event->SetEvent();
	   CDialog::OnOK();
      }
	CDialog::OnOK();
}

BOOL CWWait::OnInitDialog() 
{
	 
	CDialog::OnInitDialog();
	
	GetDlgItem(IDOK)->ShowWindow(m_bShowCancelButton ? SW_SHOW : SW_HIDE);
	SetTimer(1,500,NULL);
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
