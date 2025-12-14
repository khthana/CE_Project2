/* File: SRC\ICMP.C (RFC 792) */

#include "napt.h"

typedef struct AR_PACKET
	{
	byte		status ;
	eth_Header	eth ;
	in_Header	ip ;
	ICMP_RA		icmp ;
	} AR_PACKET ;

PRIVATE void		Advertise_Router(PACKET *) ;
PRIVATE void		Do_Inbound_ICMP(PACKET *, in_Header *, ICMP_PKT *) ;
PRIVATE void		Do_Outbound_ICMP(PACKET *, in_Header *, ICMP_PKT *) ;
PRIVATE void		Fix_Destination(in_Header *, MAPPING far *) ;
PRIVATE void		Fix_Source(in_Header *, MAPPING far *) ;
PRIVATE PACKET *	Inbound_Echo(PACKET *, unsigned, MTCBOOL *) ;
PRIVATE void		Local_Reply(PACKET *, ICMP_PKT *) ;
PRIVATE PACKET *	Outbound_Echo(PACKET *, unsigned, MTCBOOL *) ;
PRIVATE void		Remote_Reply(PACKET *, ICMP_PKT *) ;

PRIVATE char msg1[] = "Unknown ICMP type (%02Xh) on %s packet" ;
PRIVATE char msg2[] = "%s ICMP fragment type (%u) not echo" ;
PRIVATE char msg3[] = "Bad IP checksum on %s packet" ;

void Inbound_ICMP(void)
	{
	MTCBOOL orig = TRUE ;
	PACKET *pkt = NULL ;

	MtCSetPri(NULL, MTC_LOW) ;
	for (;;)
		{
		unsigned ip_hdr_len ;
		ICMP_PKT *icmp ;
		in_Header *in ;

		if (!orig) MtCStop(NULL) ;

		Packet_Free(pkt) ;
		pkt = Wait_For_Packet(PKT_REM_ICMP) ;
		if (!pkt) continue ;
		in = &pkt->ip ;

		if (in->ver != 4)
			{
			Warning(NULL, NULL, msg2, in->ver, inbound) ;
			continue ;
			}

		ip_hdr_len = IP_HDR_BYTES(in) ;
		if (Checksum(in, ip_hdr_len) != 0xFFFF)
			{
			Warning(NULL, NULL, msg3, inbound) ;
			continue ;
			}

		/* ------------------------------------ */
		/* Discard any inbound broadcast packet */
		/* or packets not addressed to NAPT box */
		/* ------------------------------------ */
		if (in->destination != _remote_IP)	continue ;
		if (in->source == 0L)			continue ;

		if (FRAGMENT(in))
			{
			pkt = Inbound_Echo(pkt, ip_hdr_len, &orig) ;
			continue ;
			}

		icmp = (ICMP_PKT *) ((byte *) in + ip_hdr_len) ;
		if (Checksum(icmp, Rev16(in->length) - ip_hdr_len) != 0xFFFF)
			{
			Warning(Reverse(Partial(in)), in, err3, inbound) ;
			continue ;
			}

		Do_Inbound_ICMP(pkt, in, icmp) ;
		}
	}

PRIVATE PACKET *Inbound_Echo(PACKET *pkt, unsigned ip_hdr_len, MTCBOOL *orig)
	{
	/* --------------------------------------- */
	/* Inbound: ECHO request or reply possible */ 
	/* --------------------------------------- */
	MAPPING far *m ;
	ICMP_PKT *icmp ;
	CONNECTION *c ;
	in_Header *in ;

	in = &pkt->ip ;
	icmp = (ICMP_PKT *) ((byte *) in + ip_hdr_len) ;

	if (FRAG_OFFSET(in) == 0)
		{
		c = Connection(in, icmp) ;
		if (icmp->unused.type != 0 && icmp->unused.type != 8)
		    	{
			c = Reverse(c) ;
			Warning(c, in, msg2, inbound, icmp->unused.type) ;
			return pkt ;
			}

		Add_Fragment(in, ip_hdr_len, c) ;
		Do_Inbound_ICMP(pkt, in, icmp) ;
		return pkt ;
		}

	c = Fragment_Connection(pkt, ip_hdr_len, orig) ;
	if (!c) return NULL ; /* Waiting for 1st fragment */

	if ((m = Find_Inbound(Reverse(c))) == NULL)
		{
		/* ----------------------------------- */
		/* No mapping: Must be an ECHO request */
		/* ----------------------------------- */
		Remote_Reply(pkt, NULL) ;
		return pkt ;
		}

	/* ------------------------------------- */
	/* Mapping exists: Must be an ECHO reply */
	/* ------------------------------------- */
	in->destination = Rev32(m->c.local_IP) ;
	Delta_Checksum(&in->checksum, m->ip_dcksm) ;

	m->status |= STATUS_EXPIRE ;
	m->time_out = Set_Timeout(ICMP_SHORT);
	if (Forward2Local(pkt, m->lcl_enet))
		{
		Reset_Timeout(m, NULL) ;
		m->pkt_rcvd++ ;
		}
	else Warning(c, in, err2) ;
	return pkt ;
	}

PRIVATE void Do_Inbound_ICMP(PACKET *pkt, in_Header *in, ICMP_PKT *icmp)
	{
	tcp_Header *tcp ;
	MAPPING far *m ;
	CONNECTION *c ;
	in_Header *out ;
	word id ;

	switch (icmp->unused.type)
		{
		case  3: /* destination unreachable message */
		case  4: /* source quench */
		case  5: /* redirect */
		case 11: /* time exceeded message */
		case 12: /* parameter problem message */

			out = &icmp->ip.ip ;
			tcp = (tcp_Header *)
				((byte *) out + IP_HDR_BYTES(out)) ;
			c = Connection(out, tcp) ;
			m = Find_Inbound(c) ;
			if (!m)
				{
				Warning(c, out, err1, inbound) ;
				return ;
				}
			if (icmp->unused.type == 3)
				{
				m->time_out = Set_Timeout(TCP_SHORT) ;
				m->status |= STATUS_EXPIRE ;
				}
			Fix_Source(out, m) ;
			Fix_ICMP_Checksum(in) ;
			break;

		case  0: /* icmp echo reply */
		case 14: /* timestamp reply */
		case 16: /* info reply */
		case 18: /* address mask reply */

			c = Reverse(Connection(in, icmp)) ;
			m = Find_Inbound(c) ;
			if (!m)
				{
				Warning(c, in, err1, inbound) ;
				return ;
				}

			id = icmp->echo.identifier ;
			icmp->echo.identifier = m->c.local_port ;
			Adjust_Checksum(&icmp->unused.checksum, &id,
				&icmp->echo.identifier, sizeof(id)) ;

			m->status |= STATUS_EXPIRE ;
			m->time_out = FRAGMENT(in) ?
				      Set_Timeout(ICMP_SHORT) :
				      Set_Timeout(IMMEDIATE) ;
			break ;

		case  8: /* icmp echo request */
		case 15: /* info request */
			Remote_Reply(pkt, icmp) ;

		case  9: /* router advertisement message (n/a) */
		case 10: /* router solicitation message (n/a) */
		case 13: /* timestamp message (extremely rare) */
		case 17: /* address mask request (n/a) */
			return ;

		default:
			c = Reverse(Partial(in)) ;
			Warning(c, in, msg1, icmp->unused.type, inbound) ;
			return ;
		}

	in->destination = Rev32(m->c.local_IP) ;
	Delta_Checksum(&in->checksum, m->ip_dcksm) ;
	if (Forward2Local(pkt, m->lcl_enet))
		{
		Reset_Timeout(m, NULL) ;
		m->pkt_rcvd++ ;
		}
	else Warning(c, in, err2) ;
	}

void Outbound_ICMP(void)
	{
	MTCBOOL orig = TRUE ;
	PACKET *pkt = NULL ;

	MtCSetPri(NULL, MTC_LOW) ;
	for (;;)
		{
		unsigned ip_hdr_len ;
		ICMP_PKT *icmp ;
		in_Header *out ;

		if (!orig) MtCStop(NULL) ;

		Packet_Free(pkt) ;
		pkt = Wait_For_Packet(PKT_LCL_ICMP) ;
		if (!pkt) continue ;
		out = &pkt->ip ;

		if (out->ver != 4)
			{
			Warning(NULL, NULL, msg2, out->ver, outbound) ;
			continue ;
			}

		ip_hdr_len = IP_HDR_BYTES(out) ;
		if (Checksum(out, ip_hdr_len) != 0xFFFF)
			{
			Warning(NULL, NULL, msg3, outbound) ;
			continue ;
			}

		if (FRAGMENT(out))
			{
			pkt = Outbound_Echo(pkt, ip_hdr_len, &orig) ;
			continue ;
			}

		icmp = (ICMP_PKT *) ((byte *) out + ip_hdr_len) ;
		if (Checksum(icmp, Rev16(out->length) - ip_hdr_len) != 0xFFFF)
			{
			Warning(Partial(out), out, err3, outbound) ;
			continue ;
			}

		Do_Outbound_ICMP(pkt, out, icmp) ;
		}
	}

PRIVATE PACKET *Outbound_Echo(PACKET *pkt, unsigned ip_hdr_len, MTCBOOL *orig)
	{
	/* --------------------------------------- */
	/* Outbound: Only ECHO request is possible */ 
	/* --------------------------------------- */
	MAPPING far *m ;
	in_Header *out ;
	ICMP_PKT *icmp ;
	CONNECTION *c ;

	out = &pkt->ip ;
	icmp = (ICMP_PKT *) ((byte *) out + ip_hdr_len) ;

	if (FRAG_OFFSET(out) == 0)
		{
		c = Connection(out, icmp) ;
		if (icmp->unused.type != 8)
		    	{
			Warning(c, out, msg2, outbound, icmp->unused.type) ;
			return pkt ;
			}

		Add_Fragment(out, ip_hdr_len, c) ;
		Do_Outbound_ICMP(pkt, out, icmp) ;
		return pkt ;
		}

	c = Fragment_Connection(pkt, ip_hdr_len, orig) ;
	if (!c) return NULL ; /* waiting for 1st frag */ 

	if (out->destination == _local_IP)
		{
		Local_Reply(pkt, NULL) ;
		return pkt ;
		}

	m = Find_Outbound(c) ;
	if (!m)
		{
		Warning(c, out, err1, outbound) ;
		return pkt ;
		}

	out->source = _remote_IP ;
	Delta_Checksum(&out->checksum, ~m->ip_dcksm) ;
	Forward2Remote(pkt, m->rem_enet) ;
	Reset_Timeout(m, NULL) ;
	m->pkt_sent++ ;
	return pkt ;
	}

PRIVATE void Do_Outbound_ICMP(PACKET *pkt, in_Header *out, ICMP_PKT *icmp)
	{
	tcp_Header *tcp ;
	MAPPING far *m ;
	in_Header *in ;
	CONNECTION *c ;
	word id ;

	switch (icmp->unused.type)
		{
		case  3: /* destination unreachable message */
		case  4: /* source quench */
		case  5: /* redirect */
		case 11: /* time exceeded message */
		case 12: /* parameter problem message */

			in = &icmp->ip.ip ;
			tcp = (tcp_Header *) ((byte *) in + IP_HDR_BYTES(in));
			c = Reverse(Connection(in, tcp)) ;
			m = Find_Outbound(c) ;
			if (!m)
				{
				Warning(c, in, err1, outbound) ;
				return ;
				}
			if (icmp->unused.type == 3)
				{
				m->time_out = Set_Timeout(TCP_SHORT) ;
				m->status |= STATUS_EXPIRE ;
				}
			Fix_Destination(in, m) ;
			Fix_ICMP_Checksum(out) ;
			break;

		case  8: /* icmp echo request */
		case 13: /* timestamp message */
		case 15: /* info request */
		case 17: /* address mask request */

			if (out->destination == _local_IP)
				{
				Local_Reply(pkt, icmp) ;
				return ;
				}

			/* Fix-Up and send out via serial link */
			c = Connection(out, icmp) ;
			m = Find_Outbound(c) ;
			if (!m) m = Add_Mapping(c, pkt->eth.source) ;

			id = icmp->echo.identifier ;
			icmp->echo.identifier = m->mapped_port ;
			Adjust_Checksum(&icmp->unused.checksum, &id,
				&icmp->echo.identifier, sizeof(id)) ;
			break ;

		case 10: /* router solicitation message */

			Advertise_Router(pkt) ;

		case  0: /* icmp echo reply (n/a) */
		case  9: /* router advertisement message (n/a) */
		case 14: /* timestamp reply (n/a) */
		case 16: /* info reply (n/a) */
		case 18: /* address mask reply (n/a) */

			return ;

		default:
			c = Partial(out) ;
			Warning(c, out, msg1, icmp->unused.type, outbound) ;
			return ;
		}

	out->source = _remote_IP ;
	Delta_Checksum(&out->checksum, ~m->ip_dcksm) ;

	if (m->status & STATUS_REM_ARP)
		{
		Remote_ARP_Resolve(Rev32(out->destination), m->rem_enet) ;
		m->status &= ~STATUS_REM_ARP ;
		}
	Forward2Remote(pkt, m->rem_enet) ;

	Reset_Timeout(m, NULL) ;
	m->pkt_sent++ ;
	}

PRIVATE void Local_Reply(PACKET *pkt, ICMP_PKT *icmp)
	{
	static eth_address all_ones = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF} ;
	BOOL broadcast ;
	in_Header *ip ;

	ip = &pkt->ip ;
	if (broadcast = !ip->source) ip->destination = 0xFFFFFFFFL ;
	else ip->destination = ip->source ;
	ip->source = _local_IP ;
	Fix_IP_Checksum(ip) ;

	if (icmp)
		{
		word type = *((word *) &icmp->unused.type) ;
		longword unused ;

		switch (icmp->unused.type)
			{
			case  8: /* echo request */
				icmp->echo.type = 0 ;
				break ;

			case 15: /* info request */
				icmp->info.type = 16 ;
				break ;

			case 17: /* address mask request */
				icmp->unused.type = 18 ;
				unused = icmp->unused.unused ;
				icmp->unused.unused = _local_mask ;
				Adjust_Checksum(&icmp->unused.checksum,
					&unused, &icmp->unused.unused,
					sizeof(unused)) ;
				break ;

			case 13: /* timestamp message */
			default: return ; /* ignore */
			}

		Adjust_Checksum(&icmp->unused.checksum, &type,
			&icmp->unused.type, sizeof(type)) ;
		}

	Forward2Local(pkt, broadcast ? all_ones : pkt->eth.source) ;
	}

PRIVATE void Remote_Reply(PACKET *pkt, ICMP_PKT *icmp)
	{
	in_Header *ip ;

	ip = &pkt->ip ;
	ip->destination = ip->source ;
	ip->source = _remote_IP ;
	Fix_IP_Checksum(ip) ;

	if (icmp)
		{
		word type = *((word *) &icmp->unused.type) ;
		switch (icmp->unused.type)
			{
			case  8: /* echo request */
				icmp->echo.type = 0 ;
				break ;

			case 15: /* info request */
				icmp->info.type = 16 ;
				break ;
			}
		Adjust_Checksum(&icmp->unused.checksum, &type,
			&icmp->unused.type, sizeof(type)) ;
		}

	Forward2Remote(pkt, pkt->eth.source) ;
	}

PRIVATE void Advertise_Router(PACKET *rqst)
	{
	static AR_PACKET pkt ;
	static int icmp_id = 0 ;
	unsigned length ;

	memset(&pkt, 0, sizeof(pkt)) ;
	pkt.status = PKT_BUSY ;

	pkt.icmp.type = 9 ;
	pkt.icmp.code = 0 ;
	pkt.icmp.number = 1 ;
	pkt.icmp.size = 2 ;
	pkt.icmp.lifetime = Rev16(30) ;
	pkt.icmp.address = _local_IP ;
	pkt.icmp.preference = Rev32(1L) ;

	length = sizeof(in_Header) + sizeof(ICMP_RA) ;

	/* encapsulate into a nice ip packet */
	pkt.ip.hdrlen = 5 ;
	pkt.ip.ver = 4 ;
	pkt.ip.tos = 0 ;
	pkt.ip.length = Rev16(length) ;
	pkt.ip.id = Rev16(icmp_id++) ;
	pkt.ip.frags = 0 ;
	pkt.ip.ttl = 1 ;
	pkt.ip.proto = ICMP_PROTO ;
	pkt.ip.source = _local_IP ;
	pkt.ip.destination = rqst->ip.source ;

	Fix_IP_Checksum(&pkt.ip) ;
	Fix_ICMP_Checksum(&pkt.ip) ;
	Forward2Local((PACKET *) &pkt, rqst->eth.source) ;
	}

PRIVATE void Fix_Destination(in_Header *ip, MAPPING far *m)
	{
	udp_Header *udp ;

	udp = (udp_Header *) ((byte *) ip + IP_HDR_BYTES(ip)) ;
	if (ip->proto == UDP_PROTO && udp->checksum != 0)
		{
		Delta_Checksum(&udp->checksum, ~m->prot_dcksm) ;
		}
	udp->dstPort = Rev16(m->mapped_port) ;

	Delta_Checksum(&ip->checksum, ~m->ip_dcksm) ;
	ip->destination = _remote_IP ;
	}

PRIVATE void Fix_Source(in_Header *ip, MAPPING far *m)
	{
	udp_Header *udp ;

	udp = (udp_Header *) ((byte *) ip + IP_HDR_BYTES(ip)) ;
	if (ip->proto == UDP_PROTO && udp->checksum != 0)
		{
		Delta_Checksum(&udp->checksum, m->prot_dcksm) ;
		}
	udp->srcPort = Rev16(m->c.local_port) ;

	Delta_Checksum(&ip->checksum, m->ip_dcksm) ;
	ip->source = Rev32(m->c.local_IP) ;
	}
