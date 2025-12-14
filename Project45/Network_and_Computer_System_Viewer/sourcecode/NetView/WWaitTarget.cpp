// WWaitTarget.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "WWaitTarget.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CWWaitTarget

IMPLEMENT_DYNCREATE(CWWaitTarget, CCmdTarget)

CWWaitTarget::CWWaitTarget()
{
	m_bShowCancelButton = false;
	m_EventName = "";
}

CWWaitTarget::~CWWaitTarget()
{
}


BEGIN_MESSAGE_MAP(CWWaitTarget, CCmdTarget)
	//{{AFX_MSG_MAP(CWWaitTarget)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CWWaitTarget message handlers

void CWWaitTarget::Show()
{
   m_Event = CreateEvent(NULL, TRUE, FALSE, m_EventName);
   m_Thread = (CWWaitThread *)AfxBeginThread(RUNTIME_CLASS(CWWaitThread), THREAD_PRIORITY_NORMAL, 0, CREATE_SUSPENDED);
   m_Thread->m_Eventname = m_EventName;
//   m_Thread->m_Text = m_Text;
   m_Thread->m_bShowCancelButton = m_bShowCancelButton;
   m_Thread->ResumeThread();
}

void CWWaitTarget::Close()
{
   m_Thread->m_Event->SetEvent();
   CloseHandle(m_Event);
}
