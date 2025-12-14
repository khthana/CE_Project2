/*
//============================================================================
//
//    FILE NAME : CPTGEN_KMITL.h
//
//    ALGORITHM : CPTGEN
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Interface for the CPTGEN_KMITL module; KMITL's implementation
//                of the ICPTGEN interface.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 1
//
//    Creation Date: Wed - 16 February 2005
//    Creation Time: 12:56 PM
//
//============================================================================
*/

#ifndef CPTGEN_KMITL_
#define CPTGEN_KMITL_

#include "icptgen.h"
#include <ialg.h>

/*
//============================================================================
// CPTGEN_KMITL_IALG
//
// KMITL's implementation of the IALG interface for CPTGEN
*/
extern far IALG_Fxns CPTGEN_KMITL_IALG;

/*
//============================================================================
// CPTGEN_KMITL_ICPTGEN
//
// KMITL's implementation of the ICPTGEN interface
*/
extern far ICPTGEN_Fxns CPTGEN_KMITL_ICPTGEN;

/*
//============================================================================
// CPTGEN_KMITL_init
//
// Initialize the CPTGEN_KMITL module as a whole
*/
extern Void CPTGEN_KMITL_init(Void);

/*
//============================================================================
// CPTGEN_KMITL_exit
//
// Exit the CPTGEN_KMITL module as a whole
*/
extern Void CPTGEN_KMITL_exit(Void);

// ===========================================================================
// CPTGEN_Result for return parameter of apply function

// ===========================================================================

#endif	/* CPTGEN_KMITL_ */
