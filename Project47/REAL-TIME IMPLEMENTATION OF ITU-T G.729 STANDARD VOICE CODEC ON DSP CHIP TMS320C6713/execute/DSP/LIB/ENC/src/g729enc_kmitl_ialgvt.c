/*
//============================================================================
//
//    FILE NAME : G729ENC_KMITL_ialgvt.c
//
//    ALGORITHM : G729ENC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : This file contains the function table definitions for
//                all interfaces implemented by the G729ENC_KMITL module
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
//    Number of Outputs: 0
//
//    Creation Date: Wed - 10 November 2004
//    Creation Time: 01:42 AM
//
//============================================================================
*/

#include <std.h>
#include "ig729enc.h"

#include "g729enc_kmitl.h"

extern Int  G729ENC_KMITL_alloc(const IALG_Params *, struct IALG_Fxns **, IALG_MemRec *);
extern Int  G729ENC_KMITL_control(IALG_Handle, IALG_Cmd, IALG_Status *);
extern Int  G729ENC_KMITL_free(IALG_Handle, IALG_MemRec *);
extern Int  G729ENC_KMITL_initObj(IALG_Handle, const IALG_MemRec *, IALG_Handle, const IALG_Params *);
extern Int  G729ENC_KMITL_numAlloc(Void);

// The G729ENC_KMITL_moved routine is only used if the G729ENC_KMITL_alloc routine
// returns more than one valid IALG_MemRec structure.
extern Void G729ENC_KMITL_moved(IALG_Handle, const IALG_MemRec *, IALG_Handle, const IALG_Params *);


// The G729ENC_KMITL_activate & G729ENC_KMITL_deactivate routines are
// only used if scratch memory is being used.
extern Void G729ENC_KMITL_activate(IALG_Handle);
extern Void G729ENC_KMITL_deactivate(IALG_Handle);

extern XDAS_Int32 G729ENC_KMITL_apply(IG729ENC_Handle handle, XDAS_Int16 * in, XDAS_Int32 * out);
extern XDAS_Void  G729ENC_KMITL_bitToSerial(XDAS_Int32 * in, XDAS_Int16 * out);

#define IALGFXNS \
    &G729ENC_KMITL_IALG,       /* module ID                            */ \
    G729ENC_KMITL_activate,    /* activate   (NULL => not suported)    */ \
    G729ENC_KMITL_alloc,       /* algAlloc                             */ \
    G729ENC_KMITL_control,     /* control    (NULL => not suported)    */ \
    G729ENC_KMITL_deactivate,  /* deactivate (NULL => not suported)    */ \
    G729ENC_KMITL_free,        /* free                                 */ \
    G729ENC_KMITL_initObj,     /* init                                 */ \
    G729ENC_KMITL_moved ,      /* moved      (NULL => not suported)    */ \
    G729ENC_KMITL_numAlloc     /* numAlloc   (NULL => IALG_DEFMEMRECS) */ \

/*
//============================================================================
// G729ENC_KMITL_IG729ENC
//
// This structure defines KMITL's implementation of the IG729ENC interface
// for the G729ENC_KMITL module.
*/
IG729ENC_Fxns G729ENC_KMITL_IG729ENC = {	/* module_vendor_interface */
    IALGFXNS,
    G729ENC_KMITL_apply,
    G729ENC_KMITL_bitToSerial,
};

/*
//============================================================================
// G729ENC_KMITL_IALG
//
// This structure defines KMITL's implementation of the IALG interface
// for the G729ENC_KMITL module.
*/
#ifdef _TI_
asm("_G729ENC_KMITL_IALG .set _G729ENC_KMITL_IG729ENC");
#else
/*
//============================================================================
// The structure is duplicated here to allow this code to be compiled
// and run on non-DSP platforms at the expense of unnecessary data space
// consumed by the definition below.
*/
IALG_Fxns G729ENC_KMITL_IALG = {	/* module_vendor_interface */
    IALGFXNS
};
#endif
