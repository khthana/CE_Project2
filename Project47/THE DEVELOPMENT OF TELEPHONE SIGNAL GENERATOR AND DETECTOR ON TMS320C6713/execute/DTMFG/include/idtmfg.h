/*
//============================================================================
//
//    FILE NAME : IDTMFG.h
//
//    ALGORITHM : DTMFG
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IDTMFG Interface Header
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

#ifndef IDTMFG_
#define IDTMFG_

#include <xdas.h>
#include <ialg.h>

#include <dtmfg_mblk.h>

/*
// ===========================================================================
// IDTMFG_Handle
//
// This handle is used to reference all DTMFG instance objects
*/
typedef struct IDTMFG_Obj *IDTMFG_Handle;

/*
// ===========================================================================
// IDTMFG_Obj
//
// This structure must be the first field of all DTMFG instance objects
*/
typedef struct IDTMFG_Obj {
    struct IDTMFG_Fxns *fxns;
} IDTMFG_Obj;

/*
// ===========================================================================
// IDTMFG_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IDTMFG_Status {
    Int             size;  /* must be first field of all status structures */
} IDTMFG_Status;

/*
// ===========================================================================
// IDTMFG_Cmd
//
// The Cmd enumeration defines the control commands for the DTMFG
// control method.
*/
typedef enum IDTMFG_Cmd {
  IDTMFG_GETSTATUS,
  IDTMFG_SETSTATUS
} IDTMFG_Cmd;

/*
// ===========================================================================
// IDTMFG_Params
//
// This structure defines the creation parameters for all DTMFG objects
*/
typedef struct IDTMFG_Params {
    Int size;	  /* must be first field of all params structures */
    
    DTMFG_KONST *ptr2konst;
    
    MdInt *target_array;
    MdInt array_elem;
    
    Char *genQ;
    MdUns genQ_elem;
    
    MdUns signal_len;
    MdUns pause_len;       
    
} IDTMFG_Params;

/*
// ===========================================================================
// IDTMFG_PARAMS
//
// Default parameter values for DTMFG instance objects
*/
extern IDTMFG_Params IDTMFG_PARAMS;

/*
// ===========================================================================
// IDTMFG_Fxns
//
// This structure defines all of the operations on DTMFG objects
*/
typedef struct IDTMFG_Fxns {
    IALG_Fxns	ialg;    /* IDTMFG extends IALG */
    MdInt (*apply)(IDTMFG_Handle handle);
    
    MdInt (*enqueue)(IDTMFG_Handle handle, Char data);
	Void  (*setEnable)(IDTMFG_Handle handle, Char enable, Char clearQ);    
} IDTMFG_Fxns;

#endif	/* IDTMFG_ */
