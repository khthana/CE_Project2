// Analysis.cpp: implementation of the CAnalysis class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Analysis.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAnalysis::CAnalysis()
{

}

CAnalysis::~CAnalysis()
{

}

BOOL CAnalysis::Check(Header_Packet Packet)
{
	CString T_Type, T_Src, T_Dst, T_Time;
	BOOL Clear_List = FALSE;
	Result Temp_Result;
	if (( Packet.Frame_Type[0] == 8 ) && ( Packet.Frame_Type[1] == 0 )) // IP
	{
		BOOL IP,ICMP,TCP,UDP;
		if ( Packet.Protocol == 1 )  // ICMP
		{
			ICMP = Analysis_ICMP.Check(Packet,Clear_List,T_Type, T_Src, T_Dst, T_Time);
		}
		else // IP
		{
			IP = Analysis_IP.Check(Packet,Clear_List,T_Type, T_Src, T_Dst, T_Time);

			if (IP == TRUE)
			{
				Temp_Result.T_Type = T_Type;
				Temp_Result.T_Src = T_Src;
				Temp_Result.T_Dst = T_Dst;
				Temp_Result.T_Time = T_Time;
				Result_Check.AddTail(Temp_Result);
			}

			if ( Packet.Protocol == 6 )  // TCP
			{
				TCP = Analysis_TCP.Check(Packet,Clear_List,T_Type, T_Src, T_Dst, T_Time);
			}
//			else if ( Packet.Protocol == 8 )  // EGP
			else if ( Packet.Protocol == 17 )  // UDP
			{
				UDP = Analysis_UDP.Check(Packet,T_Type, T_Src, T_Dst, T_Time);
			}

//			else if ( Packet.Protocol == 89 )  // OSPF
		}

		if ( (ICMP == TRUE) || (TCP == TRUE) || (UDP == TRUE) )
		{
			Temp_Result.T_Type = T_Type;
			Temp_Result.T_Src = T_Src;
			Temp_Result.T_Dst = T_Dst;
			Temp_Result.T_Time = T_Time;
			Result_Check.AddTail(Temp_Result);
		}

		if (Clear_List == TRUE)
			return TRUE;
		return FALSE;
	}
	return FALSE;

}

BOOL CAnalysis::GetResult(CString &Type, CString &Src, CString &Dst, CString &Time)
{
	int Count_Result = Result_Check.GetCount();
	if (Count_Result > 0)
	{
		Result Temp_Result;
		Temp_Result = Result_Check.GetHead();

		Type = Temp_Result.T_Type;
		Src = Temp_Result.T_Src;
		Dst = Temp_Result.T_Dst;
		Time = Temp_Result.T_Time;

		Result_Check.RemoveHead();
		return TRUE;
	}

	return FALSE;
	
}
