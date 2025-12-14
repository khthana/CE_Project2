#define FFT 		-1
#define REV_FFT  	 1

// Radix 2 FFT calculation
// param = FFT      - performs FFT
// param = REV_FFT  - performs reverse FFT
// order = the order of FFT ( pow(2,order) calculated complex points )

void fft(double *real,double *imaginary,int order,int param);