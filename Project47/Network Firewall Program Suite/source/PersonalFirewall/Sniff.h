// Sniff.h: interface for the CSniff class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_SNIFF_H__40E97954_96A3_43F9_B2FA_B4C8A4B73041__INCLUDED_)
#define AFX_SNIFF_H__40E97954_96A3_43F9_B2FA_B4C8A4B73041__INCLUDED_

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
	BOOL GetStatusDirectPacket();
	BOOL ClearSniff();
	BOOL PacketFromDevice();
	BOOL GetPacket(Header_Packet &Packet);
	BOOL GetStatusPacket(LONG &SumPacket, LONG &SumLost);
	BOOL CloseDirectPacket();
	BOOL OpenDirectPacket(int NumberDevice);
	CSniff();
	virtual ~CSniff();

protected:
	BOOL StatusDirectPacket;
	int Device;
	CList<Header_Packet,Header_Packet&> DataPacket;
	CCriticalSection Cs;

};

#endif // !defined(AFX_SNIFF_H__40E97954_96A3_43F9_B2FA_B4C8A4B73041__INCLUDED_)
