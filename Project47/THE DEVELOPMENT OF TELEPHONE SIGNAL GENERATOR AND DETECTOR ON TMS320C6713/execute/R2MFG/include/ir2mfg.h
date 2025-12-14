/*
//============================================================================
//
//    FILE NAME : IR2MFG.h
//
//    ALGORITHM : R2MFG
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IR2MFG Interface Header
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

#ifndef IR2MFG_
#define IR2MFG_

#include <xdas.h>
#include <ialg.h>

#include <r2mfg_mblk.h>

/*
// ===========================================================================
// IR2MFG_Handle
//
// This handle is used to reference all R2MFG instance objects
*/
typedef struct IR2MFG_Obj *IR2MFG_Handle;

/*
// ===========================================================================
// IR2MFG_Obj
//
// This structure must be the first field of all R2MFG instance objects
*/
typedef struct IR2MFG_Obj {
    struct IR2MFG_Fxns *fxns;
} IR2MFG_Obj;

/*
// ===========================================================================
// IR2MFG_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IR2MFG_Status {
    Int             size;  /* must be first field of all status structures */
    
} IR2MFG_Status;

/*
// ===========================================================================
// IR2MFG_Cmd
//
// The Cmd enumeration defines the control commands for the R2MFG
// control method.
*/
typedef enum IR2MFG_Cmd {
  IR2MFG_GETSTATUS,
  IR2MFG_SETSTATUS
} IR2MFG_Cmd;

/*
// ===========================================================================
// IR2MFG_Params
//
// This structure defines the creation parameters for all R2MFG objects
*/
typedef struct IR2MFG_Params {
    Int size;	  /* must be first field of all params structures */
    
    R2MFG_KONST *ptr2konst;			// pointer to konst struct    
    MdInt *target_array;		// pointer to array to store generated signal
    MdInt array_elem;			// size of array
    MdInt percent_pow;			// 0..100 %
    
} IR2MFG_Params;

/*
// ===========================================================================
// IR2MFG_PARAMS
//
// Default parameter values for R2MFG instance objects
*/
extern IR2MFG_Params IR2MFG_PARAMS;

/*
// ===========================================================================
// IR2MFG_Fxns
//
// This structure defines all of the operations on R2MFG objects
*/
typedef struct IR2MFG_Fxns {
    IALG_Fxns	ialg;    /* IR2MFG extends IALG */
    MdInt (*apply)(IR2MFG_Handle handle);
    
    XDAS_Void (*setDigit)(IR2MFG_Handle handle, MdInt digit);
    XDAS_Void (*setState)(IR2MFG_Handle handle, MdInt state);
    
} IR2MFG_Fxns;

#endif	/* IR2MFG_ */
