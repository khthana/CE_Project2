//
//		r2mfg_mblk.h
//		struct of mem. be used, and konstant be used.
//		written by Yury Ongsuvanov
//		used to define memory block of r2mfg mod.
//

// ---

#ifndef MBLKr2mfg

#define MBLKr2mfg

typedef struct
{
	Uns r2mfg_fwd_a[16];	//8kHz *1024	unsigned int
	Uns r2mfg_fwd_b[16];	//0(not used) 1..15
	
	Uns r2mfg_bwd_a[16];	
	Uns r2mfg_bwd_b[16];	
	
	Int *r2mfg_sine_tab;
	MdInt r2mfg_sine_tab_elem;	//512
	
} R2MFG_KONST;

// ---


typedef struct{

	MdInt *gen_r2mf_targetarray;	//NULL	short
	MdInt gen_r2mf_array_element;	//0
	MdInt gen_r2mf_arr_ptr;
	MdInt gen_r2mf_percentpow;		//55
	
	// ---
	Uns gen_r2mf_acs1;		//0		unsigned int
	Uns gen_r2mf_acs2;		//0
	Uns gen_r2mf_step1;
	Uns gen_r2mf_step2;
	MdInt gen_r2mf_currentDigit;	//short
	
	MdInt gen_r2mf_state;			//0	short

} R2MFG_MBLK;

// ---

/*
#define R2MFG_FWD_A		R2MFG->konst->r2mfg_fwd_a
#define R2MFG_FWD_B		R2MFG->konst->r2mfg_fwd_b
#define R2MFG_BWD_A		R2MFG->konst->r2mfg_bwd_a
#define R2MFG_BWD_B		R2MFG->konst->r2mfg_bwd_b

#define R2MFG_SINE_TAB	R2MFG->konst->r2mfg_sine_tab
*/

#define R2MFG_FWD_A		R2MFG->konst->r2mfg_fwd_a
#define R2MFG_FWD_B		R2MFG->konst->r2mfg_fwd_b
#define R2MFG_BWD_A		R2MFG->konst->r2mfg_bwd_a
#define R2MFG_BWD_B		R2MFG->konst->r2mfg_bwd_b

#define R2MFG_SINE_TAB			R2MFG->konst->r2mfg_sine_tab
#define R2MFG_SINE_TAB_ELEM		R2MFG->konst->r2mfg_sine_tab_elem

#endif
// ---

