/* File: SRC\DNS.C */

#include "napt.h"

typedef struct DNS_DATA
	{
	struct DNS_DATA *	next ;
	longword		ip ;
	char			*dns_name ;	/* As appears in DNS query */
	char			*mx_srvr ;	/* As appears in DNS query */
	} DNS_DATA ;

typedef struct DNS_HEADER
	{
	word		id ;
	unsigned	rd	: 1,	/* These bitfields have already	*/
			tc	: 1,	/* been arranged to adjust for	*/
			aa	: 1,	/* network versus intel byte	*/
			opcode	: 4,	/* order.			*/
			qr	: 1,
			rcode	: 4,
			z	: 3,
			ra	: 1 ;
	word		qdcount ;
	word		ancount ;
	word		nscount ;
	word		arcount ;
	} DNS_HEADER ;

typedef struct DNS_QUESTION	/* Follows variable length QNAME */
	{
/*	byte		qname[0] ; */
	word		qtype ;
	word		qclass ;
	} DNS_QUESTION ;

typedef struct DNS_RR
	{
/*	byte		name[0] ; */
	word		type ;
	word		class ;
	longword	ttl ;
	word		rdlength ;
	char		rdata[0] ;	/* variable length */
	} DNS_RR ;

#define	ERR_NONE	0	/* RCODE values */
#define	ERR_FORMAT	1
#define	ERR_SERVER	2
#define	ERR_NAME	3
#define	ERR_CANT	4
#define	ERR_REFUSE	5

#define	_TYPE_A		0x0100	/* A host address			*/
#define	_TYPE_NS	0x0200	/* an authoritative name server		*/
#define	_TYPE_CNAME	0x0500	/* the canonical name for an alias	*/
#define	_TYPE_SOA	0x0600	/* marks start of zone of authority	*/
#define	_TYPE_WKS	0x0B00	/* a well known service description	*/
#define	_TYPE_PTR	0x0C00	/* a domain name pointer		*/
#define	_TYPE_HINFO	0x0D00	/* host information			*/
#define	_TYPE_MINFO	0x0E00	/* mailbox or mail list information	*/
#define	_TYPE_MX	0x0F00	/* mail exchange			*/
#define	_TYPE_TXT	0x1000	/* text strings				*/

#define	_QTYPE_AXFR	0xFC00	/* request for transfer of entire zone	*/
#define	_QTYPE_MAILB	0xFD00	/* request for mailbox records		*/
#define	_QTYPE_STAR	0xFF00	/* A request for all records		*/

PRIVATE char *Copy_Name(char *) ;
PRIVATE longword Get_IP(char *) ;
PRIVATE void Local_DNS_Reply(MAPPING far *, PACKET *, DNS_HEADER *, word) ;
PRIVATE DNS_DATA *Local_QName(char *) ;
PRIVATE BOOL DNS_Err(MAPPING far *, PACKET *, DNS_HEADER *, int) ;
PRIVATE BOOL Type_A(MAPPING far *, PACKET *, DNS_HEADER *, DNS_DATA *) ;
PRIVATE BOOL Type_ALL(MAPPING far *, PACKET *, DNS_HEADER *, DNS_DATA *) ;
PRIVATE BOOL Type_MX(MAPPING far *, PACKET *, DNS_HEADER *, DNS_DATA *) ;
PRIVATE BOOL Type_PTR(MAPPING far *, PACKET *, DNS_HEADER *) ;

PRIVATE char no_memory[] = "Out of memory" ;
PRIVATE DNS_DATA *dns_data = NULL ;

BOOL DNS_InFmSrvr(PACKET *pkt, MAPPING far *m)
	{
	unsigned ip_hdr_len ;
	udp_Header *udp ;
	DNS_HEADER *dns ;
	in_Header *ip ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	udp = (udp_Header *) ((byte *) ip + ip_hdr_len) ;
	dns = (DNS_HEADER *) ((byte *) udp + sizeof(udp_Header)) ;

	if (dns->tc) /* TC (Truncation) bit: More to follow if set */
		{
		m->time_out = Set_Timeout(UDP_SHORT) ;
		}
	else
		{
		m->time_out = Set_Timeout(IMMEDIATE) ;
		m->status |= STATUS_EXPIRE ;
		}

	return FALSE ;
	}

BOOL DNS_OutToSrvr(PACKET *pkt, MAPPING far *m)
	{
	BOOL (*f)(MAPPING far *, PACKET *, DNS_HEADER *, DNS_DATA *) ;
	unsigned ip_hdr_len ;
	udp_Header *udp ;
	DNS_HEADER *dns ;
	DNS_QUESTION *q ;
	in_Header *ip ;
	char *data ;
	DNS_DATA *l ;

	m->time_out = Set_Timeout(UDP_SHORT) ;

	if (!dns_data) return FALSE ;

	ip = &pkt->ip ;	ip_hdr_len = IP_HDR_BYTES(ip) ;
	udp = (udp_Header *) ((byte *) ip + ip_hdr_len) ;

	if (Rev16(udp->length) < sizeof(DNS_HEADER))		return FALSE ;

	dns = (DNS_HEADER *) ((byte *) udp + sizeof(udp_Header)) ;

	if (dns->qdcount != 0x0100 || dns->ancount != 0x0000)	return FALSE ;
	if (dns->nscount != 0x0000 || dns->arcount != 0x0000)	return FALSE ;
	if (dns->opcode != 0)					return FALSE ;

	data = (char *) dns + sizeof(DNS_HEADER) ;
	q = (DNS_QUESTION *) (data + strlen(data) + 1) ;

	if (q->qclass != 0x0100 /* ARPA Internet class */ &&
	    q->qclass != 0xFF00 /* Any class */)		return FALSE ;

	if (q->qtype == _TYPE_PTR) return Type_PTR(m, pkt, dns) ;

	if ((l = Local_QName(data)) == NULL) return FALSE ;
		
	switch (q->qtype)
		{
		case _QTYPE_STAR:	f = Type_ALL ;		break ;
		case _TYPE_A:		f = Type_A ;		break ;
		case _TYPE_MX:		f = Type_MX ;		break ;
		default:	return DNS_Err(m, pkt, dns, ERR_CANT) ;
		}

	return (*f)(m, pkt, dns, l) ;
	}

PRIVATE 
BOOL Type_A(MAPPING far *m, PACKET *pkt, DNS_HEADER *dns, DNS_DATA *l)
	{
	word dns_len ;
	DNS_RR *rr ;
	char *data ;

	if (l->mx_srvr) return DNS_Err(m, pkt, dns, ERR_NAME) ;

	dns->rcode = ERR_NONE ;
	dns->ancount = 0x0100 ;

	data = (char *) dns + sizeof(DNS_HEADER) ;
	rr = (DNS_RR *) (data + strlen(data) + 1) ;
	rr->type = _TYPE_A ;
	rr->ttl = Rev32((longword) HOURS(18)) ;

	rr->rdlength = Rev16(sizeof(longword)) ;
	*((longword *) rr->rdata) = Rev32(l->ip) ;
	dns_len = &rr->rdata[sizeof(longword)] - (char *) dns ;
	Local_DNS_Reply(m, pkt, dns, dns_len) ;
	return TRUE ;
	}

PRIVATE 
BOOL Type_ALL(MAPPING far *m, PACKET *pkt, DNS_HEADER *dns, DNS_DATA *l)
	{
	if (l->mx_srvr) return Type_MX(m, pkt, dns, l) ;
	return Type_A(m, pkt, dns, l) ;
	}

PRIVATE 
BOOL Type_MX(MAPPING far *m, PACKET *pkt, DNS_HEADER *dns, DNS_DATA *l)
	{
	word dns_len ;
	DNS_DATA *a ;
	DNS_RR *rr ;
	char *data ;

	if (!l->mx_srvr) return DNS_Err(m, pkt, dns, ERR_NAME) ;

	dns->rcode = ERR_NONE ;
	dns->ancount = 0x0100 ;
	dns->arcount = 0x0000 ;

	data = (char *) dns + sizeof(DNS_HEADER) ;
	rr = (DNS_RR *) (data + strlen(data) + 1) ;
	rr->type = _TYPE_MX ;
	rr->ttl = Rev32((longword) HOURS(18)) ;

	*((word *) &rr->rdata[0]) = 0x0100 ;
	strcpy(&rr->rdata[sizeof(word)], l->mx_srvr) ;
	dns_len = sizeof(word) + strlen(l->mx_srvr) + 1 ;
	rr->rdlength = Rev16(dns_len) ;

	if (!l->ip && (a = Local_QName(l->mx_srvr)) && !a->mx_srvr)
		{
		l->ip = a->ip ;
		}

	if (l->ip)
		{
		strcpy(&rr->rdata[dns_len], l->mx_srvr) ;
		dns_len += strlen(l->mx_srvr) + 1 ;
		rr = (DNS_RR *)	&rr->rdata[dns_len] ;
		rr->type = _TYPE_A ;
		rr->class = 0x0100 ;
		rr->ttl = Rev32((longword) HOURS(18)) ;
		*((longword *) rr->rdata) = Rev32(l->ip) ;
		dns_len = sizeof(longword) ;
		rr->rdlength = Rev16(dns_len) ;
		dns->arcount = 0x0100 ;
		}

	dns_len = &rr->rdata[dns_len] - (char *) dns ;
	Local_DNS_Reply(m, pkt, dns, dns_len) ;
	return TRUE ;
	}

PRIVATE BOOL Type_PTR(MAPPING far *m, PACKET *pkt, DNS_HEADER *dns)
	{
	longword _ip, ip ;
	unsigned dns_len ;
	DNS_DATA *l ;
	DNS_RR *rr ;
	char *data ;

	data = (char *) dns + sizeof(DNS_HEADER) ;
	_ip = Get_IP(data) ;

	if (((_ip ^ _local_IP) & _local_mask) != 0L) return FALSE ;

	ip = Rev32(_ip) ;
	for (l = dns_data; l; l = l->next)
		{
		if (ip == l->ip) break ;
		}

	if (!l) return FALSE ;

	dns->rcode = ERR_NONE ;
	dns->ancount = 0x0100 ;

	rr = (DNS_RR *) (data + strlen(data) + 1) ;
	rr->ttl = Rev32((longword) HOURS(18)) ;

	dns_len = strlen(l->dns_name) + 1 ;
	rr->rdlength = Rev16(dns_len) ;
	strcpy(rr->rdata, l->dns_name) ;
	Local_DNS_Reply(m, pkt, dns, &rr->rdata[dns_len] - (char *) dns) ;
	return TRUE ;
	}

PRIVATE DNS_DATA *Local_QName(char *data)
	{
	DNS_DATA *l ;

	for (l = dns_data; l; l = l->next)
		{
		if (!strcmpi(data, l->dns_name)) return l ;
		MtCYield() ;
		}

	return NULL ;
	}

PRIVATE BOOL DNS_Err(MAPPING far *m, PACKET *pkt, DNS_HEADER *dns, int err)
	{
	DNS_RR *rr ;

	dns->rcode = err ;
	dns->ancount = 0x0000 ;

	rr = (DNS_RR *) ((byte *) dns + sizeof(DNS_HEADER)) ;
	rr->ttl = 0L ;
	rr->rdlength = 0 ;

	Local_DNS_Reply(m, pkt, dns, &rr->rdata[0] - (char *) dns) ;
	return TRUE ;
	}

PRIVATE void
Local_DNS_Reply(MAPPING far *m, PACKET *pkt, DNS_HEADER *dns, word dns_len)
	{
	in_Header *ip = &pkt->ip ;
	udp_Header *udp ;

	ip->length = Rev16(sizeof(in_Header) + sizeof(udp_Header) + dns_len) ;
	ip->destination = ip->source ;
	ip->source = _local_IP ;

	udp = (udp_Header *) ((byte *) dns - sizeof(udp_Header)) ;
	udp->dstPort = udp->srcPort ;
	udp->srcPort = _UDP_DNS_PORT ;
	udp->length = Rev16(sizeof(udp_Header) + dns_len) ;
	udp->checksum = 0xFFFF ; /* Force a checksum */

	dns->qr = (byte) 1 ;
	dns->aa = (byte) 1 ;
	dns->ra = (byte) 1 ;
	dns->qdcount = 0x0000 ;

	Fix_IP_Checksum(ip) ;
	Fix_Prot_Checksum(ip) ;
	Forward2Local(pkt, pkt->eth.source) ;

	m->time_out = Set_Timeout(IMMEDIATE) ;
	m->status |= STATUS_EXPIRE ;
	}

PRIVATE longword Get_IP(char *data)
	{
	unsigned count, n ;
	longword _ip ;

	_ip = 0L ;
	count = 4 ;
	while (n = *data++)
		{
		unsigned i, temp ;

		temp = 0 ;
		for (i = 0; i < n; i++) temp = 10 * temp + (*data++ - '0') ;
		_ip = (_ip << 8) + temp ;
		if (!--count) break ;
		}

	return !strcmpi(data, "\7IN-ADDR\4ARPA") ? _ip : 0L ;
	}

PRIVATE char *Copy_Name(char *src)
	{
	char *dst, *tkn, *name ;
	unsigned len ;

	len = strlen(src) + 2 ;
	dst = name = malloc(len) ;
	if (!dst) Error(no_memory) ;

	for (tkn = src; tkn = strtok(tkn, "."); tkn = NULL)
		{
		*dst++ = (char) strlen(tkn) ;
		strcpy(dst, tkn) ;
		dst += strlen(tkn) ;
		*dst = 0 ;
		}

	return name ;
	}

void Add_DNS_Entry(char *hostname, char *value)
	{
	DNS_DATA *l ;

	l = malloc(sizeof(DNS_DATA)) ;
	if (!l) Error(no_memory) ;
	l->dns_name = Copy_Name(hostname) ;
	
	if (strspn(value, ".0123456789") == strlen(value))
		{
		l->ip = Ascii2IP(value) ;
		l->mx_srvr = NULL ;
		}
	else
		{
		l->ip = 0L ;
		l->mx_srvr = Copy_Name(value) ;
		}

	l->next = dns_data ;
	dns_data = l ;
	}

