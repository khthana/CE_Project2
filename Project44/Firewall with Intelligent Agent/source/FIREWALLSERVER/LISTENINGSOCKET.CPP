// ListeningSocket.cpp : implementation file
//

#include "stdafx.h"
//#include "FirewallServer.h"
#include "ListeningSocket.h"

#include "agent.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CListeningSocket


CListeningSocket::~CListeningSocket()
{
}


// Do not edit the following lines, which are needed by ClassWizard.
#if 0
BEGIN_MESSAGE_MAP(CListeningSocket, CSocket)
	//{{AFX_MSG_MAP(CListeningSocket)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()
#endif	// 0

/////////////////////////////////////////////////////////////////////////////
// CListeningSocket member functions

CListeningSocket::CListeningSocket(CAgent* pAgent)
{
	m_pAgent = pAgent;
}

void CListeningSocket::OnAccept(int nErrorCode) 
{
	CSocket::OnAccept(nErrorCode);
	m_pAgent->ProcessPendingAccept();
}

IMPLEMENT_DYNAMIC(CListeningSocket, CSocket)
