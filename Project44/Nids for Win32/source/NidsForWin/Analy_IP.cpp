// Analy_IP.cpp: implementation of the CAnaly_IP class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "NidsForWin.h"
#include "Analy_IP.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CAnaly_IP::CAnaly_IP()
{
/*	CTime T_Time = CTime::GetCurrentTime();
	Old_Sec = T_Time.GetSecond();
*/	Count_IP_IP = 0;

}

CAnaly_IP::~CAnaly_IP()
{

}

BOOL CAnaly_IP::CheckBomb()
{
	BOOL Bomb;
	LONG CountLoop = Host_Send_Bomb.GetCount();
	Bomb_Packet Temp_Packet_Bomb;
	BOOL Found = FALSE;
	for ( LONG i = 0 ;(( i < CountLoop )&&( Found == FALSE)) ; i++ )
	{
		Temp_Packet_Bomb = Host_Send_Bomb.GetHead();
		Host_Send_Bomb.RemoveHead();
		if ((Temp_Packet_Bomb.IP_Src == IP_Src)&&(Temp_Packet_Bomb.IP_Dst == IP_Dst))
			Found = TRUE;
		Host_Send_Bomb.AddTail(Temp_Packet_Bomb);
	}
	if ( Found == TRUE )
	{
		i--;
		POSITION pos = Host_Send_Bomb.FindIndex(i);
		Temp_Packet_Bomb.Count++;
		Host_Send_Bomb.SetAt(pos,Temp_Packet_Bomb);
		if ( Temp_Packet_Bomb.Count == Max_Packet_Per_Sec )
		{
			Temp_Packet_Bomb.Count = 0;
			Host_Send_Bomb.SetAt(pos,Temp_Packet_Bomb);
			Bomb = TRUE;
		}
	}
	else
	{
		Temp_Packet_Bomb.IP_Src = IP_Src;
		Temp_Packet_Bomb.IP_Dst = IP_Dst;
		Temp_Packet_Bomb.Count = 1;
		Host_Send_Bomb.AddTail(Temp_Packet_Bomb);
	}

	if ( Bomb == TRUE )
	{
		Found = FALSE;
		if ( Host_Bomb.GetSize() > 0 )
		{
			for( int Count = 0; ((Found == FALSE) && (Count < Host_Bomb.GetSize())) ; Count++)
			{
				if (Host_Bomb.ElementAt(Count).Find(IP_Mix) != -1)
					Found = TRUE;
			}
		}
		if (Found == FALSE)
		{
			Host_Bomb.Add(IP_Mix);
			return TRUE;
		}
		else
			Bomb = FALSE;
	}

	return FALSE;
	
}

BOOL CAnaly_IP::CheckIP()
{
	BOOL Found = FALSE;
	BOOL IP_IP = FALSE;
	if ( IP_Src.Find(IP_Dst) == 0 )
	{
		if ( Host_IP_IP.GetSize() > 0 )
		{
			int Count = 0;
			for( ; ((Found == FALSE) && (Count < Host_IP_IP.GetSize())) ; )
			{
				if (Host_IP_IP.ElementAt(Count_IP_IP).Find(IP_Mix) != -1)
				{
					Found = TRUE;
					Count_IP_IP--;
				}
				Count_IP_IP++;
				Count++;
				if (( Count_IP_IP == Host_IP_IP.GetSize() ) && ( Found == FALSE )) Count_IP_IP = 0;
			}
		}
		IP_IP = TRUE;
	}

	if ((IP_IP == TRUE)&&( Found == FALSE ))
	{
		Host_IP_IP.Add(IP_Mix);
		return TRUE;
	}
	return FALSE;

}

BOOL CAnaly_IP::Check(Header_Packet Packet,BOOL &Clear_List,CString &Type,CString &Src,CString &Dst,CString &Time)
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
		Type = "IP Bomb";
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
	if (CheckIP())
	{
		IP_IP = TRUE;
		Type = "IP IP Loop";
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
	{
		if (CheckPingSweeps())
		{
			Ping_Sweeps = TRUE;
			Type = "Ping Sweeps";
//			sprintf(Buffer,"%d\.%d\.%d\.%d",Packet.Dest_Addr[0],Packet.Dest_Addr[1],Packet.Dest_Addr[2],Packet.Dest_Addr[3]);
//			Dst = Buffer;
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
	}


	if ( CheckFragment(Packet,OverLap,Gap,New_Sec) )
	{
		if (OverLap == TRUE)
		{
			Type = "IP OverLap";
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
	}

	BOOL Print_Gap = FALSE;

	LONG CountLoop = Host_Fragment.GetCount();
	for ( LONG i = 0 ; (((i < CountLoop)&&(i<10))&&(Gap == FALSE)) ; i++ )
	{
		Link_Fragment Temp_Fragment = Host_Fragment.GetHead();
		Host_Fragment.RemoveHead();
		Temp_Sec = New_Sec;
		if (( New_Sec == 0 )&&( Temp_Fragment.Sec != New_Sec )) Temp_Sec = New_Sec + 60;
		else if (( New_Sec == 1 )&&( Temp_Fragment.Sec != New_Sec )) Temp_Sec = New_Sec + 60;
		else if (( New_Sec == 2 )&&( Temp_Fragment.Sec != New_Sec )) Temp_Sec = New_Sec + 60;
		Temp_Sec = Temp_Sec - 3;
		if (Temp_Fragment.Sec < Temp_Sec)
		{
			Gap = TRUE;
			Temp_IP_Dst = Temp_Fragment.IP_Dst;
			CString Temp_IP_Mix = Temp_Fragment.IP_Dst + Temp_Fragment.IP_Src;
			BOOL Found = FALSE;
			if ( Host_Gap.GetSize() > 0 )
			{
				for( int Count = 0; ((Found == FALSE) && (Count < Host_Gap.GetSize())) ; Count++)
				{
					if (Host_Gap.ElementAt(Count).Find(Temp_IP_Mix) != -1)
						Found = TRUE;
				}
			}
			if (Found == FALSE)
			{
				int Num_Char;
				CString Temp_Ip;
				Host_Gap.Add(Temp_IP_Mix);

				Type = "IP Gap";
				Num_Char = Temp_Fragment.IP_Dst.GetLength();
				Temp_Ip = Temp_Fragment.IP_Dst.Mid(1,(Num_Char-2));
				Dst = Temp_Ip;
				Num_Char = Temp_Fragment.IP_Src.GetLength();
				Temp_Ip = Temp_Fragment.IP_Src.Mid(1,(Num_Char-2));
				Src = Temp_Ip;
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

				Print_Gap = TRUE;
/*
				sprintf(Buffer,"Gap\t");
				Alert += Buffer;
				Num_Char = Temp_Fragment.IP_Dst.GetLength();
				Temp_Ip = Temp_Fragment.IP_Dst.Mid(1,(Num_Char-2));
				Alert += Temp_Ip;
				Alert += "\t";
				Num_Char = Temp_Fragment.IP_Src.GetLength();
				Temp_Ip = Temp_Fragment.IP_Src.Mid(1,(Num_Char-2));
				Alert += Temp_Ip;
				Alert += "\t";
				if ( New_Hour < 10 )
					sprintf(Buffer,"0%d\:",New_Hour);
				else 
					sprintf(Buffer,"%d\:",New_Hour);
				Alert += Buffer;
				if ( New_Min < 10 )
					sprintf(Buffer,"0%d",New_Min);
				else 
					sprintf(Buffer,"%d",New_Min);
				Alert += Buffer;
				Alert += "\r\n";
*/			}
			else
				Print_Gap = FALSE;
		}
		else
			Host_Fragment.AddTail(Temp_Fragment);
	}

	if ( Gap == TRUE )
		Clear_List = TRUE;

	if ( Print_Gap == FALSE )
		Gap = FALSE;

	if ((Bomb == TRUE) || (IP_IP == TRUE) || (OverLap == TRUE) || (Gap == TRUE) || (Ping_Sweeps == TRUE))
		return TRUE;
	return FALSE;

}

BOOL CAnaly_IP::CheckFragment(Header_Packet Packet, BOOL &OverLap, BOOL &Gap, int New_Sec)
{
	BOOL Flag_U = FALSE ,Flag_D = FALSE,Flag_M = FALSE;
	int Size_Data,Offset;
	Convert_Flag_Offset(Packet.Flag_and_Fragment_Offset[0],Packet.Flag_and_Fragment_Offset[1],
		Flag_U,Flag_D,Flag_M,Offset,Packet.Total_Length[0],Packet.Total_Length[1],Size_Data);

	if (( Flag_M == FALSE ) && ( Offset == 0 ))
	{
		return FALSE; // single packet
	}
	else
	{
		LONG CountLoop = Host_Fragment.GetCount();
		Link_Fragment Temp_Fragment;
		BOOL Found = FALSE;
		LONG i;
		if ( Host_Fragment.GetCount() > 0 )
		{
			for ( i = 0 ;(( i < CountLoop )&&( Found == FALSE)) ; i++ )
			{
				Temp_Fragment = Host_Fragment.GetHead();
				Host_Fragment.RemoveHead();
				if ((Temp_Fragment.IP_Src == IP_Src)&&(Temp_Fragment.IP_Dst == IP_Dst)&&(Temp_Fragment.Protocal == Packet.Protocol)&&(Temp_Fragment.Identification[0] == Packet.Identification[0])&&(Temp_Fragment.Identification[1] == Packet.Identification[1]))
					Found = TRUE;
				Host_Fragment.AddTail(Temp_Fragment);
			}
		}
		if ( Found == TRUE )
		{
			i--;
			POSITION pos = Host_Fragment.FindIndex(i);
			for ( CountLoop = 0 ; CountLoop<=Temp_Fragment.PointArray; CountLoop++ )
			{
				if ( Temp_Fragment.Array_Fragment[CountLoop].Offset == Offset )
				{
					OverLap = TRUE;
					Host_Fragment.RemoveAt(pos);
					BOOL Found_OverLap = FALSE;
					if ( Host_OverLap.GetSize() > 0 )
					{
						for( int Count = 0; ((Found_OverLap == FALSE) && (Count < Host_OverLap.GetSize())) ; Count++)
						{
							if (Host_OverLap.ElementAt(Count).Find(IP_Mix) != -1)
								Found_OverLap = TRUE;
						}
					}
					if (Found_OverLap == FALSE)
						Host_OverLap.Add(IP_Mix);
					else
					{
						OverLap = FALSE;
						return FALSE;
					}
					return TRUE;
				}
			}
			if ( OverLap == FALSE )
			{
				Temp_Fragment.IP_Src = IP_Src;
				Temp_Fragment.IP_Dst = IP_Dst;
				Temp_Fragment.Identification[0] = Packet.Identification[0];
				Temp_Fragment.Identification[1] = Packet.Identification[1];
				Temp_Fragment.Protocal = Packet.Protocol;
				Temp_Fragment.Sec = Temp_Fragment.Sec;
				Temp_Fragment.PointArray++;
				Temp_Fragment.Array_Fragment[Temp_Fragment.PointArray].Size_Data = Size_Data;
				Temp_Fragment.Array_Fragment[Temp_Fragment.PointArray].Flag_U = Flag_U;
				Temp_Fragment.Array_Fragment[Temp_Fragment.PointArray].Flag_D = Flag_D;
				Temp_Fragment.Array_Fragment[Temp_Fragment.PointArray].Flag_M = Flag_M;
				Temp_Fragment.Array_Fragment[Temp_Fragment.PointArray].Offset = Offset;
				if (ReFragment(Temp_Fragment,OverLap,Gap,Offset))
				{
					Host_Fragment.RemoveAt(pos);
					return FALSE;
				}
				else
					Host_Fragment.SetAt(pos,Temp_Fragment);
			}
		}
		else
		{
			Temp_Fragment.IP_Src = IP_Src;
			Temp_Fragment.IP_Dst = IP_Dst;
			Temp_Fragment.Identification[0] = Packet.Identification[0];
			Temp_Fragment.Identification[1] = Packet.Identification[1];
			Temp_Fragment.Protocal = Packet.Protocol;
			Temp_Fragment.Sec = New_Sec;
			Temp_Fragment.PointArray = 0;
			Temp_Fragment.Array_Fragment[0].Size_Data = Size_Data;
			Temp_Fragment.Array_Fragment[0].Flag_U = Flag_U;
			Temp_Fragment.Array_Fragment[0].Flag_D = Flag_D;
			Temp_Fragment.Array_Fragment[0].Flag_M = Flag_M;
			Temp_Fragment.Array_Fragment[0].Offset = Offset;
			Host_Fragment.AddTail(Temp_Fragment);
		}
	
	}
	return TRUE;
}

BOOL CAnaly_IP::ReFragment(Link_Fragment Temp_Fragment,BOOL &OverLap,BOOL &Gap,int Offset)
{
	int CountLoop;
	BOOL Found_Begin,Found_End;
	CList<Fragment,Fragment&> List_ReFrag;
	Fragment Temp,Temp2;
	for ( CountLoop = 0 ; CountLoop<=Temp_Fragment.PointArray; CountLoop++ )
	{
		if ( Temp_Fragment.Array_Fragment[CountLoop].Flag_M == FALSE )
		{
			Found_End = TRUE;
		}
		else if ( Temp_Fragment.Array_Fragment[CountLoop].Offset == 0 )
		{
			Temp.Flag_M = Temp_Fragment.Array_Fragment[CountLoop].Flag_M;
			Temp.Flag_D = Temp_Fragment.Array_Fragment[CountLoop].Flag_D;
			Temp.Flag_U = Temp_Fragment.Array_Fragment[CountLoop].Flag_U;
			Temp.Offset = Temp_Fragment.Array_Fragment[CountLoop].Offset;
			Temp.Size_Data = Temp_Fragment.Array_Fragment[CountLoop].Size_Data;
			List_ReFrag.AddHead(Temp);
			Found_Begin = TRUE;
		}
	}

	if (( Found_End == TRUE )&&( Found_Begin == TRUE ))
	{
		for ( int Count = 0 ; Count <= Temp_Fragment.PointArray ; Count++ )
		{
			BOOL Found = FALSE;
			Temp2 = List_ReFrag.GetTail();
			for ( CountLoop = 0 ; ((CountLoop<=Temp_Fragment.PointArray)&&(Found==FALSE)); CountLoop++ )
			{
				if ( ( Temp_Fragment.Array_Fragment[CountLoop].Offset * 8 ) == ( (Temp2.Offset * 8) + Temp2.Size_Data ) )
				{
					if ( Temp_Fragment.Array_Fragment[CountLoop].Flag_M == TRUE )
					{
						Temp.Flag_M = Temp_Fragment.Array_Fragment[CountLoop].Flag_M;
						Temp.Flag_D = Temp_Fragment.Array_Fragment[CountLoop].Flag_D;
						Temp.Flag_U = Temp_Fragment.Array_Fragment[CountLoop].Flag_U;
						Temp.Offset = Temp_Fragment.Array_Fragment[CountLoop].Offset;
						Temp.Size_Data = Temp_Fragment.Array_Fragment[CountLoop].Size_Data;
						List_ReFrag.AddTail(Temp);
					}
					else
						return TRUE;
					Found = TRUE;
				}
				else if ( ( ( (Temp_Fragment.Array_Fragment[CountLoop].Offset*8) > ( Temp2.Offset*8 )) 
					&& ( ( (Temp_Fragment.Array_Fragment[CountLoop].Offset * 8) + Temp_Fragment.Array_Fragment[CountLoop].Size_Data ) < (Temp2.Offset*8) ) )
					|| ( ( (Temp_Fragment.Array_Fragment[CountLoop].Offset*8) > ( (Temp2.Offset * 8) + Temp2.Size_Data ) ) 
					&& ( ( (Temp_Fragment.Array_Fragment[CountLoop].Offset * 8) + Temp_Fragment.Array_Fragment[CountLoop].Size_Data ) < ((Temp2.Offset * 8) + Temp2.Size_Data ) ) ) )
				{
					OverLap = TRUE;
					return FALSE;
				}
			}
		}
	}
	return FALSE;
}

void CAnaly_IP::Convert_Flag_Offset(int Old_Flags1, int Old_Flags2, BOOL &Flag_U, BOOL &Flag_D, BOOL &Flag_M, int &Offset, int Total_Length1,int Total_Length2, int &Size_Data)
{
	Offset = 0;
	if ( Old_Flags1 > 127 )
	{
		Flag_U = TRUE;
		Old_Flags1 -= 128;
	}
	if ( Old_Flags1 > 63 )
	{
		Flag_D = TRUE;
		Old_Flags1 -= 64;
	}
	if ( Old_Flags1 > 31 )
	{
		Flag_M = TRUE;
		Old_Flags1 -= 32;
	}
	if ( Old_Flags1 > 15 )
	{
		Offset += 4096;
		Old_Flags1 -= 16;
	}
	if ( Old_Flags1 > 7 )
	{
		Offset += 2048;
		Old_Flags1 -= 8;
	}
	if ( Old_Flags1 > 3 )
	{
		Offset += 1024;
		Old_Flags1 -= 4;
	}
	if ( Old_Flags1 > 1 )
	{
		Offset += 512;
		Old_Flags1 -= 2;
	}
	if ( Old_Flags1 > 0 )
	{
		Offset += 256;
		Old_Flags1 -= 0;
	}
	Offset += Old_Flags2;

	Size_Data = 0;
	if (Total_Length1 > 0)
	{
		if ( Total_Length1 > 127 )
		{
			Size_Data += 32768;
			Total_Length1 -= 128;
		}
		if ( Total_Length1 > 63 )
		{
			Size_Data += 16384;
			Total_Length1 -= 64;
		}
		if ( Total_Length1 > 31 )
		{
			Size_Data += 8192;
			Total_Length1 -= 32;
		}
		if ( Total_Length1 > 15 )
		{
			Size_Data += 4096;
			Total_Length1 -= 16;
		}
		if ( Total_Length1 > 7 )
		{
			Size_Data += 2048;
			Total_Length1 -= 8;
		}
		if ( Total_Length1 > 3 )
		{
			Size_Data += 1024;
			Total_Length1 -= 4;
		}
		if ( Total_Length1 > 1 )
		{
			Size_Data += 512;
			Total_Length1 -= 2;
		}
		if ( Total_Length1 > 0 )
		{
			Size_Data += 256;
			Total_Length1 -= 0;
		}
	}
	Size_Data += Total_Length2;
	Size_Data -= 20;


}

BOOL CAnaly_IP::CheckPingSweeps()
{
	BOOL Ping = FALSE;
	LONG CountLoop = Host_Ping_Sweeps.GetCount();
	PingSweeps Temp_Ping_Sweeps;
	BOOL Found = FALSE;
	int Count = 1;
	for ( LONG i = 0 ; i < CountLoop ; i++ )
	{
		Temp_Ping_Sweeps = Host_Ping_Sweeps.GetHead();
		Host_Ping_Sweeps.RemoveHead();

		if (Temp_Ping_Sweeps.IP_Src == IP_Src)
		{
			Count++;
			if (Temp_Ping_Sweeps.IP_Dst == IP_Dst)
				Found = TRUE;
		}

		Host_Ping_Sweeps.AddTail(Temp_Ping_Sweeps);
	}

	if ( Found == FALSE )
	{
		Temp_Ping_Sweeps.IP_Src = IP_Src;
		Temp_Ping_Sweeps.IP_Dst = IP_Dst;
		Host_Ping_Sweeps.AddTail(Temp_Ping_Sweeps);
	}

	if ( Count >= 10 )
	{
		for ( LONG i = 0 ; i < CountLoop ; i++ )
		{
			Temp_Ping_Sweeps = Host_Ping_Sweeps.GetHead();
			Host_Ping_Sweeps.RemoveHead();

			if (Temp_Ping_Sweeps.IP_Src != IP_Src)
				Host_Ping_Sweeps.AddTail(Temp_Ping_Sweeps);
		}

		Ping = TRUE;
	}

	if ( Ping == TRUE )
	{
		Found = FALSE;
		if ( Host_Ping.GetSize() > 0 )
		{
			for( int Count = 0; ((Found == FALSE) && (Count < Host_Ping.GetSize())) ; Count++)
			{
				if (Host_Ping.ElementAt(Count).Find(IP_Src) != -1)
					Found = TRUE;
			}
		}
		if (Found == FALSE)
		{
			Host_Ping.Add(IP_Src);
			return TRUE;
		}
	}

	return FALSE;

}

void CAnaly_IP::Clear_Buffer()
{
	Count_IP_IP = 0;
	Host_Ping_Sweeps.RemoveAll();
	Host_IP_IP.RemoveAll();
	Host_Send_Bomb.RemoveAll();


}

void CAnaly_IP::Clear_Result()
{
	Host_OverLap.RemoveAll();
	Host_Bomb.RemoveAll();
	Host_Gap.RemoveAll();
	Host_Ping.RemoveAll();
}
