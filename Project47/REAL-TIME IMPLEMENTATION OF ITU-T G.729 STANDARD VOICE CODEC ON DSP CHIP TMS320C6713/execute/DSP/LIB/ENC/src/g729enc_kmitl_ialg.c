/*
//============================================================================
//
//    FILE NAME : G729ENC_KMITL_ialg.c
//
//    ALGORITHM : G729ENC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Implementation of the G729ENC_KMITL.h interface; KMITL's
//                implementation of the IG729ENC interface.
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

#pragma CODE_SECTION(G729ENC_KMITL_alloc,      ".text:algrfAlloc")
#pragma CODE_SECTION(G729ENC_KMITL_free,       ".text:algrfFree")
#pragma CODE_SECTION(G729ENC_KMITL_initObj,    ".text:algrfInit")
#pragma CODE_SECTION(G729ENC_KMITL_control,    ".text:algrfControl")
#pragma CODE_SECTION(G729ENC_KMITL_init,       ".text:init")
#pragma CODE_SECTION(G729ENC_KMITL_exit,       ".text:exit")

// The G729ENC_KMITL_moved routine is only used if the G729ENC_KMITL_alloc routine
// returns more than one valid IALG_MemRec structure.
#pragma CODE_SECTION(G729ENC_KMITL_moved,      ".text:algrfMoved")


// The G729ENC_KMITL_activate & G729ENC_KMITL_deactivate routines are
// only used if scratch memory is being used.
#pragma CODE_SECTION(G729ENC_KMITL_activate,   ".text:algrfActivate")
#pragma CODE_SECTION(G729ENC_KMITL_deactivate, ".text:algrfDeactivate")


#include <std.h>
#include <limits.h>
#include "ig729enc.h"
#include "g729enc_kmitl.h"

#include "structure.h"
//#include "tab_ld8k.h"
//#include "tabld8cp.h"
//#include "tab_dtx.h"

#define MTAB_NRECS 21


/*
//============================================================================
// G729ENC_KMITL_Obj
*/
typedef struct G729ENC_KMITL_Obj {
    IALG_Obj        alg;   /* MUST be first field of all G729ENC objs */
    XDAS_Bool       vadEnable;
    XDAS_Bool       annexC;
    XDAS_Bool       annexD;
    XDAS_Bool       annexE;
    XDAS_Bool		openloopOptimizeEnable;		
    XDAS_Int16		numSearchRegion;
    
    /* TODO: add custom fields here */
    ENCODER_G729_MEM_BLK  *workBuf;
    ENCODER_G729_MEM_BLK  *history;
    
    /* TABLE fields for multichannel */
  /*  G729_DTX_TABLE   G729_DTX_TablePtr;
    G729_LD8K_TABLE  G729_LD8K_TablePtr;
    G729_LD8CP_TABLE G729_LD8CP_TablePtr;
  */  
    
} G729ENC_KMITL_Obj;



/*
//============================================================================
// G729ENC_KMITL_activate
//
// Activate our object; e.g., initialize any scratch memory required
// by the G729ENC_KMITL processing methods.
*/

// The G729ENC_KMITL_activate & G729ENC_KMITL_deactivate routines are
// only used if scratch memory is being used.
Void G729ENC_KMITL_activate(IALG_Handle handle)
{
    G729ENC_KMITL_Obj *G729ENC = (Void *)handle;
    
    // TODO: implement algActivate
    
    /* copy saved history to working buffer */
	memcpy((Void *)G729ENC->workBuf->acelp_cp_d4i40_17_handle, (Void *)G729ENC->history->acelp_cp_d4i40_17_handle,
	sizeof(acelp_cp_d4i40_17_mblk));

	memcpy((Void *)G729ENC->workBuf->bwfwfunc_handle , (Void *)G729ENC->history->bwfwfunc_handle ,
	sizeof(bwfwfunc_mblk));

	memcpy((Void *)G729ENC->workBuf->cod_cng_handle , (Void *)G729ENC->history->cod_cng_handle ,
	sizeof(cod_cng_mblk));

	memcpy((Void *)G729ENC->workBuf->coder_handle  , (Void *)G729ENC->history->coder_handle  ,
	sizeof(coderMemBlk));
	
	memcpy((Void *)G729ENC->workBuf->exc_err_handle , (Void *)G729ENC->history->exc_err_handle ,
	sizeof(exc_err_mblk));

	memcpy((Void *)G729ENC->workBuf->phdisp_handle , (Void *)G729ENC->history->phdisp_handle ,
	sizeof(phdisp_mblk));
	
	memcpy((Void *)G729ENC->workBuf->preProc_handle , (Void *)G729ENC->history->preProc_handle,
	sizeof(preProcMemBlk));

	memcpy((Void *)G729ENC->workBuf->pwf_handle  , (Void *)G729ENC->history->pwf_handle ,
	sizeof(pwf_mblk));
	
	memcpy((Void *)G729ENC->workBuf->q_gaincp_handle , (Void *)G729ENC->history->q_gaincp_handle ,
	sizeof(q_gaincp_mblk));

	memcpy((Void *)G729ENC->workBuf->vad_handle  , (Void *)G729ENC->history->vad_handle ,
	sizeof(vad_mblk));
}




/*
//============================================================================
// G729ENC_KMITL_alloc
//
// Return a table of memory descriptors that describe the memory needed 
// to construct a G729ENC_KMITL_Obj structure.
*/
Int G729ENC_KMITL_alloc(const IALG_Params *G729ENCParams, IALG_Fxns **fxns, IALG_MemRec memTab[])
{
    const IG729ENC_Params *params = (Void *)G729ENCParams;

    /* TODO: implement algAlloc */
    
    if (params == NULL) {
        params = &IG729ENC_PARAMS;  /* set default parameters */
    }
	
	 /* Request memory for G729ENC object */
    memTab[0].size = sizeof(G729ENC_KMITL_Obj);
    memTab[0].alignment = (0 * 8) / CHAR_BIT;
    memTab[0].space = IALG_EXTERNAL;
    memTab[0].attrs = IALG_PERSIST;
    
	/*************** WORK BUFFER ******************/
       
    /* G729 Implementation coderMemBlk */
    memTab[1].size = sizeof(coderMemBlk);
    memTab[1].alignment = (0 * 8) / CHAR_BIT;
    memTab[1].space = IALG_DARAM0;
    memTab[1].attrs = IALG_SCRATCH;
    
       /* G729 Implementation preProcMemBlk */
    memTab[2].size = sizeof(preProcMemBlk);
    memTab[2].alignment = (0 * 8) / CHAR_BIT;
    memTab[2].space = IALG_DARAM0;
    memTab[2].attrs = IALG_SCRATCH;
    
       /* G729 Implementation exc_err_mblk */
    memTab[3].size = sizeof(exc_err_mblk);
    memTab[3].alignment = (0 * 8) / CHAR_BIT;
    memTab[3].space = IALG_DARAM0;
    memTab[3].attrs = IALG_SCRATCH;
    
       /* G729 Implementation vad_mblk*/
    memTab[4].size = sizeof(vad_mblk);
    memTab[4].alignment = (0 * 8) / CHAR_BIT;
    memTab[4].space = IALG_DARAM0;
    memTab[4].attrs = IALG_SCRATCH;
    
       /* G729 Implementation cod_cng_mblk*/
    memTab[5].size = sizeof(cod_cng_mblk);
    memTab[5].alignment = (0 * 8) / CHAR_BIT;
    memTab[5].space = IALG_DARAM0;
    memTab[5].attrs = IALG_SCRATCH;
    
       /* G729 Implementation bwfwfunc_mblk */
    memTab[6].size = sizeof(bwfwfunc_mblk);
    memTab[6].alignment = (0 * 8) / CHAR_BIT;
    memTab[6].space = IALG_DARAM0;
    memTab[6].attrs = IALG_SCRATCH;
    
           /* G729 Implementation pwf_mblk*/
    memTab[7].size = sizeof(pwf_mblk);
    memTab[7].alignment = (0 * 8) / CHAR_BIT;
    memTab[7].space = IALG_DARAM0;
    memTab[7].attrs = IALG_SCRATCH;
    
       /* G729 Implementation acelp_cp_d4i40_17_mblk*/
    memTab[8].size = sizeof(acelp_cp_d4i40_17_mblk);
    memTab[8].alignment = (0 * 8) / CHAR_BIT;
    memTab[8].space = IALG_DARAM0;
    memTab[8].attrs = IALG_SCRATCH;
    
       /* G729 Implementation q_gaincp_mblk */
    memTab[9].size = sizeof(q_gaincp_mblk);
    memTab[9].alignment = (0 * 8) / CHAR_BIT;
    memTab[9].space = IALG_DARAM0;
    memTab[9].attrs = IALG_SCRATCH;
               /* G729 Implementation phdisp_mblk*/
    memTab[10].size = sizeof(phdisp_mblk);
    memTab[10].alignment = (0 * 8) / CHAR_BIT;
    memTab[10].space = IALG_DARAM0;
    memTab[10].attrs = IALG_SCRATCH;
   
   
   /*************** HISTORY BUFFER ******************/
   /* G729 Implementation coderMemBlk */
    memTab[11].size = sizeof(coderMemBlk);
    memTab[11].alignment = (0 * 8) / CHAR_BIT;
    memTab[11].space = IALG_EXTERNAL;
    memTab[11].attrs = IALG_PERSIST;
    
       /* G729 Implementation preProcMemBlk */
    memTab[12].size = sizeof(preProcMemBlk);
    memTab[12].alignment = (0 * 8) / CHAR_BIT;
    memTab[12].space = IALG_EXTERNAL;
    memTab[12].attrs = IALG_PERSIST;
    
       /* G729 Implementation exc_err_mblk */
    memTab[13].size = sizeof(exc_err_mblk);
    memTab[13].alignment = (0 * 8) / CHAR_BIT;
    memTab[13].space = IALG_EXTERNAL;
    memTab[13].attrs = IALG_PERSIST;
    
       /* G729 Implementation vad_mblk*/
    memTab[14].size = sizeof(vad_mblk);
    memTab[14].alignment = (0 * 8) / CHAR_BIT;
    memTab[14].space = IALG_EXTERNAL;
    memTab[14].attrs = IALG_PERSIST;
    
       /* G729 Implementation cod_cng_mblk*/
    memTab[15].size = sizeof(cod_cng_mblk);
    memTab[15].alignment = (0 * 8) / CHAR_BIT;
    memTab[15].space = IALG_EXTERNAL;
    memTab[15].attrs = IALG_PERSIST;
    
       /* G729 Implementation bwfwfunc_mblk */
    memTab[16].size = sizeof(bwfwfunc_mblk);
    memTab[16].alignment = (0 * 8) / CHAR_BIT;
    memTab[16].space = IALG_EXTERNAL;
    memTab[16].attrs = IALG_PERSIST;
    
           /* G729 Implementation pwf_mblk*/
    memTab[17].size = sizeof(pwf_mblk);
    memTab[17].alignment = (0 * 8) / CHAR_BIT;
    memTab[17].space = IALG_EXTERNAL;
    memTab[17].attrs = IALG_PERSIST;
    
       /* G729 Implementation acelp_cp_d4i40_17_mblk*/
    memTab[18].size = sizeof(acelp_cp_d4i40_17_mblk);
    memTab[18].alignment = (0 * 8) / CHAR_BIT;
    memTab[18].space = IALG_EXTERNAL;
    memTab[18].attrs = IALG_PERSIST;
    
       /* G729 Implementation q_gaincp_mblk */
    memTab[19].size = sizeof(q_gaincp_mblk);
    memTab[19].alignment = (0 * 8) / CHAR_BIT;
    memTab[19].space = IALG_EXTERNAL;
    memTab[19].attrs = IALG_PERSIST;
               /* G729 Implementation phdisp_mblk*/
    memTab[20].size = sizeof(phdisp_mblk);
    memTab[20].alignment = (0 * 8) / CHAR_BIT;
    memTab[20].space = IALG_EXTERNAL;
    memTab[20].attrs = IALG_PERSIST;
    
    /************* Table ******************/
//  memTab[21].size = sizeof(G729_dtx_table);
//	memTab[21].alignment = 0; /* no alignment */
//	memTab[21].attrs = IALG_WRITEONCE;
//	memTab[21].space = IALG_SARAM; /* single-access on-chip */
//	memTab[21].base = &G729_dtx_table; /* shared look-up table */
   
//	memTab[22].size = sizeof(G729_ld8k_table);
//	memTab[22].alignment = 0; /* no alignment */
//	memTab[22].attrs = IALG_WRITEONCE;
//	memTab[22].space = IALG_SARAM; /* single-access on-chip */
//	memTab[22].base = &G729_ld8k_table; /* shared look-up table */
	
//	memTab[23].size = sizeof(G729_ld8cp_table );
//	memTab[23].alignment = 0; /* no alignment */
//	memTab[23].attrs = IALG_WRITEONCE;
//	memTab[23].space = IALG_SARAM; /* single-access on-chip */
//	memTab[23].base = &G729_ld8cp_table; /* shared look-up table */

    return (MTAB_NRECS);
}

/*
//============================================================================
// G729ENC_KMITL_control
//
// Control our object's parameters while the algorithm is running
*/
Int G729ENC_KMITL_control(IALG_Handle handle, IALG_Cmd cmd, IALG_Status * status)
{
    IG729ENC_Status *sPtr = (IG729ENC_Status *)status;	
    G729ENC_KMITL_Obj *G729ENC = (Void *)handle;

    switch ((IG729ENC_Cmd)cmd) {

       case IG729ENC_GETSTATUS:
            sPtr->vadEnable = G729ENC->vadEnable;
            sPtr->annexC = G729ENC->annexC;
            sPtr->annexD = G729ENC->annexD;
            sPtr->annexE = G729ENC->annexE;
            sPtr->numSearchRegion = G729ENC->numSearchRegion;
            sPtr->openloopOptimizeEnable = G729ENC->openloopOptimizeEnable;
           

            return(IALG_EOK);

       case IG729ENC_SETSTATUS:
            G729ENC->vadEnable = sPtr->vadEnable;
            G729ENC->annexC = sPtr->annexC;
            G729ENC->annexD = sPtr->annexD;
            G729ENC->annexE = sPtr->annexE;
 			G729ENC->numSearchRegion        = sPtr->numSearchRegion;
            G729ENC->openloopOptimizeEnable = sPtr->openloopOptimizeEnable ;
           
            return(IALG_EOK);

       default:  break;
    }
                       
    return(IALG_EFAIL);
}

/*
//============================================================================
// G729ENC_KMITL_deactivate
//
// Deactivate our object; e.g., save any scratch memory requred
// by the G729ENC_KMITL processing methods to persistent memory.
*/

// The G729ENC_KMITL_activate & G729ENC_KMITL_deactivate routines are
// only used if scratch memory is being used.
Void G729ENC_KMITL_deactivate(IALG_Handle handle)
{
    G729ENC_KMITL_Obj *G729ENC = (Void *)handle;
    
    // TODO: implement algDeactivate
    
        /* copy saved working to history buffer */
	memcpy((Void *)G729ENC->history->acelp_cp_d4i40_17_handle, (Void *)G729ENC->workBuf->acelp_cp_d4i40_17_handle,
	sizeof(acelp_cp_d4i40_17_mblk));

	memcpy((Void *)G729ENC->history->bwfwfunc_handle , (Void *)G729ENC->workBuf->bwfwfunc_handle ,
	sizeof(bwfwfunc_mblk));

	memcpy((Void *)G729ENC->history->cod_cng_handle , (Void *)G729ENC->workBuf->cod_cng_handle ,
	sizeof(cod_cng_mblk));

	memcpy((Void *)G729ENC->history->coder_handle  , (Void *)G729ENC->workBuf->coder_handle  ,
	sizeof(coderMemBlk));
	
	memcpy((Void *)G729ENC->history->exc_err_handle , (Void *)G729ENC->workBuf->exc_err_handle ,
	sizeof(exc_err_mblk));

	memcpy((Void *)G729ENC->history->phdisp_handle , (Void *)G729ENC->workBuf->phdisp_handle ,
	sizeof(phdisp_mblk));
	
	memcpy((Void *)G729ENC->history->preProc_handle , (Void *)G729ENC->workBuf->preProc_handle,
	sizeof(preProcMemBlk));

	memcpy((Void *)G729ENC->history->pwf_handle  , (Void *)G729ENC->workBuf->pwf_handle ,
	sizeof(pwf_mblk));
	
	memcpy((Void *)G729ENC->history->q_gaincp_handle , (Void *)G729ENC->workBuf->q_gaincp_handle ,
	sizeof(q_gaincp_mblk));

	memcpy((Void *)G729ENC->history->vad_handle  , (Void *)G729ENC->workBuf->vad_handle ,
	sizeof(vad_mblk));
    
}


/*  
//============================================================================
// G729ENC_KMITL_exit
//
// Exit the G729ENC_KMITL module as a whole.
 */
Void G729ENC_KMITL_exit(Void)
{
    /* TODO: implement module exit */
}

/*
//============================================================================
// G729ENC_KMITL_free
//
// Return a table of memory pointers that should be freed.  Note
// that this should include *all* memory requested in the 
// G729ENC_KMITL_alloc operation above.
*/
Int G729ENC_KMITL_free(IALG_Handle handle, IALG_MemRec memTab[])
{
    Int n;
    G729ENC_KMITL_Obj *G729ENC = (Void *)handle;

    n = G729ENC_KMITL_alloc(NULL, NULL, memTab);

    memTab[0].base = handle;

    return (n);
}

/*
//============================================================================
// G729ENC_KMITL_init
//
// Initialize the G729ENC_KMITL module as a whole.
*/
Void G729ENC_KMITL_init(Void)
{
    /* TODO: implement module init */
    
   
}

/*
//============================================================================
// G729ENC_KMITL_initObj
//
// Initialize the memory allocated for our instance.
*/
Int G729ENC_KMITL_initObj(IALG_Handle handle,
		const IALG_MemRec memTab[], IALG_Handle p, const IALG_Params *G729ENCParams)
{
    G729ENC_KMITL_Obj *G729ENC = (Void *)handle;
    const IG729ENC_Params *params = (Void *)G729ENCParams;

    if(params == NULL){
        params = &IG729ENC_PARAMS; /* set default parameters */
    }

    G729ENC->vadEnable = params->vadEnable;
    G729ENC->annexC = params->annexC;
    G729ENC->annexD = params->annexD;
    G729ENC->annexE = params->annexE;
    G729ENC->numSearchRegion = params->numSearchRegion;
    G729ENC->openloopOptimizeEnable = params->openloopOptimizeEnable;

    /* TODO: Implement any additional algInit desired */
    
      /*  Work Buffer */
     G729ENC->workBuf->coder_handle    = memTab[1].base; 
     G729ENC->workBuf->preProc_handle  = memTab[2].base; 
     G729ENC->workBuf->exc_err_handle  = memTab[3].base; 
     G729ENC->workBuf->vad_handle      = memTab[4].base; 
     G729ENC->workBuf->cod_cng_handle  = memTab[5].base; 
     G729ENC->workBuf->bwfwfunc_handle = memTab[6].base; 
     G729ENC->workBuf->pwf_handle      = memTab[7].base; 
     G729ENC->workBuf->acelp_cp_d4i40_17_handle = memTab[8].base; 
     G729ENC->workBuf->q_gaincp_handle = memTab[9].base; 
     G729ENC->workBuf->phdisp_handle   = memTab[10].base; 
    
    /* History Buffer */ 
     G729ENC->history->coder_handle    = memTab[11].base; 
     G729ENC->history->preProc_handle  = memTab[12].base; 
     G729ENC->history->exc_err_handle  = memTab[13].base; 
     G729ENC->history->vad_handle      = memTab[14].base; 
     G729ENC->history->cod_cng_handle  = memTab[15].base; 
     G729ENC->history->bwfwfunc_handle = memTab[16].base; 
     G729ENC->history->pwf_handle      = memTab[17].base; 
     G729ENC->history->acelp_cp_d4i40_17_handle = memTab[18].base; 
     G729ENC->history->q_gaincp_handle = memTab[19].base; 
     G729ENC->history->phdisp_handle   = memTab[20].base;  
       
   /*Writeone buffer*/
//     	 G729_DTX_TablePtr    = memTab[21].base;
//   	 G729_LD8CP_TablePtr  = memTab[22].base;
//   	 G729_LD8K_TablePtr   = memTab[23].base;
   
           /* TABLE fields for multichannel */
 //   G729_DTX_TablePtr  = params->G729_DTX_TablePtr;   // &G729_dtx_table;
 //   G729_LD8K_TablePtr = params->G729_LD8K_TablePtr;  // &G729_ld8k_table;
 //  G729_LD8CP_TablePtr= params->G729_LD8CP_TablePtr; // &G729_ld8cp_table;
    
    G729ENC->history = ENCODER_G729_MEM_BLK_init(G729ENC->history);
    
 
/************************** Adjust offset of encode pointer ***************************************/
// Edit offset pointer of new_speech
  
    G729ENC->history->coder_handle->frames = 0;
    
  	G729ENC->history->coder_handle->new_speech 	= (FLOAT *)(((char *)(G729ENC->history->coder_handle->new_speech )) + (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->speech		= (FLOAT *)(((char *)(G729ENC->history->coder_handle->speech )) 	+ (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->p_window	= (FLOAT *)(((char *)(G729ENC->history->coder_handle->p_window )) 	+ (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->wsp			= (FLOAT *)(((char *)(G729ENC->history->coder_handle->wsp )) 		+ (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->exc			= (FLOAT *)(((char *)(G729ENC->history->coder_handle->exc )) 		+ (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->zero		= (FLOAT *)(((char *)(G729ENC->history->coder_handle->zero )) 		+ (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->error		= (FLOAT *)(((char *)(G729ENC->history->coder_handle->error )) 		+ (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->synth_ptr	= (FLOAT *)(((char *)(G729ENC->history->coder_handle->synth_ptr )) 	+ (int)(G729ENC->history->coder_handle));
     

	init_pre_process(G729ENC->history->preProc_handle);
	init_coder_ld8c(G729ENC->history->coder_handle ,
					G729ENC->history->exc_err_handle,
	 				G729ENC->history->vad_handle, 
	 				G729ENC->vadEnable);           /* Initialize the coder             */
    
    
    	/************************** Adjust offset of encode pointer ***************************************/
	G729ENC->history->coder_handle->new_speech 	= (FLOAT *)(((char *)(G729ENC->history->coder_handle->new_speech )) - (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->speech		= (FLOAT *)(((char *)(G729ENC->history->coder_handle->speech )) 	- (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->p_window	= (FLOAT *)(((char *)(G729ENC->history->coder_handle->p_window )) 	- (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->wsp			= (FLOAT *)(((char *)(G729ENC->history->coder_handle->wsp )) 		- (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->exc			= (FLOAT *)(((char *)(G729ENC->history->coder_handle->exc )) 		- (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->zero		= (FLOAT *)(((char *)(G729ENC->history->coder_handle->zero ))		- (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->error		= (FLOAT *)(((char *)(G729ENC->history->coder_handle->error )) 		- (int)(G729ENC->history->coder_handle));
	G729ENC->history->coder_handle->synth_ptr	= (FLOAT *)(((char *)(G729ENC->history->coder_handle->synth_ptr )) 	- (int)(G729ENC->history->coder_handle));

 	/**********************************************************************/

    return (IALG_EOK);
}

/*
//============================================================================
// G729ENC_KMITL_moved
//
// Adjust any data pointers that has been moved by the client.
*/

// The G729ENC_KMITL_moved routine is only used if the G729ENC_KMITL_alloc routine
// returns more than one valid IALG_MemRec structure.
Void G729ENC_KMITL_moved(IALG_Handle handle,
		const IALG_MemRec memTab[], IALG_Handle p, const IALG_Params *G729ENCParams)
{
    G729ENC_KMITL_Obj *G729ENC = (Void *)handle;
    const IG729ENC_Params *params = (Void *)G729ENCParams;
    
    // TO DO Implement
    
    if (params != NULL) {
		G729ENC->vadEnable = params->vadEnable;
		G729ENC->annexC	   = params->annexC;
		G729ENC->annexD	   = params->annexD;
		G729ENC->annexE	   = params->annexE;
		G729ENC->numSearchRegion = params->numSearchRegion;
    	G729ENC->openloopOptimizeEnable = params->openloopOptimizeEnable;
    }
   
   	      	      /*  Work Buffer */
     G729ENC->workBuf->coder_handle    = memTab[1].base; 
     G729ENC->workBuf->preProc_handle  = memTab[2].base; 
     G729ENC->workBuf->exc_err_handle  = memTab[3].base; 
     G729ENC->workBuf->vad_handle      = memTab[4].base; 
     G729ENC->workBuf->cod_cng_handle  = memTab[5].base; 
     G729ENC->workBuf->bwfwfunc_handle = memTab[6].base; 
     G729ENC->workBuf->pwf_handle      = memTab[7].base; 
     G729ENC->workBuf->acelp_cp_d4i40_17_handle = memTab[8].base; 
     G729ENC->workBuf->q_gaincp_handle = memTab[9].base; 
     G729ENC->workBuf->phdisp_handle   = memTab[10].base; 
    
    /* History Buffer */ 
     G729ENC->history->coder_handle    = memTab[11].base; 
     G729ENC->history->preProc_handle  = memTab[12].base; 
     G729ENC->history->exc_err_handle  = memTab[13].base; 
     G729ENC->history->vad_handle      = memTab[14].base; 
     G729ENC->history->cod_cng_handle  = memTab[15].base; 
     G729ENC->history->bwfwfunc_handle = memTab[16].base; 
     G729ENC->history->pwf_handle      = memTab[17].base; 
     G729ENC->history->acelp_cp_d4i40_17_handle = memTab[18].base; 
     G729ENC->history->q_gaincp_handle = memTab[19].base; 
     G729ENC->history->phdisp_handle   = memTab[20].base; 


}


/*
//============================================================================
// G729ENC_KMITL_apply
// KMITL's implementation of the apply operation.
// Custom fields of the G729ENC_KMITL_Obj may be accessed as follows:
//     G729ENC->vadEnable = ...;
//     G729ENC->annexC = ...;
//     G729ENC->annexD = ...;
//     G729ENC->annexE = ...;
*/
XDAS_Int32 G729ENC_KMITL_apply(IG729ENC_Handle handle, XDAS_Int16 * in, XDAS_Int32 * out)
{
    	int i;
    	//int prm[PRM_SIZE_E+1];	
    	int rate;
    	G729ENC_KMITL_Obj *G729ENC = (Void *)handle;

    /* TODO: implement apply */

   	G729ENC->workBuf->coder_handle->new_speech 	= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->new_speech )) + (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->speech		= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->speech )) 	+ (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->p_window	= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->p_window )) 	+ (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->wsp			= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->wsp )) 		+ (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->exc			= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->exc )) 		+ (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->zero		= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->zero )) 		+ (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->error		= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->error )) 		+ (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->synth_ptr	= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->synth_ptr )) 	+ (int)(G729ENC->workBuf->coder_handle));
  
	// SET param enable   
    G729ENC->workBuf->coder_handle->enableOpenloopOpt = G729ENC->openloopOptimizeEnable;
 	// SET param numsearch   
    if ((G729ENC->numSearchRegion <= 8) && (G729ENC->numSearchRegion >= 1))
    G729ENC->workBuf->acelp_cp_d4i40_17_handle->numRegion = G729ENC->numSearchRegion;
    else (G729ENC->workBuf->acelp_cp_d4i40_17_handle->numRegion = 8) ; 
       
        if (G729ENC->workBuf->coder_handle->frames == 32767) G729ENC->workBuf->coder_handle->frames = 256;
        else (G729ENC->workBuf->coder_handle->frames)++;
       
        for (i = 0; i < L_FRAME; i++)  G729ENC->workBuf->coder_handle->new_speech[i] = (FLOAT) in[i];
        
      
		pre_process(G729ENC->workBuf->preProc_handle , G729ENC->workBuf->coder_handle->new_speech, L_FRAME);

		if (G729ENC->annexC) rate = G729 ;
		if (G729ENC->annexD) rate = G729D ;
		if (G729ENC->annexE) rate = G729E ;
			coder_ld8c(
			G729ENC->workBuf->coder_handle,
			G729ENC->workBuf->exc_err_handle,
			G729ENC->workBuf->vad_handle,
			G729ENC->workBuf->cod_cng_handle,
			G729ENC->workBuf->bwfwfunc_handle,
			G729ENC->workBuf->pwf_handle,
			G729ENC->workBuf->acelp_cp_d4i40_17_handle,
			G729ENC->workBuf->q_gaincp_handle,
			G729ENC->workBuf->phdisp_handle,
			out,
			G729ENC->workBuf->coder_handle->frames,
			G729ENC->vadEnable ,
			rate);
         	
	/************************** Adjust offset of encode pointer ***************************************/

 	G729ENC->workBuf->coder_handle->new_speech 	= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->new_speech )) - (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->speech		= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->speech )) 	- (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->p_window	= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->p_window )) 	- (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->wsp			= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->wsp )) 		- (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->exc			= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->exc )) 		- (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->zero		= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->zero )) 		- (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->error		= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->error )) 		- (int)(G729ENC->workBuf->coder_handle));
	G729ENC->workBuf->coder_handle->synth_ptr	= (FLOAT *)(((char *)(G729ENC->workBuf->coder_handle->synth_ptr )) 	- (int)(G729ENC->workBuf->coder_handle));

	/**********************************************************************/
  

    return((XDAS_Int32)0);
}

Int G729ENC_KMITL_numAlloc(Void){
	return MTAB_NRECS;

}


XDAS_Void G729ENC_KMITL_bitToSerial(XDAS_Int32 * in, XDAS_Int16 * out){
	
	prm2bits_ld8c(in, out);
	
}
