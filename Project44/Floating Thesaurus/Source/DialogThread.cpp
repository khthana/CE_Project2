// DialogThread.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "DialogThread.h"

#include "GifAnimation.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDialogThread

IMPLEMENT_DYNCREATE(CDialogThread, CWinThread)

CDialogThread::CDialogThread()
{
}

CDialogThread::~CDialogThread()
{
}

BOOL CDialogThread::InitInstance()
{
    CGifAnimation dlg;

    m_pMainWnd = &dlg;
    dlg.DoModal();  // returning false will make MFC doing the cleanup for us :)
          
    return FALSE;
}

int CDialogThread::ExitInstance()
{
	return CWinThread::ExitInstance();
}

BEGIN_MESSAGE_MAP(CDialogThread, CWinThread)
	//{{AFX_MSG_MAP(CDialogThread)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDialogThread message handlers
