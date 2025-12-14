// Analy_UDP.cpp: implementation of the CAnaly_UDP class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Analy_UDP.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAnaly_UDP::CAnaly_UDP()
{

}

CAnaly_UDP::~CAnaly_UDP()
{

}

BOOL CAnaly_UDP::Check(Header_Packet Packet,CString &Type,CString &Src,CString &Dst,CString &Time)
{
	CString Temp_Time;
	BOOL Scan = FALSE;
	BOOL OS_Finger = FALSE;
	CTime T_Time = CTime::GetCurrentTime();
	int New_Min = T_Time.GetMinute();
	int New_Hour = T_Time.GetHour();
	int Temp_Min = New_Min;
	if (( New_Min == 0 )&&( Old_Min != New_Min )) Temp_Min = New_Min + 60;
	if ( Old_Min < Temp_Min )
	{
		Old_Min = New_Min;
		Clear();
	}
	char IP[20];
	char Buffer[50];
	sprintf(IP,"\#%d\.%d\.%d\.%d\#",Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
	IP_Src = IP;
	sprintf(IP,"\#%d\.%d\.%d\.%d\#",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
	IP_Dst = IP;

	IP_Mix = IP_Dst + IP_Src;

	if ( Check_PortScan(Packet) )
	{
		Scan = TRUE;
		Type = "UDP Scan Port";
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
/*	else if ( Check_OSFinger(Packet) )
	{
		sprintf(Buffer,"Os Finger Print -> Dest %d\.%d\.%d\.%d  Src %d\.%d\.%d\.%d\r\n",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3],Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
		OS_Finger = TRUE;
		Alert += Buffer;
	}
*/
	if ((Scan == TRUE)||(OS_Finger == TRUE))
		return TRUE;
	return FALSE;
}

BOOL CAnaly_UDP::Check_PortScan(Header_Packet Packet)
{
	BOOL PortScan = FALSE;
	BOOL Found = FALSE;
	long RealPort = DecodePort(Packet.Data[2],Packet.Data[3]);
	if ( RealPort < 1024 )
	{
		LONG CountLoop = Host_Port.GetCount();
		CGetPort Temp_IP_Port;
		for ( LONG i = 0 ;(( i < CountLoop )&&( Found == FALSE)) ; i++ )
		{
			Temp_IP_Port = Host_Port.GetHead();
			Host_Port.RemoveHead();
			if ((Temp_IP_Port.IP_Src == IP_Src)&&(Temp_IP_Port.IP_Dst == IP_Dst))
				Found = TRUE;
			Host_Port.AddTail(Temp_IP_Port);
		}
		if (Found == TRUE)
		{
			i--;
			POSITION pos = Host_Port.FindIndex(i);
			BOOL Found_Port = FALSE;
			for ( int j = 0 ;(( j < Temp_IP_Port.Count )&&( Found_Port == FALSE)) ; j++ )
			{
				if (Temp_IP_Port.Port[j] == RealPort)
				{
					Found_Port = TRUE;
				}
			}
			if (Found_Port == FALSE)
			{
				Temp_IP_Port.Count++;
				if (Temp_IP_Port.Count < Max_Port_Min ) //Max_Port_Per_Sec)
				{
					Temp_IP_Port.Port[Temp_IP_Port.Count] = RealPort;
					Host_Port.SetAt(pos,Temp_IP_Port);
				}
				else
				{
					PortScan = TRUE;
					Temp_IP_Port.Count = 0;
					Host_Port.SetAt(pos,Temp_IP_Port);
				}
			}
		}
		else
		{
			Temp_IP_Port.IP_Src = IP_Src;
			Temp_IP_Port.IP_Dst = IP_Dst;
			Temp_IP_Port.Count = 0;
			Temp_IP_Port.Port[0] = RealPort;
			Host_Port.AddTail(Temp_IP_Port);
		}

	}

	if ( PortScan == TRUE )
	{
		Found = FALSE;
		if ( Host_PortScan.GetSize() > 0 )
		{
			for( int Count = 0; ((Found == FALSE) && (Count < Host_PortScan.GetSize())) ; Count++)
			{
				if (Host_PortScan.ElementAt(Count).Find(IP_Mix) != -1)
					Found = TRUE;
			}
		}
		if (Found == FALSE)
		{
			Host_PortScan.Add(IP_Mix);
			return TRUE;
		}
	}

	return FALSE;


}

long CAnaly_UDP::DecodePort(int port_0, int port_1)
{
	long Sum = 0;
	if ( port_0 > 127 )
	{
		Sum += 32768;
		port_0 -= 128;
	}
	if ( port_0 > 63 )
	{
		Sum += 16384;
		port_0 -= 64;
	}
	if ( port_0 > 31 )
	{
		Sum += 8192;
		port_0 -= 32;
	}
	if ( port_0 > 15 )
	{
		Sum += 4096;
		port_0 -= 16;
	}
	if ( port_0 > 7 )
	{
		Sum += 2048;
		port_0 -= 8;
	}
	if ( port_0 > 3 )
	{
		Sum += 1024;
		port_0 -= 4;
	}
	if ( port_0 > 1 )
	{
		Sum += 512;
		port_0 -= 2;
	}
	if ( port_0 > 0 )
	{
		Sum += 256;
		port_0 -= 0;
	}
	Sum += port_1;

	return Sum;

}

void CAnaly_UDP::Clear()
{
	Host_Port.RemoveAll();
	Host_PortScan.RemoveAll();
}
