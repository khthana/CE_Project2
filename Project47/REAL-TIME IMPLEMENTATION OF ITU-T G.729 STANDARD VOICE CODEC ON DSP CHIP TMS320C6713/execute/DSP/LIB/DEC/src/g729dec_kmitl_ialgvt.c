/*
//============================================================================
//
//    FILE NAME : G729DEC_KMITL_ialgvt.c
//
//    ALGORITHM : G729DEC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This file contains the function table definitions for
//                all interfaces implemented by the G729DEC_KMITL module
//                that derive from IALG
//
//                You are free to replace these tables with different
//                definitions.  For example, one may want to build a
//                system where the algorithm is activated once and never
//                deactivated, moved, or freed.
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

#include <std.h>
#include "ig729dec.h"

#include "g729dec_kmitl.h"

extern Int  G729DEC_KMITL_alloc(const IALG_Params *, struct IALG_Fxns **, IALG_MemRec *);
extern Int  G729DEC_KMITL_control(IALG_Handle, IALG_Cmd, IALG_Status *);
extern Int  G729DEC_KMITL_free(IALG_Handle, IALG_MemRec *);
extern Int  G729DEC_KMITL_initObj(IALG_Handle, const IALG_MemRec *, IALG_Handle, const IALG_Params *);
extern Int  G729DEC_KMITL_numAlloc(Void);
/*
// The G729DEC_KMITL_moved routine is only used if the G729DEC_KMITL_alloc routine
// returns more than one valid IALG_MemRec structure.
extern Void G729DEC_KMITL_moved(IALG_Handle, const IALG_MemRec *, IALG_Handle, const IALG_Params *);
*/

// The G729DEC_KMITL_activate & G729DEC_KMITL_deactivate routines are
// only used if scratch memory is being used.
extern Void G729DEC_KMITL_activate(IALG_Handle);
extern Void G729DEC_KMITL_deactivate(IALG_Handle);

extern XDAS_Void G729DEC_KMITL_apply(IG729DEC_Handle handle, XDAS_Int32 * parm, XDAS_Int16 * out,XDAS_Int32 serial_size);
extern XDAS_Void G729DEC_KMITL_bits2prm_ld8c(IG729DEC_Handle handle, XDAS_Int16 * serial, XDAS_Int32 * parm);
#define IALGFXNS \
    &G729DEC_KMITL_IALG,       /* module ID                            */ \
    G729DEC_KMITL_activate,                      /* activate   (NULL => not suported)    */ \
    G729DEC_KMITL_alloc,       /* algAlloc                             */ \
    G729DEC_KMITL_control,     /* control    (NULL => not suported)    */ \
    G729DEC_KMITL_deactivate,                      /* deactivate (NULL => not suported)    */ \
    G729DEC_KMITL_free,        /* free                                 */ \
    G729DEC_KMITL_initObj,     /* init                                 */ \
    NULL,                      /* moved      (NULL => not suported)    */ \
    G729DEC_KMITL_numAlloc                       /* numAlloc   (NULL => IALG_DEFMEMRECS) */ \

/*
//============================================================================
// G729DEC_KMITL_IG729DEC
//
// This structure defines KMITL's implementation of the IG729DEC interface
// for the G729DEC_KMITL module.
*/
IG729DEC_Fxns G729DEC_KMITL_IG729DEC = {	/* module_vendor_interface */
    IALGFXNS,
    G729DEC_KMITL_apply,
    G729DEC_KMITL_bits2prm_ld8c,
};

/*
//============================================================================
// G729DEC_KMITL_IALG
//
// This structure defines KMITL's implementation of the IALG interface
// for the G729DEC_KMITL module.
*/
#ifdef _TI_
asm("_G729DEC_KMITL_IALG .set _G729DEC_KMITL_IG729DEC");
#else
/*
//============================================================================
// The structure is duplicated here to allow this code to be compiled
// and run on non-DSP platforms at the expense of unnecessary data space
// consumed by the definition below.
*/
IALG_Fxns G729DEC_KMITL_IALG = {	/* module_vendor_interface */
    IALGFXNS
};
#endif
