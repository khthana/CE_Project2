#include <std.h>
#include <dtmfd.h>
#include <dtmfd_kasatka.h>

#include "konfigcfg.h"

extern int INTERNALHEAP;
extern int EXTERNALHEAP;

DTMFD_KONST dtmfd_Konst =
{
	5800000,	//5.8M
	13000000,	//22M
	500,
	
	320,		// 320 samp = 40mS
	320,	// 320 samp = 40mS
	744,	// 744 samp = 93mS
	80,			// 80 samp = 10mS	,allowed inturrupt period	
	
	{
	//x(2^17)
		152581, 130596, 104676, 74518, 	// hi
		223836, 215650, 205610, 193751	// low
	},
	
	200,
	-3000,
	-5500,
	
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

    DTMFD_Handle  handle;
    IDTMFD_Fxns   fxns;
    DTMFD_Params  params;


void main()
{
	ALGRF_setup(INTERNALHEAP,EXTERNALHEAP);  

    fxns = DTMFD_KASATKA_IDTMFD;
//    params = DTMFD_PARAMS;
    params.ptr2konst = &dtmfd_Konst;
    
          
    DTMFD_init();
    if((handle = DTMFD_create(&fxns, &params)) != NULL){  
		    
    }else
    {
    	DTMFD_exit();
    }
    
    return;
}

// ---
// ---

void cccp()
{
	SWI_dec(&SWI0);
	return;
}

// ---

void ps()
{
	MdInt dtmf_detection_result=500;   
	MdInt i;
	
	i=1;	// for prob point input, no meaning

    for (i = 0; i<80; i++) 
    {
		todtc[i] = infio[i];					// by file io		
	}
	
    for (i = 0; i < 80; i++) 
    {    
    		STS_set(&STS_CLK, CLK_gethtime());
		// sample per sample	        
        DTMFD_apply(handle,&todtc[i],&dtmf_detection_result);
        	STS_delta(&STS_CLK, CLK_gethtime());
    } 
    
	if ((dtmf_detection_result >=0)&&(dtmf_detection_result < 100))
	{				
		result[0] = 100000;
		result[1] = dtmf_detection_result;											
    	
		dtmf_detection_result=500;	    // prob point area output (result)	  	
	}
	return;	    							 
}

// ---



