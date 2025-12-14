/*
//============================================================================
//
//    FILE NAME : ICPTDETECT.h
//
//    ALGORITHM : CPTDETECT
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : ICPTDETECT Interface Header
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

#ifndef ICPTDETECT_
#define ICPTDETECT_

#include <xdas.h>
#include <ialg.h>

//============================================================================
//===========================DETECT PARAM=====================================
//============================================================================
typedef struct CPT_DetectParam
{
	int *data;	
	unsigned int CntS;
	unsigned int CntZ;
	unsigned int InterruptCntS;
	unsigned int state;
	short PrevData[200];
	unsigned short isDetected;
	unsigned short isRejected;
	unsigned int result;
	int power;
	int CountPrev;
	/////use for Confirmation Tone and reject signal in state is not in START state////
	unsigned short isConfirmation;	//for confirmation only
	unsigned short isSecondDetect;
	unsigned short isSecondReject;
	int SecondPower;
	unsigned short SecondResult;
	
	unsigned short StartKeep;
	unsigned short FirstStart;
	///////////////////////////////////////
} CPT_DetectParam;

// ==========================CPTDETECT_Result=================================
typedef struct CPTDETECT_Result
{
	unsigned short isDetected;
	unsigned short isRejected;
	unsigned int result;
	
	unsigned short isConfirmation;	//for confirmation only
	unsigned short isSecondDetect;
	unsigned short isSecondReject;
	unsigned short SecondResult;
} CPTDETECT_Result;

/*
// ===========================================================================
// ICPTDETECT_Handle
//
// This handle is used to reference all CPTDETECT instance objects
*/
typedef struct ICPTDETECT_Obj *ICPTDETECT_Handle;

/*
// ===========================================================================
// ICPTDETECT_Obj
//
// This structure must be the first field of all CPTDETECT instance objects
*/
typedef struct ICPTDETECT_Obj {
    struct ICPTDETECT_Fxns *fxns;
} ICPTDETECT_Obj;

/*
// ===========================================================================
// ICPTDETECT_Status
//
// Status structure defines the parameters that can be changed or read
// during real-time operation of the alogrithm.
*/
typedef struct ICPTDETECT_Status {
    Int             size;  /* must be first field of all status structures */
} ICPTDETECT_Status;

/*
// ===========================================================================
// ICPTDETECT_Cmd
//
// The Cmd enumeration defines the control commands for the CPTDETECT
// control method.
*/
typedef enum ICPTDETECT_Cmd {
  ICPTDETECT_GETSTATUS,
  ICPTDETECT_SETSTATUS
} ICPTDETECT_Cmd;

/*
// ===========================================================================
// ICPTDETECT_Params
//
// This structure defines the creation parameters for all CPTDETECT objects
*/
typedef struct ICPTDETECT_Params {
    Int size;	  /* must be first field of all params structures */
    XDAS_UInt32     framesizeIn0;
} ICPTDETECT_Params;

/*
// ===========================================================================
// ICPTDETECT_PARAMS
//
// Default parameter values for CPTDETECT instance objects
*/
extern ICPTDETECT_Params ICPTDETECT_PARAMS;
/*
// ===========================================================================
// ICPTDETECT_Fxns
//
// This structure defines all of the operations on CPTDETECT objects
*/
typedef struct ICPTDETECT_Fxns {
    IALG_Fxns	ialg;    /* ICPTDETECT extends IALG */
    CPTDETECT_Result (*apply)(ICPTDETECT_Handle handle, XDAS_Int32 * in);
} ICPTDETECT_Fxns;

#endif	/* ICPTDETECT_ */
