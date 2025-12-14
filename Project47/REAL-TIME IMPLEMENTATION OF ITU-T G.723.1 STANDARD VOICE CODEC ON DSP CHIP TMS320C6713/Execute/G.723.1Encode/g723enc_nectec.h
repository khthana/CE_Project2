/*
//============================================================================
//
//    FILE NAME : G723ENC_NECTEC.h
//
//    ALGORITHM : G723ENC
//
//    VENDOR    : NECTEC
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the G723ENC_NECTEC module; NECTEC's implementation
//                of the IG723ENC interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 1
//    Number of Outputs: 1
//
//    Creation Date: Tue - 11 January 2005
//    Creation Time: 03:42 PM
//
//============================================================================
*/

#ifndef G723ENC_NECTEC_
#define G723ENC_NECTEC_

#include "ig723enc.h"
#include <ialg.h>

/*
//============================================================================
// G723ENC_NECTEC_IALG
//
// NECTEC's implementation of the IALG interface for G723ENC
*/
extern far IALG_Fxns G723ENC_NECTEC_IALG;

/*
//============================================================================
// G723ENC_NECTEC_IG723ENC
//
// NECTEC's implementation of the IG723ENC interface
*/
extern far IG723ENC_Fxns G723ENC_NECTEC_IG723ENC;

/*
//============================================================================
// G723ENC_NECTEC_init
//
// Initialize the G723ENC_NECTEC module as a whole
*/
extern Void G723ENC_NECTEC_init(Void);

/*
//============================================================================
// G723ENC_NECTEC_exit
//
// Exit the G723ENC_NECTEC module as a whole
*/
extern Void G723ENC_NECTEC_exit(Void);

#endif	/* G723ENC_NECTEC_ */
