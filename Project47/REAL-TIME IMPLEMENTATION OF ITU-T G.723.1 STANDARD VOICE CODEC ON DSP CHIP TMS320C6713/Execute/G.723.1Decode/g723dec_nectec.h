/*
//============================================================================
//
//    FILE NAME : G723DEC_NECTEC.h
//
//    ALGORITHM : G723DEC
//
//    VENDOR    : NECTEC
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the G723DEC_NECTEC module; NECTEC's implementation
//                of the IG723DEC interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 1
//    Number of Outputs: 1
//
//    Creation Date: Fri - 18 February 2005
//    Creation Time: 09:25 PM
//
//============================================================================
*/

#ifndef G723DEC_NECTEC_
#define G723DEC_NECTEC_

#include "ig723dec.h"
#include <ialg.h>

/*
//============================================================================
// G723DEC_NECTEC_IALG
//
// NECTEC's implementation of the IALG interface for G723DEC
*/
extern far IALG_Fxns G723DEC_NECTEC_IALG;

/*
//============================================================================
// G723DEC_NECTEC_IG723DEC
//
// NECTEC's implementation of the IG723DEC interface
*/
extern far IG723DEC_Fxns G723DEC_NECTEC_IG723DEC;

/*
//============================================================================
// G723DEC_NECTEC_init
//
// Initialize the G723DEC_NECTEC module as a whole
*/
extern Void G723DEC_NECTEC_init(Void);

/*
//============================================================================
// G723DEC_NECTEC_exit
//
// Exit the G723DEC_NECTEC module as a whole
*/
extern Void G723DEC_NECTEC_exit(Void);

#endif	/* G723DEC_NECTEC_ */
