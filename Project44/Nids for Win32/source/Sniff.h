// Sniff.h: interface for the CSniff class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SNIFF_H__32522386_5B8D_4E64_BA1E_53445963B962__INCLUDED_)
#define AFX_SNIFF_H__32522386_5B8D_4E64_BA1E_53445963B962__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "Include\packet32.h"
#include "Header_Packet.h"
#include <afxtempl.h>
#include <afxmt.h>

#define Max_Num_Adapter 10
#define Max_Packet_Analys 100000

class CSniff  
{
public:
	BOOL GetStatusPromiscuous();
//	BOOL Split();
//	BOOL Getinfo(int &RemainLink, LONG &SumLink);
	BOOL ClearSniff();
	BOOL PacketFromDevice();
	BOOL GetPacket(Header_Packet &Packet);
	BOOL GetStatusPacket(LONG &SumPacket, LONG &SumLost);
	BOOL ClosePromiscuous();
	BOOL OpenPromiscuous(int NumberDevice);
	CSniff();
	virtual ~CSniff();

protected:
	BOOL StatusPromiscuous;
	int Device;
//	LONG SumNumLinkList;
	CList<Header_Packet,Header_Packet&> DataPacket;
	CCriticalSection Cs;
};

#endif // !defined(AFX_SNIFF_H__32522386_5B8D_4E64_BA1E_53445963B962__INCLUDED_)
