/*
//============================================================================
//
//    FILE NAME : G729ENC.h
//
//    ALGORITHM : G729ENC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This header defines the interface used by clients of the
//                G729ENC module
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

#ifndef G729ENC_
#define G729ENC_

#include <algrf.h>
#include <xdas.h>
#include "ig729enc.h"

/*
// ===========================================================================
// G729ENC_Handle
//
// This pointer is used to reference all G729ENC instance objects
*/
typedef struct IG729ENC_Obj *G729ENC_Handle;

/*
// ===========================================================================
// G729ENC_Params
//
// This structure defines the creation parameters for all G729ENC objects
*/
typedef IG729ENC_Params G729ENC_Params;

/*
// ===========================================================================
// G729ENC_PARAMS
//
// This structure defines the default creation parameters for G729ENC objects
*/
#define G729ENC_PARAMS   IG729ENC_PARAMS

/*
// ===========================================================================
// G729ENC_Status
//
// This structure defines the real-time parameters for G729ENC objects
*/
typedef struct IG729ENC_Status   G729ENC_Status;

/*
// ===========================================================================
// G729ENC_Cmd
//
// This typedef defines the control commands G729ENC objects
*/
typedef IG729ENC_Cmd   G729ENC_Cmd;

/*
// ===========================================================================
// control method commands
*/
#define G729ENC_GETSTATUS    IG729ENC_GETSTATUS
#define G729ENC_SETSTATUS    IG729ENC_SETSTATUS

/*
// ===========================================================================
// G729ENC_create
//
// Create an G729ENC instance object (using parameters specified by prms)
*/
extern G729ENC_Handle G729ENC_create(const IG729ENC_Fxns *fxns, const G729ENC_Params *prms);

/*
// ===========================================================================
// G729ENC_control
//
// Get, set, and change the parameters of the G729ENC function (using parameters specified by status).
*/
extern Int G729ENC_control(G729ENC_Handle handle, G729ENC_Cmd cmd, G729ENC_Status *status);

/*
// ===========================================================================
// G729ENC_delete
// Delete the G729ENC instance object specified by handle
*/
extern Void G729ENC_delete(G729ENC_Handle handle);

/*
// ===========================================================================
// G729ENC_apply
*/
extern XDAS_Int32 G729ENC_apply(G729ENC_Handle handle, XDAS_Int16 * in, XDAS_Int32 * out);

extern XDAS_Void G729ENC_bitToSerial(G729ENC_Handle handle, XDAS_Int32 * in, XDAS_Int16 * out);

#endif	/* G729ENC_ */
