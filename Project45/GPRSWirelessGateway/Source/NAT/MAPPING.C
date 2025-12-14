/* File: SRC\MAPPING.C */

#include "napt.h"

#define	MINPORT		10000
#define	MAXPORTS	22000
#define	BITVCTRS	((MAXPORTS + 15)/16)

typedef	MAPPING far *	HASH_BUCKET ;

PRIVATE HASH_BUCKET far	*inbound_table	= NULL ;
PRIVATE HASH_BUCKET far	*outbound_table	= NULL ;
PRIVATE unsigned	hashsize ;
PRIVATE word		ports_in_use[BITVCTRS] = {0} ;	/* 1 bit per port */

PRIVATE word		Alloc_Port(void) ;
PRIVATE void		Checksum_Deltas(MAPPING far *) ;
PRIVATE MAPPING far *	Create_Mapping(CONNECTION *, void far *) ;
PRIVATE void		Del_Links(MAPPING far *) ;
PRIVATE MAPPING far *	Find_Oldest(void) ;
PRIVATE void		Free_Port(word port) ;
PRIVATE unsigned	Hash_Inbound(word) ;
PRIVATE void		Hash_Mapping(MAPPING far *) ;
PRIVATE unsigned	Hash_Outbound(longword, word) ;
PRIVATE int		Servers(int) ;
PRIVATE void		SetUp_ALGs(MAPPING far *) ;

void Alloc_Tables(void)
	{
#	define LOADFCTR	2	/* yields avg # probes = 2 */
	unsigned hashcost ;

	/* ------------------------------------------------------------ */
	/* Automatically set size of mapping table data structure based	*/
	/* on a maximum capacity with load factor below specified limit */
	/* ------------------------------------------------------------ */
	hashcost = sizeof(HASH_BUCKET)		/* for outbound hash table */
		 + sizeof(HASH_BUCKET)		/* for inbound hash table  */
		 + LOADFCTR * sizeof(MAPPING) ;	/* for hash table entries  */

	hashsize = (unsigned) ((farcoreleft() + hashcost / 2) / hashcost) ;

	inbound_table  = farcalloc(hashsize, sizeof(HASH_BUCKET)) ;
	outbound_table = farcalloc(hashsize, sizeof(HASH_BUCKET)) ;
	}

MAPPING far *Add_Mapping(CONNECTION *c, void far *lcl_enet)
	{
	MAPPING far *m ;

	m = Create_Mapping(c, (void far *) lcl_enet) ;
	m->mapped_port = Alloc_Port() ;
	Checksum_Deltas(m) ;
	Hash_Mapping(m) ;
//	Show_Percent() ;

	return m ;
	}


PRIVATE MAPPING far *Create_Mapping(CONNECTION *c, void far *lcl_enet)
	{
	MAPPING far *m ;

	m = (MAPPING far *) farmalloc((longword) sizeof(MAPPING)) ;
	if (!m) m = Find_Oldest() ;
	else Mappings(1) ;

	farmemset(m, 0, sizeof(MAPPING)) ;
	farmemcpy(&m->c, (void far *) c, sizeof(CONNECTION)) ;
	farmemcpy(m->lcl_enet, lcl_enet, sizeof(eth_address)) ;
	m->status |= STATUS_REM_ARP ;
	SetUp_ALGs(m) ;
	Reset_Timeout(m, NULL) ;

	return m ;
	}

PRIVATE void Hash_Mapping(MAPPING far *m)
	{
	unsigned index ;

	index = Hash_Inbound(m->mapped_port) ;
	m->inbound = inbound_table[index] ;
	inbound_table[index] = m ;

	index = Hash_Outbound(m->c.local_IP, m->c.local_port) ;
	m->outbound = outbound_table[index] ;
	outbound_table[index] = m ;
	}

PRIVATE void Del_Links(MAPPING far *m)
	{
	MAPPING far *prev ;
	MAPPING far *this ;
	unsigned index ;

	index = Hash_Inbound(m->mapped_port) ;
	this = inbound_table[index] ;
	if (this == m) inbound_table[index] = this->inbound ;
	else for (prev = this; this = prev->inbound; prev = this)
		{
		if (this == m)
			{
			prev->inbound = this->inbound ;
			break ;
			}
		}
	if (!this) Error("Can't find mapping to delete") ;

	index = Hash_Outbound(m->c.local_IP, m->c.local_port) ;
	this = outbound_table[index] ;
	if (this == m) outbound_table[index] = this->outbound ;
	else for (prev = this; this = prev->outbound; prev = this)
		{
		if (this == m)
			{
			prev->outbound = this->outbound ;
			break ;
			}
		}
	if (!this) Error("Can't find mapping to delete") ;
	}

void Del_Mapping(MAPPING far *m)
	{
	if (m->associate) Del_Mapping(m->associate) ;
	Del_Links(m) ;
	Free_Port(m->mapped_port) ;
	farfree(m) ;
	Mappings(-1) ;
	if (m->status & STATUS_SERVER) Servers(-1) ;
	else Update_Display() ;
	Show_Percent() ;
	}

void Visit_Mappings(void (*fn)(MAPPING far *))
{
	unsigned index ;

	for (index = 0;; index = (index + 1) % hashsize)
	{
		MAPPING far *next ;
		MAPPING far *m ;

		MtCYield() ;
		if (!index) (*fn)(NULL) ; /* Re-initialize the function */
		for (m = inbound_table[index]; m; m = next)
		{
			/* Can't yield in here! */
			next = m->inbound ;
			(*fn)(m) ;
		}
	}
}

void Reset_Timeout(MAPPING far *m, tcp_Header *tcp)
	{
	if ((m->status & STATUS_SERVER) == 0) Update_Display() ;

	if (m->status & STATUS_EXPIRE) return ;

	switch (m->c.protocol)
		{
		case TCP_PROTO:
			if (!tcp) /* Fragment, and no the 1st */
				{
				m->time_out = Set_Timeout(TCP_LONG) ;
				}
			else if (tcp->flags & (_TCP_FIN | _TCP_RST))
				{
				m->status |= STATUS_EXPIRE ;
				m->time_out = Set_Timeout(TCP_SHORT) ;
				}
			else if (tcp->flags & _TCP_SYN)
				{
				m->time_out = Set_Timeout(TCP_SHORT) ;
				}
			else m->time_out = Set_Timeout(TCP_LONG) ;
			break ;

		case UDP_PROTO:
			m->time_out = Set_Timeout(UDP_LONG) ;
			break ;

		case ICMP_PROTO:
			m->time_out = Set_Timeout(ICMP_LONG) ;
			break ;

		default:
			m->time_out = Set_Timeout(IMMEDIATE) ;
			m->status |= STATUS_EXPIRE ;
		}
	}

PRIVATE unsigned Hash_Inbound(word mapped_port)
	{
	return mapped_port % hashsize ;
	}

PRIVATE unsigned Hash_Outbound(longword local_IP, word local_port)
	{
	return (((word) local_IP) ^ local_port) % hashsize ;
	}

PRIVATE word Alloc_Port(void)
	{
	static word port = 0xFFFF ;	/* previous port */
	unsigned ndex, count ;
	word mask ;

	count = 0 ;
	do
		{
		if (count++ == MAXPORTS) Error("Out of ports") ;
		port = (port + 1) % MAXPORTS ;
		ndex = port / BITVCTRS ;
		mask = 1 << (port % BITVCTRS) ;
		} while (ports_in_use[ndex] & mask) ;

	ports_in_use[ndex] |= mask ;
	return port + MINPORT ;
	}

PRIVATE void Free_Port(word port)
	{
	unsigned ndex ;
	word mask ;

	if (port >= MINPORT)
		{
		port -= MINPORT ;
		ndex = port / BITVCTRS ;
		mask = 1 << (port % BITVCTRS) ;
		ports_in_use[ndex] &= ~mask ;
		}
	}

MAPPING far *Find_Inbound(CONNECTION *c)
	{
	MAPPING far *srvr ;
	MAPPING far *m ;
	unsigned index ;

	srvr = NULL ;
	index = Hash_Inbound(c->local_port) ;
	for (m = inbound_table[index]; m; m = m->inbound)
		{
		if (c->local_port == m->mapped_port &&
		    c->protocol  == m->c.protocol)
			{
			/* Prefer an established connection */
			if (c->remote_IP == m->c.remote_IP)
				{
				if (c->remote_port == m->c.remote_port ||
				    c->protocol == ICMP_PROTO)
					{
					return m ;
					}
				}

			/* Match new connection to server */
			if (m->status & STATUS_SERVER) srvr = m ;
			}
		}

	return srvr ;
	}

MAPPING far *Find_Outbound(CONNECTION *c)
	{
	unsigned index ;
	MAPPING far *m ;

	index = Hash_Outbound(c->local_IP, c->local_port) ;
	for (m = outbound_table[index]; m; m = m->outbound)
		{
		if (!farmemcmp((void far *) c, &m->c, sizeof(CONNECTION)))
			{
			return m ;
			}
		}
		
	return NULL ;
	}

PRIVATE MAPPING far *Find_Oldest(void)
	{
	longword time_out ;
	MAPPING far *oldest ;
	unsigned index ;

	oldest = NULL ;
	time_out = ~0L ; /* Max positive value */
	for (index = 0; index < hashsize; index++)
		{
		MAPPING far *m ;

		for (m = inbound_table[index]; m; m = m->inbound)
			{
			if (m->status & STATUS_SERVER) continue ;
			if (m->time_out < time_out)
				{
				time_out = m->time_out ;
				oldest = m ;
				}
			}
		}

	if (!oldest) Error("Can't find oldest mapping") ;

	return oldest ;
	}

unsigned Percent_Used(void)
	{
	unsigned ttl, percent ;
	longword btm ;

	ttl = Mappings(0) + Servers(0) ;
	btm = ttl + Max_Mappings() ;
	percent = (unsigned) ((100L * ttl + btm / 2L) / btm) ;

	if (percent > 100) percent = 100 ;
	return percent ;
	}

PRIVATE int Servers(int delta)
	{
	static int servers = 0 ;
	servers += delta ;
	return servers ;
	}

int Mappings(int delta)
	{
	static int mappings = 0 ;
	mappings += delta ;
	return mappings - Servers(0) ;
	}

int Max_Mappings(void)
	{
	return farcoreleft() / (sizeof(MAPPING) + 2 * sizeof(word)) ;
	}

CONNECTION *Partial(in_Header *ip)
	{
	static CONNECTION c ;

	c.protocol  = ip->proto ;

	c.local_IP  = Rev32(ip->source) ;
	c.local_port = 0 ;

	c.remote_IP = Rev32(ip->destination) ;
	c.remote_port = 0 ;

	return &c ;
	}

CONNECTION *Connection(in_Header *ip, void *data)
	{
	tcp_Header *tcp ;
	ICMP_PKT *icmp ;
	CONNECTION *c ;

	c = Partial(ip) ;

	/* gets the correct header info from the packet */
	switch (ip->proto)
		{
		case TCP_PROTO:	/* Port #'s are in same relative	*/
		case UDP_PROTO:	/* position for both TCP and UDP.	*/
			tcp = (tcp_Header *) data ;
			c->local_port = Rev16(tcp->srcPort) ;
			c->remote_port = Rev16(tcp->dstPort) ;
			break;

		case ICMP_PROTO:
			icmp = (ICMP_PKT *) data ;
			c->remote_port = icmp->echo.identifier ;
			c->local_port  = icmp->echo.identifier ;
			break ;

		default:
			c->local_port = c->remote_port = 0 ;
			break;
		}

	return c ;
	}

CONNECTION *Reverse(CONNECTION *c)
	{
	longword temp_ip ;
	word temp_port ;

	temp_ip = c->local_IP ;
	c->local_IP = c->remote_IP ;
	c->remote_IP = temp_ip ;

	temp_port = c->local_port ;
	c->local_port = c->remote_port ;
	c->remote_port = temp_port ;

	return c ;
	}

MAPPING far *Add_Client(MAPPING far *m, CONNECTION *c, byte *rem_enet)
	{
	word mapped ;

	if (m->status & STATUS_LCL_ARP)
		{
		if (!Local_ARP_Resolve(m->c.local_IP, m->lcl_enet))
			{
			return NULL ;
			}
		m->status &= ~STATUS_LCL_ARP ;
		}

	c->local_IP = m->c.local_IP ;
	c->local_port = m->c.local_port ;
	mapped = m->mapped_port ;

	m = Create_Mapping(c, m->lcl_enet) ;
	m->mapped_port = mapped ;

	farmemcpy(m->rem_enet, rem_enet, sizeof(eth_address)) ;
	m->status &= ~STATUS_REM_ARP ;

	Checksum_Deltas(m) ;
	Hash_Mapping(m) ;

	if (c->protocol == TCP_PROTO && c->local_port == FTP_CNTL_PORT)
		{
		MAPPING far *dp ;

		dp = Add_Server(TCP_PROTO, c->local_IP, FTP_DATA_PORT, FALSE);
		farmemcpy(dp->lcl_enet, m->lcl_enet, sizeof(eth_address)) ;
		dp->status &= ~STATUS_LCL_ARP ;
		m->associate = dp ;
		}

	Show_Percent() ;
	return m ;
	}

MAPPING far *Add_Server(byte protocol, longword ip, word port, BOOL map)
	{
	eth_address dummy ;
	MAPPING far *m ;
	CONNECTION c ;

	c.protocol = (byte) protocol ;
	c.local_IP = ip ;
	c.local_port = port ;
	c.remote_IP = 0L ;
	c.remote_port = 0 ;
	m = Create_Mapping(&c, (void far *) dummy) ;
	m->mapped_port = map ? Alloc_Port() : port ;
	m->status |= (STATUS_SERVER | STATUS_LCL_ARP) ;
	Hash_Mapping(m) ;
	Servers(1) ;
	return m ;
	}

PRIVATE void Checksum_Deltas(MAPPING far *m)
	{
	word ip_dcksm, prot_dcksm, _local_port, _mapped_port ;
	longword _local_IP ;

	ip_dcksm   = m->ip_dcksm ;
	prot_dcksm = m->prot_dcksm ;

	_local_IP    = Rev32(m->c.local_IP) ;
	_local_port  = Rev16(m->c.local_port) ;
	_mapped_port = Rev16(m->mapped_port) ;

	Adjust_Checksum(&ip_dcksm, &_local_IP, &_remote_IP,
		sizeof(longword)) ;
	Adjust_Checksum(&prot_dcksm, &_local_IP, &_remote_IP,
		sizeof(longword)) ;
	Adjust_Checksum(&prot_dcksm, &_local_port, &_mapped_port,
		sizeof(word)) ;

	m->ip_dcksm   = ip_dcksm ;
	m->prot_dcksm = prot_dcksm ;
	}

PRIVATE void SetUp_ALGs(MAPPING far *m)
	{
	/* Establish defaults */
	m->in_alg  = No_Op ;
	m->out_alg = No_Op ;

	if (m->c.protocol == TCP_PROTO)
		{
		if (m->c.local_port == IDENT_PORT)
			{
			m->in_alg  = Ident_InToSrvr ;
			}
		else if (m->c.local_port == FTP_CNTL_PORT)
			{
			m->in_alg  = FTP_InToSrvr ;
			m->out_alg = FTP_OutFmSrvr ;
			}
		else if (m->c.remote_port == FTP_CNTL_PORT)
			{
			m->in_alg  = FTP_InFmSrvr ;
			m->out_alg = FTP_OutToSrvr ;
			}
		else if (m->c.remote_port == _REAL_AUDIO_PORT)
			{
			m->out_alg = RA_OutToSrvr ;
			}
		}

	else if (m->c.protocol == UDP_PROTO)
		{
		if (m->c.remote_port == UDP_DNS_PORT)
			{
			m->in_alg  = DNS_InFmSrvr ;
			m->out_alg = DNS_OutToSrvr ;
			}
		}
	}
