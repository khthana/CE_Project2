/*
//============================================================================
//
//    FILE NAME : IG723ENC.h
//
//    ALGORITHM : G723ENC
//
//    VENDOR    : NECTEC
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IG723ENC Interface Header
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 1
//    Number of Outputs: 1
//
//    Creation Date: Tue - 11 January 2005
//    Creation Time: 03:42 PM
//
//============================================================================
*/

#ifndef IG723ENC_
#define IG723ENC_

#include <xdas.h>
#include <ialg.h>
//#include "cst2.h"
//#include "tab2.h"



/*
// ===========================================================================
// IG723ENC_Handle
//
// This handle is used to reference all G723ENC instance objects
*/
typedef struct IG723ENC_Obj *IG723ENC_Handle;

/*
// ===========================================================================
// IG723ENC_Obj
//
// This structure must be the first field of all G723ENC instance objects
*/
typedef struct IG723ENC_Obj {
    struct IG723ENC_Fxns *fxns;
} IG723ENC_Obj;

/*
// ===========================================================================
// IG723ENC_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IG723ENC_Status {
    Int             size;  /* must be first field of all status structures */
    XDAS_Bool       useHp;
    XDAS_Bool       useVx;
    XDAS_Bool       rate63;
} IG723ENC_Status;

/*
// ===========================================================================
// IG723ENC_Cmd
//
// The Cmd enumeration defines the control commands for the G723ENC
// control method.
*/
typedef enum IG723ENC_Cmd {
  IG723ENC_GETSTATUS,
  IG723ENC_SETSTATUS
} IG723ENC_Cmd;

/*
// ===========================================================================
// IG723ENC_Params
//
// This structure defines the creation parameters for all G723ENC objects
*/
typedef struct IG723ENC_Params {
    Int size;	  /* must be first field of all params structures */
    XDAS_UInt32     framesizeIn0;
    XDAS_UInt32     framesizeOut0;
    XDAS_Bool       useHp;
    XDAS_Bool       useVx;
    XDAS_Bool       rate63;
 //   Table_PTR       table_ptr;
} IG723ENC_Params;

/*
// ===========================================================================
// IG723ENC_PARAMS
//
// Default parameter values for G723ENC instance objects
*/
extern IG723ENC_Params IG723ENC_PARAMS;

/*
// ===========================================================================
// IG723ENC_Fxns
//
// This structure defines all of the operations on G723ENC objects
*/
typedef struct IG723ENC_Fxns {
    IALG_Fxns	ialg;    /* IG723ENC extends IALG */
    XDAS_Void (*encode)(IG723ENC_Handle handle, XDAS_Int16 * ptrIn, XDAS_Int8 * ptrOut);
    XDAS_Void (*outframesize)(IG723ENC_Handle handle, XDAS_Int8 * ptrIn, XDAS_UInt32 *size);
} IG723ENC_Fxns;

#endif	/* IG723ENC_ */
