/* File: SRC\ARP.C */

#include "napt.h"

typedef struct ARP_PACKET
	{
	byte			status ;
	eth_Header		eth ;
	arp_Header		arp ;
	} ARP_PACKET ;

typedef struct ARP_PENDING
	{
	struct ARP_PENDING	*next ;
	longword		_ip ;
	void far *		enet ;
	} ARP_PENDING ;

typedef struct ARP_PARAMS
	{
	int			pd_class ;
	int			packet_type ;
	longword		ip_adrs ;
	longword		_ip_adrs ;
	longword		net_mask ;
	eth_address		enet_adrs ;
	longword		gateway_ip_adrs ;
	eth_address		gateway_enet_adrs ;
	BOOL			gateway_resolved ;
	int			(*send)(PACKET *, unsigned) ;
	} ARP_PARAMS ;

PRIVATE ARP_PENDING *	ARP_List_Add(longword, void far *) ;
PRIVATE void		ARP_List_Del(ARP_PENDING *) ;
PRIVATE void		ARP_Process(ARP_PARAMS *) ;
PRIVATE BOOL		ARP_Resolve(ARP_PARAMS *, longword, void far *) ;
PRIVATE BOOL		_ARP_Resolve(ARP_PARAMS *, longword, void far *) ;
PRIVATE void		Handle_Reply(PACKET *) ;
PRIVATE void		Handle_Request(ARP_PARAMS *, PACKET *) ;
PRIVATE ARP_PENDING *	Oldest_Pending_Request(void) ;
PRIVATE void		Process_ARP(ARP_PARAMS *, PACKET *, arp_Header *) ;
PRIVATE void		Send_Request(ARP_PARAMS *, longword) ;

PRIVATE ARP_PARAMS	remote_arp, local_arp ;
PRIVATE ARP_PENDING *	arp_pending = NULL ;

void Local_ARP(void)
	{
	local_arp.pd_class = Local_Class() ;
	local_arp.packet_type = PKT_LCL_ARP ;
	memcpy(local_arp.enet_adrs, Local_Adrs(), sizeof(eth_address)) ;
	local_arp.ip_adrs = local_IP ;
	local_arp._ip_adrs = _local_IP ;
	local_arp.net_mask = local_mask ;
	local_arp.gateway_ip_adrs = local_gateway ;
	local_arp.gateway_resolved = FALSE ;
	local_arp.send = Local_Send ;

	ARP_Process(&local_arp) ;
	}

void Remote_ARP(void)
	{
	remote_arp.pd_class = Remote_Class() ;
	remote_arp.packet_type = PKT_REM_ARP ;
	memcpy(remote_arp.enet_adrs, Remote_Adrs(), sizeof(eth_address)) ;
	remote_arp.ip_adrs = remote_IP ;
	remote_arp._ip_adrs = _remote_IP ;
	remote_arp.net_mask = remote_mask ;
	remote_arp.gateway_ip_adrs = remote_gateway ;
	remote_arp.gateway_resolved = FALSE ;
	remote_arp.send = Remote_Send ;

	ARP_Process(&remote_arp) ;
	}

PRIVATE void ARP_Process(ARP_PARAMS *params)
	{
	PACKET *pkt = NULL ;

	for (;;)
		{
		arp_Header *arp ;

		Packet_Free(pkt) ;
		MtCSetPri(NULL, MTC_HI) ;
		pkt = Wait_For_Packet(params->packet_type) ;
		if (!pkt) continue ;
		arp = (arp_Header *) &pkt->ip ;

		if (arp->dstIPAddr != params->_ip_adrs)	continue ;
		if (arp->protType  != IP_TYPE)		continue ;
		if (arp->hwType    != ARP_TYPE_ETHER)	continue ;

		MtCSetPri(NULL, MTC_LOW) ;
		MtCCoroutine(Process_ARP(params, pkt, arp)) ;
		pkt = NULL ;	/* New thread releases the packet */
		}
	}

PRIVATE void Process_ARP(ARP_PARAMS *params, PACKET *pkt, arp_Header *arp)
	{
	switch (arp->opcode)
		{
		case ARP_REQUEST:
			Handle_Request(params, pkt) ;
			break ;

		case ARP_REPLY:
			Handle_Reply(pkt) ;
			break ;
		}

	Packet_Free(pkt) ;
	}

BOOL Remote_ARP_Resolve(longword ip, void far *eadrs)
	{
	return ARP_Resolve(&remote_arp, ip, eadrs) ;
	}

BOOL Local_ARP_Resolve(longword ip, void far *eadrs)
	{
	return ARP_Resolve(&local_arp, ip, eadrs) ;
	}

PRIVATE BOOL ARP_Resolve(ARP_PARAMS *params, longword ip, void far *eadrs)
	{
	BOOL success, foreign ;

	if (params->pd_class != PD_ETHER) return TRUE ;

	if (foreign = ((ip ^ params->ip_adrs) & params->net_mask) != 0)
		{
		if (params->gateway_resolved)
			{
			farmemcpy(eadrs, params->gateway_enet_adrs,
				sizeof(eth_address)) ;
			return TRUE ;
			}

		ip = params->gateway_ip_adrs ;
		}

	success = _ARP_Resolve(params, ip, eadrs) ;

	if (foreign && success && !params->gateway_resolved)
		{
		farmemcpy(params->gateway_enet_adrs, eadrs,
			sizeof(eth_address)) ;
		params->gateway_resolved = TRUE ;
		}

	return success ;
	}

PRIVATE BOOL _ARP_Resolve(ARP_PARAMS *params, longword ip, void far *eadrs)
	{
	longword timeout, re_send, one_fourth ;
	ARP_PENDING *arp ;
	BOOL resolved ;

	arp = ARP_List_Add(ip, eadrs) ;

	resolved = FALSE ;
	timeout = Set_Timeout(5) ;
	re_send = Set_Timeout(0) ;
	one_fourth = (Set_Timeout(100) - Set_Timeout(0) + 200L) / 400L ;
	while (!resolved && !Check_Timeout(timeout))
		{
		Send_Request(params, ip) ;
		re_send += one_fourth ; /* 250 ms */
		while (!resolved && !Check_Timeout(re_send))
			{
			MtCYield() ;
			resolved = !arp->enet ;
			}
		}

	ARP_List_Del(arp) ;
	return resolved ;
	}

PRIVATE void Handle_Reply(PACKET *pkt)
	{
	arp_Header *arp ;
	ARP_PENDING *p ;

	arp = (arp_Header *) &pkt->ip ;
	for (p = (ARP_PENDING *) &arp_pending; p; p = p->next)
		{
		if (p->_ip == arp->srcIPAddr)
			{
			farmemcpy(p->enet, arp->srcEthAddr,
				sizeof(eth_address)) ;
			p->enet = NULL ;
			break ;
			}
		}
	}

PRIVATE void Send_Request(ARP_PARAMS *params, longword ip)
	{
	static eth_address broadcast = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF} ;
	ARP_PACKET pkt ;

	memset(&pkt, 0, sizeof(pkt)) ;
	pkt.status = PKT_BUSY ;
	memcpy(pkt.eth.destination, broadcast, sizeof(eth_address)) ;
	memcpy(pkt.eth.source, params->enet_adrs, sizeof(eth_address)) ;
	pkt.eth.type = ARP_TYPE ;

	pkt.arp.hwType = ARP_TYPE_ETHER ;
	pkt.arp.protType = IP_TYPE ;
	pkt.arp.hwProtAddrLen = sizeof(eth_address) + (sizeof(longword) << 8);
	pkt.arp.opcode = ARP_REQUEST ;
	pkt.arp.srcIPAddr = params->_ip_adrs ;
	pkt.arp.dstIPAddr = Rev32(ip) ;
	memcpy(pkt.arp.srcEthAddr, params->enet_adrs, sizeof(eth_address));

	(void) (*params->send)((PACKET *) &pkt, sizeof(arp_Header)) ;
	}

PRIVATE void Handle_Request(ARP_PARAMS *params, PACKET *pkt)
	{
	arp_Header *arp ;
	longword temp_l ;

	arp = (arp_Header *) &pkt->ip ;
	arp->opcode = ARP_REPLY ;
	memcpy(arp->dstEthAddr, arp->srcEthAddr, sizeof(eth_address)) ;
	memcpy(arp->srcEthAddr, params->enet_adrs, sizeof(eth_address)) ;
	temp_l = arp->dstIPAddr ;
	arp->dstIPAddr = arp->srcIPAddr ;
	arp->srcIPAddr = temp_l ;

	memcpy(pkt->eth.destination, pkt->eth.source, sizeof(eth_address)) ;
	memcpy(pkt->eth.source, params->enet_adrs, sizeof(eth_address)) ;

	(void) (*params->send)(pkt, sizeof(arp_Header)) ;
	}

PRIVATE ARP_PENDING *ARP_List_Add(longword ip, void far *enet)
	{
	ARP_PENDING *p ;

	p = (ARP_PENDING *) malloc(sizeof(ARP_PENDING)) ;
	if (!p) p = Oldest_Pending_Request() ;

	p->_ip = Rev32(ip) ;
	p->enet = enet ;
	p->next = arp_pending ;
	return arp_pending = p ;
	}

PRIVATE ARP_PENDING *Oldest_Pending_Request(void)
	{
	ARP_PENDING *this ;
	ARP_PENDING *prev ;

	for (prev = (ARP_PENDING *) &arp_pending; this=prev->next; prev=this)
		{
		if (!this->next) break ;
		}

	prev->next = NULL ;
	return this ;
	}


PRIVATE void ARP_List_Del(ARP_PENDING *arp)
	{
	ARP_PENDING *this, *prev ;

	prev = (ARP_PENDING *) &arp_pending ;
	while (this = prev->next)
		{
		if (this == arp)
			{
			prev->next = this->next ;
			free(this) ;
			break ;
			}
		prev = this ;
		}
	}

