// Analy_ICMP.cpp: implementation of the CAnaly_ICMP class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
//#include "FirewallSuite.h"
#include "Analy_ICMP.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAnaly_ICMP::CAnaly_ICMP()
{

}

CAnaly_ICMP::~CAnaly_ICMP()
{

}

BOOL CAnaly_ICMP::Check(Header_Packet Packet,BOOL &Clear_List,CString &Type,CString &Src,CString &Dst,CString &Time)
{
	BOOL Bomb,IP_IP,OverLap,Gap,Ping_Sweeps;
	CString Temp_IP_Dst;
	CString Temp_Time;
	CTime T_Time = CTime::GetCurrentTime();
	int New_Sec = T_Time.GetSecond();
	int New_Min = T_Time.GetMinute();
	int New_Hour = T_Time.GetHour();
	int Temp_Sec = New_Sec;
	if (( New_Sec == 0 )&&( Old_Sec != New_Sec ))
		Temp_Sec = New_Sec + 60;
	if ( Old_Sec < Temp_Sec )
	{
		Old_Sec = New_Sec;
		Clear_Buffer();
	}

	int Temp_Min = New_Min;
	if (( New_Min == 0 )&&( Old_Min != New_Min )) Temp_Min = New_Min + 60;
	if ( Old_Min < Temp_Min )
	{
		Old_Min = New_Min;
		Clear_Result();
	}

	char IP[20];
	char Buffer[50];
	sprintf(IP,"\#%d\.%d\.%d\.%d\#",Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
	IP_Src = IP;
	sprintf(IP,"\#%d\.%d\.%d\.%d\#",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
	IP_Dst = IP;
	IP_Mix = IP_Dst + IP_Src;
	Bomb = FALSE;
	IP_IP = FALSE;
	OverLap = FALSE;
	Gap = FALSE;
	Ping_Sweeps = FALSE;

	if (CheckBomb())
	{
		Bomb = TRUE;
		Type = "ICMP FLOODER";
		sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
		Dst = Buffer;
		sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
		Src = Buffer;

		if ( New_Hour < 10 )
			sprintf(Buffer,"0%d\:",New_Hour);
		else 
			sprintf(Buffer,"%d\:",New_Hour);
		Temp_Time = Buffer;
		if ( New_Min < 10 )
			sprintf(Buffer,"0%d",New_Min);
		else 
			sprintf(Buffer,"%d",New_Min);
		Time = Temp_Time + Buffer;
//		Time = Temp_Time;
	}//End CheckBomb();
	if (CheckIP())
	{
		IP_IP = TRUE;
		Type = "ICMP IP Loop";
		sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
		Dst = Buffer;
		sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
		Src = Buffer;
		if ( New_Hour < 10 )
			sprintf(Buffer,"0%d\:",New_Hour);
		else 
			sprintf(Buffer,"%d\:",New_Hour);
		Temp_Time = Buffer;
		if ( New_Min < 10 )
			sprintf(Buffer,"0%d",New_Min);
		else 
			sprintf(Buffer,"%d",New_Min);
		Time = Temp_Time + Buffer;
//		Time = Temp_Time;
	}

//	if ( Packet.Data[0] == 8 )
//	{//I (noty) Comment
		if (CheckPingSweeps())
		{
			Ping_Sweeps = TRUE;
			Type = "Ping Sweeps";
			sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
			Dst = Buffer;
			sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
			Src = Buffer;
			if ( New_Hour < 10 )
				sprintf(Buffer,"0%d\:",New_Hour);
			else 
				sprintf(Buffer,"%d\:",New_Hour);
			Temp_Time = Buffer;
			if ( New_Min < 10 )
				sprintf(Buffer,"0%d",New_Min);
			else 
				sprintf(Buffer,"%d",New_Min);
			Time = Temp_Time + Buffer;
//			Time = Temp_Time;
		}
//	}  //I (noty) comment

	if ( CheckFragment(Packet,OverLap,Gap,New_Sec) )
	{
		if (OverLap == TRUE)
		{
			Type = "ICMP OverLap";
			sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
			Dst = Buffer;
			sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
			Src = Buffer;
			if ( New_Hour < 10 )
				sprintf(Buffer,"0%d\:",New_Hour);
			else 
				sprintf(Buffer,"%d\:",New_Hour);
			Temp_Time = Buffer;
			if ( New_Min < 10 )
				sprintf(Buffer,"0%d",New_Min);
			else 
				sprintf(Buffer,"%d",New_Min);
			Time = Temp_Time + Buffer;
//			Time = Temp_Time;
		}

		LONG CountLoop = Host_Fragment.GetCount();
		for ( LONG i = 0 ; ((i < CountLoop)&&(i<10)) ; i++ )
		{
			Link_Fragment Temp_Fragment = Host_Fragment.GetHead();
			Host_Fragment.RemoveHead();
			Temp_Sec = New_Sec;
			if (( New_Sec == 0 )&&( Temp_Fragment.Sec != New_Sec )) Temp_Sec = New_Sec + 60;
			else if (( New_Sec == 1 )&&( Temp_Fragment.Sec != New_Sec )) Temp_Sec = New_Sec + 60;
			else if (( New_Sec == 2 )&&( Temp_Fragment.Sec != New_Sec )) Temp_Sec = New_Sec + 60;
			Temp_Sec = Temp_Sec - 3;
			if (Temp_Fragment.Sec != Temp_Sec)
				Host_Fragment.AddTail(Temp_Fragment);
		}
	}

	if ( Gap == TRUE )
		Clear_List = TRUE;

	if ((Bomb == TRUE) || (IP_IP == TRUE) || (OverLap == TRUE) || (Gap == TRUE) || (Ping_Sweeps == TRUE))
		return TRUE;
	return FALSE;

}
