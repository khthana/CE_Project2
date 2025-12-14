/*
//============================================================================
//
//    FILE NAME : G723ENC.h
//
//    ALGORITHM : G723ENC
//
//    VENDOR    : NECTEC
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This header defines the interface used by clients of the
//                G723ENC module
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

#ifndef G723ENC_
#define G723ENC_

#include <algrf.h>
#include <xdas.h>
#include "ig723enc.h"

/*
// ===========================================================================
// G723ENC_Handle
//
// This pointer is used to reference all G723ENC instance objects
*/
typedef struct IG723ENC_Obj *G723ENC_Handle;

/*
// ===========================================================================
// G723ENC_Params
//
// This structure defines the creation parameters for all G723ENC objects
*/
typedef IG723ENC_Params G723ENC_Params;

/*
// ===========================================================================
// G723ENC_PARAMS
//
// This structure defines the default creation parameters for G723ENC objects
*/
#define G723ENC_PARAMS   IG723ENC_PARAMS

/*
// ===========================================================================
// G723ENC_Status
//
// This structure defines the real-time parameters for G723ENC objects
*/
typedef struct IG723ENC_Status   G723ENC_Status;

/*
// ===========================================================================
// G723ENC_Cmd
//
// This typedef defines the control commands G723ENC objects
*/
typedef IG723ENC_Cmd   G723ENC_Cmd;

/*
// ===========================================================================
// control method commands
*/
#define G723ENC_GETSTATUS    IG723ENC_GETSTATUS
#define G723ENC_SETSTATUS    IG723ENC_SETSTATUS

/*
// ===========================================================================
// G723ENC_create
//
// Create an G723ENC instance object (using parameters specified by prms)
*/
extern G723ENC_Handle G723ENC_create(const IG723ENC_Fxns *fxns, const G723ENC_Params *prms);

/*
// ===========================================================================
// G723ENC_control
//
// Get, set, and change the parameters of the G723ENC function (using parameters specified by status).
*/
extern Int G723ENC_control(G723ENC_Handle handle, G723ENC_Cmd cmd, G723ENC_Status *status);

/*
// ===========================================================================
// G723ENC_delete
// Delete the G723ENC instance object specified by handle
*/
extern Void G723ENC_delete(G723ENC_Handle handle);

extern Void G723ENC_outframesize(G723ENC_Handle handle, XDAS_Int8 * ptrIn, XDAS_UInt32 *size);

/*
// ===========================================================================
// G723ENC_encode
*/
extern XDAS_Void G723ENC_encode(G723ENC_Handle handle, XDAS_Int16 * ptrIn, XDAS_Int8 * ptrOut);

#endif	/* G723ENC_ */
