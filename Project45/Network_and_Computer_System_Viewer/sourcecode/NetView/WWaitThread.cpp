// WWaitThread.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "WWaitThread.h"
#include "WWait.h"
#include <afxmt.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWWaitThread

IMPLEMENT_DYNCREATE(CWWaitThread, CWinThread)

CWWaitThread::CWWaitThread()
{
  m_bShowCancelButton = false;
}

CWWaitThread::~CWWaitThread()
{
}

BOOL CWWaitThread::InitInstance()
{
	// TODO:  perform and per-thread initialization here
   CWWait dlg;

   m_pMainWnd = &dlg;
   m_Event = new CEvent(FALSE, TRUE, m_Eventname);
   dlg.m_bShowCancelButton = m_bShowCancelButton;
   //dlg.m_Text = m_Text;
   dlg.m_Thread = this;
   dlg.DoModal();
   delete m_Event;
	return TRUE;
}

int CWWaitThread::ExitInstance()
{
	// TODO:  perform any per-thread cleanup here
	return CWinThread::ExitInstance();
}

BEGIN_MESSAGE_MAP(CWWaitThread, CWinThread)
	//{{AFX_MSG_MAP(CWWaitThread)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWWaitThread message handlers
