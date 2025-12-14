// Analysis.h: interface for the CAnalysis class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ANALYSIS_H__A25BA208_8636_4740_ACB0_3D71710A9492__INCLUDED_)
#define AFX_ANALYSIS_H__A25BA208_8636_4740_ACB0_3D71710A9492__INCLUDED_

#include "Analy_IP.h"	// Added by ClassView
#include "Analy_ICMP.h"	// Added by ClassView
#include "Analy_TCP.h"	// Added by ClassView
#include "Analy_UDP.h"	// Added by ClassView
#include "Header_Packet.h"
#include "Result.h"

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CAnalysis  
{
public:
	BOOL GetResult(CString &Type,CString &Src,CString &Dst,CString &Time);
	BOOL Check(Header_Packet Packet);
	CAnalysis();
	virtual ~CAnalysis();

protected:
	CList<Result,Result&> Result_Check;
	CAnaly_ICMP Analysis_ICMP;
	CAnaly_IP Analysis_IP;
	CAnaly_TCP Analysis_TCP;
	CAnaly_UDP Analysis_UDP;
};

#endif // !defined(AFX_ANALYSIS_H__A25BA208_8636_4740_ACB0_3D71710A9492__INCLUDED_)
