// Agent.cpp: implementation of the CAgent class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
//#include "FirewallServer.h"
#include "Agent.h"

#include "msg.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif



//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAgent::CAgent()
{

}

CAgent::~CAgent()
{

}

/* -------------------------------------------------------------
   GoOffline(): Close listening socket
   -------------------------------------------------------------
*/
BOOL CAgent::GoOffline()
{
	m_pSocket->Close();
	delete m_pSocket;
	m_pSocket = NULL;
	return TRUE;
}

/* -------------------------------------------------------------
   GoOnline(): Open listening socket and waiting for connection
   -------------------------------------------------------------
*/
BOOL CAgent::GoOnline(UINT port)
{
	m_pSocket = new CListeningSocket(this);
	if (m_pSocket->Create(port) != 0)
	{
		if (m_pSocket->Listen())
			return TRUE;
	}
	return FALSE;
}

/* -------------------------------------------------------------
   ProcessPendingAccept(): Automatically called when connection
                           is accepted
   -------------------------------------------------------------
*/
void CAgent::ProcessPendingAccept()
{
	CClientSocket* pSocket = new CClientSocket(this);
	if (m_pSocket->Accept(*pSocket))
	{
		pSocket->Init();
	}
	else
		delete pSocket;
}

/* -------------------------------------------------------------
   ProcessPendingRead(): Virtual function, need to be overided
   -------------------------------------------------------------
*/
void CAgent::ProcessPendingRead(CClientSocket* pSocket)
{
	// Virtual Function
}

/* -------------------------------------------------------------
   SendMsg(): Send message to specific socket
   -------------------------------------------------------------
*/
void CAgent::SendMsg(CClientSocket *pSocket, CMsg *pMsg)
{
	TRY
	{
		pSocket->SendMsg(pMsg);
	}
	CATCH(CFileException, e)
	{
		pSocket->Abort();
	}
	END_CATCH
}

/* -------------------------------------------------------------
   ReadMsg(): Read message from specific socket
   -------------------------------------------------------------
*/
CMsg* CAgent::ReadMsg(CClientSocket *pSocket)
{
	static CMsg msg;

	TRY
	{
		pSocket->ReceiveMsg(&msg);
	}
	CATCH(CFileException, e)
	{
		pSocket->Abort();
	}
	END_CATCH
	return &msg;
}

/* -------------------------------------------------------------
   SendCommand(): Send message with specific command to specific
                  IP address
   -------------------------------------------------------------
*/
BOOL CAgent::SendCommand(const CString clientIP, const UINT clientPort,
						 const CString command)
{
	CClientSocket* pSocket = new CClientSocket(this);
	pSocket->Create();
	if (pSocket->Connect(clientIP, clientPort)) // return successful
	{
		CMsg* msg = new CMsg();
		msg->m_command = command;
		pSocket->Init();
		pSocket->SendMsg(msg);
		pSocket->Close();
		return TRUE;
	}
	return FALSE;
}

/* -------------------------------------------------------------
   GetIP(): Get Ip string from specific socket
   -------------------------------------------------------------
*/
CString CAgent::GetIP(CSocket *pSocket)
{
	CString clientIP;
	UINT clientPort;
	
	if (pSocket->GetPeerName(clientIP, clientPort) != 0)
		return clientIP;	// function returns successful
	else 
		return ""; // function returns error
}
