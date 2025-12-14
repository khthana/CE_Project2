// MasterAgent.h: interface for the CMasterAgent class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_MASTERAGENT_H__83762BE5_215E_4262_ACA8_77890C041477__INCLUDED_)
#define AFX_MASTERAGENT_H__83762BE5_215E_4262_ACA8_77890C041477__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Agent.h"

#define SLAVE_PORT 8888
#define MASTER_PORT 9999

class CMasterAgent : public CAgent  
{
public:
	//BOOL GoOnline();
	void ProcessPendingRead(CClientSocket* pSocket);
	CObList* GetRuleSet();
	void SendRuleSet(const CString clientIP);
	CMasterAgent();
	virtual ~CMasterAgent();
};

#endif // !defined(AFX_MASTERAGENT_H__83762BE5_215E_4262_ACA8_77890C041477__INCLUDED_)
