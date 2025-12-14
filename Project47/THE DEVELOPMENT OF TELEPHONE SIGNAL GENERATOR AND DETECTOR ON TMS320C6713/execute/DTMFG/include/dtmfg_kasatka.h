/*
//============================================================================
//
//    FILE NAME : DTMFG_KASATKA.h
//
//    ALGORITHM : DTMFG
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the DTMFG_KASATKA module; KASATKA's implementation
//                of the IDTMFG interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 0
//
//    Creation Date: Mon - 13 December 2004
//    Creation Time: 09:37 PM
//
//============================================================================
*/

#ifndef DTMFG_KASATKA_
#define DTMFG_KASATKA_

#include "idtmfg.h"
#include <ialg.h>

/*
//============================================================================
// DTMFG_KASATKA_IALG
//
// KASATKA's implementation of the IALG interface for DTMFG
*/
extern far IALG_Fxns DTMFG_KASATKA_IALG;

/*
//============================================================================
// DTMFG_KASATKA_IDTMFG
//
// KASATKA's implementation of the IDTMFG interface
*/
extern far IDTMFG_Fxns DTMFG_KASATKA_IDTMFG;

/*
//============================================================================
// DTMFG_KASATKA_init
//
// Initialize the DTMFG_KASATKA module as a whole
*/
extern Void DTMFG_KASATKA_init(Void);

/*
//============================================================================
// DTMFG_KASATKA_exit
//
// Exit the DTMFG_KASATKA module as a whole
*/
extern Void DTMFG_KASATKA_exit(Void);

#endif	/* DTMFG_KASATKA_ */
