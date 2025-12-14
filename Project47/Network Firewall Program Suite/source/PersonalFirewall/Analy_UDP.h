// Analy_UDP.h: interface for the CAnaly_UDP class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ANALY_UDP_H__AEBFE119_ACF8_45A8_9BA6_46D490BE1182__INCLUDED_)
#define AFX_ANALY_UDP_H__AEBFE119_ACF8_45A8_9BA6_46D490BE1182__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <afxtempl.h>
#include "Header_Packet.h"
#include "GetPort.h"

class CAnaly_UDP  
{
public:
	BOOL Check(Header_Packet Packet,CString &Type,CString &Src,CString &Dst,CString &Time);
	CAnaly_UDP();
	virtual ~CAnaly_UDP();

private:
	CString IP_Mix;
	CStringArray Host_PortScan;
	void Clear();
	long DecodePort(int port_0, int port_1);
	CString IP_Dst;
	CString IP_Src;
	int Old_Min;
	CList<CGetPort,CGetPort&> Host_Port;
	BOOL Check_PortScan(Header_Packet Packet);

};

#endif // !defined(AFX_ANALY_UDP_H__AEBFE119_ACF8_45A8_9BA6_46D490BE1182__INCLUDED_)
