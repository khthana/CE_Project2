// Sniff.cpp: implementation of the CSniff class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "NidsForWin.h"
#include "Sniff.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//define a pointer to an ADAPTER structure
LPADAPTER  lpAdapter;
//define a pointer to a PACKET structure
LPPACKET   lpPacket;

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CSniff::CSniff()
{
	StatusPromiscuous = FALSE;
//	SumNumLinkList = 0;

}

CSniff::~CSniff()
{

}

BOOL CSniff::OpenPromiscuous(int NumberDevice)
{
	if ( StatusPromiscuous == FALSE )
	{
		if ( NumberDevice < 0 ) NumberDevice = 0;

		Device = NumberDevice;

		char AdapterList[Max_Num_Adapter][1024];
		WCHAR		AdapterName[512];
		WCHAR		*temp,*temp1;
		TCHAR		AdapterNameTmp[1024];
		int			AdapterNum=0;
		int			a;
		ULONG		AdapterLength=512;
		char	    buffer[256000] ;

		int SumAdapter=0;

		sprintf(buffer,"%s",AdapterName);

		PacketGetAdapterNames(AdapterNameTmp,&AdapterLength);
		for ( a = 0 ; a <= 511 ; a++)
			AdapterName[a] = AdapterNameTmp[a*2];
		temp=AdapterName;
		temp1=AdapterName;
		while ((*temp!='\0')||(*(temp-1)!='\0'))
		{
			if (*temp=='\0') 
			{
				memcpy(AdapterList[SumAdapter],temp1,(temp-temp1)*2);
				AdapterList[SumAdapter][((temp-temp1)*2)+0] = NULL ;
				AdapterList[SumAdapter][((temp-temp1)*2)+1] = NULL ;
				AdapterList[SumAdapter][((temp-temp1)*2)+2] = NULL ;
				AdapterList[SumAdapter][((temp-temp1)*2)+3] = NULL ;
				temp1=temp+1;
				SumAdapter++;
			}

			temp++;
		}

		::lpAdapter = PacketOpenAdapter(AdapterList[NumberDevice]) ;
	
		if (!::lpAdapter || (::lpAdapter->hFile == INVALID_HANDLE_VALUE))
			return(-1);
		PacketSetHwFilter(::lpAdapter,NDIS_PACKET_TYPE_PROMISCUOUS);	// Promiscuous Mode Opening
		//PacketSetHwFilter(::lpAdapter,NDIS_PACKET_TYPE_DIRECTED);		// Normal Mode
		//PacketSetHwFilter(::lpAdapter,NDIS_PACKET_TYPE_ALL_LOCAL);		//  All Own Packet 
		PacketSetBuff(::lpAdapter,512000);	// set a 512K buffer in the driver
		PacketSetReadTimeout(::lpAdapter,1000);	// set a 1 second read timeout

		if((::lpPacket = PacketAllocatePacket())==NULL)
			return FALSE;
		PacketInitPacket(::lpPacket,(char*)buffer,256000);
	
		StatusPromiscuous = TRUE;

		return TRUE;

	}

	return FALSE;

}

BOOL CSniff::ClosePromiscuous()
{
	if ( StatusPromiscuous == TRUE )
	{
		PacketFreePacket(::lpPacket);
		PacketCloseAdapter(::lpAdapter);
		StatusPromiscuous = FALSE;
		return TRUE;
	}

	return FALSE;

}

BOOL CSniff::GetStatusPacket(LONG &SumPacket, LONG &SumLost)
{
 	if ( StatusPromiscuous == TRUE )
	{
		struct bpf_stat stat;
		PacketGetStats(::lpAdapter,&stat);
		SumPacket = stat.bs_recv;
		SumLost = stat.bs_drop;
		return TRUE;
	}
	SumPacket = 0;
	SumLost = 0;
	return FALSE;

}

BOOL CSniff::GetPacket(Header_Packet &Packet)
{
	if ( DataPacket.GetCount() > 0 )
	{
		CSingleLock singleLock(&Cs);
		singleLock.Lock();  // Attempt to lock the shared resource
		if (singleLock.IsLocked())  // Resource has been locked
		{
			Packet = DataPacket.GetHead();
			DataPacket.RemoveHead();
			singleLock.Unlock();
		}
		return TRUE;
	}
	return FALSE;
	
}

BOOL CSniff::PacketFromDevice()
{
	if ( StatusPromiscuous == TRUE )
	{
		PacketReceivePacket(::lpAdapter,::lpPacket,TRUE);

		if ( ::lpPacket->ulBytesReceived > 0 )
		{
			ULONG	ulBytesReceived;
			char	*pChar,*pBase;
			char	*buf;
			struct	bpf_hdr *hdr;
			UINT	offset;

			ulBytesReceived = ::lpPacket->ulBytesReceived;
			buf = (char *)::lpPacket->Buffer;		// Set buffer to point the Buffer of PacketRecieve
			offset = 0;
	
			while(offset<ulBytesReceived)
			{

				hdr=(struct bpf_hdr *)(buf+offset);
				offset+=hdr->bh_hdrlen ;

				pChar =(char*)(buf + offset);  // Initial base of Packet
				offset=Packet_WORDALIGN(offset+hdr->bh_caplen) ;

				pBase = pChar;

				Header_Packet temp;

				if (DataPacket.GetCount() < Max_Packet_Analys)
				{
					temp.Mac_Dest[0] = *(BYTE *)(pBase);
					temp.Mac_Dest[1] = *(BYTE *)(pBase+1);
					temp.Mac_Dest[2] = *(BYTE *)(pBase+2);
					temp.Mac_Dest[3] = *(BYTE *)(pBase+3);
					temp.Mac_Dest[4] = *(BYTE *)(pBase+4);
					temp.Mac_Dest[5] = *(BYTE *)(pBase+5);
					temp.Mac_Src[0] = *(BYTE *)(pBase+6);
					temp.Mac_Src[1] = *(BYTE *)(pBase+7);
					temp.Mac_Src[2] = *(BYTE *)(pBase+8);
					temp.Mac_Src[3] = *(BYTE *)(pBase+9);
					temp.Mac_Src[4] = *(BYTE *)(pBase+10);
					temp.Mac_Src[5] = *(BYTE *)(pBase+11);
					temp.Frame_Type[0] = *(BYTE *)(pBase+12);
					temp.Frame_Type[1] = *(BYTE *)(pBase+13);
					temp.IP_Version_and_Header_Length = *(BYTE *)(pBase+14);
					temp.Type_Of_Service = *(BYTE *)(pBase+15);
					temp.Total_Length[0] = *(BYTE *)(pBase+16);
					temp.Total_Length[1] = *(BYTE *)(pBase+17);
					temp.Identification[0] = *(BYTE *)(pBase+18);
					temp.Identification[1] = *(BYTE *)(pBase+19);
					temp.Flag_and_Fragment_Offset[0] = *(BYTE *)(pBase+20);
					temp.Flag_and_Fragment_Offset[1] = *(BYTE *)(pBase+21);
					temp.TTL = *(BYTE *)(pBase+22);
					temp.Protocol = *(BYTE *)(pBase+23);
					temp.Header_Checksum[0] = *(BYTE *)(pBase+24);
					temp.Header_Checksum[1] = *(BYTE *)(pBase+25);
					temp.Src_Addr[0] = *(BYTE *)(pBase+26);
					temp.Src_Addr[1] = *(BYTE *)(pBase+27);
					temp.Src_Addr[2] = *(BYTE *)(pBase+28);
					temp.Src_Addr[3] = *(BYTE *)(pBase+29);
					temp.Dest_Addr[0] = *(BYTE *)(pBase+30);
					temp.Dest_Addr[1] = *(BYTE *)(pBase+31);
					temp.Dest_Addr[2] = *(BYTE *)(pBase+32);
					temp.Dest_Addr[3] = *(BYTE *)(pBase+33);
					temp.Data[0] = *(BYTE *)(pBase+34);
					temp.Data[1] = *(BYTE *)(pBase+35);
					temp.Data[2] = *(BYTE *)(pBase+36);
					temp.Data[3] = *(BYTE *)(pBase+37);
					temp.Data[4] = *(BYTE *)(pBase+38);
					temp.Data[5] = *(BYTE *)(pBase+39);
					temp.Data[6] = *(BYTE *)(pBase+40);
					temp.Data[7] = *(BYTE *)(pBase+41);
					temp.Data[8] = *(BYTE *)(pBase+42);
					temp.Data[9] = *(BYTE *)(pBase+43);
					temp.Data[10] = *(BYTE *)(pBase+44);
					temp.Data[11] = *(BYTE *)(pBase+45);
					temp.Data[12] = *(BYTE *)(pBase+46);
					temp.Data[13] = *(BYTE *)(pBase+47);
					temp.Data[14] = *(BYTE *)(pBase+48);
					temp.Data[15] = *(BYTE *)(pBase+49); 
					temp.Data[16] = *(BYTE *)(pBase+50);
					temp.Data[17] = *(BYTE *)(pBase+51);
					temp.Data[18] = *(BYTE *)(pBase+52);
					temp.Data[19] = *(BYTE *)(pBase+53);

					CSingleLock singleLock(&Cs);
					singleLock.Lock();  // Attempt to lock the shared resource
					if (singleLock.IsLocked())  // Resource has been locked
					{
						DataPacket.AddTail(temp);
						singleLock.Unlock();
					}

				} // end if fix packet
				else
				{
					PacketSetHwFilter(::lpAdapter,NDIS_PACKET_TYPE_DIRECTED);
					StatusPromiscuous = FALSE;
				}

			}

			return TRUE;
		}

		return FALSE;
	}
	else if ( StatusPromiscuous == FALSE )
	{
		if ( DataPacket.GetCount() == 0 )
		{
			PacketSetHwFilter(::lpAdapter,NDIS_PACKET_TYPE_PROMISCUOUS);
			StatusPromiscuous = TRUE;
		}
	}

	return FALSE;

}

BOOL CSniff::ClearSniff()
{
	CSingleLock singleLock(&Cs);
	singleLock.Lock();  // Attempt to lock the shared resource
	if (singleLock.IsLocked())  // Resource has been locked
	{
		DataPacket.RemoveAll();
		singleLock.Unlock();
	}
	return TRUE;

}

//BOOL CSniff::Getinfo(int &RemainLink, LONG &SumLink)
//{
//	RemainLink = DataPacket.GetCount();
//	SumLink = SumNumLinkList;
//	return TRUE;
//
//}

//BOOL CSniff::Split()
//{
//	CSingleLock singleLock(&Cs);
//	singleLock.Lock();  // Attempt to lock the shared resource
//	if (singleLock.IsLocked())  // Resource has been locked
//	{
/*		int Count_Packet = DataPacket.GetCount();
		if ( Count_Packet > Split_Packet )
		{
			for ( int i = 0 ; i <= Count_Packet - Split_Packet ; i++ )
				DataPacket.RemoveHead();
		}
*/
//		DataPacket.RemoveAll();
//		singleLock.Unlock();
//	}
//	return TRUE;
//}

BOOL CSniff::GetStatusPromiscuous()
{
	if ( StatusPromiscuous == TRUE )
		return TRUE;
	return FALSE;

}
