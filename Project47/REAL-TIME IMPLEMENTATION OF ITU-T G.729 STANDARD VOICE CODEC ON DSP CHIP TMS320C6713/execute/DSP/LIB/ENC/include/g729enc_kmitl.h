/*
//============================================================================
//
//    FILE NAME : G729ENC_KMITL.h
//
//    ALGORITHM : G729ENC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the G729ENC_KMITL module; KMITL's implementation
//                of the IG729ENC interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 0
//
//    Creation Date: Wed - 10 November 2004
//    Creation Time: 01:42 AM
//
//============================================================================
*/

#ifndef G729ENC_KMITL_
#define G729ENC_KMITL_

#include "ig729enc.h"
#include <ialg.h>

/*User Include*/


/*
//============================================================================
// G729ENC_KMITL_IALG
//
// KMITL's implementation of the IALG interface for G729ENC
*/
extern far IALG_Fxns G729ENC_KMITL_IALG;

/*
//============================================================================
// G729ENC_KMITL_IG729ENC
//
// KMITL's implementation of the IG729ENC interface
*/
extern far IG729ENC_Fxns G729ENC_KMITL_IG729ENC;

/*
//============================================================================
// G729ENC_KMITL_init
//
// Initialize the G729ENC_KMITL module as a whole
*/
extern Void G729ENC_KMITL_init(Void);

/*
//============================================================================
// G729ENC_KMITL_exit
//
// Exit the G729ENC_KMITL module as a whole
*/
extern Void G729ENC_KMITL_exit(Void);

#endif	/* G729ENC_KMITL_ */
