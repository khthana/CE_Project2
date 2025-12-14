/* File: SRC\CHECKSUM.C */
#include "napt.h"

void Fix_IP_Checksum(in_Header *ip)
	{
	/* ----------------------------------------- */
	/* Calculate the checksum for the IP header. */
	/* ----------------------------------------- */
	ip->checksum = 0 ;
	ip->checksum = ~Checksum(ip, IP_HDR_BYTES(ip)) ;
	}

void Fix_Prot_Checksum(in_Header *ip)
	{
	register byte *prot ;
	tcp_PseudoHeader ph ;
	unsigned length ;
	word *prot_cksm ;

	/* ----------------------------------- */
	/* "length" is the length of IP header */
	/* ----------------------------------- */
	length = IP_HDR_BYTES(ip) ;

	/* ------------------------------------ */
	/* "prot" is a pointer to the beginning */
	/* of the protocol (TCP or UDP) header. */
	/* ------------------------------------ */
	prot = (byte *) ip + length ;

	/* --------------------------------------------------- */
	/* "length" becomes length of data following IP header */
	/* --------------------------------------------------- */
	length = Rev16(ip->length) - length ;

	/* ---------------------------------------- */
	/* "prot_cksm" is a pointer to the checksum */
	/* in the protocol (TCP or UDP) header.     */
	/* ---------------------------------------- */
	switch (ip->proto)
		{
		case TCP_PROTO:
			prot_cksm = &((tcp_Header *) prot)->checksum ;
			break ;

		case UDP_PROTO:
			prot_cksm = &((udp_Header *) prot)->checksum ;
			if (!*prot_cksm) return ;
			break ;
		}

	/* ----------------------------------------------- */
	/* Initialize protocol checksum before calculating */
	/* the checksum for the pseudo header.		   */
	/* ----------------------------------------------- */
	*prot_cksm = 0 ;

	/* ------------------------------------------------- */
	/* Calculate the checksum for the pseudo header.     */
	/* (This is used to calculate the protocol checksum) */
	/* ------------------------------------------------- */
	ph.src = ip->source ;
	ph.dst = ip->destination ;
	ph.mbz = 0 ;
	ph.protocol = ip->proto ;
	ph.length = Rev16(length) ;
	ph.checksum = Checksum(prot, length) ;

	/* ---------------------------------------------- */
	/* Calculate the checksum for the protocol header */
	/* ---------------------------------------------- */
	*prot_cksm = ~Checksum(&ph, sizeof(ph)) ;
	}

void Fix_ICMP_Checksum(in_Header *ip)
	{
	register ICMP_UNUSED *icmp ;
	unsigned ip_hdr_len ;

	ip_hdr_len = IP_HDR_BYTES(ip) ;
	icmp = (ICMP_UNUSED *) ((byte *) ip + ip_hdr_len) ;
	icmp->checksum = 0 ;
	icmp->checksum = ~Checksum(icmp, Rev16(ip->length) - ip_hdr_len) ;
	}
