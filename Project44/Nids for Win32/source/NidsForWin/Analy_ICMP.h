// Analy_ICMP.h: interface for the CAnaly_ICMP class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ANALY_ICMP_H__55B757DC_5698_4147_9D01_FC6F5BE0B54F__INCLUDED_)
#define AFX_ANALY_ICMP_H__55B757DC_5698_4147_9D01_FC6F5BE0B54F__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/*
#include <afxtempl.h>
#include "Header_Packet.h"
#include "Bomb_Packet.h"
#include "Link_Fragment.h"
*/
#include "Analy_IP.h"

class CAnaly_ICMP : public CAnaly_IP
{
public:
	BOOL Check(Header_Packet Packet,BOOL &Clear_List,CString &Type,CString &Src,CString &Dst,CString &Time);
	CAnaly_ICMP();
	virtual ~CAnaly_ICMP();

protected:
/*	CString IP_Mix;
	void Convert_Flag_Offset(int Old_Flags1,int Old_Flags2,BOOL &Flag_U,BOOL &Flag_D,BOOL &Flag_M,int &Offset,int Total_Length1,int Total_Length2,int &Size_Data);
	CStringArray Host_Bomb;
//	CStringArray Host_Gap;
	CStringArray Host_OverLap;
	BOOL ReFragment(Link_Fragment Temp_Fragment,BOOL &OverLap,BOOL &Gap,int Offset);
	CList<Link_Fragment,Link_Fragment&> Host_Fragment;
	BOOL CheckFragment(Header_Packet Packet,BOOL &OverLap,BOOL &Gap,int New_Sec);
	int Count_IP_IP;
	CStringArray Host_IP_IP;
	void Clear();
	int Old_Sec;
	CList<Bomb_Packet,Bomb_Packet&> Host_Send_Bomb;
	CString IP_Src,IP_Dst;
	CStringArray IP_Packet_Bomb;
	LONG Count_Packet_Bomb;
	BOOL CheckIP();
	BOOL CheckBomb();
*/
};

#endif // !defined(AFX_ANALY_ICMP_H__55B757DC_5698_4147_9D01_FC6F5BE0B54F__INCLUDED_)
