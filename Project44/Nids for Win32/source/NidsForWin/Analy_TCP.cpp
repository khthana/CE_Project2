// Analy_TCP.cpp: implementation of the CAnaly_TCP class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "NidsForWin.h"
#include "Analy_TCP.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAnaly_TCP::CAnaly_TCP()
{
/*	CTime T_Time = CTime::GetCurrentTime();
	Old_Sec = T_Time.GetSecond();
	Old_Min = T_Time.GetMinute();
*/
}

CAnaly_TCP::~CAnaly_TCP()
{

}

BOOL CAnaly_TCP::Check(Header_Packet Packet,BOOL &Clear_List,CString &Type,CString &Src,CString &Dst,CString &Time)
{
	CString Temp_Time;
	BOOL Scan = FALSE;
	BOOL OS_Finger = FALSE;
	BOOL Sync = FALSE;

	char IP[20];
	char Buffer[50];

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
/*
	int New_Sec = T_Time.GetSecond();
	int Temp_Sec = New_Sec;
	if (( New_Sec == 0 )&&( Old_Sec != New_Sec )) Temp_Sec = New_Sec + 60;
	if ( Old_Sec < Temp_Sec )
	{
		Old_Sec = New_Sec;
		Host_Send_Sync.RemoveAll();
	}
*/
	sprintf(IP,"\#%d\.%d\.%d\.%d\#",Packet.Src_Addr[0],Packet.Src_Addr[1],Packet.Src_Addr[2],Packet.Src_Addr[3]);
	IP_Src = IP;
	sprintf(IP,"\#%d\.%d\.%d\.%d\#",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
	IP_Dst = IP;

	if ( Check_PortScan(Packet,New_Min) )
	{
		Scan = TRUE;
		Type = "TCP Scan Port";
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
	
	if ( Check_Sync_Flood(Packet) )
	{
		Sync = TRUE;
		Type = "Sync Flood";
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
	}

	if ( Check_OSFinger(Packet) )
	{
		OS_Finger = TRUE;
		Type = "Os Finger Print";
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
/*
	if ( Sync == TRUE )
		Clear_List = TRUE;
*/
	if ((Scan == TRUE)||(OS_Finger == TRUE)||(Sync == TRUE))
		return TRUE;
	return FALSE;
}

void CAnaly_TCP::Clear()
{
	Host_Send_Sync.RemoveAll();
	Host_Port.RemoveAll();
	Host_Fin.RemoveAll();
	Host_PortScan.RemoveAll();
	Host_OSFinger.RemoveAll();
	Host_Sync.RemoveAll();
}

BOOL CAnaly_TCP::Check_PortScan(Header_Packet Packet,int now_min)
{
	BOOL PortScan = FALSE;
	BOOL Found = FALSE;
	BOOL URG = FALSE, ACK = FALSE, PSH = FALSE, RST = FALSE, SYN = FALSE, FIN = FALSE;

	DecodeCode(Packet.Data[13], URG, ACK, PSH, RST, SYN, FIN);

	if ((URG == TRUE)&&(ACK == FALSE)&&(PSH == TRUE)&&(RST == FALSE)&&(SYN == FALSE)&&(FIN == TRUE))
	{
		PortScan = TRUE;
	}
	else if ((URG == FALSE)&&(ACK == FALSE)&&(PSH == FALSE)&&(RST == FALSE)&&(SYN == FALSE)&&(FIN == FALSE))
	{
		PortScan = TRUE;
	}
	else if ((URG == FALSE)&&(ACK == FALSE)&&(PSH == FALSE)&&(RST == FALSE)&&(SYN == FALSE)&&(FIN == TRUE))
	{
		CGetFin Temp_Fin;
		Temp_Fin.IP_Src = IP_Src;
		Temp_Fin.IP_Dst = IP_Dst;
		Temp_Fin.Old_Min = now_min;
		Host_Fin.AddHead(Temp_Fin);		
	}
	else if ((URG == FALSE)&&(ACK == FALSE)&&(PSH == FALSE)&&(RST == TRUE)&&(SYN == FALSE)&&(FIN == FALSE))
	{
		int CountLoop = Host_Fin.GetCount();
		CGetFin Temp_Fin;
		Found = FALSE;
		for ( int i = 0 ;(( i < CountLoop )&&( Found == FALSE)) ; i++ )
		{
			Temp_Fin = Host_Fin.GetHead();
			Host_Fin.RemoveHead();
			if ((Temp_Fin.IP_Src == IP_Dst)&&(Temp_Fin.IP_Dst == IP_Src))
				Found = TRUE;
			Host_Fin.AddTail(Temp_Fin);
		}
		if (Found == TRUE)
		{
			i--;
			POSITION pos = Host_Port.FindIndex(i);
			Host_Fin.RemoveAt(pos);
			PortScan = TRUE;
		}
	}
	else // if ((URG == FALSE)&&(ACK == FALSE)&&(PSH == FALSE)&&(RST == FALSE)&&(SYN == TRUE)&&(FIN == FALSE))
	{
		long RealPort = DecodePort(Packet.Data[2],Packet.Data[3]);
		if ( RealPort < 1024 )
		{
			int CountLoop = Host_Port.GetCount();
			CGetPort Temp_IP_Port;
			Found = FALSE;
			for ( int i = 0 ;(( i < CountLoop )&&( Found == FALSE)) ; i++ )
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
				for ( int j = 0 ;(( j <= Temp_IP_Port.Count )&&( Found_Port == FALSE)) ; j++ )
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
//						Temp_IP_Port.Count = -1;
//						Host_Port.SetAt(pos,Temp_IP_Port);
						Host_Port.RemoveAt(pos);
						PortScan = TRUE;
					}
				}
			}
			else
			{
				Temp_IP_Port.IP_Src = IP_Src;
				Temp_IP_Port.IP_Dst = IP_Dst;
				Temp_IP_Port.Count = 0;
				Temp_IP_Port.Port[0] = RealPort;
				Host_Port.AddHead(Temp_IP_Port);
			}

		}

	}

//	return PortScan;

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

long CAnaly_TCP::DecodePort(int port_0, int port_1)
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

void CAnaly_TCP::DecodeCode(int Flag, BOOL &URG, BOOL &ACK, BOOL &PSH, BOOL &RST, BOOL &SYN, BOOL &FIN)
{
	URG = (Flag & 32) >> 5 ;
	ACK = (Flag & 16) >> 4 ;
	PSH = (Flag & 8) >> 3 ;
	RST = (Flag & 4) >> 2 ;
	SYN = (Flag & 2) >> 1 ;
	FIN = (Flag & 1) ;
}

BOOL CAnaly_TCP::Check_OSFinger(Header_Packet Packet)
{
	BOOL OSFinger = FALSE;
	BOOL Found = FALSE;
	BOOL URG = FALSE, ACK = FALSE, PSH = FALSE, RST = FALSE, SYN = FALSE, FIN = FALSE;

	DecodeCode(Packet.Data[13], URG, ACK, PSH, RST, SYN, FIN);
	if ((SYN == TRUE)&&(FIN == TRUE))
		OSFinger = TRUE;
//	return FALSE;

	if ( OSFinger == TRUE )
	{
		Found = FALSE;
		if ( Host_OSFinger.GetSize() > 0 )
		{
			for( int Count = 0; ((Found == FALSE) && (Count < Host_OSFinger.GetSize())) ; Count++)
			{
				if (Host_OSFinger.ElementAt(Count).Find(IP_Mix) != -1)
					Found = TRUE;
			}
		}
		if (Found == FALSE)
		{
			Host_OSFinger.Add(IP_Mix);
			return TRUE;
		}
	}

	return FALSE;
	

}

BOOL CAnaly_TCP::Check_Sync_Flood(Header_Packet Packet)
{
	BOOL Sync = FALSE;
	BOOL Found = FALSE;

	BOOL URG = FALSE, ACK = FALSE, PSH = FALSE, RST = FALSE, SYN = FALSE, FIN = FALSE;

	DecodeCode(Packet.Data[13], URG, ACK, PSH, RST, SYN, FIN);

	if ((URG == FALSE)&&(ACK == FALSE)&&(PSH == FALSE)&&(RST == FALSE)&&(SYN == TRUE)&&(FIN == FALSE))
	{

		LONG CountLoop = Host_Send_Sync.GetCount();
		Bomb_Packet Temp_Packet_Sync;
		Found = FALSE;
		for ( LONG i = 0 ;(( i < CountLoop )&&( Found == FALSE)) ; i++ )
		{
			Temp_Packet_Sync = Host_Send_Sync.GetHead();
			Host_Send_Sync.RemoveHead();
			if ((Temp_Packet_Sync.IP_Src == IP_Src)&&(Temp_Packet_Sync.IP_Dst == IP_Dst))
				Found = TRUE;
			Host_Send_Sync.AddTail(Temp_Packet_Sync);
		}
		if ( Found == TRUE )
		{
			i--;
			POSITION pos = Host_Send_Sync.FindIndex(i);
			Temp_Packet_Sync.Count++;
			Host_Send_Sync.SetAt(pos,Temp_Packet_Sync);
			if ( Temp_Packet_Sync.Count >= Max_Sync_Per_Sec )
			{
//				Host_Send_Sync.RemoveAt(pos);
				Temp_Packet_Sync.Count = 0;
				Host_Send_Sync.SetAt(pos,Temp_Packet_Sync);
				Sync = TRUE;
			}
		}
		else
		{
			Temp_Packet_Sync.IP_Src = IP_Src;
			Temp_Packet_Sync.IP_Dst = IP_Dst;
			Temp_Packet_Sync.Count = 1;
			Host_Send_Sync.AddTail(Temp_Packet_Sync);
		}
	}

//	return Sync;
	if ( Sync == TRUE )
	{
		Found = FALSE;
		if ( Host_Sync.GetSize() > 0 )
		{
			for( int Count = 0; ((Found == FALSE) && (Count < Host_Sync.GetSize())) ; Count++)
			{
				if (Host_Sync.ElementAt(Count).Find(IP_Mix) != -1)
					Found = TRUE;
			}
		}
		if (Found == FALSE)
		{
			Host_Sync.Add(IP_Mix);
			return TRUE;
		}
	}

	return FALSE;


}
