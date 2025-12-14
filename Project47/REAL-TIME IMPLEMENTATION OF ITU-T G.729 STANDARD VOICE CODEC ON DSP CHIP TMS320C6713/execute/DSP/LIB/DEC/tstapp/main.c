#include <std.h>
#include <stdio.h>
#include <stdlib.h>
#include "G729DECcfg.h"

#include "typedef.h"
#include "ld8k.h"
#include "ld8cp.h"
#include "dtx.h"
#include "octet.h"

#include "g729dec.h"
#include "g729dec_kmitl.h"


float PtrOut0[256];
extern int INTERNALHEAP;
extern int EXTERNALHEAP;

G729DEC_Handle  handle;
IG729DEC_Fxns   fxns;
G729DEC_Params  params;
FILE    *f_syn, *f_serial;
int  	serial_size;
int    	parm[PRM_SIZE_E+3];             /* Synthesis parameters        */
INT16  	serial[SERIAL_SIZE_E];          /* Serial stream               */
INT16  	out[L_FRAME];                   /* Postfilter output           */
 

void main(){
 	fxns = G729DEC_KMITL_IG729DEC;
    params = G729DEC_PARAMS;
    
       /* Open file for synthesis and packed serial stream */
    if( (f_serial = fopen("d:/project/tester/serialDSP.bit","rb") ) == NULL ) {
         exit(0);
    }
    if( (f_syn = fopen("d:/project/tester/Xout.pcm", "wb") ) == NULL ) {
         exit(0);
    }

    
    
    G729DEC_init();   
    
	ALGRF_setup(EXTERNALHEAP,EXTERNALHEAP);

		
	    if((handle = G729DEC_create(&fxns, &params)) != NULL){
  
     
    while( fread(serial, sizeof(INT16), 2, f_serial) == 2) {
          serial_size = (int)serial[1];
        if(serial_size != 0) {
            if (fread(&serial[2], sizeof(INT16), serial_size, f_serial) !=
                (size_t)serial_size) {
                exit(-1);
            }
        }
      
		G729DEC_bits2prm_ld8c(handle,&serial[1], parm);
  
   		G729DEC_apply( handle, (XDAS_Int32 *)parm , (XDAS_Int16 *)out ,serial_size );


  		fwrite(out , sizeof(INT16), L_FRAME, f_syn);
       }
        G729DEC_delete(handle);
    }
    

  
    	if(f_serial) fclose(f_serial);
	  	if(f_syn) fclose(f_syn); 
    
    G729DEC_exit();

}



