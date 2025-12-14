/*
//============================================================================
//
//    FILE NAME : R2MFG_KASATKA.h
//
//    ALGORITHM : R2MFG
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the R2MFG_KASATKA module; KASATKA's implementation
//                of the IR2MFG interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 0
//
//    Creation Date: Mon - 29 November 2004
//    Creation Time: 02:24 PM
//
//============================================================================
*/

#ifndef R2MFG_KASATKA_
#define R2MFG_KASATKA_

#include "ir2mfg.h"
#include <ialg.h>

/*
//============================================================================
// R2MFG_KASATKA_IALG
//
// KASATKA's implementation of the IALG interface for R2MFG
*/
extern far IALG_Fxns R2MFG_KASATKA_IALG;

/*
//============================================================================
// R2MFG_KASATKA_IR2MFG
//
// KASATKA's implementation of the IR2MFG interface
*/
extern far IR2MFG_Fxns R2MFG_KASATKA_IR2MFG;

/*
//============================================================================
// R2MFG_KASATKA_init
//
// Initialize the R2MFG_KASATKA module as a whole
*/
extern Void R2MFG_KASATKA_init(Void);

/*
//============================================================================
// R2MFG_KASATKA_exit
//
// Exit the R2MFG_KASATKA module as a whole
*/
extern Void R2MFG_KASATKA_exit(Void);

#endif	/* R2MFG_KASATKA_ */
