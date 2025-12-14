// ClientSocket.cpp : implementation file
//

#include "stdafx.h"
//#include "FirewallServer.h"
#include "ClientSocket.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

#include "msg.h"
#include "agent.h"
/////////////////////////////////////////////////////////////////////////////
// CClientSocket

CClientSocket::~CClientSocket()
{
	if (m_pArchiveOut != NULL)
		delete m_pArchiveOut;
	if (m_pArchiveIn != NULL)
		delete m_pArchiveIn;
	if (m_pFile != NULL)
		delete m_pFile;
}


// Do not edit the following lines, which are needed by ClassWizard.
#if 0
BEGIN_MESSAGE_MAP(CClientSocket, CSocket)
	//{{AFX_MSG_MAP(CClientSocket)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()
#endif	// 0

/////////////////////////////////////////////////////////////////////////////
// CClientSocket member functions

/* -------------------------------------------------------------
   CClientSocket(): Main constructor
   -------------------------------------------------------------
*/
CClientSocket::CClientSocket(CAgent *pAgent)
{
	m_pAgent = pAgent;
	m_pFile = NULL;
	m_pArchiveIn = NULL;
	m_pArchiveOut = NULL;
}

/* -------------------------------------------------------------
   Init(): Initilization function
   -------------------------------------------------------------
*/
void CClientSocket::Init()
{
	m_pFile = new CSocketFile(this);
	m_pArchiveIn = new CArchive(m_pFile, CArchive::load);
	m_pArchiveOut = new CArchive(m_pFile, CArchive::store);
}

/* -------------------------------------------------------------
   Abort(): Abort the transmittion
   -------------------------------------------------------------
*/
void CClientSocket::Abort()
{
	if (m_pArchiveOut != NULL)
	{
		m_pArchiveOut->Abort();
		delete m_pArchiveOut;
		m_pArchiveOut = NULL;
	}
}

/* -------------------------------------------------------------
   SendMsg(): Serialize message
   -------------------------------------------------------------
*/
void CClientSocket::SendMsg(CMsg *pMsg)
{
	if (m_pArchiveOut != NULL)
	{
		pMsg->Serialize(*m_pArchiveOut);
		m_pArchiveOut->Flush();
	}
}

/* -------------------------------------------------------------
   OnRecieve(): Automatically called when recieve data
   -------------------------------------------------------------
*/
void CClientSocket::OnReceive(int nErrorCode)
{
	CSocket::OnReceive(nErrorCode);
	m_pAgent->ProcessPendingRead(this);
}

/* -------------------------------------------------------------
   ReceiveMsg(): De-Serialize message
   -------------------------------------------------------------
*/
void CClientSocket::ReceiveMsg(CMsg *pMsg)
{
	pMsg->Serialize(*m_pArchiveIn);
}

/* -------------------------------------------------------------
   IsAborted():
   -------------------------------------------------------------
*/
BOOL CClientSocket::IsAborted()
{
	return (m_pArchiveOut == NULL);
}

IMPLEMENT_DYNAMIC(CClientSocket, CSocket)

