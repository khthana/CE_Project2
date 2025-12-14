#ifndef _CPTGENPRIV
#define _CPTGENPRIV
//============================================================================
//==========================INTERNAL DECLARATION==============================
//============================================================================
#include "icptgen.h"

typedef struct CPT_GenTone_Param
{
	unsigned int freq[2];
	unsigned int freqNum;
	unsigned int length;
	unsigned int SampNum;
	CPT_GenParam *CPTparam;
} CPT_GenTone_Param;

typedef struct CPT_GenPause_Param
{
	unsigned int length;
	CPT_GenParam *CPTparam;
} CPT_GenPause_Param;

Void CPT_GenTone(CPT_GenTone_Param* param);
Void CPT_GenPause(CPT_GenPause_Param* param);
Void CPT_GenToneInit(CPT_GenTone_Param* Tparam,CPT_GenParam* param);
Void CPT_GenPauseInit(CPT_GenPause_Param* Pparam,CPT_GenParam* param);
Void Padding(CPT_GenParam *param);
Void SetState(int state,CPT_GenParam* param);

#endif
