/*
//============================================================================
//
//    FILE NAME : _G729DEC.c
//
//    BLOCK NAME: G729DEC
//
//    GROUP NAME: Default Group
//
//    PURPOSE   : Provides the real-time block's DSP C source code.
//
//    Component Wizard for eXpressDSP Version 1.31.00 Auto-Generated Block
//
//    Number of Inputs : 0
//    Number of Outputs: 1
//
//    Creation Date: Mon - 15 November 2004
//    Creation Time: 10:42 PM
//
//============================================================================
*/

#include "_g729dec.h"

#pragma DATA_SECTION(Params, ".hyper:ignore")
PARAMS Params;

/*----------------------------------------------------------------------------*/
/*               Optional real-time block interrupt routine                   */
/*----------------------------------------------------------------------------*/
/* If this routine is activated, it will be called in response to a selected  */
/* DSP interrupt.  If this routine in not activated, the main block routine   */
/* will be called in response to a selected DSP interrupt.                    */
/*----------------------------------------------------------------------------*/
/*
void G729DEC_INT(PARAMS *pPtr)
{

}
*/


/*----------------------------------------------------------------------------*/
/*               Optional real-time block initialization routine              */
/*----------------------------------------------------------------------------*/
/* If this routine is activated, it will be called one time before the main   */
/* application begins.  This allows for any required software or hardware     */
/* initialization to be performed before the block executes.                  */
/*----------------------------------------------------------------------------*/

static IG729DEC_Fxns   fxns;
static G729DEC_Params  params;

void G729DEC_INIT(PARAMS *pPtr)
{
    fxns = G729DEC_KMITL_IG729DEC;
    params = G729DEC_PARAMS;

    params.framesizeOut0 = pPtr->FramesizeOut0;

    pPtr->handle = G729DEC_create(&fxns, &params);
}


/*----------------------------------------------------------------------------*/
/*                    Optional real-time block stop routine                   */
/*----------------------------------------------------------------------------*/
/* If this routine is activated, it will be called whenever the block diagram */
/* worksheet's execution is stopped.  Blocks that deal with hardware may need */
/* this routine to stop the hardware's execution.                             */
/*----------------------------------------------------------------------------*/
/*
void G729DEC_STOP(PARAMS *pPtr)
{

}
*/


/*----------------------------------------------------------------------------*/
/*                    Optional real-time block restart routine                */
/*----------------------------------------------------------------------------*/
/* If this routine is activated, it will be called whenever a block diagram   */
/* worksheet is executed after being stopped.  Blocks that deal with hardware */
/* may need this routine to restart the hardware's execution.                 */
/*----------------------------------------------------------------------------*/
/*
void G729DEC_RESTART(PARAMS *pPtr)
{

}
*/


/*----------------------------------------------------------------------------*/
/*                           Real-time block routine                          */
/*----------------------------------------------------------------------------*/
/* This is the main block routine.  It is called during each loop of the main */
/* application.  If an interrupt is selected, and the interrupt routine above */
/* is not activated, this routine will be called in response to the selected  */
/* interrupt instead of during the main application loop.                     */
/* Custom fields of the pPtr structure may be accessed as follows:            */
/*     pPtr->FramesizeOut0 = ...;                                             */
/*----------------------------------------------------------------------------*/
void G729DEC(PARAMS *pPtr)
{
    if(pPtr->handle){
        if(pPtr->Changed){
            G729DEC_Status	status;

            pPtr->Changed = FALSE;
            G729DEC_control(pPtr->handle, G729DEC_SETSTATUS, &status);
        }

        /* Call XDAIS algorithm specific routine(s) */
        /* For example: */
        //G729DEC_apply(pPtr->handle, (XDAS_Int16 *)pPtr->PtrOut0);
    }
}
