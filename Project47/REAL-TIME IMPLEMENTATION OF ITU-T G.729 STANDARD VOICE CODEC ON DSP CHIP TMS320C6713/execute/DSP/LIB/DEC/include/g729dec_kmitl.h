/*
//============================================================================
//
//    FILE NAME : G729DEC_KMITL.h
//
//    ALGORITHM : G729DEC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the G729DEC_KMITL module; KMITL's implementation
//                of the IG729DEC interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 1
//
//    Creation Date: Mon - 15 November 2004
//    Creation Time: 10:42 PM
//
//============================================================================
*/

#ifndef G729DEC_KMITL_
#define G729DEC_KMITL_

#include "ig729dec.h"
#include <ialg.h>

/*
//============================================================================
// G729DEC_KMITL_IALG
//
// KMITL's implementation of the IALG interface for G729DEC
*/
extern far IALG_Fxns G729DEC_KMITL_IALG;

/*
//============================================================================
// G729DEC_KMITL_IG729DEC
//
// KMITL's implementation of the IG729DEC interface
*/
extern far IG729DEC_Fxns G729DEC_KMITL_IG729DEC;

/*
//============================================================================
// G729DEC_KMITL_init
//
// Initialize the G729DEC_KMITL module as a whole
*/
extern Void G729DEC_KMITL_init(Void);

/*
//============================================================================
// G729DEC_KMITL_exit
//
// Exit the G729DEC_KMITL module as a whole
*/
extern Void G729DEC_KMITL_exit(Void);

#endif	/* G729DEC_KMITL_ */
