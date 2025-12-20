#if !defined IMAGEPROCESSOR
#define IMAGEPROCESSOR

#include <cv.h>      // include core library interface
#include <highgui.h> // include GUI library interface
#include <stdio.h>
#include <math.h>
#include <string.h>
//#include "cvisionDlg.h"
#include "MyNeuralNetwork.h"
#include "FImgProc.h"
#include "ImgProc1.h"

#define PI 3.14159265

/*typedef struct {
  int x;
  int y;
  float data[4][8];
}keydes;*/

class ImageProcessor
{
public:    
    ImageProcessor()
	{
		nnscheme = 0;
		successload = 0;
		tfinish = 0;
		learnRate = 0.25f;
		MinError = 0.002f;
		Momentum = FALSE;
		Movalue = 0.9f;
		windowSize = 11;
		fn = "NO";
		firsttime = 1;
		filenumber = 0; //initialize
		cross_flag = 0;
    }
    void display()
	{
    }
	void initnn();
    //void execute(int *command,int& nnnn);
	double preparevalidation(void);
    void execute(int *command,int& nnnn,int **flevel,int& nnnn2,int thresh);
	void trainNetwork(int nepochs);
	void setBPparameter(float learnr,float minerror);
	void setBPWMparameter(BOOL momentum,float movalue);
	void TrainTheBrain(float ***bigdata,int maxnum,int epo);
	void setfilename(CString filen);
	CString getfilename(void);
    void showImage();
	void adaptiveTH();
	bool loadw();
	bool savew();
	void releasehebrain();
	void setscheme(int sch);

protected:
	//IplImage* image;
//	CCvisionDlg dia;
	NeuralNetwork	TheBrain;
	int cross_flag;
	float learnRate;
	int tfinish;
	int successload;//successload
	float MinError;
	BOOL Momentum;
	float Movalue;
	int		nnscheme;
	CString fn;
	FImgProc falcon;
	CImgProc Cimgproc;
	//CImgProc Cimgproc;
	//FImgProc falcon;
	int firsttime;
	int filenumber;
public:
	int windowSize;
};

#endif