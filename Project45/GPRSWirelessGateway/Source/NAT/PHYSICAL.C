/* File: SRC\PHYSICAL.C */

#include "napt.h"

#define BASIC_DRIVER_INFO	1
#define BASIC_ACCESS_TYPE	2
#define BASIC_RELEASE_TYPE	3
#define BASIC_SEND_PKT		4
#define	BASIC_TERMINATE		5
#define BASIC_GET_ADDRESS	6
#define	BASIC_RESET_INTERFACE	7

#define	HIPERF_GET_PARAMS	10
#define	HIPERF_OLD_AS_SEND_PKT	11
#define	HIPERF_AS_SEND_PKT	12
#define	HIPERF_DROP_PKT		13

#define	EXT_SET_RCV_MODE	20
#define	EXT_GET_RCV_MODE	21
#define	EXT_SET_MULTICAST_LIST	22
#define	EXT_GET_MULTICAST_LIST	23
#define	EXT_GET_STATISTICS	24
#define	EXT_SET_ADDRESS		25
#define	EXT_SEND_RAW_BYTES	26
#define	EXT_FLUSH_RAW_BYTES	27
#define	EXT_FETCH_RAW_BYTES	28
#define	EXT_SIGNAL		29
#define	EXT_GET_STRUCTURE	30

#define	ERR_BAD_HANDLE		1
#define	ERR_NO_CLASS		2
#define	ERR_NO_TYPE		3
#define	ERR_NO_NUMBER		4
#define	ERR_BAD_TYPE		5
#define	ERR_NO_MULTICAST	6
#define	ERR_CANT_TERMINATE	7
#define	ERR_BAD_MODE		8
#define	ERR_NO_SPACE		9
#define	ERR_TYPE_IN_USE		10
#define	ERR_BAD_COMMAND		11
#define	ERR_CANT_SEND		12
#define	ERR_CANT_SET		13
#define	ERR_BAD_ADDRESS		14
#define	ERR_CANT_RESET		15

#define CARRY	 		0x0001	     /* carry bit in flags register */

typedef struct IOCB
	{
	void far *	buffer ;
	unsigned	length ;
	byte		done ;
	byte		code ;
	void		(far *upcall)() ;
	byte		reserved[4] ;
	byte		private[8] ;
	} IOCB ;

typedef struct PD_INFO
	{
	char far *	name ;
	word		intvec ;
	void interrupt 	(far *isr)() ;
	word		version ;
	byte		major ;
	byte		minor ;
	byte		class ;
	word		type ;
	byte		ifnum ;
	byte		support ;
	word		ip_handle ;
	word		arp_handle ;
	eth_address	address ;
	unsigned	offset ;
	SEMA_INFO *	async_busy ;
	IOCB		iocb ;
	} PD_INFO ;

PRIVATE void		Hardware_Address(PD_INFO *) ;
PRIVATE PD_INFO *	Is_PD(int) ;
PRIVATE void		Local_Access(void) ;
PRIVATE void		Local_IP_Fini(void) ;
PRIVATE void		Local_ARP_Fini(void) ;
PRIVATE void		Packet_Fini(int, word) ;
PRIVATE BOOL		Packet_Send(PD_INFO *, void *, unsigned) ;
PRIVATE word		PD_Access(PD_INFO *, word *, word, void far *) ;
PRIVATE void		PD_Info(PD_INFO *, char *) ;
PRIVATE int		PD_Signature(int) ;
PRIVATE void		Remote_Access(void) ;
PRIVATE void		Remote_ARP_Fini(void) ;
PRIVATE void		Remote_IP_Fini(void) ;

PRIVATE PD_INFO		remote, local ;
PRIVATE PACKET 		packet[20] ;
PRIVATE unsigned	pending[PKT_STATES] ;
PRIVATE SEMA_INFO *	semaphore[PKT_STATES] ;

extern void _bfr_init(void *, int, int, unsigned *) ;
extern void _off_init(unsigned, unsigned) ;
extern byte _pkt_sync_send(void interrupt (far *)(), void *, unsigned) ;
extern byte _pkt_async_send(void interrupt (far *)(), IOCB *) ;
extern void _rem_ip(void) ;
extern void _rem_arp(void) ;
extern void _lcl_ip(void) ;
extern void _lcl_arp(void) ;

void Packet_Init(void)
	{
	PD_INFO *pd ;

	memset(&remote, 0, sizeof(remote )) ;
	memset(&local,  0, sizeof(local  )) ;
	memset(packet,  0, sizeof(packet )) ;
	memset(pending, 0, sizeof(pending)) ;
	memset(semaphore, 0, sizeof(semaphore)) ;

	if (pd = Is_PD(remote_pdi))	remote = *pd ;
	if (pd = Is_PD(local_pdi))	local  = *pd ;

	_bfr_init(packet, ENTRIES(packet), sizeof(PACKET), pending) ;
	_off_init(remote.offset, local.offset) ;

	Remote_Access() ;
	Local_Access() ;

	PD_Info(&local,  "Local") ;
	PD_Info(&remote, "Remote") ;
	}

void Dispatcher(void)
	{
	int state ;

	for (state = 2; state < ENTRIES(semaphore); state++)
		{
		if (pending[state] && semaphore[state])
			{
			MtCSemaReset(semaphore[state]) ;
			}
		}

	Check_Fragments() ;
	MtCYield() ; /* Run highest priority pending thread */
	}

PACKET *Wait_For_Packet(int state)
	{
	static int previous[PKT_STATES] = {0} ;
	register int *index ;
	register unsigned i ;
	PACKET *pkt ;

	Dispatcher() ;
	if (!semaphore[state]) MtCSemaCreate(&semaphore[state]) ;
	MtCSemaWait(semaphore[state], FALSE) ;
	MtCSemaSet(semaphore[state]) ;

	index = &previous[state] ;
	pkt = &packet[*index] ;
	for (i = 0; i < ENTRIES(packet); i++)
		{
		if (++pkt, ++*index == ENTRIES(packet))
			{
			pkt = packet ; /* Wrap */
			*index = 0 ;
			}

		if (pkt->status == state)
			{
			pkt->status = PKT_BUSY ; /* Don't process again! */
			--pending[state] ;
			return pkt ;
			}
		}

	return NULL ;
	}

void Packet_Free(PACKET *pkt)
	{
	if (pkt) pkt->status = PKT_EMPTY ;
	}

PRIVATE void Remote_IP_Fini(void)
	{
	Packet_Fini(remote.intvec, remote.ip_handle) ;
	}

PRIVATE void Remote_ARP_Fini(void)
	{
	Packet_Fini(remote.intvec, remote.arp_handle) ;
	}

PRIVATE void Local_IP_Fini(void)
	{
	Packet_Fini(local.intvec, local.ip_handle) ;
	}

PRIVATE void Local_ARP_Fini(void)
	{
	Packet_Fini(local.intvec, local.arp_handle) ;
	}

PRIVATE void Packet_Fini(int intvec, word handle)
	{
	struct REGPACK regs ;

	if (intvec && handle)
		{
		regs.r_ax = BASIC_RELEASE_TYPE << 8 ;
		regs.r_bx = handle ;
		intr(intvec, &regs) ;
		}
	}

PRIVATE void PD_Info(PD_INFO *pd, char *class_name)
	{
	char *support, *class ;

	if (!pd->intvec) Error("No %s packet driver found", class_name) ;

	switch (pd->class)
		{
		case PD_PPP:	class = "PPP" ; 	break ;
		case PD_SLIP:	class = "SLIP" ; 	break ; 
		case PD_ETHER:	class = "Ethernet" ;	break ;
		default:	class = "Unknown" ;
		}

	switch (pd->support)
		{
		case 1:	support = "Basic" ;
			break ;
		case 2: support = "Basic & Extended" ;
			break ;
		case 5: support = "Basic & Hi-Performance" ;
			break ;
		case 6: support = "Basic, Hi-Performance, & Extended" ;
			break ;
		default: support = "Unknown" ;
		}

	printf("      %11s Packet Driver: %Fs\n", class_name, pd->name) ;
	printf("                        Version: %u", pd->version) ;
	if (pd->support >= 5) /* High-Performance Functions */
		{
		printf(" (PD Spec %u.%02u)\n", pd->major, pd->minor) ;
		}
	else printf("\n") ;
	printf("                      Interrupt: %02Xh\n", pd->intvec) ;
	printf("                          Class: %u (%s)\n",
		pd->class, class) ;
	printf("                           Type: %u\n", pd->type) ;
	printf("                      Interface: %u", pd->ifnum) ;
	if (pd->class == PD_ETHER)
		{
		byte *bp = (byte *) &pd->address[0] ;
		printf(" (%02X:%02X:%02X:%02X:%02X:%02X)",
			bp[0], bp[1], bp[2], bp[3], bp[4], bp[5]) ;
		}
	printf("\n") ;
	printf("                        Support: %u (%s)\n",
		pd->support, support) ;
	printf("\n") ;
	}

PRIVATE PD_INFO *Is_PD(int intvec)
	{
	struct REGPACK regs ;

	if (!intvec || !PD_Signature(intvec)) return NULL ;

	regs.r_ax = (BASIC_DRIVER_INFO << 8) | 0x00FF ;
	intr(intvec, &regs) ;
	if ((regs.r_flags & CARRY) == 0)
		{
		static PD_INFO pd ;

		memset(&pd, 0, sizeof(pd)) ;
		pd.intvec = intvec ;
		pd.isr = getvect(intvec) ;
		pd.version = regs.r_bx ;
		pd.name = MK_FP(regs.r_ds, regs.r_si) ;
		pd.class = MSB(regs.r_cx) ;
		pd.ifnum = LSB(regs.r_cx) ;
		pd.type = regs.r_dx ;
		pd.support = LSB(regs.r_ax) ;
		pd.offset = sizeof(byte) ;
		if (pd.class != PD_ETHER) pd.offset += sizeof(eth_Header) ;
		
		if (pd.support >= 5) /* High-Performance Functions */
			{
			regs.r_ax = HIPERF_GET_PARAMS << 8 ;
			intr(intvec, &regs) ;
			if ((regs.r_flags & CARRY) == 0)
				{
				byte far *bp = MK_FP(regs.r_es, regs.r_di) ;
				pd.major = bp[0] ;
				pd.minor = bp[1] ;
				}

			MtCSemaCreate(&pd.async_busy) ;
			}

		return &pd ;
		}

	return NULL ;
	}

PRIVATE void Remote_Access(void)
	{
	static word arp_type = ARP_TYPE ;
	static word ip_type = IP_TYPE ;

	if (!remote.intvec) return ;

	if (remote.class == PD_ETHER)
		{
		remote.ip_handle = PD_Access(&remote, &ip_type,
					sizeof(ip_type), _rem_ip) ;
		atexit(Remote_IP_Fini) ;

		remote.arp_handle = PD_Access(&remote, &arp_type,
					sizeof(arp_type), _rem_arp) ;
		atexit(Remote_ARP_Fini) ;

		Hardware_Address(&remote) ;
		}
	else
		{
		remote.ip_handle = PD_Access(&remote, &ip_type, 0, _rem_ip) ;
		atexit(Remote_IP_Fini) ;
		}
	}

PRIVATE void Local_Access(void)
	{
	static word arp = ARP_TYPE ;
	static word ip = IP_TYPE ;

	if (!local.intvec) return ;

	local.ip_handle = PD_Access(&local, &ip, sizeof(ip), _lcl_ip) ;
	atexit(Local_IP_Fini) ;

	local.arp_handle = PD_Access(&local,&arp,sizeof(arp),_lcl_arp) ;
	atexit(Local_ARP_Fini) ;

	Hardware_Address(&local) ;
	}

PRIVATE void Hardware_Address(PD_INFO *pd)
	{
	struct REGPACK regs ;

	/* get local hardware address */
	regs.r_ax = BASIC_GET_ADDRESS << 8 ;
	regs.r_bx = pd->ip_handle ;
	regs.r_es = getdseg() ;
	regs.r_di = (word) &pd->address[0] ;
	regs.r_cx = sizeof(pd->address) ;
	intr(pd->intvec, &regs) ;
	if (regs.r_flags & CARRY)
		{
		Error("ERROR # %02Xh reading %Fs hardware address",
			MSB(regs.r_dx), pd->name) ;
		}
	}

PRIVATE word PD_Access(PD_INFO *pd, word *type, word size, void far *isr)
	{
	static char err[] = "ERROR # 0x%02X accessing %s packet driver" ;
	struct REGPACK regs ;

	regs.r_ax = (BASIC_ACCESS_TYPE << 8) | pd->class ;
	regs.r_bx = 0xFFFF ;
	regs.r_cx = size ;
	regs.r_dx = 0 ;
	regs.r_ds = getdseg() ;
	regs.r_si = (word) type ;
	regs.r_es = FP_SEG(isr) ;
	regs.r_di = FP_OFF(isr) ;
	intr(pd->intvec, &regs) ;
	if (regs.r_flags & CARRY) Error(err, MSB(regs.r_dx), pd->name) ;
	return regs.r_ax ;
	}

PRIVATE int PD_Signature(int intvec)
	{
	static char pkt_drvr[] = "PKT DRVR" ;
	char far *vector = (char far *) getvect(intvec) ;

	return !farmemcmp(&vector[3], (char far *) pkt_drvr,
		strlen(pkt_drvr)) ;
	}

BOOL Remote_Send(PACKET *pkt, unsigned length)
	{
	BOOL success = Packet_Send(&remote, pkt, length) ;
	pkt->status = PKT_EMPTY ;
	return success ;
	}

BOOL Local_Send(PACKET *pkt, unsigned length)
	{
	BOOL success = Packet_Send(&local, pkt, length) ;
	pkt->status = PKT_EMPTY ;
	return success ;
	}

PRIVATE BOOL Packet_Send(PD_INFO *pd, void *buffer, unsigned length)
	{
	int attempt ;
	word error ;

	if (pd->class == PD_ETHER)
		{
		length += sizeof(eth_Header) ;
		if (length < ETH_MIN) length = ETH_MIN ;
		}

	buffer = ((byte *) buffer) + pd->offset ;
	for (attempt = 0; attempt < 5; attempt++)
		{
		if (!pd->async_busy)
			{
			MTCPRI pri ;

			error = _pkt_sync_send(pd->isr, buffer, length) ;
			if (!error) return TRUE ;

			MtCGetPri(NULL, &pri) ;
			MtCSetPri(NULL, MTC_LOW) ;
			MtCYield() ; /* Return for retry with low priority */
			MtCSetPri(NULL, pri) ;
			continue ;
			}

		MtCSemaWait(pd->async_busy, TRUE) ;
		MtCSemaReset(pd->async_busy) ;

		pd->iocb.buffer = (void far *) buffer ;
		pd->iocb.length = length ;
		pd->iocb.done = FALSE ;
		pd->iocb.code = 0 ;
		pd->iocb.upcall = NULL ;

		error = _pkt_async_send(pd->isr, &pd->iocb) ;

		if (!error)
			{
			longword timer = Set_Timeout(1) ;
			while (!pd->iocb.done && !Check_Timeout(timer))
				{
				MtCYield() ; /* Wait for send to complete */
				}
			MtCSemaSet(pd->async_busy) ;
			if (error = pd->iocb.code) continue ;
			return TRUE ;
			}

		if (error == ERR_BAD_COMMAND)
			{
			MtCSemaDel(pd->async_busy) ;
			pd->async_busy = NULL ;
			attempt-- ;
			}
		else MtCSemaSet(pd->async_busy) ;
		}

	return FALSE ;
	}

void *Remote_Adrs(void)
	{
	return &remote.address[0] ;
	}

void *Local_Adrs(void)
	{
	return &local.address[0] ;
	}

int Remote_Class(void)
	{
	return remote.class ;
	}

int Local_Class(void)
	{
	return local.class ;
	}

BOOL Forward2Remote(PACKET *pkt, byte far *eadr)
	{
	pkt->eth.type = IP_TYPE ;
	farmemcpy(pkt->eth.destination, eadr, sizeof(eth_address)) ;
	memcpy(pkt->eth.source, Remote_Adrs(), sizeof(eth_address)) ;
	return Remote_Send(pkt, Rev16(pkt->ip.length)) ;
	}

BOOL Forward2Local(PACKET *pkt, byte far *eadr)
	{
	pkt->eth.type = IP_TYPE ;
	farmemcpy(pkt->eth.destination, eadr, sizeof(eth_address)) ;
	memcpy(pkt->eth.source, Local_Adrs(), sizeof(eth_address)) ;
	return Local_Send(pkt, Rev16(pkt->ip.length)) ;
	}
