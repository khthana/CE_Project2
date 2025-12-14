/*
//============================================================================
//
//    FILE NAME : R2MFD_KASATKA.h
//
//    ALGORITHM : R2MFD
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the R2MFD_KASATKA module; KASATKA's implementation
//                of the IR2MFD interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 0
//
//    Creation Date: Tue - 04 January 2005
//    Creation Time: 09:23 PM
//
//============================================================================
*/

#ifndef R2MFD_KASATKA_
#define R2MFD_KASATKA_

#include "ir2mfd.h"
#include <ialg.h>

/*
//============================================================================
// R2MFD_KASATKA_IALG
//
// KASATKA's implementation of the IALG interface for R2MFD
*/
extern far IALG_Fxns R2MFD_KASATKA_IALG;

/*
//============================================================================
// R2MFD_KASATKA_IR2MFD
//
// KASATKA's implementation of the IR2MFD interface
*/
extern far IR2MFD_Fxns R2MFD_KASATKA_IR2MFD;

/*
//============================================================================
// R2MFD_KASATKA_init
//
// Initialize the R2MFD_KASATKA module as a whole
*/
extern Void R2MFD_KASATKA_init(Void);

/*
//============================================================================
// R2MFD_KASATKA_exit
//
// Exit the R2MFD_KASATKA module as a whole
*/
extern Void R2MFD_KASATKA_exit(Void);

#endif	/* R2MFD_KASATKA_ */
