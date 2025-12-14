/*
//============================================================================
//
//    FILE NAME : G729DEC.h
//
//    ALGORITHM : G729DEC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This header defines the interface used by clients of the
//                G729DEC module
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

#ifndef G729DEC_
#define G729DEC_

#include <algrf.h>
#include <xdas.h>
#include "ig729dec.h"

/*
// ===========================================================================
// G729DEC_Handle
//
// This pointer is used to reference all G729DEC instance objects
*/
typedef struct IG729DEC_Obj *G729DEC_Handle;

/*
// ===========================================================================
// G729DEC_Params
//
// This structure defines the creation parameters for all G729DEC objects
*/
typedef IG729DEC_Params G729DEC_Params;

/*
// ===========================================================================
// G729DEC_PARAMS
//
// This structure defines the default creation parameters for G729DEC objects
*/
#define G729DEC_PARAMS   IG729DEC_PARAMS

/*
// ===========================================================================
// G729DEC_Status
//
// This structure defines the real-time parameters for G729DEC objects
*/
typedef struct IG729DEC_Status   G729DEC_Status;

/*
// ===========================================================================
// G729DEC_Cmd
//
// This typedef defines the control commands G729DEC objects
*/
typedef IG729DEC_Cmd   G729DEC_Cmd;

/*
// ===========================================================================
// control method commands
*/
#define G729DEC_GETSTATUS    IG729DEC_GETSTATUS
#define G729DEC_SETSTATUS    IG729DEC_SETSTATUS

/*
// ===========================================================================
// G729DEC_create
//
// Create an G729DEC instance object (using parameters specified by prms)
*/
extern G729DEC_Handle G729DEC_create(const IG729DEC_Fxns *fxns, const G729DEC_Params *prms);

/*
// ===========================================================================
// G729DEC_control
//
// Get, set, and change the parameters of the G729DEC function (using parameters specified by status).
*/
extern Int G729DEC_control(G729DEC_Handle handle, G729DEC_Cmd cmd, G729DEC_Status *status);

/*
// ===========================================================================
// G729DEC_delete
// Delete the G729DEC instance object specified by handle
*/
extern Void G729DEC_delete(G729DEC_Handle handle);

/*
// ===========================================================================
// G729DEC_apply
*/
extern XDAS_Void G729DEC_apply(G729DEC_Handle handle, XDAS_Int32 * parm, XDAS_Int16 * out,XDAS_Int32 serial_size);
/*
// ===========================================================================
// G729DEC_bits2prm_ld8c
*/
extern XDAS_Void G729DEC_bits2prm_ld8c(G729DEC_Handle handle, XDAS_Int16 * serial , XDAS_Int32 * parm);

#endif	/* G729DEC_ */
