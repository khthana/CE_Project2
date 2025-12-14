#pragma warning(disable: 4786)

#include "MATRIX.h"  
//#include "fft.h"

#ifndef _NO_NAMESPACE
using namespace std;
using namespace math;
#define STD std
#else
#define STD
#endif

#ifndef _NO_TEMPLATE
typedef matrix<double> Matrix;
#else
typedef matrix Matrix;
#endif

class PROCESS 
{
	private:
		Matrix MELFILTERBANK(double p,double n,double fs);
		Matrix HAMMING(int n);
		Matrix DCT(Matrix x,double n); 
		Matrix FFT_DCT(Matrix b,Matrix m,int order);
		Matrix MFCC(Matrix s,double fs); 
	public:
		Matrix EXTRACT(Matrix wavtrain,int length_wav,int no_cmd);		
		Matrix ENDPOINT(Matrix m);
};
