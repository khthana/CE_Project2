/*
//============================================================================
//
//    FILE NAME : CPTGEN.h
//
//    ALGORITHM : CPTGEN
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This header defines the interface used by clients of the
//                CPTGEN module
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 1
//
//    Creation Date: Wed - 16 February 2005
//    Creation Time: 12:56 PM
//
//============================================================================
*/

#ifndef CPTGEN_
#define CPTGEN_

#include <alg.h>
#include <xdas.h>
#include "icptgen.h"

/*
// ===========================================================================
// CPTGEN_Handle
//
// This pointer is used to reference all CPTGEN instance objects
*/
typedef struct ICPTGEN_Obj *CPTGEN_Handle;

/*
// ===========================================================================
// CPTGEN_Params
//
// This structure defines the creation parameters for all CPTGEN objects
*/
typedef ICPTGEN_Params CPTGEN_Params;

/*
// ===========================================================================
// CPTGEN_PARAMS
//
// This structure defines the default creation parameters for CPTGEN objects
*/
#define CPTGEN_PARAMS   ICPTGEN_PARAMS

/*
// ===========================================================================
// CPTGEN_Status
//
// This structure defines the real-time parameters for CPTGEN objects
*/
typedef struct ICPTGEN_Status   CPTGEN_Status;

/*
// ===========================================================================
// CPTGEN_Cmd
//
// This typedef defines the control commands CPTGEN objects
*/
typedef ICPTGEN_Cmd   CPTGEN_Cmd;

/*
// ===========================================================================
// control method commands
*/
#define CPTGEN_GETSTATUS    ICPTGEN_GETSTATUS
#define CPTGEN_SETSTATUS    ICPTGEN_SETSTATUS

/*
// ===========================================================================
// CPTGEN_create
//
// Create an CPTGEN instance object (using parameters specified by prms)
*/
extern CPTGEN_Handle CPTGEN_create(const ICPTGEN_Fxns *fxns, const CPTGEN_Params *prms);

/*
// ===========================================================================
// CPTGEN_control
//
// Get, set, and change the parameters of the CPTGEN function (using parameters specified by status).
*/
extern Int CPTGEN_control(CPTGEN_Handle handle, CPTGEN_Cmd cmd, CPTGEN_Status *status);

/*
// ===========================================================================
// CPTGEN_delete
// Delete the CPTGEN instance object specified by handle
*/
extern Void CPTGEN_delete(CPTGEN_Handle handle);

/*
// ===========================================================================
// CPTGEN_apply
*/
extern CPTGEN_Result CPTGEN_apply(CPTGEN_Handle handle, XDAS_Int32 code, XDAS_Int32 amplitude, XDAS_Int32 * out);

#endif	/* CPTGEN_ */
