// RuleManage.h: interface for the CRuleManage class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_RULEMANAGE_H__5E8E8CC0_D239_435A_A72F_4BDA7DE50843__INCLUDED_)
#define AFX_RULEMANAGE_H__5E8E8CC0_D239_435A_A72F_4BDA7DE50843__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Include/Fltdefs.h"
#include "Rules.h"

#define MAX_RULES 50

//#pragma comment(lib, "Lib/Iphlpapi.lib")
#pragma comment(lib, "Lib/WSock32.lib")

class CRuleManage  
{
public:
	CRuleManage();
	virtual ~CRuleManage();

// Attributes
public:
	unsigned int nRules;
	RuleInfo rules[MAX_RULES];
	PFFORWARD_ACTION defaultAction;

// Implementation
public:
	void DeleteRule(unsigned int position);
	void ResetRules();
	int AddRule(unsigned long srcIp, 
				unsigned long srcMask,
				unsigned short srcPort, 
				unsigned long dstIp,
				unsigned long dstMask,
				unsigned short dstPort,
				unsigned int protocol,
				int action);

	static CString GetClientIP();
};

#endif // !defined(AFX_RULEMANAGE_H__5E8E8CC0_D239_435A_A72F_4BDA7DE50843__INCLUDED_)
