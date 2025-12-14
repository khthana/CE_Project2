/* File: SRC\BOOTP.C */
#include "napt.h"

typedef struct BOOTP_PACKET
	{
	byte		status ;
	eth_Header	eth ;
	in_Header	ip ;
	udp_Header	udp ;
	BOOTP		bootp ;
	} BOOTP_PACKET ;

#define VM_RFC1048	0x63825363L

#define BOOTP_REQUEST 	1	/* bootp.bp_op */
#define BOOTP_REPLY	2

#define	BOOTP_TIMEOUT	30

#define	BOOTP_CLIENT	68
#define	BOOTP_SERVER	67
#define	BOOTP_LENGTH	sizeof(BOOTP)
#define	IPPKT_LENGTH	(sizeof(in_Header)+sizeof(udp_Header)+BOOTP_LENGTH)

#define MINBOOTP sizeof(udp_Header) + sizeof(BOOTP)

PRIVATE BOOTP *		BOOTP_Data(PACKET *) ;
PRIVATE void		BOOTP_Options(byte *) ;
PRIVATE BOOTP_PACKET *	BOOTP_Packet(longword) ;
PRIVATE void		BOOTP_Reply(longword) ;

void BOOTP_Attempt(void)
	{
	unsigned reply_secs, seconds = BOOTP_TIMEOUT ;
	longword onesec, counter, xid ;
	BOOTP_PACKET *send ;

	if (Remote_Class() != PD_ETHER)
		{
		Error("No remote IP address specified and not Ethernet") ;
		}

	xid = Set_Timeout(0) ; /* 32-bit random number */
	MtCCoroutine(BOOTP_Reply(xid)) ;
	send = BOOTP_Packet(xid) ;

	reply_secs = 7 ;
	counter = Set_Timeout(0) ;
	onesec = Set_Timeout(1) - counter ;
	while (!remote_IP && seconds)
		{
		static eth_address all_ones =
			{0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF} ;
		longword reply_timer ;

		Fix_IP_Checksum(&send->ip) ;
		Fix_Prot_Checksum(&send->ip) ;
		Forward2Remote((PACKET *) send, all_ones) ;

		reply_secs += rand() & 0x0007 ;
		send->bootp.secs = Rev16(Rev16(send->bootp.secs)+reply_secs) ;
		reply_timer = Set_Timeout(reply_secs) ;
		while (!remote_IP && seconds && !Check_Timeout(reply_timer))
			{
			if (Check_Timeout(counter))
				{
				printf("%2u\b\b", seconds) ;
				if (seconds) seconds-- ;
				counter += onesec ;
				}
			Dispatcher() ;
			}
		}

	if (!remote_IP) Error("BOOTP request failed") ;
	}

PRIVATE void BOOTP_Reply(longword xid)
	{
	while (!remote_IP)
		{
		BOOTP *bootp ;
		PACKET *pkt ;

		pkt = Wait_For_Packet(PKT_REM_IP) ;

		if ((bootp = BOOTP_Data(pkt)) && bootp->xid == xid)
			{
			_remote_IP = bootp->yiaddr ;
			remote_IP = Rev32(_remote_IP) ;
			BOOTP_Options(bootp->vend) ;
			}

		Packet_Free(pkt) ;
		}
	}

PRIVATE BOOTP *BOOTP_Data(PACKET *pkt)
	{
	unsigned hdrlen ;
	udp_Header *udp ;
	in_Header *ip ;

	ip = &pkt->ip ;
	hdrlen = IP_HDR_BYTES(ip) ;

	for (;;)
		{
		if (Checksum(ip, hdrlen) != 0xFFFF)		break ;
		if (ip->proto != UDP_PROTO)			break ;
		if (Rev16(ip->length) < MINBOOTP)		break ;

		udp = (udp_Header *) ((byte *) ip + hdrlen) ;
		if (Rev16(udp->dstPort) != BOOTP_CLIENT)	break ;

		return (BOOTP *) (((byte *) udp) + sizeof(udp_Header)) ;
		}

	return NULL ;
	}

PRIVATE BOOTP_PACKET *BOOTP_Packet(longword xid)
	{
	static BOOTP_PACKET pkt ;
	unsigned length ;

	memset(&pkt, 0, sizeof(pkt)) ;

	pkt.bootp.op	= BOOTP_REQUEST ;
	pkt.bootp.htype	= PD_ETHER ;
	pkt.bootp.hlen	= 6 ;
	pkt.bootp.xid	= xid ;
	pkt.bootp.secs	= Rev16(1) ;
	*((longword *) pkt.bootp.vend) = Rev32(VM_RFC1048) ;
	memcpy(pkt.bootp.chaddr, Remote_Adrs(), sizeof(eth_address)) ;

	length = sizeof(udp_Header) + sizeof(BOOTP) ;

	pkt.udp.srcPort	= Rev16(BOOTP_CLIENT) ;
	pkt.udp.dstPort	= Rev16(BOOTP_SERVER) ;
	pkt.udp.length	= Rev16(length) ;
	pkt.udp.checksum = 0xFFFF ; /* Force recalculation */

	pkt.ip.hdrlen	= 5 ;
	pkt.ip.ver	= 4 ;
	pkt.ip.length	= Rev16(sizeof(in_Header) + length) ;
	pkt.ip.id	= Rev16(1) ;
	pkt.ip.ttl	= 254 ;
	pkt.ip.proto	= UDP_PROTO ;
	pkt.ip.destination = 0xFFFFFFFFL ;

	pkt.eth.type	= IP_TYPE ;
	memset(pkt.eth.destination, 0xFF, sizeof(eth_address)) ;
	memcpy(pkt.eth.source, Remote_Adrs(), sizeof(eth_address)) ;

	return &pkt ;
	}

PRIVATE void BOOTP_Options(byte *p)
	{
	unsigned index ;

	if (Rev32(*((longword *) p)) != VM_RFC1048) return ;

	p += 4 ;
	for (index = 4; index < 64; index++)
		{
		if (p[0] == 255) break ;
		switch (p[0])
			{
			case 0: /* Nop Pad character */
                               	p++ ;
				continue ;

			case 1: /* Subnet Mask */
				_remote_mask = *((longword *) &p[2]) ;
				remote_mask = Rev32(_remote_mask) ;
				break ;

			case 3:	/* Gateways (take only the 1st) */
				_remote_gateway = *((longword *) &p[2]) ;
				remote_gateway = Rev32(_remote_gateway) ;
				break ;

			case 12: /* hostname */
				memcpy(remote_name, &p[2],
					sizeof(remote_name)) ;
				remote_name[sizeof(remote_name) - 1] = '\0' ;
				strlwr(remote_name) ;
				break ;
			}

		p += p[1] + 2 ;
		}
	}
