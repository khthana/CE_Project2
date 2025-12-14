// Header_Packet.h: interface for the Header_Packet class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_HEADER_PACKET_H__00F6B80A_C58B_4BFF_96DD_6D4ED3704007__INCLUDED_)
#define AFX_HEADER_PACKET_H__00F6B80A_C58B_4BFF_96DD_6D4ED3704007__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class Header_Packet  
{
public:
	int Mac_Dest[6];
	int Mac_Src[6];
	int Frame_Type[2];
	int IP_Version_and_Header_Length;
	int Type_Of_Service;
	int Total_Length[2];
	int Identification[2];
	int	Flag_and_Fragment_Offset[2];
	int TTL;
	int	Protocol;
	int Header_Checksum[2];
	int Src_Addr[4];
	int Dest_Addr[4];
	int Data[20];
//	int Src_Port[2];
//	int Dst_Port[2];
//	int Seq_Num[4];
	Header_Packet();
	virtual ~Header_Packet();

};

#endif // !defined(AFX_HEADER_PACKET_H__00F6B80A_C58B_4BFF_96DD_6D4ED3704007__INCLUDED_)
