/*
//============================================================================
//
//    FILE NAME : IDTMFD.h
//
//    ALGORITHM : DTMFD
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IDTMFD Interface Header
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

#ifndef IDTMFD_
#define IDTMFD_

#include <xdas.h>
#include <ialg.h>

#include "dtmfd_mblk.h"		// by Yury

/*
// ===========================================================================
// IDTMFD_Handle
//
// This handle is used to reference all DTMFD instance objects
*/
typedef struct IDTMFD_Obj *IDTMFD_Handle;

/*
// ===========================================================================
// IDTMFD_Obj
//
// This structure must be the first field of all DTMFD instance objects
*/
typedef struct IDTMFD_Obj {
    struct IDTMFD_Fxns *fxns;
} IDTMFD_Obj;

/*
// ===========================================================================
// IDTMFD_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IDTMFD_Status {
    Int             size;  /* must be first field of all status structures */
} IDTMFD_Status;

/*
// ===========================================================================
// IDTMFD_Cmd
//
// The Cmd enumeration defines the control commands for the DTMFD
// control method.
*/
typedef enum IDTMFD_Cmd {
  IDTMFD_GETSTATUS,
  IDTMFD_SETSTATUS
} IDTMFD_Cmd;

/*
// ===========================================================================
// IDTMFD_Params
//
// This structure defines the creation parameters for all DTMFD objects
*/
typedef struct IDTMFD_Params {
    Int size;	  /* must be first field of all params structures */
    
    DTMFD_KONST *ptr2konst;
        
} IDTMFD_Params;

/*
// ===========================================================================
// IDTMFD_PARAMS
//
// Default parameter values for DTMFD instance objects
*/
extern IDTMFD_Params IDTMFD_PARAMS;

/*
// ===========================================================================
// IDTMFD_Fxns
//
// This structure defines all of the operations on DTMFD objects
*/
typedef struct IDTMFD_Fxns {
    IALG_Fxns	ialg;    /* IDTMFD extends IALG */
    XDAS_Void (*apply)(IDTMFD_Handle handle, MdInt * samp, MdInt * result);
} IDTMFD_Fxns;

#endif	/* IDTMFD_ */
