/*
//============================================================================
//
//    FILE NAME : ICPTGEN.h
//
//    ALGORITHM : CPTGEN
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : ICPTGEN Interface Header
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

#ifndef ICPTGEN_
#define ICPTGEN_

#include <xdas.h>
#include <ialg.h>

/*
// ===========================================================================
// ICPTGEN_Handle
//
// This handle is used to reference all CPTGEN instance objects
*/
typedef struct ICPTGEN_Obj *ICPTGEN_Handle;

/*
// ===========================================================================
// ICPTGEN_Obj
//
// This structure must be the first field of all CPTGEN instance objects
*/
typedef struct ICPTGEN_Obj {
    struct ICPTGEN_Fxns *fxns;
} ICPTGEN_Obj;

/*
// ===========================================================================
// ICPTGEN_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct ICPTGEN_Status {
    Int             size;  /* must be first field of all status structures */
} ICPTGEN_Status;

/*
// ===========================================================================
// ICPTGEN_Cmd
//
// The Cmd enumeration defines the control commands for the CPTGEN
// control method.
*/
typedef enum ICPTGEN_Cmd {
  ICPTGEN_GETSTATUS,
  ICPTGEN_SETSTATUS
} ICPTGEN_Cmd;

/*
// ===========================================================================
// ICPTGEN_Params
//
// This structure defines the creation parameters for all CPTGEN objects
*/
typedef struct ICPTGEN_Params {
    Int size;	  /* must be first field of all params structures */
    XDAS_UInt32     framesizeOut0;
    const XDAS_Int32 *sinTable;
} ICPTGEN_Params;

/*
// ===========================================================================
// ICPTGEN_PARAMS
//
// Default parameter values for CPTGEN instance objects
*/
extern ICPTGEN_Params ICPTGEN_PARAMS;


// ===========================================================================
// CPTGEN_Result for Apply Function

typedef struct CPTGEN_Result {
	XDAS_Int32 code;
	XDAS_Int32 amplitude;
	XDAS_Bool  Complete;
} CPTGEN_Result;
/*
// ===========================================================================
// ICPTGEN_Fxns
//
// This structure defines all of the operations on CPTGEN objects
*/
typedef struct ICPTGEN_Fxns {
    IALG_Fxns	ialg;    /* ICPTGEN extends IALG */
    CPTGEN_Result (*apply)(ICPTGEN_Handle handle, XDAS_Int32 code, XDAS_Int32 amplitude, XDAS_Int32 * out);
} ICPTGEN_Fxns;

//=====================================================================
//for keep state of generation algorithm
typedef struct CPT_GenParam
{
	int *data;
	unsigned char state;			//1 = tone, 0 = pause
	unsigned int  SampRate;
	int code;
	int amplitude;					//1.0 scale to 100
	unsigned int  StartSample;		//Start Sample of this call
	unsigned int  step1;
	unsigned int  step2;
	unsigned char full;				//1 = full data in data[GEN_LENGTH]
	unsigned char completeCycle;	//1 = completed cycle
	unsigned int  count;
	unsigned int  frameSize;		//number of sample per 1 call
	const int *SinTable;
} CPT_GenParam;

#endif	/* ICPTGEN_ */
