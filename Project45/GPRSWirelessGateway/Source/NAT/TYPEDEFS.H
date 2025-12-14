/* File: INC\TYPEDEFS.H */
typedef unsigned long	longword		;
typedef unsigned short	word			;
typedef unsigned char	byte			;
typedef byte		eth_address[6]		;

typedef struct eth_Header
	{
	eth_address     destination		;
	eth_address     source			;
	word            type			;
	} eth_Header ;

typedef struct arp_Header
	{
	word		hwType			;
	word		protType		;
	word		hwProtAddrLen		;
	word		opcode			;
	eth_address	srcEthAddr		;
	longword	srcIPAddr		;
	eth_address	dstEthAddr		;
	longword	dstIPAddr		;
	} arp_Header ;

typedef struct in_Header
	{
	unsigned	hdrlen  : 4		,	/* Already adjusted */
			ver : 4			,	/* for network vs.  */
			tos : 8			;	/* intel byte order */
	word		length			;
	word		id			;
	word		frags			;
	byte		ttl			;
	byte		proto			;
	word		checksum		;
	longword	source			;
	longword	destination		;
	} in_Header ;

typedef struct udp_Header
	{
	word		srcPort			;
	word		dstPort			;
	word		length			;
	word		checksum		;
	} udp_Header;

typedef struct tcp_Header
	{
	word		srcPort			;
	word		dstPort			;
	longword	seqnum			;
	longword	acknum			;
	word		flags			;
	word		window			;
	word		checksum		;
	word		urgentPointer		;
	} tcp_Header ;

typedef struct tcp_PseudoHeader
	{
	longword	src			;
	longword	dst			;
	byte		mbz			;
	byte		protocol		;
	word		length			;
	word		checksum		;
	} tcp_PseudoHeader ;

typedef struct BOOTP
	{
	byte			op		;
	byte			htype		;
	byte			hlen		;
	byte			hops		;
	longword		xid		;
	word			secs		;
	word			spare		;
	longword		ciaddr		;
	longword		yiaddr		;
	longword		siaddr		;
	longword		giaddr		;
	byte			chaddr[16]	;
	byte			sname[64]	;
	byte			file[128]	;
	byte			vend[64]	;
	} BOOTP ;

typedef struct PACKET
	{
	byte			status		;
	eth_Header		eth		;
	in_Header		ip		;
	byte			data[1500 - sizeof(in_Header)] ;
	} PACKET ;

typedef struct CONNECTION
	{
	byte			protocol	;
	longword		local_IP	;	/* All of these	*/
	word			local_port	;	/* are in Intel	*/
	longword		remote_IP	;	/* byte order.	*/
	word			remote_port	;
	} CONNECTION ;

typedef struct MAPPING
	{
	CONNECTION		c		;
	eth_address		lcl_enet	;
	eth_address		rem_enet	;
	word			mapped_port	;
	longword		time_out	;
	byte			status		;
	longword		pkt_rcvd	;
	longword		pkt_sent	;
	longword		seq_start	;
	int			nxt_delta	;
	int			seq_delta	;
	int			ack_delta	;
	word			ip_dcksm	;
	word			prot_dcksm	;
	BOOL			(*in_alg)(PACKET *, ...) ;
	BOOL			(*out_alg)(PACKET *, ...) ;
	struct MAPPING far *	inbound		;
	struct MAPPING far *	outbound	;
	struct MAPPING far *	associate	;
	} MAPPING ;

typedef struct FRAGSPEC
	{
	word			id		;
	longword		src_IP		;
	longword		dst_IP		;
	byte			proto		;
	} FRAGSPEC ;

typedef struct FRAGLIST
	{
	struct FRAGLIST far *	next		;
	FRAGSPEC		spec		;
	CONNECTION		c		;
	MAPPING far *		m		;
	word			offset		;
	word			size		;
	byte			bits		;
	longword		parts		;
	longword		time_out	;
	} FRAGLIST ;

typedef struct ICMP_UNUSED
	{
	byte 			type		;
	byte			code		;
	word			checksum	;
	longword		unused		;
	in_Header		ip		;
	byte			spares[8]	;
	} ICMP_UNUSED ;

typedef struct ICMP_ECHO
	{
	byte			type		;
	byte			code		;
	word			checksum	;
	word			identifier	;
	word			sequence	;
	longword 		index		;
	} ICMP_ECHO ;

typedef struct ICMP_RA
	{
	byte 			type		;
	byte			code		;
	word			checksum	;
	byte			number		;
	byte			size		;
	word			lifetime	;
	longword		address		;
	longword		preference	;
	} ICMP_RA ;

typedef struct ICMP_IP
	{
	byte			type		;
	byte			code		;
	word			checksum	;
	longword		ipaddr		;
	in_Header		ip		;
	} ICMP_IP ;

typedef struct ICMP_INFO
	{
	byte			type		;
	byte			code		;
	word			checksum	;
	word			identifier	;
	word			sequence	;
	} ICMP_INFO ;

typedef struct ICMP_TIME
	{
	byte			type		;
	byte			code		;
	word			checksum	;
	word			identifier	;
	word			sequence	;
	longword		originate	;
	longword		receive		;
	longword		transmit	;
	} ICMP_TIME ;

typedef union ICMP_PKT
	{
	ICMP_UNUSED		unused		;
	ICMP_ECHO		echo		;
	ICMP_RA			ra		;
	ICMP_IP			ip		;
	ICMP_INFO		info		;
	} ICMP_PKT ;
