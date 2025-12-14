// SlaveAgent.h: interface for the CSlaveAgent class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SLAVEAGENT_H__9A892F90_5827_4E3C_9A69_F0F8337286EE__INCLUDED_)
#define AFX_SLAVEAGENT_H__9A892F90_5827_4E3C_9A69_F0F8337286EE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "..\FIREWALLSERVER\Agent.h"

#define SLAVE_PORT 8888
#define MASTER_PORT 9999

class CSlaveAgent : public CAgent  
{
public:
	BOOL SendLog(CString log);
	void ProcessPendingRead(CClientSocket* pSocket);
	CObList* GetRuleSet();
	CString GetLocalIP();
	CSlaveAgent();
	virtual ~CSlaveAgent();

};

#endif // !defined(AFX_SLAVEAGENT_H__9A892F90_5827_4E3C_9A69_F0F8337286EE__INCLUDED_)
