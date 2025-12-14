/*
//============================================================================
//
//    FILE NAME : IG729DEC.h
//
//    ALGORITHM : G729DEC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IG729DEC Interface Header
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 1
//
//    Creation Date: Mon - 15 November 2004
//    Creation Time: 10:42 PM
//
//============================================================================
*/

#ifndef IG729DEC_
#define IG729DEC_

#include <xdas.h>
#include <ialg.h>

/*
// ===========================================================================
// IG729DEC_Handle
//
// This handle is used to reference all G729DEC instance objects
*/
typedef struct IG729DEC_Obj *IG729DEC_Handle;

/*
// ===========================================================================
// IG729DEC_Obj
//
// This structure must be the first field of all G729DEC instance objects
*/
typedef struct IG729DEC_Obj {
    struct IG729DEC_Fxns *fxns;
} IG729DEC_Obj;

/*
// ===========================================================================
// IG729DEC_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IG729DEC_Status {
    Int             size;  /* must be first field of all status structures */
} IG729DEC_Status;

/*
// ===========================================================================
// IG729DEC_Cmd
//
// The Cmd enumeration defines the control commands for the G729DEC
// control method.
*/
typedef enum IG729DEC_Cmd {
  IG729DEC_GETSTATUS,
  IG729DEC_SETSTATUS
} IG729DEC_Cmd;

/*
// ===========================================================================
// IG729DEC_Params
//
// This structure defines the creation parameters for all G729DEC objects
*/
typedef struct IG729DEC_Params {
    Int size;	  /* must be first field of all params structures */
    XDAS_UInt32     framesizeOut0;
} IG729DEC_Params;

/*
// ===========================================================================
// IG729DEC_PARAMS
//
// Default parameter values for G729DEC instance objects
*/
extern IG729DEC_Params IG729DEC_PARAMS;

/*
// ===========================================================================
// IG729DEC_Fxns
//
// This structure defines all of the operations on G729DEC objects
*/
typedef struct IG729DEC_Fxns {
    IALG_Fxns	ialg;    /* IG729DEC extends IALG */
    XDAS_Void (*apply)(IG729DEC_Handle handle, XDAS_Int32 * parm, XDAS_Int16 * out ,XDAS_Int32 serial_size);
    XDAS_Void (*bits2prm_ld8c)(IG729DEC_Handle handle, XDAS_Int16 * serial, XDAS_Int32 * parm);	
} IG729DEC_Fxns;

#endif	/* IG729DEC_ */
