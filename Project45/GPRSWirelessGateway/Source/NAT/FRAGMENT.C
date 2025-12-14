/* File: SRC\FRAGMENT.C */
#include "napt.h"

PRIVATE BOOL		All_Parts(FRAGLIST far *, in_Header *, unsigned) ;
PRIVATE FRAGLIST far *	Find_Fragment(in_Header *, unsigned) ;
PRIVATE FRAGLIST far *	Oldest_Fragment(void) ;

PRIVATE FRAGLIST far *	frags = NULL ;
PRIVATE SEMA_INFO *	frag_sema = NULL ;
PRIVATE char		msg1[] =
	 "Can't map fragmented packet - 1st fragment missing" ;

#define	FRAG_TIMEOUT	SECONDS(30)

CONNECTION *
Fragment_Connection(PACKET *pkt, unsigned ip_hdr_len, MTCBOOL *original)
	{
	static CONNECTION c ;
	FRAGLIST far *f ;
	THREAD *tp ;

	if (f = Find_Fragment(&pkt->ip, ip_hdr_len))
		{
		c = f->c ;
		return &c ;
		}

	MtCSplit(&tp, original) ;
	if (!*original)
		{
		longword timeout = Set_Timeout(30) ;
		while (!Check_Timeout(timeout))
			{
			MtCYield() ;
			if (f = Find_Fragment(&pkt->ip, ip_hdr_len))
				{
				c = f->c ;
				return &c ;
				}
			}
		Warning(Partial(&pkt->ip), &pkt->ip, msg1) ;
		Packet_Free(pkt) ;
		}

	return NULL ;
	}

void Add_Fragment(in_Header *ip, unsigned ip_hdr_len, CONNECTION *c)
	{
	FRAGLIST far *f ;

	f = (FRAGLIST far *) farmalloc(sizeof(FRAGLIST)) ;
	if (!f) f = Oldest_Fragment() ;

	f->spec.id     = ip->id ;
	f->spec.src_IP = ip->source ;
	f->spec.dst_IP = ip->destination ;
	f->spec.proto  = ip->proto ;
	f->c = *c ;
	f->size = f->offset = Rev16(ip->length) - ip_hdr_len ;
	f->parts = 1L ;
	f->bits = 0 ;
	f->time_out = Set_Timeout(FRAG_TIMEOUT) ;
	f->next = frags ;
	frags = f ;
	}

void Check_Fragments(void)
	{
	if (frags && frag_sema) MtCSemaReset(frag_sema) ;
	}

void Expire_Fragments(void)
	{
	MtCSemaCreate(&frag_sema) ;
	MtCSetPri(NULL, MTC_LOW) ;
	for (;;)
		{
		FRAGLIST far *this ;
		FRAGLIST far *prev ;

		MtCSemaSet(frag_sema) ;
		MtCSemaWait(frag_sema, FALSE) ;

		prev = (FRAGLIST far *) &frags ;
		while (this = prev->next)
			{
			MtCYield() ;
			if (Check_Timeout(this->time_out))
				{
				prev->next = this->next ;
				farfree(this) ;
				}
			else prev = this ;
			}
		}
	}

PRIVATE FRAGLIST far *Oldest_Fragment(void)
	{
	FRAGLIST far *this ;
	FRAGLIST far *prev ;

	for (prev = (FRAGLIST far *) &frags; this = prev->next; prev = this)
		{
		if (!this->next) break ;
		}

	prev->next = NULL ;
	return this ;
	}

PRIVATE FRAGLIST far *Find_Fragment(in_Header *ip, unsigned ip_hdr_len)
	{
	FRAGLIST far *f ;
	FRAGSPEC spec ;

	spec.id     = ip->id ;
	spec.src_IP = ip->source ;
	spec.dst_IP = ip->destination ;
	spec.proto  = ip->proto ;

	for (f = frags; f; f = f->next)
		{
		if (!farmemcmp(&f->spec, &spec, sizeof(FRAGSPEC)))
			{
			if (All_Parts(f, ip, ip_hdr_len))
				{
				f->time_out = Set_Timeout(IMMEDIATE) ;
				}
			return f ;
			}
		}

	return NULL ;
	}

PRIVATE BOOL All_Parts(FRAGLIST far *f, in_Header *ip, unsigned ip_hdr_len)
	{
	unsigned size, bit ;
	word offset ;

	offset = Rev16(ip->frags) << 3 ;
	size   = Rev16(ip->length) - ip_hdr_len ;

	/* ------------------------------- */
	/* If all packets arrive in order, */
	/* then last one can remove entry. */
	/* ------------------------------- */
	if (offset == f->offset)
		{
		if (LAST_FRAGMENT(ip)) return TRUE ;
		f->offset += size ;
		}
	
	/* ------------------------------------ */
	/* Otherwise, if all (but last) packets */
	/* are the same size and there are less */
	/* than 32 of them, bit vector will do. */
	/* ------------------------------------ */
	bit = (offset / f->size) ;
	f->parts |= (1L << bit) ;

	if (LAST_FRAGMENT(ip)) f->bits = (byte) (bit + 1) ;
	else if (size != f->size || bit > 31) f->parts = 0L ;

	return (f->parts == (1L << f->bits) - 1L) ;
	}
