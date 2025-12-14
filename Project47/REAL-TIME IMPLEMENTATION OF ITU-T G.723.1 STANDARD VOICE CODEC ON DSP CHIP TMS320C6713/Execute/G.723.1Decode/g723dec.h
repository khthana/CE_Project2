/*
//============================================================================
//
//    FILE NAME : G723DEC.h
//
//    ALGORITHM : G723DEC
//
//    VENDOR    : NECTEC
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This header defines the interface used by clients of the
//                G723DEC module
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

#ifndef G723DEC_
#define G723DEC_

#include <algrf.h>
#include <xdas.h>
#include "ig723dec.h"

/*
// ===========================================================================
// G723DEC_Handle
//
// This pointer is used to reference all G723DEC instance objects
*/
typedef struct IG723DEC_Obj *G723DEC_Handle;

/*
// ===========================================================================
// G723DEC_Params
//
// This structure defines the creation parameters for all G723DEC objects
*/
typedef IG723DEC_Params G723DEC_Params;

/*
// ===========================================================================
// G723DEC_PARAMS
//
// This structure defines the default creation parameters for G723DEC objects
*/
#define G723DEC_PARAMS   IG723DEC_PARAMS

/*
// ===========================================================================
// G723DEC_Status
//
// This structure defines the real-time parameters for G723DEC objects
*/
typedef struct IG723DEC_Status   G723DEC_Status;

/*
// ===========================================================================
// G723DEC_Cmd
//
// This typedef defines the control commands G723DEC objects
*/
typedef IG723DEC_Cmd   G723DEC_Cmd;

/*
// ===========================================================================
// control method commands
*/
#define G723DEC_GETSTATUS    IG723DEC_GETSTATUS
#define G723DEC_SETSTATUS    IG723DEC_SETSTATUS

/*
// ===========================================================================
// G723DEC_create
//
// Create an G723DEC instance object (using parameters specified by prms)
*/
extern G723DEC_Handle G723DEC_create(const IG723DEC_Fxns *fxns, const G723DEC_Params *prms);

/*
// ===========================================================================
// G723DEC_control
//
// Get, set, and change the parameters of the G723DEC function (using parameters specified by status).
*/
extern Int G723DEC_control(G723DEC_Handle handle, G723DEC_Cmd cmd, G723DEC_Status *status);

/*
// ===========================================================================
// G723DEC_delete
// Delete the G723DEC instance object specified by handle
*/
extern Void G723DEC_delete(G723DEC_Handle handle);

/*
// ===========================================================================
// G723DEC_decode
*/
extern XDAS_Void G723DEC_decode(G723DEC_Handle handle, XDAS_Int8 * ptrIn, XDAS_Int16 * ptrOut);

/*
// ===========================================================================
// G723DEC_inframesize
*/
extern XDAS_Void G723DEC_inframesize(G723DEC_Handle handle, XDAS_Int8 * ptrIn, XDAS_UInt32 * size);

#endif	/* G723DEC_ */
