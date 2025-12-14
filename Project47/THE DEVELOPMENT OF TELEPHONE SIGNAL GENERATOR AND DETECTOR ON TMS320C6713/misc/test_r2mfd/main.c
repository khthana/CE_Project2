#include <std.h>
#include <r2mfd.h>
#include <r2mfd_kasatka.h>

#include "konfigcfg.h"

extern int INTERNALHEAP;
extern int EXTERNALHEAP;

// ---

R2MFD_KONST r2mfd_Konst =
{
	8000000,
	10000000,
	500,
	
	{
	// x 2^17
	// 1380, 1500, 1620, 1740, 1860, 1980
	0x0001DF28, 0x000187DE, 0x00012D18, 0x0000CFA7, 0x0000705E, 0x00001015
	},	
	{
	// x 2^17
	// 1140, 1020, 900, 780, 660, 540
	0x0002803F, 0x0002C89D, 0x00030AA7, 0x000345C9, 0x0003797A, 0x0003A546
	},	
	
	-450,
	-3500,
	
	131072,
	
	-159540501,
	-81494089,
	
	{
		0, 39456604, 16375970, 7601120,
		3673781, 1807258, 896457, 446464,
		222794, 111288, 55617, 27802,
		13899, 6949, 3474, 1737,
		869, 434, 217, 109,
		54, 27, 14, 7,
		3, 2, 1
	},
	{
	   0, -39456603, -78913207, -118369810, 
	   -157826414, -197283017, -236739621, -276196225, 
	   -315652828, -355109432, -394566035, -434022639, 
	   -473479243, -512935846, -552392450, -591849053, 
	   -631305657, -670762261, -710218864, -749675468, 
	   -789132071, -828588675, -868045279, -907501882, 
	   -946958486, -986415089, -1025871693, -1065328296, 
	   -1104784900, -1144241504, -1183698107, -1223154711
	}	
};

MdInt todtc[80];
Int infio[80];
Int result[2];

    R2MFD_Handle  handle;
    IR2MFD_Fxns   fxns;
    R2MFD_Params  params;  


void main()
{
    ALGRF_setup(INTERNALHEAP,EXTERNALHEAP);	

    fxns = R2MFD_KASATKA_IR2MFD;
    //params = R2MFD_PARAMS;
    params.ptr2konst = &r2mfd_Konst;

    R2MFD_init();
    if((handle = R2MFD_create(&fxns, &params)) != NULL){
    
    }else
    {
    	R2MFD_exit();
    }
	return;
}

// ---
// ---
void cccp()
{
	SWI_dec(&SWI0);
}


// ---

void ps()
{
    MdInt i,j;
	MdInt r2mf_detection_result=0;      
    
	while(1)
	{		
		i=1;	// for prob point input, no meaning
	
	    for (i = 0, j=0; i < 80; i++, j+=2) 
	    {
			todtc[i] = infio[i];					// by file io		
		}
		
	    for (i = 0; i < 80; i++) 
	    {    
				STS_set(&STS_CLK, CLK_gethtime());	    
	    	R2MFD_apply(handle,&todtc[i],&r2mf_detection_result);
				STS_delta(&STS_CLK, CLK_gethtime());	    		        	        
	    }
	    
		if (r2mf_detection_result != 0)
		{
			i = r2mf_detection_result & 0x0F;		//fwd
			j = (r2mf_detection_result & 0xF0)>>4;	//bwd
			
			result[0] = i;
			result[1] = j;												
	    	
			r2mf_detection_result = 0;	   // prob point , output result
		}		    
	}

}

// ---




