/*
//============================================================================
//
//    FILE NAME : G729ENC.c
//
//    ALGORITHM : G729ENC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This file implements all methods defined in G729ENC.h
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

#pragma CODE_SECTION(G729ENC_create,  ".text:create")
#pragma CODE_SECTION(G729ENC_control, ".text:control")
#pragma CODE_SECTION(G729ENC_delete,  ".text:delete")
#pragma CODE_SECTION(G729ENC_init,    ".text:init")
#pragma CODE_SECTION(G729ENC_exit,    ".text:exit")

#include <std.h>
#include <algrf.h>
#include <xdas.h>
#include "g729enc.h"

/*
// ===========================================================================
// G729ENC_create
//
//  Create an G729ENC instance object (using parameters specified by prms)
*/
G729ENC_Handle G729ENC_create(const IG729ENC_Fxns *fxns, const G729ENC_Params *prms)
{
    return ((G729ENC_Handle)ALGRF_create((IALG_Fxns *)fxns, NULL, (IALG_Params *)prms));
}

/*
// ===========================================================================
// G729ENC_control
//
// Function to either write to the read/write parameters in the status
// structure or to read all the parameters in the status structure.
*/
Int G729ENC_control(G729ENC_Handle handle, G729ENC_Cmd cmd, G729ENC_Status *status)
{
    return (ALGRF_control((IALG_Handle)handle, cmd, (IALG_Status *)status));
    
}

/*
// ===========================================================================
// G729ENC_delete
//
// Delete the G729ENC instance object specified by handle
*/
Void G729ENC_delete(G729ENC_Handle handle)
{
    ALGRF_delete((ALGRF_Handle)handle);
}

/*
// ===========================================================================
// G729ENC_init
//
// G729ENC module initialization
*/
Void  G729ENC_init(Void)
{
}

/*
// ===========================================================================
// G729ENC_exit
//
// G729ENC module finalization
*/
Void  G729ENC_exit(Void)
{
}

/*
// ===========================================================================
// G729ENC_apply
*/
XDAS_Int32 G729ENC_apply(G729ENC_Handle handle, XDAS_Int16 * in, XDAS_Int32 * out)
{
    XDAS_Int32 result;

    ALGRF_activate((ALGRF_Handle)handle);

    result = handle->fxns->apply(handle, in, out);

    ALGRF_deactivate((ALGRF_Handle)handle);

    return(result);
}

XDAS_Void G729ENC_bitToSerial(G729ENC_Handle handle,XDAS_Int32 * in, XDAS_Int16 * out){

	handle->fxns->bitToSerial(in,out);

}
