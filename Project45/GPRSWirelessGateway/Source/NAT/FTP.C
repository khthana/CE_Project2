/* File: SRC\FTP.C: Support for (outbound) embedded PORT and PASV commands */

#include "napt.h"

PRIVATE MAPPING far *Data_Mapping(MAPPING far *, longword, word) ;
PRIVATE void	Fix_Ack(MAPPING far *, tcp_Header *) ;
PRIVATE void	Fix_Seq(MAPPING far *, tcp_Header *) ;
PRIVATE int	FTP_PASV_Reply(MAPPING far *, in_Header *, char *) ;
PRIVATE int	FTP_PORT_Command(MAPPING far *, in_Header *, char *) ;
PRIVATE int	New_Address(char *, word) ;
PRIVATE int	Old_Address(char *, longword *, word *) ;

BOOL FTP_InToSrvr(PACKET *pkt, MAPPING far *m)
	{
	unsigned ip_hdr_len ;
	tcp_Header *tcp ;
	in_Header *ip ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;

	Fix_Ack(m, tcp) ;
	return FALSE ;
	}

BOOL FTP_InFmSrvr(PACKET *pkt, MAPPING far *m)
	{
	unsigned ip_hdr_len ;
	tcp_Header *tcp ;
	in_Header *ip ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;

	Fix_Ack(m, tcp) ;
	return FALSE ;
	}

BOOL FTP_OutToSrvr(PACKET *pkt, MAPPING far *m)
	{
	unsigned ip_hdr_len ;
	tcp_Header *tcp ;
	in_Header *ip ;
	int delta ;
	char *dp ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;

	Fix_Seq(m, tcp) ;

	dp = ((char *) tcp) + (DATAOFFSET(tcp) << 2) ;
	if ((dp - (char *) ip) == Rev16(ip->length)) return FALSE ;

	if (delta = FTP_PORT_Command(m, ip, dp))
		{
		m->seq_start = Rev32(tcp->seqnum) + 1 ;
		m->nxt_delta += delta ;
		}

	return FALSE ;
	}

BOOL FTP_OutFmSrvr(PACKET *pkt, MAPPING far *m)
	{
	unsigned ip_hdr_len ;
	tcp_Header *tcp ;
	in_Header *ip ;
	int delta ;
	char *dp ;

	ip = &pkt->ip ;
	ip_hdr_len = IP_HDR_BYTES(ip) ;
	tcp = (tcp_Header *) ((byte *) ip + ip_hdr_len) ;


	Fix_Seq(m, tcp) ;

	dp = ((char *) tcp) + (DATAOFFSET(tcp) << 2) ;
	if ((dp - (char *) ip) == Rev16(ip->length)) return FALSE ;

	if (delta = FTP_PASV_Reply(m, ip, dp))
		{
		m->seq_start = Rev32(tcp->seqnum) + 1 ;
		m->nxt_delta += delta ;
		}

	return FALSE ;
	}

PRIVATE void Fix_Seq(MAPPING far *m, tcp_Header *tcp)
	{
	longword seqnum = Rev32(tcp->seqnum) ;

	if (m->seq_start != 0L && (long) (seqnum - m->seq_start) >= 0L)
		{
		m->seq_delta = m->nxt_delta ;
		}

	if (m->seq_delta)
		{
		longword new = Rev32(seqnum + (long) m->seq_delta) ;
		Adjust_Checksum(&tcp->checksum, &tcp->seqnum, &new, 4) ;
		tcp->seqnum = new ;
		}
	}

PRIVATE void Fix_Ack(MAPPING far *m, tcp_Header *tcp)
	{
	longword acknum = Rev32(tcp->acknum) ;

	if (m->seq_start != 0L && (long) (acknum - m->seq_start) > 0L)
		{
		m->ack_delta = m->nxt_delta ;
		}

	if (m->ack_delta)
		{
		longword new = Rev32(acknum - (long) m->ack_delta) ;
		Adjust_Checksum(&tcp->checksum, &tcp->acknum, &new, 4) ;
		tcp->acknum = new ;
		}
	}

PRIVATE int FTP_PORT_Command(MAPPING far *m, in_Header *in, char *dp)
	{
	unsigned old_len ;
	longword ip ;
	char *adrs ;
	word port ;

	if (strnicmp(dp, "PORT ", 5)) return 0 ;
	if ((adrs = strpbrk(dp + 4, "0123456789\r\n")) == NULL) return 0 ;
	if (old_len = Old_Address(adrs, &ip, &port))
		{
		int new_len, delta ;
		char bfr[24] ;

		if (!Local_Target(Rev32(ip))) return 0 ;

		m = Data_Mapping(m, ip, port) ;
		new_len = New_Address(bfr, m->mapped_port) ;
		if (delta = new_len - old_len)
			{
			int ip_len, bytes ;

			ip_len = Rev16(in->length) ;
			bytes = ip_len - (adrs - (char *) in) - old_len ;
			if (bytes) memmove(adrs+new_len, adrs+old_len, bytes);
			in->length = Rev16(ip_len + delta) ;
			Fix_IP_Checksum(in) ;
			}
		memmove(adrs, bfr, new_len) ;
		Fix_Prot_Checksum(in) ;
		return delta ;
		}

	return 0 ;
	}

PRIVATE int FTP_PASV_Reply(MAPPING far *m, in_Header *in, char *dp)
	{
	unsigned old_len, status ;
	longword ip ;
	char *adrs ;
	word port ;

	if (dp[3] != ' ') return 0 ;
	if (sscanf(dp, "%u", &status) != 1 || status >= 400) return 0 ;

	if ((adrs = strpbrk(dp + 3, "0123456789\r\n")) == NULL) return 0 ;

	if (old_len = Old_Address(adrs, &ip, &port))
		{
		int new_len, delta ;
		char bfr[24] ;

		if (!Local_Target(Rev32(ip))) return 0 ;

		m = Data_Mapping(m, ip, port) ;
		new_len = New_Address(bfr, m->mapped_port) ;
		if (delta = new_len - old_len)
			{
			int ip_len, bytes ;

			ip_len = Rev16(in->length) ;
			bytes = ip_len - (adrs - (char *) in) - old_len;
			if (bytes) memmove(adrs+new_len, adrs+old_len, bytes);
			in->length = Rev16(ip_len + delta) ;
			Fix_IP_Checksum(in) ;
			}
		memmove(adrs, bfr, new_len) ;
		Fix_Prot_Checksum(in) ;
		return delta ;
		}

	return 0 ;
	}

PRIVATE MAPPING far *Data_Mapping(MAPPING far *ctl, longword ip, word port)
	{
	MAPPING far *dat ;

	dat = Add_Server(TCP_PROTO, ip, port, TRUE) ;
	if (!(ctl->status & STATUS_LCL_ARP) && ip == ctl->c.local_IP)
		{
		farmemcpy(dat->lcl_enet, ctl->lcl_enet, sizeof(eth_address)) ;
		dat->status &= ~STATUS_LCL_ARP ;
		}
	if (ctl->associate) Del_Mapping(ctl->associate) ;
	ctl->associate = dat ;
	return dat ;
	}

PRIVATE int Old_Address(char *data, longword *ip, word *port)
	{
	unsigned _ip[4], _port[2] ;

	if (sscanf(data, "%u,%u,%u,%u,%u,%u",
		&_ip[3], &_ip[2], &_ip[1], &_ip[0],
		&_port[1], &_port[0]) == 6)
		{
		word msw = (_ip[3] << 8) | _ip[2] ;
		word lsw = (_ip[1] << 8) | _ip[0] ;
		*ip = ((longword) msw << 16) | (longword) lsw ;
		*port = (_port[1] << 8) | _port[0] ;
		return strspn(data, "0123456789,") ;
		}

	return 0 ;
	}

PRIVATE int New_Address(char *bfr, word mapped)
	{
	sprintf(bfr, "%u,%u,%u,%u,%u,%u",
		((byte *) &remote_IP)[3],
		((byte *) &remote_IP)[2],
		((byte *) &remote_IP)[1],
		((byte *) &remote_IP)[0],
		((byte *) &mapped)[1],
		((byte *) &mapped)[0]) ;

	return strlen(bfr) ;
	}
