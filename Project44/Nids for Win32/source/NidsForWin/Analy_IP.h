// Analy_IP.h: interface for the CAnaly_IP class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_ANALY_IP_H__4499B821_ACAB_451E_A5E5_92FE6DD484FE__INCLUDED_)
#define AFX_ANALY_IP_H__4499B821_ACAB_451E_A5E5_92FE6DD484FE__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <afxtempl.h>
#include "Header_Packet.h"
#include "Bomb_Packet.h"
#include "Link_Fragment.h"
#include "PingSweeps.h"

class CAnaly_IP  
{
public:
	BOOL Check(Header_Packet Packet,BOOL &Clear_List,CString &Type,CString &Src,CString &Dst,CString &Time);
	CAnaly_IP();
	virtual ~CAnaly_IP();

protected:
	void Clear_Result();
	CList<PingSweeps,PingSweeps&> Host_Ping_Sweeps;
	BOOL CheckPingSweeps();
	CString IP_Mix;
	void Convert_Flag_Offset(int Old_Flags1,int Old_Flags2,BOOL &Flag_U,BOOL &Flag_D,BOOL &Flag_M,int &Offset,int Total_Length1,int Total_Length2,int &Size_Data);
	CStringArray Host_Ping;
	CStringArray Host_Bomb;
	CStringArray Host_Gap;
	CStringArray Host_OverLap;
	BOOL ReFragment(Link_Fragment Temp_Fragment,BOOL &OverLap,BOOL &Gap,int Offset);
	CList<Link_Fragment,Link_Fragment&> Host_Fragment;
	BOOL CheckFragment(Header_Packet Packet,BOOL &OverLap,BOOL &Gap,int New_Sec);
	int Count_IP_IP;
	CStringArray Host_IP_IP;
	void Clear_Buffer();
	int Old_Min;
	int Old_Sec;
	CList<Bomb_Packet,Bomb_Packet&> Host_Send_Bomb;
	CString IP_Src,IP_Dst;
	CStringArray IP_Packet_Bomb;
	LONG Count_Packet_Bomb;
	BOOL CheckIP();
	BOOL CheckBomb();

};

#endif // !defined(AFX_ANALY_IP_H__4499B821_ACAB_451E_A5E5_92FE6DD484FE__INCLUDED_)
