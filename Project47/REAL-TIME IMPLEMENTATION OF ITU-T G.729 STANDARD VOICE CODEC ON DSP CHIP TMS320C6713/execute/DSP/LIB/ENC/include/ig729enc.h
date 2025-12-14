/*
//============================================================================
//
//    FILE NAME : IG729ENC.h
//
//    ALGORITHM : G729ENC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : IG729ENC Interface Header
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

#ifndef IG729ENC_
#define IG729ENC_

#include <xdas.h>
#include <ialg.h>

/*User Include*/
//#include "structure.h"
//#include "tab_ld8k.h"
//#include "tabld8cp.h"
//#include "tab_dtx.h"

/*
// ===========================================================================
// IG729ENC_Handle
//
// This handle is used to reference all G729ENC instance objects
*/
typedef struct IG729ENC_Obj *IG729ENC_Handle;

/*
// ===========================================================================
// IG729ENC_Obj
//
// This structure must be the first field of all G729ENC instance objects
*/
typedef struct IG729ENC_Obj {
    struct IG729ENC_Fxns *fxns;
} IG729ENC_Obj;

/*
// ===========================================================================
// IG729ENC_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct IG729ENC_Status {
    Int             size;  /* must be first field of all status structures */
    XDAS_Bool       vadEnable;
    XDAS_Bool       annexC;
    XDAS_Bool       annexD;
    XDAS_Bool       annexE;
    XDAS_Bool		openloopOptimizeEnable;		
  	XDAS_Int16		numSearchRegion;
   /* TABLE fields for multichannel */
  //  G729_DTX_TABLEPTR   G729_DTX_TablePtr;
  //  G729_LD8K_TABLEPTR  G729_LD8K_TablePtr;
  //  G729_LD8CP_TABLEPTR G729_LD8CP_TablePtr;
    
} IG729ENC_Status;

/*
// ===========================================================================
// IG729ENC_Cmd
//
// The Cmd enumeration defines the control commands for the G729ENC
// control method.
*/
typedef enum IG729ENC_Cmd {
  IG729ENC_GETSTATUS,
  IG729ENC_SETSTATUS
} IG729ENC_Cmd;

/*
// ===========================================================================
// IG729ENC_Params
//
// This structure defines the creation parameters for all G729ENC objects
*/
typedef struct IG729ENC_Params {
    Int size;	  /* must be first field of all params structures */
    XDAS_Bool       vadEnable;
    XDAS_Bool       annexC;
    XDAS_Bool       annexD;
    XDAS_Bool       annexE;
    XDAS_Bool		openloopOptimizeEnable;		
  	XDAS_Int16		numSearchRegion;
    /* TABLE fields for multichannel */
  //  G729_DTX_TABLEPTR   G729_DTX_TablePtr;
  //  G729_LD8K_TABLEPTR  G729_LD8K_TablePtr;
  //  G729_LD8CP_TABLEPTR G729_LD8CP_TablePtr;
} IG729ENC_Params;

/*
// ===========================================================================
// IG729ENC_PARAMS
//
// Default parameter values for G729ENC instance objects
*/
extern IG729ENC_Params IG729ENC_PARAMS;

/*
// ===========================================================================
// IG729ENC_Fxns
//
// This structure defines all of the operations on G729ENC objects
*/
typedef struct IG729ENC_Fxns {
    IALG_Fxns	ialg;    /* IG729ENC extends IALG */
    XDAS_Int32 (*apply)(IG729ENC_Handle handle, XDAS_Int16 * in, XDAS_Int32 * out);
	XDAS_Void  (*bitToSerial)( XDAS_Int32 * in, XDAS_Int16 * out);
} IG729ENC_Fxns;

#endif	/* IG729ENC_ */
