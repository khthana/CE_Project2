// SlaveAgent.cpp: implementation of the CSlaveAgent class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FirewallAgent.h"
#include "SlaveAgent.h"

#include "FilterRule.h"
#include "../FirewallServer/msg.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif



//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CSlaveAgent::CSlaveAgent()
{

}

CSlaveAgent::~CSlaveAgent()
{

}

/*---------------------------------------------------------
   GetLocalIP() - Get local IP Address 
  ---------------------------------------------------------
*/
CString CSlaveAgent::GetLocalIP()
{
	//      Now only support 1 address
	WSADATA p;
    WSAStartup ((2<<8) | 2, &p);
  
	char szHostName[128];
	CString str;
	if( gethostname(szHostName, 128) != SOCKET_ERROR )
	{
		// Get host adresses
		struct hostent * pHost;
		int i;
 
		pHost = gethostbyname(szHostName);
		for( i = 0; pHost!= NULL && pHost->h_addr_list[i]!= NULL; i++ )
 		{
 			int j;
	 		for( j = 0; j < pHost->h_length; j++ )
 			{
				CString addr;
				if( j > 0 )
 					str += ".";
	 			addr.Format("%u", (unsigned int)((unsigned
				 	char*)pHost->h_addr_list[i])[j]);
				str += addr;
 			}
  		// str now contains one local IP address - do whatever you want to do with it (probably add it to a list)
 		}
	}
	return str;  // return the last one if has more than 1 ip address
}

/*---------------------------------------------------------
   GetRuleSet() - For debugging purpose, use to get 
                  ruleset from text file
  ---------------------------------------------------------
*/
CObList* CSlaveAgent::GetRuleSet()
{
	// Get rules from File
	char* pszFileName;
	CString buffer;
	CObList* ruleSet = new CObList;

	pszFileName = "C:\\rule.txt";
	CStdioFile ReadRule(pszFileName, CFile::modeRead);
	while(!feof(ReadRule.m_pStream))
	{
		ReadRule.ReadString(buffer);	// read 1 line
		CFilterRule* newRule = CFilterRule::CreateRule(buffer);
		ruleSet->AddTail(newRule);
	}
	return ruleSet;
}

/*---------------------------------------------------------
   ProcessPendingRead() - Handle incoming commands
  ---------------------------------------------------------
*/
void CSlaveAgent::ProcessPendingRead(CClientSocket *pSocket)
{
	do
	{
		CMsg* pMsg = ReadMsg(pSocket);
		
		if (strcmp(pMsg->m_command, "RULESET") == 0)
		{
			CObList* ruleSet = (CObList*) pMsg->m_pData;
			ASSERT (ruleSet->IsKindOf(RUNTIME_CLASS(CObList)));

			// Save ruleset to local machine
			//BACKKUP theApp.SaveLocalRuleSet(ruleSet);
			if (theApp.OnStartFilter(ruleSet) == TRUE)
			{	// Filter started successfuly
				if (!SendCommand(MASTER_IP, MASTER_PORT,
					"START_FILTER_OK") ) 
				{
					AfxMessageBox("Can not send START_FILTER_OK message");
				}
			}
		
			else
			{	// Filter did not start
				if(!SendCommand(GetIP(pSocket), MASTER_PORT,
					"START_FILTER_ERROR"))
				{
					AfxMessageBox("Can not send START_FILTER_ERROR message");
				}
			}
		}
		else if (strcmp(pMsg->m_command, "STOP_FILTER_REQUEST") == 0)
		{
			if (theApp.StopFilter() == TRUE)
			{
				if (!SendCommand(GetIP(pSocket), MASTER_PORT,
					"STOP_FILTER_OK"))
					AfxMessageBox("STOP_FILTER_OK error");
			}
			else
			{
				if (!SendCommand(GetIP(pSocket), MASTER_PORT,
					"STOP_FILTER_ERROR"))
					AfxMessageBox("STOP_FILTER_ERROR error");
			}
		}
		else if (strcmp(pMsg->m_command, "LOG_REQUEST") == 0)
		{
			AfxMessageBox("LOG_REQUEST");
			if (!SendCommand(GetIP(pSocket), MASTER_PORT,
				theApp.GetStatsString()))
				AfxMessageBox("LOG_RESPONSE error");
		}
	} while (!pSocket->m_pArchiveIn->IsBufferEmpty());
}

/*---------------------------------------------------------
   SendLog() - Send log back to server, not quite completed
               should be re-write
  ---------------------------------------------------------
*/
BOOL CSlaveAgent::SendLog(CString log)
{
	CClientSocket* pSocket = new CClientSocket(this);
	pSocket->Create();
	
	if (pSocket->Connect(MASTER_IP, MASTER_PORT))  // return successful
	{
		CMsg* msg = new CMsg();
		msg->m_command = log;

		ASSERT (msg->m_pData->IsKindOf(RUNTIME_CLASS(CObList)));
		
		pSocket->Init();
		pSocket->SendMsg(msg);
		pSocket->Close();
		return TRUE;
	} 
	else
	{
		AfxMessageBox("Can't Send RuleSet to Client");
		return FALSE;
	}
}
