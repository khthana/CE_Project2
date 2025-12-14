/* File: SRC\EXPIRE.C */


#include "napt.h"

PRIVATE void	Expire_Mapping(MAPPING far *) ;

void Expire(void)
	{
	MtCSetPri(NULL, MTC_LOW) ;
	Visit_Mappings(Expire_Mapping) ;
	}

PRIVATE void Expire_Mapping(MAPPING far *m)
	{
	if (!m || m->status & STATUS_SERVER) return ;
        if (Check_Timeout(m->time_out)) Del_Mapping(m) ;
	}
