/*
//============================================================================
//
//    FILE NAME : IG723DEC.h
//
//    ALGORITHM : G723DEC
//
//    VENDOR    : NECTEC
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IG723DEC Interface Header
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 1
//    Number of Outputs: 1
//
//    Creation Date: Fri - 18 February 2005
//    Creation Time: 09:25 PM
//
//============================================================================
*/

#ifndef IG723DEC_
#define IG723DEC_

#include <xdas.h>
#include <ialg.h>
//#include "cst2.h"

/*
// ===========================================================================
// IG723DEC_Handle
//
// This handle is used to reference all G723DEC instance objects
*/
typedef struct IG723DEC_Obj *IG723DEC_Handle;

/*
// ===========================================================================
// IG723DEC_Obj
//
// This structure must be the first field of all G723DEC instance objects
*/
typedef struct IG723DEC_Obj {
    struct IG723DEC_Fxns *fxns;
} IG723DEC_Obj;

/*
// ===========================================================================
// IG723DEC_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IG723DEC_Status {
    Int             size;  /* must be first field of all status structures */
    XDAS_Bool       usePf;
    XDAS_Bool       rate63;
} IG723DEC_Status;

/*
// ===========================================================================
// IG723DEC_Cmd
//
// The Cmd enumeration defines the control commands for the G723DEC
// control method.
*/
typedef enum IG723DEC_Cmd {
  IG723DEC_GETSTATUS,
  IG723DEC_SETSTATUS
} IG723DEC_Cmd;

/*
// ===========================================================================
// IG723DEC_Params
//
// This structure defines the creation parameters for all G723DEC objects
*/
typedef struct IG723DEC_Params {
    Int size;	  /* must be first field of all params structures */
    XDAS_UInt32     framesizeIn0;
    XDAS_UInt32     framesizeOut0;
    XDAS_Bool       usePf;
    XDAS_Bool       rate63;
} IG723DEC_Params;

/*
// ===========================================================================
// IG723DEC_PARAMS
//
// Default parameter values for G723DEC instance objects
*/
extern IG723DEC_Params IG723DEC_PARAMS;

/*
// ===========================================================================
// IG723DEC_Fxns
//
// This structure defines all of the operations on G723DEC objects
*/
typedef struct IG723DEC_Fxns {
    IALG_Fxns	ialg;    /* IG723DEC extends IALG */
    XDAS_Void (*decode)(IG723DEC_Handle handle, XDAS_Int8 * ptrIn, XDAS_Int16 * ptrOut);
    XDAS_Void (*inframesize)(IG723DEC_Handle handle, XDAS_Int8 * ptrIn, XDAS_UInt32 * size);
} IG723DEC_Fxns;

#endif	/* IG723DEC_ */
