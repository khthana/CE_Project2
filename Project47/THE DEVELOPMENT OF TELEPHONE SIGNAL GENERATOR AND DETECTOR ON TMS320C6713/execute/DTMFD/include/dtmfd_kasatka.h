/*
//============================================================================
//
//    FILE NAME : DTMFD_KASATKA.h
//
//    ALGORITHM : DTMFD
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the DTMFD_KASATKA module; KASATKA's implementation
//                of the IDTMFD interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 0
//
//    Creation Date: Thu - 06 January 2005
//    Creation Time: 02:35 PM
//
//============================================================================
*/

#ifndef DTMFD_KASATKA_
#define DTMFD_KASATKA_

#include "idtmfd.h"
#include <ialg.h>

/*
//============================================================================
// DTMFD_KASATKA_IALG
//
// KASATKA's implementation of the IALG interface for DTMFD
*/
extern far IALG_Fxns DTMFD_KASATKA_IALG;

/*
//============================================================================
// DTMFD_KASATKA_IDTMFD
//
// KASATKA's implementation of the IDTMFD interface
*/
extern far IDTMFD_Fxns DTMFD_KASATKA_IDTMFD;

/*
//============================================================================
// DTMFD_KASATKA_init
//
// Initialize the DTMFD_KASATKA module as a whole
*/
extern Void DTMFD_KASATKA_init(Void);

/*
//============================================================================
// DTMFD_KASATKA_exit
//
// Exit the DTMFD_KASATKA module as a whole
*/
extern Void DTMFD_KASATKA_exit(Void);

#endif	/* DTMFD_KASATKA_ */
