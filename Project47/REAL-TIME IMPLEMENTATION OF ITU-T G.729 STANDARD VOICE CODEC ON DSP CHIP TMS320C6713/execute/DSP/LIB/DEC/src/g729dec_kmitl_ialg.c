/*
//============================================================================
//
//    FILE NAME : G729DEC_KMITL_ialg.c
//
//    ALGORITHM : G729DEC
//
//    VENDOR    : KMITL
//
//    TARGET DSP: C67x
//
//    PURPOSE   : Implementation of the G729DEC_KMITL.h interface; KMITL's
//                implementation of the IG729DEC interface.
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

#pragma CODE_SECTION(G729DEC_KMITL_alloc,      ".text:algAlloc")
#pragma CODE_SECTION(G729DEC_KMITL_free,       ".text:algFree")
#pragma CODE_SECTION(G729DEC_KMITL_initObj,    ".text:algInit")
#pragma CODE_SECTION(G729DEC_KMITL_control,    ".text:algControl")
#pragma CODE_SECTION(G729DEC_KMITL_init,       ".text:init")
#pragma CODE_SECTION(G729DEC_KMITL_exit,       ".text:exit")

// The G729DEC_KMITL_moved routine is only used if the G729DEC_KMITL_alloc routine
// returns more than one valid IALG_MemRec structure.
//#pragma CODE_SECTION(G729DEC_KMITL_moved,      ".text:algMoved")


// The G729DEC_KMITL_activate & G729DEC_KMITL_deactivate routines are
// only used if scratch memory is being used.
#pragma CODE_SECTION(G729DEC_KMITL_activate,   ".text:algActivate")
#pragma CODE_SECTION(G729DEC_KMITL_deactivate, ".text:algDeactivate")

#pragma CODE_SECTION(write16, ".text:write16")

#include <std.h>
#include <limits.h>
#include "typedef.h"
#include "ld8k.h"
#include "ld8cp.h"
#include "dtx.h"
#include "octet.h"

#include "ig729dec.h"
#include "g729dec_kmitl.h"


#define MTAB_NRECS 19

//*****************************//
void write16(
    FLOAT *data,           /* input: inputdata */
    int length ,         /* input: length of data array */
    INT16 sp16[L_FRAME]
)
{
    int  i;
    FLOAT temp;
    
    for(i=0; i<length; i++)
    {
        /* round and convert to int  */
        temp = data[i];
        if (temp >= (F)0.0)
            temp += (F)0.5;
        else  temp -= (F)0.5;
        if (temp >  (F)32767.0 ) temp =  (F)32767.0;
        if (temp < (F)-32768.0 ) temp = (F)-32768.0;
        sp16[i] = (INT16) temp; 
    }
   
    return;
}

void init_decodecp(decodecp_mblk_handle decodecp_handle){
int i;
	for (i=0; i<L_ANA_BWD; i++) decodecp_handle->synth_buf[i] = (F)0.;
    decodecp_handle->synth = decodecp_handle->synth_buf + MEM_SYN_BWD;
   
	
    decodecp_handle->voicing = 60;

    decodecp_handle->frame = 0;

    decodecp_handle->ga1_post = GAMMA1_PST_E;
    decodecp_handle->ga2_post = GAMMA2_PST_E;
    decodecp_handle->ga_harm  = GAMMA_HARM_E;

  

}
/*
//============================================================================
// G729DEC_KMITL_Obj
*/
typedef struct G729DEC_KMITL_Obj {
    IALG_Obj        alg;   /* MUST be first field of all G729DEC objs */
    
    /* TODO: add custom fields here */
    DECODER_G729_MEM_BLK  *workBuf;
    DECODER_G729_MEM_BLK  *history;
    
} G729DEC_KMITL_Obj;

/*
//============================================================================
// G729DEC_KMITL_activate
//
// Activate our object; e.g., initialize any scratch memory required
// by the G729DEC_KMITL processing methods.
*/

// The G729DEC_KMITL_activate & G729DEC_KMITL_deactivate routines are
// only used if scratch memory is being used.
Void G729DEC_KMITL_activate(IALG_Handle handle)
{
    G729DEC_KMITL_Obj *G729DEC = (Void *)handle;
    
    // TODO: implement algActivate
       /* copy saved  history to working buffer */
	memcpy((Void *)G729DEC->workBuf->bwfwfunc_handle , (Void *)G729DEC->history->bwfwfunc_handle ,
	sizeof(bwfwfunc_mblk));
    
    memcpy((Void *)G729DEC->workBuf->dec_sid_handle , (Void *)G729DEC->history->dec_sid_handle ,
	sizeof(dec_sid_mblk));
    
    memcpy((Void *)G729DEC->workBuf->decld8cp_handle  , (Void *)G729DEC->history->decld8cp_handle  ,
	sizeof(decld8cp_mblk));
    
    memcpy((Void *)G729DEC->workBuf->decodecp_handle , (Void *)G729DEC->history->decodecp_handle ,
	sizeof(decodecp_mblk));
    
    memcpy((Void *)G729DEC->workBuf->degaincp_handle , (Void *)G729DEC->history->degaincp_handle ,
	sizeof(degaincp_mblk));
    
    memcpy((Void *)G729DEC->workBuf->exc_err_handle , (Void *)G729DEC->history->exc_err_handle ,
	sizeof(exc_err_mblk));
    
    memcpy((Void *)G729DEC->workBuf->phdisp_handle , (Void *)G729DEC->history->phdisp_handle ,
	sizeof(phdisp_mblk));
    
    memcpy((Void *)G729DEC->workBuf->postProc_handle , (Void *)G729DEC->history->postProc_handle ,
	sizeof(post_pro_mblk));
    
    memcpy((Void *)G729DEC->workBuf->pstcp_handle , (Void *)G729DEC->history->pstcp_handle ,
	sizeof(pstcp_mblk));
    
    
}


/*
//============================================================================
// G729DEC_KMITL_alloc
//
// Return a table of memory descriptors that describe the memory needed 
// to construct a G729DEC_KMITL_Obj structure.
*/
Int G729DEC_KMITL_alloc(const IALG_Params *G729DECParams, IALG_Fxns **fxns, IALG_MemRec memTab[])
{
    const IG729DEC_Params *params = (Void *)G729DECParams;

    /* TODO: implement algAlloc */
    
    if (params == NULL) {
        params = &IG729DEC_PARAMS;  /* set default parameters */
    }

    /* Request memory for G729DEC object */
    memTab[0].size = sizeof(G729DEC_KMITL_Obj);
    memTab[0].alignment = (0 * 8) / CHAR_BIT;
    memTab[0].space = IALG_DARAM0;
    memTab[0].attrs = IALG_PERSIST;
    
    	/*************** WORK BUFFER ******************/
       
    /* G729 Implementation decld8cp_mblk */
    memTab[1].size = sizeof(decld8cp_mblk);
    memTab[1].alignment = (0 * 8) / CHAR_BIT;
    memTab[1].space = IALG_DARAM0;
    memTab[1].attrs = IALG_SCRATCH;
    
        /* G729 Implementation post_pro_mblk */
    memTab[2].size = sizeof(post_pro_mblk);
    memTab[2].alignment = (0 * 8) / CHAR_BIT;
    memTab[2].space = IALG_DARAM0;
    memTab[2].attrs = IALG_SCRATCH;
    
       /* G729 Implementation exc_err_mblk */
    memTab[3].size = sizeof(exc_err_mblk);
    memTab[3].alignment = (0 * 8) / CHAR_BIT;
    memTab[3].space = IALG_DARAM0;
    memTab[3].attrs = IALG_SCRATCH;
    
       /* G729 Implementation phdisp_mblk*/
    memTab[4].size = sizeof(phdisp_mblk);
    memTab[4].alignment = (0 * 8) / CHAR_BIT;
    memTab[4].space = IALG_DARAM0;
    memTab[4].attrs = IALG_SCRATCH;
    
       /* G729 Implementation pstcp_mblk*/
    memTab[5].size = sizeof(pstcp_mblk);
    memTab[5].alignment = (0 * 8) / CHAR_BIT;
    memTab[5].space = IALG_DARAM0;
    memTab[5].attrs = IALG_SCRATCH;
    
       /* G729 Implementation bwfwfunc_mblk */
    memTab[6].size = sizeof(bwfwfunc_mblk);
    memTab[6].alignment = (0 * 8) / CHAR_BIT;
    memTab[6].space = IALG_DARAM0;
    memTab[6].attrs = IALG_SCRATCH;
    
           /* G729 Implementation degaincp_mblk*/
    memTab[7].size = sizeof(degaincp_mblk);
    memTab[7].alignment = (0 * 8) / CHAR_BIT;
    memTab[7].space = IALG_DARAM0;
    memTab[7].attrs = IALG_SCRATCH;
    
       /* G729 Implementation dec_sid_mblk*/
    memTab[8].size = sizeof(dec_sid_mblk);
    memTab[8].alignment = (0 * 8) / CHAR_BIT;
    memTab[8].space = IALG_DARAM0;
    memTab[8].attrs = IALG_SCRATCH;
    
       /* G729 Implementation decodecp_mblk */
    memTab[9].size = sizeof(decodecp_mblk);
    memTab[9].alignment = (0 * 8) / CHAR_BIT;
    memTab[9].space = IALG_DARAM0;
    memTab[9].attrs = IALG_SCRATCH;

 	/*************** HISTORY BUFFER ******************/
       
    /* G729 Implementation decld8cp_mblk */
    memTab[10].size = sizeof(decld8cp_mblk);
    memTab[10].alignment = (0 * 8) / CHAR_BIT;
    memTab[10].space = IALG_EXTERNAL;
    memTab[10].attrs = IALG_PERSIST;
    
        /* G729 Implementation post_pro_mblk */
    memTab[11].size = sizeof(post_pro_mblk);
    memTab[11].alignment = (0 * 8) / CHAR_BIT;
    memTab[11].space = IALG_EXTERNAL;
    memTab[11].attrs = IALG_PERSIST;
    
       /* G729 Implementation exc_err_mblk */
    memTab[12].size = sizeof(exc_err_mblk);
    memTab[12].alignment = (0 * 8) / CHAR_BIT;
    memTab[12].space = IALG_EXTERNAL;
    memTab[12].attrs = IALG_PERSIST;
    
       /* G729 Implementation phdisp_mblk*/
    memTab[13].size = sizeof(phdisp_mblk);
    memTab[13].alignment = (0 * 8) / CHAR_BIT;
    memTab[13].space = IALG_EXTERNAL;
    memTab[13].attrs = IALG_PERSIST; 
     
       /* G729 Implementation pstcp_mblk*/
    memTab[14].size = sizeof(pstcp_mblk);
    memTab[14].alignment = (0 * 8) / CHAR_BIT;
    memTab[14].space = IALG_EXTERNAL;
    memTab[14].attrs = IALG_PERSIST;
     
       /* G729 Implementation bwfwfunc_mblk */
    memTab[15].size = sizeof(bwfwfunc_mblk);
    memTab[15].alignment = (0 * 8) / CHAR_BIT;
    memTab[15].space = IALG_EXTERNAL;
    memTab[15].attrs = IALG_PERSIST;
    
           /* G729 Implementation degaincp_mblk*/
    memTab[16].size = sizeof(degaincp_mblk);
    memTab[16].alignment = (0 * 8) / CHAR_BIT;
    memTab[16].space = IALG_EXTERNAL;
    memTab[16].attrs = IALG_PERSIST;
    
       /* G729 Implementation dec_sid_mblk*/
    memTab[17].size = sizeof(dec_sid_mblk);
    memTab[17].alignment = (0 * 8) / CHAR_BIT;
    memTab[17].space = IALG_EXTERNAL;
    memTab[17].attrs = IALG_PERSIST;
    
       /* G729 Implementation decodecp_mblk */
    memTab[18].size = sizeof(decodecp_mblk);
    memTab[18].alignment = (0 * 8) / CHAR_BIT;
    memTab[18].space = IALG_EXTERNAL;
    memTab[18].attrs = IALG_PERSIST;



    

    return (MTAB_NRECS);
}

/*
//============================================================================
// G729DEC_KMITL_control
//
// Control our object's parameters while the algorithm is running
*/
Int G729DEC_KMITL_control(IALG_Handle handle, IALG_Cmd cmd, IALG_Status * status)
{
    IG729DEC_Status *sPtr = (IG729DEC_Status *)status;	
    G729DEC_KMITL_Obj *G729DEC = (Void *)handle;

    switch ((IG729DEC_Cmd)cmd) {

       case IG729DEC_GETSTATUS:

            return(IALG_EOK);

       case IG729DEC_SETSTATUS:

            return(IALG_EOK);

       default:  break;
    }
                       
    return(IALG_EFAIL);
}

/*
//============================================================================
// G729DEC_KMITL_deactivate
//
// Deactivate our object; e.g., save any scratch memory requred
// by the G729DEC_KMITL processing methods to persistent memory.
*/

// The G729DEC_KMITL_activate & G729DEC_KMITL_deactivate routines are
// only used if scratch memory is being used.
Void G729DEC_KMITL_deactivate(IALG_Handle handle)
{
    G729DEC_KMITL_Obj *G729DEC = (Void *)handle;
    
    // TODO: implement algDeactivate
    
    /* copy saved working to history buffer */
	memcpy((Void *)G729DEC->history->bwfwfunc_handle , (Void *)G729DEC->workBuf->bwfwfunc_handle ,
	sizeof(bwfwfunc_mblk));
    
    memcpy((Void *)G729DEC->history->dec_sid_handle , (Void *)G729DEC->workBuf->dec_sid_handle ,
	sizeof(dec_sid_mblk));
    
    memcpy((Void *)G729DEC->history->decld8cp_handle  , (Void *)G729DEC->workBuf->decld8cp_handle  ,
	sizeof(decld8cp_mblk));
    
    memcpy((Void *)G729DEC->history->decodecp_handle , (Void *)G729DEC->workBuf->decodecp_handle ,
	sizeof(decodecp_mblk));
    
    memcpy((Void *)G729DEC->history->degaincp_handle , (Void *)G729DEC->workBuf->degaincp_handle ,
	sizeof(degaincp_mblk));
    
    memcpy((Void *)G729DEC->history->exc_err_handle , (Void *)G729DEC->workBuf->exc_err_handle ,
	sizeof(exc_err_mblk));
    
    memcpy((Void *)G729DEC->history->phdisp_handle , (Void *)G729DEC->workBuf->phdisp_handle ,
	sizeof(phdisp_mblk));
    
    memcpy((Void *)G729DEC->history->postProc_handle , (Void *)G729DEC->workBuf->postProc_handle ,
	sizeof(post_pro_mblk));
    
    memcpy((Void *)G729DEC->history->pstcp_handle , (Void *)G729DEC->workBuf->pstcp_handle ,
	sizeof(pstcp_mblk));
    
    
    
    
}


/*
//============================================================================
// G729DEC_KMITL_exit
//
// Exit the G729DEC_KMITL module as a whole.
 */
Void G729DEC_KMITL_exit(Void)
{
    /* TODO: implement module exit */
}

/*
//============================================================================
// G729DEC_KMITL_free
//
// Return a table of memory pointers that should be freed.  Note
// that this should include *all* memory requested in the 
// G729DEC_KMITL_alloc operation above.
*/
Int G729DEC_KMITL_free(IALG_Handle handle, IALG_MemRec memTab[])
{
    Int n;
    G729DEC_KMITL_Obj *G729DEC = (Void *)handle;

    n = G729DEC_KMITL_alloc(NULL, NULL, memTab);

    memTab[0].base = handle;

    return (n);
}

/*
//============================================================================
// G729DEC_KMITL_init
//
// Initialize the G729DEC_KMITL module as a whole.
*/
Void G729DEC_KMITL_init(Void)
{
    /* TODO: implement module init */
}

/*
//============================================================================
// G729DEC_KMITL_initObj
//
// Initialize the memory allocated for our instance.
*/
Int G729DEC_KMITL_initObj(IALG_Handle handle,
		const IALG_MemRec memTab[], IALG_Handle p, const IALG_Params *G729DECParams)
{
    
    G729DEC_KMITL_Obj *G729DEC = (Void *)handle;
    const IG729DEC_Params *params = (Void *)G729DECParams;

    if(params == NULL){
        params = &IG729DEC_PARAMS; /* set default parameters */
    }

   // G729DEC->framesizeOut0 = params->framesizeOut0;

    /* TODO: Implement any additional algInit desired */

     /*  Work Buffer */
     G729DEC->workBuf->decld8cp_handle  = memTab[1].base;
     G729DEC->workBuf->postProc_handle	= memTab[2].base;
     G729DEC->workBuf->exc_err_handle	= memTab[3].base;
     G729DEC->workBuf->phdisp_handle	= memTab[4].base;
     G729DEC->workBuf->pstcp_handle		= memTab[5].base;
     G729DEC->workBuf->bwfwfunc_handle	= memTab[6].base;
     G729DEC->workBuf->degaincp_handle	= memTab[7].base;
     G729DEC->workBuf->dec_sid_handle	= memTab[8].base;
     G729DEC->workBuf->decodecp_handle 	= memTab[9].base;
       
     /* History Buffer */   
     G729DEC->history->decld8cp_handle  = memTab[10].base;
     G729DEC->history->postProc_handle	= memTab[11].base;
     G729DEC->history->exc_err_handle	= memTab[12].base;
     G729DEC->history->phdisp_handle	= memTab[13].base;
     G729DEC->history->pstcp_handle		= memTab[14].base;
     G729DEC->history->bwfwfunc_handle	= memTab[15].base;
     G729DEC->history->degaincp_handle	= memTab[16].base;
     G729DEC->history->dec_sid_handle	= memTab[17].base;
     G729DEC->history->decodecp_handle 	= memTab[18].base;
     
       
    G729DEC->history = DECODER_G729_MEM_BLK_init(G729DEC->history);
 
    // INIT EACH MODULE
   
   	init_decod_ld8c(G729DEC->history->decld8cp_handle);
	init_post_filter(G729DEC->history->pstcp_handle);
	init_post_process(G729DEC->history->postProc_handle);
   	init_decodecp(G729DEC->history->decodecp_handle);
	  /* for G.729b */
	init_dec_cng(G729DEC->history->dec_sid_handle);
    
    
    return (IALG_EOK);
}

/*
//============================================================================
// G729DEC_KMITL_moved
//
// Adjust any data pointers that has been moved by the client.
*/
/*
// The G729DEC_KMITL_moved routine is only used if the G729DEC_KMITL_alloc routine
// returns more than one valid IALG_MemRec structure.
Void G729DEC_KMITL_moved(IALG_Handle handle,
		const IALG_MemRec memTab[], IALG_Handle p, const IALG_Params *G729DECParams)
{
    G729DEC_KMITL_Obj *G729DEC = (Void *)handle;
    const IG729DEC_Params *params = (Void *)G729DECParams;

}
*/

/*
//============================================================================
// G729DEC_KMITL_apply
// KMITL's implementation of the apply operation.
// Custom fields of the G729DEC_KMITL_Obj may be accessed as follows:
//     G729DEC->framesizeOut0 = ...;
*/
XDAS_Void G729DEC_KMITL_apply(IG729DEC_Handle handle, XDAS_Int32 * parm, XDAS_Int16 * out ,XDAS_Int32 serial_size)
{
    G729DEC_KMITL_Obj *G729DEC = (Void *)handle;
    int i;

    /* TODO: implement apply */
/*
        if (  parm[0] == 0 )
        	 G729DEC->workBuf->decodecp_handle->serial_size  = 16;//(int)serial[1];
      	else  if ( parm[0] == 1 )
        	 G729DEC->workBuf->decodecp_handle->serial_size  = 16;//(int)serial[1];
      	else  if ( parm[0] == 2 )
        	 G729DEC->workBuf->decodecp_handle->serial_size  = 64;//(int)serial[1];
      	else  if ( parm[0] == 3 )
        	 G729DEC->workBuf->decodecp_handle->serial_size  = 80;//(int)serial[1];
      	else  if ( parm[0] == 4 )
        	 G729DEC->workBuf->decodecp_handle->serial_size  = 118;//(int)serial[1];
      	else  printf("Error at frame mode\n");
       			
  	
   		for (i = 1 ; i <= 19 ; i++){
			 G729DEC->workBuf->decodecp_handle->parm[i] =  parm[i-1] ;
		
		}
   */ 
   		G729DEC->workBuf->decodecp_handle->serial_size = serial_size;
   		
   		for (i = 0 ; i <= 20 ; i++){
			 G729DEC->workBuf->decodecp_handle->parm[i] =  parm[i] ;
		
		}
       
        if( (G729DEC->workBuf->decodecp_handle->serial_size ==80) ) {
            G729DEC->workBuf->decodecp_handle->parm[5] =
				check_parity_pitch(G729DEC->workBuf->decodecp_handle->parm[4],
				G729DEC->workBuf->decodecp_handle->parm[5]);
        }
        else 
            if (G729DEC->workBuf->decodecp_handle->serial_size == 118) {
                /* ------------------------------------------------------------------ */
                /* check parity and put 1 in parm[6] if parity error in Forward mode  */
                /*                  put 1 in parm[4] if parity error in Backward mode */
                /* ------------------------------------------------------------------ */
                if (G729DEC->workBuf->decodecp_handle->parm[2] == 0) {
                    i = (G729DEC->workBuf->decodecp_handle->parm[5] >> 1) & 1;
                    G729DEC->workBuf->decodecp_handle->parm[6] += i;
                    G729DEC->workBuf->decodecp_handle->parm[6] = check_parity_pitch(G729DEC->workBuf->decodecp_handle->parm[5], G729DEC->workBuf->decodecp_handle->parm[6]);
                }
                else {
                    i = (G729DEC->workBuf->decodecp_handle->parm[3] >> 1) & 1;
                    G729DEC->workBuf->decodecp_handle->parm[4] += i;
                    G729DEC->workBuf->decodecp_handle->parm[4] = check_parity_pitch(G729DEC->workBuf->decodecp_handle->parm[3], G729DEC->workBuf->decodecp_handle->parm[4]);
                }
            }

        /* for speech and SID frames, the hardware detects frame erasures
        by checking if all bits are set to zero */
        /* for untransmitted frames, the hardware detects frame erasures
        by testing serial[0] */

        G729DEC->workBuf->decodecp_handle->parm[0] = 0;           /* No frame erasure */
  //      if(G729DEC->workBuf->decodecp_handle->serial[1] != 0) {
  //          for (i=0; i < G729DEC->workBuf->decodecp_handle->serial[1]; i++)
  //              if (G729DEC->workBuf->decodecp_handle->serial[i+2] == 0 ) 
  //              G729DEC->workBuf->decodecp_handle->parm[0] = 1;  /* frame erased     */
  //      }
  //      else if(G729DEC->workBuf->decodecp_handle->serial[0] != SYNC_WORD) 
  //      G729DEC->workBuf->decodecp_handle->parm[0] = 1;


  //      if (G729DEC->workBuf->decodecp_handle->parm[0] == 1) {
  //          printf("Frame Erased : %d\n", G729DEC->workBuf->decodecp_handle->frame);
  //          G729DEC->workBuf->decodecp_handle->serial_size = G729DEC->workBuf->decodecp_handle->serial_size_prec;
  //          if(G729DEC->workBuf->decodecp_handle->serial_size < RATE_6400) {
  //              G729DEC->workBuf->decodecp_handle->serial_size = 0;
  //          }
  //      }


        /* ---------- */
        /*  Decoding  */
        /* ---------- */
        decod_ld8c(G729DEC->workBuf ,G729DEC->workBuf->decodecp_handle->parm, G729DEC->workBuf->decodecp_handle->voicing, G729DEC->workBuf->decodecp_handle->synth_buf, G729DEC->workBuf->decodecp_handle->Az_dec,
            &(G729DEC->workBuf->decodecp_handle->T0_first), &(G729DEC->workBuf->decodecp_handle->bwd_dominant), &(G729DEC->workBuf->decodecp_handle->m_pst), &(G729DEC->workBuf->decodecp_handle->Vad));

        /* ---------- */
        /* Postfilter */
        /* ---------- */
        G729DEC->workBuf->decodecp_handle->ptr_Az = G729DEC->workBuf->decodecp_handle->Az_dec;

        /* Adaptive parameters for postfiltering */
        /* ------------------------------------- */
        if (G729DEC->workBuf->decodecp_handle->serial_size != 118) {
            G729DEC->workBuf->decodecp_handle->long_h_st = LONG_H_ST;
            G729DEC->workBuf->decodecp_handle->ga1_post = GAMMA1_PST;
            G729DEC->workBuf->decodecp_handle->ga2_post = GAMMA2_PST;
            G729DEC->workBuf->decodecp_handle->ga_harm = GAMMA_HARM;
        }
        else {
            G729DEC->workBuf->decodecp_handle->long_h_st = LONG_H_ST_E;
            /* If backward mode is dominant => progressively reduce postfiltering */
            if ((G729DEC->workBuf->decodecp_handle->parm[2] == 1) && (G729DEC->workBuf->decodecp_handle->bwd_dominant == 1)) {
                G729DEC->workBuf->decodecp_handle->ga_harm -= (F)0.0125;
                if (G729DEC->workBuf->decodecp_handle->ga_harm < 0) G729DEC->workBuf->decodecp_handle->ga_harm = 0;
                G729DEC->workBuf->decodecp_handle->ga1_post -= (F)0.035;
                if (G729DEC->workBuf->decodecp_handle->ga1_post < 0) G729DEC->workBuf->decodecp_handle->ga1_post = 0;
                G729DEC->workBuf->decodecp_handle->ga2_post -= (F)0.0325;
                if (G729DEC->workBuf->decodecp_handle->ga2_post < 0) G729DEC->workBuf->decodecp_handle->ga2_post = 0;
            }
            else {
                G729DEC->workBuf->decodecp_handle->ga_harm += (F)0.0125;
                if (G729DEC->workBuf->decodecp_handle->ga_harm > GAMMA_HARM_E) G729DEC->workBuf->decodecp_handle->ga_harm = GAMMA_HARM_E;
                G729DEC->workBuf->decodecp_handle->ga1_post += (F)0.035;
                if (G729DEC->workBuf->decodecp_handle->ga1_post > GAMMA1_PST_E) G729DEC->workBuf->decodecp_handle->ga1_post = GAMMA1_PST_E;
                G729DEC->workBuf->decodecp_handle->ga2_post += (F)0.0325;
                if (G729DEC->workBuf->decodecp_handle->ga2_post > GAMMA2_PST_E) G729DEC->workBuf->decodecp_handle->ga2_post = GAMMA2_PST_E;
            }
        }
        for(i=0; i<L_FRAME; i++) G729DEC->workBuf->decodecp_handle->pst_out[i] = G729DEC->workBuf->decodecp_handle->synth[i];

        G729DEC->workBuf->decodecp_handle->voicing = 0;
        for(i=0; i<L_FRAME; i+=L_SUBFR) {
			poste(G729DEC->workBuf->pstcp_handle,G729DEC->workBuf->decodecp_handle->T0_first, &(G729DEC->workBuf->decodecp_handle->synth[i]),
				G729DEC->workBuf->decodecp_handle->ptr_Az, &(G729DEC->workBuf->decodecp_handle->pst_out[i]), &(G729DEC->workBuf->decodecp_handle->sf_voic),
                G729DEC->workBuf->decodecp_handle->ga1_post, G729DEC->workBuf->decodecp_handle->ga2_post,
				G729DEC->workBuf->decodecp_handle->ga_harm,  G729DEC->workBuf->decodecp_handle->long_h_st,
				G729DEC->workBuf->decodecp_handle->m_pst, G729DEC->workBuf->decodecp_handle->Vad);
            if (G729DEC->workBuf->decodecp_handle->sf_voic != 0) G729DEC->workBuf->decodecp_handle->voicing = G729DEC->workBuf->decodecp_handle->sf_voic;
            G729DEC->workBuf->decodecp_handle->ptr_Az += G729DEC->workBuf->decodecp_handle->m_pst+1;
        }

		post_process(G729DEC->workBuf->postProc_handle,G729DEC->workBuf->decodecp_handle->pst_out, L_FRAME);
        
        G729DEC->workBuf->decodecp_handle->serial_size_prec = G729DEC->workBuf->decodecp_handle->serial_size;
 
    	
    	write16(G729DEC->workBuf->decodecp_handle->pst_out, L_FRAME , out );
    
    
    

}

XDAS_Void G729DEC_KMITL_bits2prm_ld8c(IG729DEC_Handle handle, XDAS_Int16 * serial,XDAS_Int32 * parm)
{
	bits2prm_ld8c(serial, parm);
}
Int  G729DEC_KMITL_numAlloc(Void){
	return MTAB_NRECS;
}
