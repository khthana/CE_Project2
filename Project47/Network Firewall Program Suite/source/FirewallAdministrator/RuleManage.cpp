// RuleManage.cpp: implementation of the CRuleManage class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "RuleManage.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

#include "Include/Winsock2.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CRuleManage::CRuleManage()
{
	nRules = 0;
}

CRuleManage::~CRuleManage()
{

}

int CRuleManage::AddRule(unsigned long srcIp,
							 unsigned long srcMask,
							 unsigned short srcPort,
							 unsigned long dstIp,
							 unsigned long dstMask,
							 unsigned short dstPort,
							 unsigned int protocol,
							 int action)
{

	if(nRules >= MAX_RULES)
	{
		return -1;
	}

	else
	{
		rules[nRules].sourceIp		  = srcIp;
		rules[nRules].sourceMask	  = srcMask;
		rules[nRules].sourcePort	  = srcPort;
		rules[nRules].destinationIp   = dstIp;
		rules[nRules].destinationMask = dstMask;
		rules[nRules].destinationPort = dstPort;
		rules[nRules].protocol		  = protocol;
		rules[nRules].action		  = action;

		nRules++;
	}

	return 0;
}

void CRuleManage::ResetRules()
{
	nRules = 0;
}

void CRuleManage::DeleteRule(unsigned int position)
{
	// out of range
	if(position >= nRules)
		return;

	// If it's the las rule, I only decrement nRules
	if(position != nRules - 1)
	{
		unsigned int i;

		for(i = position + 1;i<nRules;i++)
		{
			rules[i - 1].sourceIp		  = rules[i].sourceIp;
			rules[i - 1].sourceMask		  = rules[i].sourceMask;
			rules[i - 1].sourcePort		  = rules[i].sourcePort;
			rules[i - 1].destinationIp    = rules[i].destinationIp;
			rules[i - 1].destinationMask  = rules[i].destinationMask;
			rules[i - 1].destinationPort  = rules[i].destinationPort;
			rules[i - 1].protocol	      = rules[i].protocol;
			rules[i - 1].action		      = rules[i].action;
		}
	}
	nRules--;
}

CString CRuleManage::GetClientIP()
{
	WSADATA p;
    WSAStartup ((2<<8) | 2, &p);

	char szHostName[128];
	CString str;
	if( gethostname(szHostName, 128) == SOCKET_ERROR )
	{
		MessageBox(NULL,"Error !!!: gethostname", "Firewall Agent", MB_OK | MB_ICONEXCLAMATION);
	}
	else
	{
		// Get host adresses
		struct hostent * pHost;
		int i = 0;
 
		pHost = gethostbyname(szHostName);
//		for( i = 0; pHost!= NULL && pHost->h_addr_list[i]!= NULL; i++ )
 		{
 			int j;
	 		for( j = 0; j < pHost->h_length; j++ )
 			{
				CString addr;
				if( j > 0 )
 					str += ".";
	 			addr.Format("%u", (unsigned int)((unsigned char*)pHost->h_addr_list[i])[j]);
				str += addr;
 			}
  		// str now contains one local IP address - do whatever you want to do with it (probably add it to a list)
 		}
	}
	return str;  // return the last one if has more than 1 ip address
}