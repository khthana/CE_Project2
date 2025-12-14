/*
//============================================================================
//
//    FILE NAME : CPTDETECT_KMITL.h
//
//    ALGORITHM : CPTDETECT
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the CPTDETECT_KMITL module; KMITL's implementation
//                of the ICPTDETECT interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 1
//    Number of Outputs: 0
//
//    Creation Date: Thu - 17 February 2005
//    Creation Time: 01:32 PM
//
//============================================================================
*/

#ifndef CPTDETECT_KMITL_
#define CPTDETECT_KMITL_

#include "icptdetect.h"
#include <ialg.h>

/*
//============================================================================
// CPTDETECT_KMITL_IALG
//
// KMITL's implementation of the IALG interface for CPTDETECT
*/
extern far IALG_Fxns CPTDETECT_KMITL_IALG;

/*
//============================================================================
// CPTDETECT_KMITL_ICPTDETECT
//
// KMITL's implementation of the ICPTDETECT interface
*/
extern far ICPTDETECT_Fxns CPTDETECT_KMITL_ICPTDETECT;

/*
//============================================================================
// CPTDETECT_KMITL_init
//
// Initialize the CPTDETECT_KMITL module as a whole
*/
extern Void CPTDETECT_KMITL_init(Void);

/*
//============================================================================
// CPTDETECT_KMITL_exit
//
// Exit the CPTDETECT_KMITL module as a whole
*/
extern Void CPTDETECT_KMITL_exit(Void);

#endif	/* CPTDETECT_KMITL_ */
