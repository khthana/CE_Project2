/* File: SRC\RAUDIO.C - Support for Real Audio Protocol */

#include "napt.h"

PRIVATE BOOL RA_InFmSrvr(PACKET *, MAPPING far *) ;

BOOL RA_OutToSrvr(PACKET *pkt, MAPPING far *m)
	{
	word *udp_rx_port, *udp_tx_port ;
	unsigned ip_hdr_len ;
	tcp_Header *tcp ;
	in_Header *ip ;
	char *dp ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;

	dp = ((char *) tcp) + (DATAOFFSET(tcp) << 2) ;
	if ((Rev16(ip->length) - (dp - (char *) ip)) <= 6)	return FALSE ;
	if (strnicmp(dp, "PNA", 3))				return FALSE ;

	udp_rx_port = NULL ;
	udp_tx_port = NULL ;

	dp += 5 ;
	for (;;)
		{
		register word *wp = (word *) dp ;
		dp += 4 + Rev16(wp[1]) ;
		switch (wp[0])
			{
			case 0x0000:	/* End of startup messages */
				break ;

			case 0x0100:	/* UDP port request */
				udp_rx_port = &wp[2] ;
				continue ;

			case 0x0700:	/* Robust UDP */
				udp_tx_port = &wp[2] ;
				continue ;
			}
		break ;
		}

	if (udp_rx_port)
		{
		MAPPING far *rx ;
		longword lcl_IP ;
		word lcl_port ;

		lcl_IP = Rev32(ip->source) ;
		lcl_port = Rev16(*udp_rx_port) ;
		rx = Add_Server(UDP_PROTO, lcl_IP, lcl_port, TRUE) ;
		*udp_rx_port = rx->mapped_port ;

		farmemcpy(rx->lcl_enet, m->lcl_enet, sizeof(eth_address)) ;
		rx->status &= ~STATUS_LCL_ARP ;

		if (m->associate) Del_Mapping(m->associate) ;
		m->associate = rx ;

		if (udp_tx_port)
			{
			MAPPING far *tx ;
			CONNECTION c ;

			c.protocol    = UDP_PROTO ;
			c.local_IP    = m->c.local_IP ;
			c.local_port  = Rev16(*udp_tx_port) ;
			c.remote_IP   = 0L ;
			c.remote_port = 0 ;

			tx = Add_Mapping(&c, m->lcl_enet) ;
			*udp_tx_port = tx->mapped_port ;

			rx->associate = tx ;
			rx->in_alg = RA_InFmSrvr ;
			}
		}

	return FALSE ;
	}

PRIVATE BOOL RA_InFmSrvr(PACKET *pkt, MAPPING far *rx)
	{
	unsigned ip_hdr_len, length ;
	MAPPING far *tx ;
	tcp_Header *tcp ;
	in_Header *ip ;
	word *wp ;
	char *dp ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;

	dp = ((char *) tcp) + sizeof(udp_Header) ;
	length = Rev16(ip->length) - (dp - (char *) ip) ;
	tx = rx->associate ;
	wp = (word *) dp ;

	if (length == 10 && wp[0] == 0x084F && wp[1] == 0x0700)
		{
		tx->c.remote_IP = rx->c.remote_IP ;
		tx->c.remote_port = wp[2] ;
		}
	else
		{
		Del_Mapping(tx) ;
		rx->associate = NULL ;
		}

	return FALSE ;
	}
