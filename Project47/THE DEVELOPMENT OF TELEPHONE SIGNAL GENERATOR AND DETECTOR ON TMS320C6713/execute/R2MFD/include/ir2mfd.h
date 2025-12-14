/*
//============================================================================
//
//    FILE NAME : IR2MFD.h
//
//    ALGORITHM : R2MFD
//
//    VENDOR    : KASATKA
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IR2MFD Interface Header
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Component
//
//    Number of Inputs : 0
//    Number of Outputs: 0
//
//    Creation Date: Tue - 04 January 2005
//    Creation Time: 09:23 PM
//
//============================================================================
*/

#ifndef IR2MFD_
#define IR2MFD_

#include <xdas.h>
#include <ialg.h>

#include <r2mfd_mblk.h>

/*
// ===========================================================================
// IR2MFD_Handle
//
// This handle is used to reference all R2MFD instance objects
*/
typedef struct IR2MFD_Obj *IR2MFD_Handle;

/*
// ===========================================================================
// IR2MFD_Obj
//
// This structure must be the first field of all R2MFD instance objects
*/
typedef struct IR2MFD_Obj {
    struct IR2MFD_Fxns *fxns;
} IR2MFD_Obj;

/*
// ===========================================================================
// IR2MFD_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IR2MFD_Status {
    Int             size;  /* must be first field of all status structures */
} IR2MFD_Status;

/*
// ===========================================================================
// IR2MFD_Cmd
//
// The Cmd enumeration defines the control commands for the R2MFD
// control method.
*/
typedef enum IR2MFD_Cmd {
  IR2MFD_GETSTATUS,
  IR2MFD_SETSTATUS
} IR2MFD_Cmd;

/*
// ===========================================================================
// IR2MFD_Params
//
// This structure defines the creation parameters for all R2MFD objects
*/
typedef struct IR2MFD_Params {
    Int size;	  /* must be first field of all params structures */
    
    R2MFD_KONST *ptr2konst;			// pointer to konst struct   
          
} IR2MFD_Params;

/*
// ===========================================================================
// IR2MFD_PARAMS
//
// Default parameter values for R2MFD instance objects
*/
extern IR2MFD_Params IR2MFD_PARAMS;

/*
// ===========================================================================
// IR2MFD_Fxns
//
// This structure defines all of the operations on R2MFD objects
*/
typedef struct IR2MFD_Fxns {
    IALG_Fxns	ialg;    /* IR2MFD extends IALG */
    XDAS_Void (*apply)(IR2MFD_Handle handle, MdInt * samp, MdInt * result);
} IR2MFD_Fxns;

#endif	/* IR2MFD_ */
