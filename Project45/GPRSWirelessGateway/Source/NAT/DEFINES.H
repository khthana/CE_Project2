/* File: INC\DEFINES.H */

#define NOTICE  "Network Address Translation Module <GPRS Wireless Gateway>. "

#define	PUBLIC		
#define	PRIVATE			static
#define	BOOL			int

#define	SECONDS(s)		(s)
#define	MINUTES(m)		((m)*SECONDS(60u))
#define	HOURS(h)		((h)*MINUTES(60u))

#define	IMMEDIATE		SECONDS(0)

#define	TCP_SHORT		SECONDS(30)
#define TCP_LONG		HOURS(18)

#define UDP_SHORT		SECONDS(30)
#define UDP_LONG		MINUTES(1)

#define	ICMP_SHORT		SECONDS(30)
#define	ICMP_LONG		SECONDS(60)

#define	STATUS_NORMAL		0x00
#define	STATUS_EXPIRE		0x01
#define	STATUS_SERVER		0x02
#define	STATUS_LCL_ARP		0x04
#define	STATUS_REM_ARP		0x08

#define	FTP_CNTL_PORT		0x0015	/*   21 */
#define	FTP_DATA_PORT		0x0014	/*   20 */
#define	UDP_DNS_PORT		0x0035	/*   53 */
#define	IDENT_PORT		0x0071	/*  113 */
#define	REAL_AUDIO_PORT		0x1B9E	/* 7070 */

#define	_FTP_CNTL_PORT		0x1500	/* network byte order */
#define	_FTP_DATA_PORT		0x1400
#define	_UDP_DNS_PORT		0x3500
#define	_IDENT_PORT		0x7100
#define	_REAL_AUDIO_PORT	0x9E1B

#define	PKT_EMPTY		0
#define	PKT_BUSY		1
#define	PKT_LCL_ARP		2
#define	PKT_REM_ARP		3
#define	PKT_LCL_IP		4
#define	PKT_LCL_ICMP		5
#define	PKT_REM_IP		6
#define	PKT_REM_ICMP		7

#define	PKT_STATES		8

#define	_IP_DONT_FRAG		0x0040	/* Do not fragment flag */
#define	_IP_MORE_FRAGS		0x0020	/* More fragments flag */
#define	_IP_FRAG_OFFSET		0xFF1F
#define	_IP_FRAGMENT		(_IP_MORE_FRAGS|_IP_FRAG_OFFSET)

#define	FRAG_OFFSET(ip)		((ip)->frags & _IP_FRAG_OFFSET)
#define	FRAGMENT(ip)		((ip)->frags & _IP_FRAGMENT)
#define	LAST_FRAGMENT(ip)	(((ip)->frags & _IP_MORE_FRAGS) == 0)

#define	_TCP_FIN		0x0100
#define	_TCP_SYN		0x0200
#define	_TCP_RST		0x0400
#define	_TCP_PSH		0x0800
#define	_TCP_ACK		0x1000
#define	_TCP_URG		0x2000
#define	_TCP_DO			0x00F0

#define	ENTRIES(a)		(sizeof(a)/sizeof(a[0]))

#define	ETH_MIN			60

#define	IP_TYPE			0x0008
#define	ARP_TYPE		0x0608

#define UDP_PROTO		0x11
#define TCP_PROTO		0x06
#define ICMP_PROTO		0x01

#define PD_ETHER		0x0001
#define PD_SLIP			0x0006
#define	PD_PPP			0x0010

#define ARP_TYPE_ETHER  	0x0100

#define ARP_REQUEST		0x0100
#define ARP_REPLY		0x0200

#define IP_HDR_BYTES(ip)	((ip)->hdrlen << 2)
#define DATAOFFSET(tcp) 	(Rev16((tcp)->flags) >> 12)

#define	LSB(w)			((byte *) &w)[0]
#define	MSB(w)			((byte *) &w)[1]

