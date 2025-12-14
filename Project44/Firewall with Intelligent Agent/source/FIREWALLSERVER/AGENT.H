// Agent.h: interface for the CAgent class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_AGENT_H__DEA0AF47_8255_48CC_AC5B_6602D544B031__INCLUDED_)
#define AFX_AGENT_H__DEA0AF47_8255_48CC_AC5B_6602D544B031__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "listeningsocket.h"
#include "clientsocket.h"

class CMsg;



class CAgent
{
public:
	CString GetIP(CSocket *pSocket);
	BOOL SendCommand(const CString clientIP, const UINT clientPort,
		const CString command);
	CMsg* ReadMsg(CClientSocket* pSocket);
	void SendMsg(CClientSocket* pSocket, CMsg* pMsg);
	virtual void ProcessPendingRead(CClientSocket* pSocket);
	void ProcessPendingAccept();
	CListeningSocket* m_pSocket;
	BOOL GoOnline(UINT port);
	BOOL GoOffline();
	CAgent();
	virtual ~CAgent();
};

#endif // !defined(AFX_AGENT_H__DEA0AF47_8255_48CC_AC5B_6602D544B031__INCLUDED_)
