/* File: SRC\INBOUND.C */
#include "napt.h"

PRIVATE char msg1[] = "Can't do ARP resolve on local IP address" ;

PRIVATE void Send_TCP_RST(PACKET *, tcp_Header *) ;

void Inbound_IP(void)
	{
	MTCBOOL original = TRUE ;
	PACKET *pkt = NULL ;

	MtCSetPri(NULL, MTC_HI) ;
	for (;;)
		{
		unsigned ip_hdr_len, ip_data_len ;
		tcp_Header *tcp ;
		MAPPING far *m ;
		CONNECTION *c ;
		in_Header *ip ;

		if (!original) MtCStop(NULL) ;

		Packet_Free(pkt) ;
		pkt = Wait_For_Packet(PKT_REM_IP) ;
		if (!pkt) continue ;
		ip = &pkt->ip ;

		if (ip->ver != 4)
			{
			Warning(NULL, NULL, err6, ip->ver, inbound) ;
			continue ;
			}

		ip_hdr_len = IP_HDR_BYTES(ip) ;
		if (ip_hdr_len < sizeof(in_Header))
			{
			Warning(NULL, NULL, err5, inbound) ;
			continue ;
			}

		/* ------------------------------------ */
		/* Discard any inbound broadcast packet */
		/* or packets not addressed to NAPT box */
		/* ------------------------------------ */
		if (ip->destination != _remote_IP)	continue ;
		if (ip->source == 0L)			continue ;

		tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;
		ip_data_len = Rev16(ip->length) - ip_hdr_len ;

		switch (ip->proto)
			{
			case TCP_PROTO:
				if (ip_data_len >= sizeof(tcp_Header)) break ;
				if (FRAG_OFFSET(ip)) break ;
				c = Reverse(Partial(ip)) ;
				Warning(c, ip, err5, inbound) ;
				continue ;

			case UDP_PROTO:
				if (ip_data_len >= sizeof(udp_Header)) break ;
				if (FRAG_OFFSET(ip)) break ;
				c = Reverse(Partial(ip)) ;
				Warning(c, ip, err5, inbound) ;
				continue ;

			default:
				c = Reverse(Partial(ip)) ;
				Warning(c, ip, err4, ip->proto, inbound) ;
				continue ;
			}

		if (FRAGMENT(ip))
			{
			if (FRAG_OFFSET(ip) == 0)
				{
				c = Connection(ip, tcp) ;
				Add_Fragment(ip, ip_hdr_len, c) ;
				}
			else
				{
				c = Fragment_Connection(pkt, ip_hdr_len,
					&original) ;
				if (!c)
					{ /* waiting for 1st fragment */
					pkt = NULL ;
					continue ;
					}
				tcp = NULL ; /* No TCP flags */
				}
			}
		else c = Connection(ip, tcp) ;

		m = Find_Inbound(Reverse(c)) ;
		if (!m)
			{
			Send_TCP_RST(pkt, tcp) ;
			Warning(c, ip, err1, inbound) ;
			continue ;
			}

		if (m->status & STATUS_SERVER)
			{
			if ((m = Add_Client(m, c, pkt->eth.source)) == NULL)
				{
				Send_TCP_RST(pkt, tcp) ;
				Warning(c, ip, msg1) ;
				continue ;
				}
			}

		if (FRAG_OFFSET(ip))
			{
			/* No protocol header to correct */
			}
		else if (ip->proto == UDP_PROTO &&
		         ((udp_Header *) tcp)->checksum == 0)
			{
			if ((*m->in_alg)(pkt, m)) continue ;
			tcp->dstPort = Rev16(m->c.local_port) ;
			((udp_Header *) tcp)->checksum = 0 ;
			}
		else
			{
			word *cp ;

			if ((*m->in_alg)(pkt, m)) continue ;
			if (ip->proto == TCP_PROTO) cp = &tcp->checksum ;
			else cp = &(((udp_Header *) tcp)->checksum) ;
			Delta_Checksum(cp, m->prot_dcksm) ;
			tcp->dstPort = Rev16(m->c.local_port) ;
			}

		Delta_Checksum(&ip->checksum, m->ip_dcksm) ;
		ip->destination = Rev32(m->c.local_IP) ;

		if (!Forward2Local(pkt, m->lcl_enet)) Warning(c, ip, err2) ;
		Reset_Timeout(m, tcp) ;
		m->pkt_rcvd++ ;
		}
	}

PRIVATE void Send_TCP_RST(PACKET *pkt, tcp_Header *tcp)
	{
	longword temp_l ;
	word temp_w ;

	if (pkt->ip.proto != TCP_PROTO) return ;
	if (!tcp || (tcp->flags & _TCP_SYN) == 0) return ;

	pkt->ip.ttl = 254 ;

	temp_l = pkt->ip.destination ;
	pkt->ip.destination = pkt->ip.source ;
	pkt->ip.source = temp_l ;

	tcp->flags &= _TCP_DO ;
	tcp->flags |= _TCP_ACK | _TCP_RST | _TCP_FIN ;
	tcp->acknum = tcp->seqnum ;
	tcp->seqnum = 0 ;
	tcp->window = 0 ;

	temp_w = tcp->dstPort ;
	tcp->dstPort = tcp->srcPort ;
	tcp->srcPort = temp_w ;

	Fix_IP_Checksum(&pkt->ip) ;
	Fix_Prot_Checksum(&pkt->ip) ;
	Forward2Remote(pkt, pkt->eth.source) ;
	}
