/*
//============================================================================
//
//    FILE NAME : IG729ENC.c
//
//    ALGORITHM : G729ENC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This file defines the default parameter structure for iG729ENC.h
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

#include <std.h>
#include <xdas.h>
#include "ig729enc.h"

/*
// ===========================================================================
// G729ENC_PARAMS
//
// This constant structure defines the default parameters for G729ENC objects
*/
IG729ENC_Params IG729ENC_PARAMS = {
    sizeof(IG729ENC_Params),
    1, /* vadEnable */
    1, /* annexC */
    0, /* annexD */
    0, /* annexE */
    1, /* openloopOptimizeEnable	*/
  	3, /* numSearchRegion  1 - 8 	*/
    
//    &G729_dtx_table,
//   &G729_ld8k_table,
 //   &G729_ld8cp_table,
   
    
};
