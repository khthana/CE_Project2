// Analy_ICMP.h: interface for the CAnaly_ICMP class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ANALY_ICMP_H__27770991_CBAF_4406_90CA_FDCF21605A99__INCLUDED_)
#define AFX_ANALY_ICMP_H__27770991_CBAF_4406_90CA_FDCF21605A99__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Analy_IP.h"

class CAnaly_ICMP : public CAnaly_IP  
{
public:
	BOOL Check(Header_Packet Packet,BOOL &Clear_List,CString &Type,CString &Src,CString &Dst,CString &Time);
	CAnaly_ICMP();
	virtual ~CAnaly_ICMP();

};

#endif // !defined(AFX_ANALY_ICMP_H__27770991_CBAF_4406_90CA_FDCF21605A99__INCLUDED_)
