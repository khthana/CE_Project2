/* File: SRC\OUTBOUND.C */

#include "napt.h"

void Outbound_IP(void)
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
		pkt = Wait_For_Packet(PKT_LCL_IP) ;
		if (!pkt) continue ;
		ip = &pkt->ip ;

		if (ip->ver != 4)
			{
			Warning(NULL, NULL, err6, ip->ver, outbound) ;
			continue ;
			}

		ip_hdr_len = IP_HDR_BYTES(ip) ;
		if (ip_hdr_len < sizeof(in_Header))
			{
			Warning(NULL, NULL, err5, outbound) ;
			continue ;
			}

		/* ---------------------------------------------- */
		/* Discard TCP/UDP local subnet broadcast packets */
		/* plus any TCP/UDP packets aimed at the NAPT box */
		/* ---------------------------------------------- */
		if (Local_Target(ip->destination))	continue ;
		if (ip->source == 0L)			continue ;

		tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;
		ip_data_len = Rev16(ip->length) - ip_hdr_len ;

		switch (ip->proto)
			{
			case TCP_PROTO:
				if (ip_data_len >= sizeof(tcp_Header)) break ;
				if (FRAG_OFFSET(ip)) break ;
				c = Partial(ip) ;
				Warning(c, ip, err5, outbound) ;
				continue ;
			case UDP_PROTO:
				if (ip_data_len >= sizeof(udp_Header)) break ;
				if (FRAG_OFFSET(ip)) break ;
				c = Partial(ip) ;
				Warning(c, ip, err5, outbound) ;
				continue ;
			default:
				c = Partial(ip) ;
				Warning(c, ip, err4, ip->proto, outbound) ;
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
				tcp = NULL ; /* No port numbers */
				}
			}
		else c = Connection(ip, tcp) ;

		m = Find_Outbound(c) ;
		if (!m) m = Add_Mapping(c, pkt->eth.source) ;

		if (FRAG_OFFSET(ip))
			{
			/* No protocol header to correct */
			}
		else if (ip->proto == UDP_PROTO &&
		         ((udp_Header *) tcp)->checksum == 0)
			{
			if ((*m->out_alg)(pkt, m)) continue ;
			tcp->srcPort = Rev16(m->mapped_port) ;
			((udp_Header *) tcp)->checksum = 0 ;
			}
		else
			{
			word *cp ;

			if ((*m->out_alg)(pkt, m)) continue ;

			if (ip->proto == TCP_PROTO) cp = &tcp->checksum ;
			else cp = &(((udp_Header *) tcp)->checksum) ;

			Delta_Checksum(cp, ~m->prot_dcksm) ;
			tcp->srcPort = Rev16(m->mapped_port) ;
			}

		Delta_Checksum(&ip->checksum, ~m->ip_dcksm) ;
		ip->source = _remote_IP ;

		if (m->status & STATUS_REM_ARP)
			{
			Remote_ARP_Resolve(Rev32(ip->destination),
				m->rem_enet) ;
			m->status &= ~STATUS_REM_ARP ;
			}
		Forward2Remote(pkt, m->rem_enet) ;
		Reset_Timeout(m, tcp) ;
		m->pkt_sent++ ;
		}
	}

BOOL Local_Target(longword dst)
	{
	if (dst == 0xFFFFFFFFL) return TRUE ;
	return ((dst ^ _local_IP) & _local_mask) == 0L ;
	}

