/* File: SRC\IDENT.C (RFC1413) */

#include "napt.h"

BOOL Ident_InToSrvr(PACKET *pkt, MAPPING far *m)
	{
	unsigned ip_hdr_len ;
	longword seqnum ;
	tcp_Header *tcp ;
	in_Header *ip ;

	m->pkt_rcvd++ ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;

	if (!Protocol_Checksum_OK(ip, ip_hdr_len))
		{
		Warning(Reverse(Partial(ip)), ip, err3, inbound) ;
		return TRUE ;
		}

	Reset_Timeout(m, tcp) ;
	seqnum = tcp->acknum ;

	if (tcp->flags & _TCP_SYN)		seqnum = (longword) rand() ;
	else if (tcp->flags & _TCP_FIN)		tcp->flags &= ~_TCP_FIN ;
	else if (tcp->flags & _TCP_RST)		return TRUE ;
	else
		{
		char *dp, *p ;
		/* ------------------------------------ */
		/* "<server-port (me)> , <remote-port>"	*/
		/* ------------------------------------ */

		dp = (char *) tcp + (DATAOFFSET(tcp) << 2) ;
		if ((p = strchr(dp, '\r')) == NULL) return TRUE ;
		strcpy(p, ":USERID:OTHER:NatRouter\r\n") ; 
		ip->length = Rev16(Rev16(ip->length) + strlen(p) - 2) ;
		}

	tcp->acknum = Rev32(Rev32(tcp->seqnum) + 1) ;
	tcp->seqnum = seqnum ;
	tcp->flags |= _TCP_ACK ;

	ip->destination = ip->source ;
	ip->source = _remote_IP ;

	tcp->dstPort = tcp->srcPort ;
	tcp->srcPort = _IDENT_PORT ;

	Fix_IP_Checksum(ip) ;
	Fix_Prot_Checksum(ip) ;
	Forward2Remote(pkt, pkt->eth.source) ;
	m->pkt_sent++ ;

	return TRUE ;
	}
