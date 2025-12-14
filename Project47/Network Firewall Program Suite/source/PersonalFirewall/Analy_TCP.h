// Analy_TCP.h: interface for the CAnaly_TCP class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ANALY_TCP_H__A7D695D9_8458_4983_A82F_64167C73EDB7__INCLUDED_)
#define AFX_ANALY_TCP_H__A7D695D9_8458_4983_A82F_64167C73EDB7__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <afxtempl.h>
#include "Header_Packet.h"
#include "GetPort.h"
#include "GetFin.h"
#include "Bomb_Packet.h"

//#define Max_Port_Min 254

class CAnaly_TCP  
{
public:
	BOOL Check(Header_Packet Packet,BOOL &Clear_List,CString &Type,CString &Src,CString &Dst,CString &Time);
	CAnaly_TCP();
	virtual ~CAnaly_TCP();

private:
	CString IP_Mix;
	CStringArray Host_PortScan;
	CStringArray Host_OSFinger;
	CStringArray Host_Sync;
	BOOL Check_OSFinger(Header_Packet Packet);
	void DecodeCode(int Flag, BOOL &URG, BOOL &ACK, BOOL &PSH, BOOL &RST, BOOL &SYN, BOOL &FIN);
	long DecodePort(int port_0, int port_1);
	BOOL Check_PortScan(Header_Packet Packet,int now_min);
	CString IP_Dst;
	CString IP_Src;
	int Old_Min;
	int Old_Sec;
	CList<CGetFin,CGetFin&> Host_Fin;
	CList<CGetPort,CGetPort&> Host_Port;
	void Clear();
	CList<Bomb_Packet,Bomb_Packet&> Host_Send_Sync;
	BOOL Check_Sync_Flood(Header_Packet Packet);

};

#endif // !defined(AFX_ANALY_TCP_H__A7D695D9_8458_4983_A82F_64167C73EDB7__INCLUDED_)
