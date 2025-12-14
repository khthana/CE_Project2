//
//		dtmfg_mblk.h
//		struct of mem. be used, and konstant be used.
//		written by Yury Ongsuvanov
//		used to define memory block of dtmfg mod.
//

//#define MaxGenDTMFQueueItem 50

// ---

#ifndef MBLKdtmfg

#define MBLKdtmfg

typedef struct
{
	Uns dtmfg_low_step[16];	// unsigned int
	Uns dtmfg_hi_step[16];
	
	Int *dtmfg_sine_tab;	// int
	MdInt dtmfg_sine_tab_elem;	//512
	
}DTMFG_KONST;

// ---

typedef struct{

	MdUns gen_dtmf_signal_length;	//800	samples	// unsigned short
	MdUns gen_dtmf_pause_length;	//800	
	
	MdInt *gen_dtmf_targetarray;			//NULL	//short
	MdUns gen_dtmf_array_element;		//0
	MdUns gen_dtmf_arr_ptr;	
	
	Uns gen_dtmf_acs1;	//0		// unsigned int
	Uns gen_dtmf_acs2;	//0
	Char gen_dtmf_currentDigit;	// short
	MdInt gen_dtmf_signalGend;
	
	MdInt gen_dtmf_pauseGend;	// short
	
	Char gen_dtmf_state;	//0		//MdInt
	

	//Char gen_dtmf_genDTMFQueue[MaxGenDTMFQueueItem]; // e.g. 201 defined = 200 usable
	Char *gen_dtmf_genDTMFQueue;		//NULL
	MdUns gen_dtmf_genDTMFQueue_element;	//0
	
	MdUns gen_dtmf_sPtr;	//0
	MdUns gen_dtmf_ePtr;	//1	
	
	Char gen_dtmf_enable;	//	0(disable, default), 1(enable)

} DTMFG_MBLK;

// ---

#define DTMFG_LOW_STEP	DTMFG->konst->dtmfg_low_step
#define DTMFG_HI_STEP  	DTMFG->konst->dtmfg_hi_step
#define DTMFG_SINE_TAB	DTMFG->konst->dtmfg_sine_tab

#define DTMFG_SINE_TAB			DTMFG->konst->dtmfg_sine_tab
#define DTMFG_SINE_TAB_ELEM		DTMFG->konst->dtmfg_sine_tab_elem


#endif
// ---

