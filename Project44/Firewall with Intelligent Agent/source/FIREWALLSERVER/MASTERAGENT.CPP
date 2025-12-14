// MasterAgent.cpp: implementation of the CMasterAgent class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FirewallServer.h"
#include "MasterAgent.h"

#include "msg.h"
#include "FilterRule.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CMasterAgent::CMasterAgent()
{

}

CMasterAgent::~CMasterAgent()
{

}

/* -------------------------------------------------------------
   GetRuleSet(): In fact, this function should get ruleset
                 from database, not from text file, need to
				 be corrected
   -------------------------------------------------------------
*/
CObList* CMasterAgent::GetRuleSet()
{
	// Get rules from File
	char* pszFileName;
	CString buffer;
	CObList* ruleSet = new CObList;

	pszFileName = "rule.txt";
	CStdioFile ReadRule(pszFileName, CFile::modeRead);
	while(!feof(ReadRule.m_pStream))
	{
		ReadRule.ReadString(buffer);	// read 1 line
		if (buffer.GetLength() > 10)    // discard unfinished line
		{
			CFilterRule* newRule = CFilterRule::CreateRule(buffer);
			ruleSet->AddTail(newRule);
		}
	}
	return ruleSet;
}

/* -------------------------------------------------------------
   SendRuleSet(): Send ruleset to specific IP address
   -------------------------------------------------------------
*/
void CMasterAgent::SendRuleSet(const CString clientIP)
{
	CClientSocket* pSocket = new CClientSocket(this);
	pSocket->Create();

	if (pSocket->Connect(clientIP, SLAVE_PORT))  // return successful
	{
		CObList* ruleSet = GetRuleSet();

		CMsg* msg = new CMsg();
		msg->m_command = "RULESET";
		msg->m_pData = ruleSet;

		ASSERT (msg->m_pData->IsKindOf(RUNTIME_CLASS(CObList)));

		pSocket->Init();
		pSocket->SendMsg(msg);
		pSocket->Close();
	}
	else
	{
		AfxMessageBox("Can't Send RuleSet to Client");
	}
}

/* -------------------------------------------------------------
   ProcessPendingRead(): Handle incoming commands
   -------------------------------------------------------------
*/
void CMasterAgent::ProcessPendingRead(CClientSocket *pSocket)
{
	do
	{
		CMsg* pMsg = ReadMsg(pSocket);

		if (strcmp(pMsg->m_command, "START_FILTER_REQUEST") == 0)
		{
			GoOffline();
			SendRuleSet(GetIP(pSocket));
			GoOnline(MASTER_PORT);
		}
		else if (strcmp(pMsg->m_command, "START_FILTER_OK") == 0)
		{
			MessageBox(NULL, "Bind Successful", "FirewallServer",
				MB_ICONEXCLAMATION);
		}
		else if (strcmp(pMsg->m_command, "START_FILTER_ERROR") == 0)
		{
			MessageBox(NULL, "Bind Error", "FirewallServer",
				MB_ICONEXCLAMATION);
		}
		else if (strcmp(pMsg->m_command, "STOP_FILTER_OK") == 0)
		{
			MessageBox(NULL, "UnBind Successful", "FirewallServer",
				MB_ICONEXCLAMATION);
		}
		else if (strcmp(pMsg->m_command, "STOP_FILTER_ERROR") == 0)
		{
			MessageBox(NULL, "UnBind Error", "FirewallServer",
				MB_ICONEXCLAMATION);
		}
		else
		{
			MessageBox(NULL,pMsg->m_command,"LOG",MB_OK);
		}
	} while (!pSocket->m_pArchiveIn->IsBufferEmpty());
}