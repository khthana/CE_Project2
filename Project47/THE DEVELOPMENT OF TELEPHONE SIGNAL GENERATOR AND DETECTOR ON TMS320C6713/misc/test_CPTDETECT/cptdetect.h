/*
//============================================================================
//
//    FILE NAME : CPTDETECT.h
//
//    ALGORITHM : CPTDETECT
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This header defines the interface used by clients of the
//                CPTDETECT module
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 1
//    Number of Outputs: 0
//
//    Creation Date: Thu - 17 February 2005
//    Creation Time: 01:32 PM
//
//============================================================================
*/

#ifndef CPTDETECT_
#define CPTDETECT_

#include <alg.h>
#include <xdas.h>
#include "icptdetect.h"

/*
// ===========================================================================
// CPTDETECT_Handle
//
// This pointer is used to reference all CPTDETECT instance objects
*/
typedef struct ICPTDETECT_Obj *CPTDETECT_Handle;

/*
// ===========================================================================
// CPTDETECT_Params
//
// This structure defines the creation parameters for all CPTDETECT objects
*/
typedef ICPTDETECT_Params CPTDETECT_Params;

/*
// ===========================================================================
// CPTDETECT_PARAMS
//
// This structure defines the default creation parameters for CPTDETECT objects
*/
#define CPTDETECT_PARAMS   ICPTDETECT_PARAMS

/*
// ===========================================================================
// CPTDETECT_Status
//
// This structure defines the real-time parameters for CPTDETECT objects
*/
typedef struct ICPTDETECT_Status   CPTDETECT_Status;

/*
// ===========================================================================
// CPTDETECT_Cmd
//
// This typedef defines the control commands CPTDETECT objects
*/
typedef ICPTDETECT_Cmd   CPTDETECT_Cmd;

/*
// ===========================================================================
// control method commands
*/
#define CPTDETECT_GETSTATUS    ICPTDETECT_GETSTATUS
#define CPTDETECT_SETSTATUS    ICPTDETECT_SETSTATUS

/*
// ===========================================================================
// CPTDETECT_create
//
// Create an CPTDETECT instance object (using parameters specified by prms)
*/
extern CPTDETECT_Handle CPTDETECT_create(const ICPTDETECT_Fxns *fxns, const CPTDETECT_Params *prms);

/*
// ===========================================================================
// CPTDETECT_control
//
// Get, set, and change the parameters of the CPTDETECT function (using parameters specified by status).
*/
extern Int CPTDETECT_control(CPTDETECT_Handle handle, CPTDETECT_Cmd cmd, CPTDETECT_Status *status);

/*
// ===========================================================================
// CPTDETECT_delete
// Delete the CPTDETECT instance object specified by handle
*/
extern Void CPTDETECT_delete(CPTDETECT_Handle handle);

/*
// ===========================================================================
// CPTDETECT_apply
*/
extern CPTDETECT_Result CPTDETECT_apply(CPTDETECT_Handle handle, XDAS_Int32 * in);

#endif	/* CPTDETECT_ */
