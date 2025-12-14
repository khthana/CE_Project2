/* File: SRC\NAPT.C (RFC 1631, <draft-rfced-info-srisuresh-05.txt>) */
#define	NAPT
#include "napt.h"

PRIVATE void		Init_Pkt_Drvrs(char *[]) ;
PRIVATE void		Get_Parameters(char *) ;
PRIVATE BOOL		NAPT_Parameter(char *, char *) ;
PRIVATE char *		Ones(longword) ;

int main(int argc, char *argv[])
{
	longword timer, onesec ;
	MAPPING far *m ;
	exitconsole =0;
        endisplay = 1;

	argc ; /* eliminates compiler warning */

	Init_Display() ;
	Alloc_Tables() ;
	Init_Pkt_Drvrs(argv) ;

	m = Add_Server(TCP_PROTO, remote_IP, IDENT_PORT, FALSE) ;
	m->status &= ~STATUS_LCL_ARP ;

	MtCCoroutine(Local_ARP()) ;
	MtCCoroutine(Remote_ARP()) ;
	MtCCoroutine(Outbound_IP()) ;
	MtCCoroutine(Inbound_IP()) ;
	MtCCoroutine(Inbound_ICMP()) ;
	MtCCoroutine(Outbound_ICMP()) ;
	MtCCoroutine(Expire()) ;
	MtCCoroutine(Expire_Fragments()) ;
	MtCCoroutine(Display()) ;

	timer = Set_Timeout(0) ;
	onesec = Set_Timeout(1) - timer ;
	MtCSetPri(NULL, MTC_LOW) ;
	sendcommand = 0;

	for (;;)
	{
		word scan_ascii;
		if(exitconsole == 1)
			endisplay = 1; //enable display

		while (!bioskey(1))
		{	keyhit = 0; //not key hit

			Dispatcher() ;
			if (Check_Timeout(timer))
			{       Update_Display() ; /* 1 per sec minimum */
				timer += onesec ;
			}
		}
		scan_ascii = bioskey(0) ;
		scan =(char) scan_ascii;
		keyhit = 1;

		if(scan_ascii == 27 || scan == 27)
		{       break;
			exit(0);//force exit
		}
		if(exitconsole ==1 && keyhit == 1)
			exitconsole =0;

		if (scan_ascii != 0x011B /* ESC */)
		 {      endisplay =0; //disable display thread
			if(exitconsole != 1)
			{ 	console();
			}
			continue ;
		 }
		if (!Restore_Window()) break ;
	}
	clrscrn() ;
	exit(0) ;
	return 0 ;
}

PRIVATE char *Ones(longword l)
	{
	static char bfr[3] ;
	unsigned ones ;
	for (ones = 0; l; l <<= 1) ones++ ;
	sprintf(bfr, "%u", ones) ;
	return bfr ;
	}

PRIVATE void Init_Pkt_Drvrs(char *argv[])
	{
	int sec, key ;
	char bfr[81] ;

	clrscrn() ;
	printf("%s\n\n", NOTICE) ;
	Get_Parameters(argv[0]) ;
	Packet_Init() ;

	printf("     Estimated Mapping Capacity: %u entries\n",
		Max_Mappings()) ;

	sprintf(bfr, "%s/%s", IP2Ascii(local_IP), Ones(local_mask)) ;
	while (strlen(bfr) < 18) strcat(bfr, " ") ;
	printf("           Local Subnet Address: %s", bfr) ;
	printf(" Gateway: %s\n", IP2Ascii(local_gateway)) ;

	printf("         Remote Network Address: ") ;
	if (!remote_IP) BOOTP_Attempt() ;
	sprintf(bfr, "%s/%s", IP2Ascii(remote_IP), Ones(remote_mask)) ;
	while (strlen(bfr) < 18) strcat(bfr, " ") ;
	printf(bfr) ;
	printf(" Gateway: %s\n", IP2Ascii(remote_gateway)) ;

	printf("\n      Press any key to continue:   ") ;
	for (sec = 30; sec >= 0; sec--)
		{
		longword timer ;

		printf("\b\b%2d", sec) ;
		timer = Set_Timeout(1) ;
		while (!Check_Timeout(timer) && !bioskey(1)) ;
		if (bioskey(1)) break ;
		}
	for (key = 0; bioskey(1); key = bioskey(0)) ;
	printf("\n") ;
	if (key == 0x011B) exit(0) ;
	}

void Error(char *fmt, ...)
	{
	va_list argptr ;

	fprintf(stderr, "\n") ;
	va_start(argptr, fmt) ;
	vfprintf(stderr, fmt, argptr) ;
	fprintf(stderr, "!\n\7") ;
	exit(255) ;
	}

BOOL Protocol_Checksum_OK(in_Header *ip, unsigned hdrlen)
	{
	tcp_PseudoHeader ph ;
	unsigned len ;
	byte *hdr ;

	hdr = ((byte *) ip + hdrlen) ;

	if (ip->proto == TCP_PROTO)
		{
		len = Rev16(ip->length) - hdrlen ;
		ph.length = Rev16(len) ;
		}
	else /* if (ip->proto == UDP_PROTO) */
		{
		if (((udp_Header *) hdr)->checksum == 0) return TRUE ;
		ph.length = ((udp_Header *) hdr)->length ;
		len = Rev16(ph.length) ;
		}

	ph.mbz = 0 ;
	ph.src = ip->source ;
	ph.dst = ip->destination ;
	ph.protocol = ip->proto ;
	ph.checksum = Checksum(hdr, len) ;
	return Checksum(&ph, sizeof(ph)) == 0xFFFF ;
	}

PRIVATE void Get_Parameters(char *filespec)
	{
	char *p, bfr[80] ;
	FILE *fp ;

	/* Force location of .INI file to be in EXE directory */
	strcpy(strrchr(filespec, '.'), ".INI") ;
	strupr(filespec) ;
	fp = fopen(filespec, "r") ;
	if (!fp) Error("Can't open file %s", filespec) ;
	while (fgets(bfr, sizeof(bfr), fp))
		{
		if (bfr[0] == ';') continue ;
		if (p = strpbrk(bfr, "\r\n")) *p = '\0' ;
		if (!*bfr) continue ;
		if (p = strchr(bfr, '='))
			{
			*p = '\0' ;
			strupr(bfr) ;
			if (NAPT_Parameter(bfr, p + 1)) continue ;
			*p = '=' ;
			}
		Error("Unrecognized parameter: %s", bfr) ;
		}
	fclose(fp) ;
	}

PRIVATE BOOL NAPT_Parameter(char *name, char *value)
	{
	longword ip ;
	word port ;
	char *p ;

	if (!strcmp(name, "DNS"))
		{
		if (p = strchr(value, ','))
			{
			*p++ = '\0' ;
			Add_DNS_Entry(value, p) ;
			}
		return TRUE ;
		}

	if (!strcmp(name, "REMOTE_NAME"))
		{
		strncpy(remote_name, value, sizeof(remote_name) - 1) ;
		remote_name[sizeof(remote_name) - 1] = '\0' ;
		strlwr(remote_name) ;
		return TRUE ;
		}

	if (!strcmp(name, "REMOTE_GATEWAY"))
		{
		_remote_gateway = Rev32(remote_gateway = Ascii2IP(value)) ;
		return TRUE ;
		}

	if (!strcmp(name, "LOCAL_GATEWAY"))
		{
		_local_gateway = Rev32(local_gateway = Ascii2IP(value)) ;
		return TRUE ;
		}

	if (!strcmp(name, "LOCAL_PDI"))
		{
		local_pdi = (unsigned) strtoul(value, NULL, 0) ;
		return TRUE ;
		}

	if (!strcmp(name, "LOCAL_IP"))
		{
		_local_IP = Rev32(local_IP = Ascii2IP(value)) ;
		return TRUE ;
		}

	if (!strcmp(name, "LOCAL_MASK"))
		{
		_local_mask = Rev32(local_mask = Ascii2IP(value)) ;
		return TRUE ;
		}

	if (!strcmp(name, "REMOTE_PDI"))
		{
		remote_pdi = (unsigned) strtoul(value, NULL, 0) ;
		return TRUE ;
		}

	if (!strcmp(name, "REMOTE_IP"))
		{
		_remote_IP = Rev32(remote_IP = Ascii2IP(value)) ;
		return TRUE ;
		}

	if (!strcmp(name, "REMOTE_MASK"))
		{
		_remote_mask = Rev32(remote_mask = Ascii2IP(value)) ;
		return TRUE ;
		}

	if (!strcmp(name, "TCP_SERVER"))
		{
		if (p = strchr(value, ':'))
			{
			*p++ = '\0' ;
			ip = Ascii2IP(value) ;
			sscanf(p, "%u", &port) ;
			Add_Server(TCP_PROTO, ip, port, FALSE) ;
			return TRUE ;
			}
		return FALSE ;
		}

	if (!strcmp(name, "UDP_SERVER"))
		{
		if (p = strchr(value, ':'))
			{
			*p++ = '\0' ;
			ip = Ascii2IP(value) ;
			sscanf(p, "%u", &port) ;
			Add_Server(UDP_PROTO, ip, port, FALSE) ;
			return TRUE ;
			}
		return FALSE ;
		}

	return FALSE ;
	}

char *IP2Ascii(longword x)
	{
	static char bfr[16] ;

	sprintf(bfr, "%u.%u.%u.%u",
		((char *) &x)[3],
		((char *) &x)[2],
		((char *) &x)[1],
		((char *) &x)[0]) ;

	return bfr ;
	}

longword Ascii2IP(char *s)
	{
	longword ip ;
	int part ;

	ip = 0L ;
	for (part = 3; part >= 0; part--)
		{
		s = strtok(s, ".") ;
		((byte *) &ip)[part] = (byte) atoi(s) ;
		s = NULL ;
		}

	return ip ;
	}
