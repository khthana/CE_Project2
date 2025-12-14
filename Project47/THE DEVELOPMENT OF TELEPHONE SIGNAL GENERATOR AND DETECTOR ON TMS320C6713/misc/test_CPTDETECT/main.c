//#include <std.h>
#include "cptdetect_kmitl.h"
//#include "icptdetect.h"
#include "cptdetect.h"

int in[80];
int in2[80];
void FileIO()
{
}

void main(){
    CPTDETECT_Handle  handle,handle2;
    ICPTDETECT_Fxns   fxns,fxns2;
    CPTDETECT_Params  params,params2;
    
    CPTDETECT_Result result,result2;

    fxns = CPTDETECT_KMITL_ICPTDETECT;

	fxns2 = CPTDETECT_KMITL_ICPTDETECT;
    
    params.framesizeIn0 = 80;
    params2.framesizeIn0 = 80;
    

    CPTDETECT_init();
    if((handle = CPTDETECT_create(&fxns, &params)) != NULL){
    	if((handle2 = CPTDETECT_create(&fxns2, &params2)) != NULL)
    	{
    		FileIO();
    	}
  
        while(1)
        {
	        FileIO();
	        FileIO();
	        result = CPTDETECT_apply(handle, in);
	        result2 = CPTDETECT_apply(handle2, in2);
	        if(result.result != 99)
	        {
	        	printf("%d",result.result);
	        }
	        if(result2.result != 99)
	        {
	        	printf("%d",result2.result);
	        }
	        if(result.isRejected == 1 || result2.isRejected == 1)
	        {
	        	printf("%d",result.result);	
	        }
        }
        CPTDETECT_delete(handle);
        CPTDETECT_delete(handle2);
    }
    CPTDETECT_exit();
}
