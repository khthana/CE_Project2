/*
//============================================================================
//
//    FILE NAME : G729DEC.c
//
//    ALGORITHM : G729DEC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This file implements all methods defined in G729DEC.h
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

#pragma CODE_SECTION(G729DEC_create,  ".text:create")
#pragma CODE_SECTION(G729DEC_control, ".text:control")
#pragma CODE_SECTION(G729DEC_delete,  ".text:delete")
#pragma CODE_SECTION(G729DEC_init,    ".text:init")
#pragma CODE_SECTION(G729DEC_exit,    ".text:exit")

#include <std.h>
#include <xdas.h>
#include "g729dec.h"

/*
// ===========================================================================
// G729DEC_create
//
//  Create an G729DEC instance object (using parameters specified by prms)
*/
G729DEC_Handle G729DEC_create(const IG729DEC_Fxns *fxns, const G729DEC_Params *prms)
{
    return ((G729DEC_Handle)ALGRF_create((IALG_Fxns *)fxns, NULL, (IALG_Params *)prms));
}

/*
// ===========================================================================
// G729DEC_control
//
// Function to either write to the read/write parameters in the status
// structure or to read all the parameters in the status structure.
*/
Int G729DEC_control(G729DEC_Handle handle, G729DEC_Cmd cmd, G729DEC_Status *status)
{
    return (ALGRF_control((IALG_Handle)handle, cmd, (IALG_Status *)status));
}

/*
// ===========================================================================
// G729DEC_delete
//
// Delete the G729DEC instance object specified by handle
*/
Void G729DEC_delete(G729DEC_Handle handle)
{
    ALGRF_delete((ALGRF_Handle)handle);
}

/*
// ===========================================================================
// G729DEC_init
//
// G729DEC module initialization
*/
Void  G729DEC_init(Void)
{
}

/*
// ===========================================================================
// G729DEC_exit
//
// G729DEC module finalization
*/
Void  G729DEC_exit(Void)
{
}

/*
// ===========================================================================
// G729DEC_apply
*/
XDAS_Void G729DEC_apply(G729DEC_Handle handle, XDAS_Int32 * parm, XDAS_Int16 * out ,XDAS_Int32 serial_size)
{
    ALGRF_activate((ALGRF_Handle)handle);

    handle->fxns->apply(handle, parm, out , serial_size);

    ALGRF_deactivate((ALGRF_Handle)handle);
}

// ===========================================================================
// G729DEC_apply

XDAS_Void G729DEC_bits2prm_ld8c(G729DEC_Handle handle, XDAS_Int16 * serial , XDAS_Int32 * parm)
{
	handle->fxns->bits2prm_ld8c(handle,serial, parm);
}
