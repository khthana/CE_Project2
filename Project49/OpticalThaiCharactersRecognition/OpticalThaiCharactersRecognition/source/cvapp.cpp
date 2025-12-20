#include <cv.h>      // include core library interface
#include <highgui.h> // include GUI library interface
#include "stdafx.h"
#include <allegro.h>			//#include <allegro.h>
#include "cvapp.h"
#include "FImgProc.h"
#include "FImage.h"
#include "ImgProc1.h"
#include "Img.h"
#include "MyNeuralNetwork.h"
 #pragma warning(disable : 4996)

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//ImageProcessor *proc = 0;

// Should have been declared as 
// void process(IplImage* img)
// but we will use it as a callback
// in the next version.
/*void process(void* img) {

  IplImage* image = reinterpret_cast<IplImage*>(img);  // img must point to an IplImage
  cvErode( image, image, 0, 2 );

}
*/

/*

void shellSort(int *numbers, int array_size)
{
  int i, j, increment, temp;

  increment = 3;
  while (increment > 0)
  {
    for (i=0; i < array_size; i++)
    {
      j = i;
      temp = numbers[i];
      while ((j >= increment) && (numbers[j-increment] > temp))
      {
        numbers[j] = numbers[j - increment];
        j = j - increment;
      }
      numbers[j] = temp;
    }
    if (increment/2 != 0)
      increment = increment/2;
    else if (increment == 1)
      increment = 0;
    else
      increment = 1;
  }
}*/
/*
unsigned char findmax(unsigned char* data , int begin , int end)
{
    quick_sort_Oo( data,  begin,  end );
    return data[0];
}*/
/*
int findmin(int *data , int begin , int end)
{
	shellSort( data , begin + end );
	return data[0];
}*/
void ImageProcessor::releasehebrain() 
{

	TheBrain.CleanUp();

}
bool ImageProcessor::loadw()
{
	bool result;
	int toread;

	FILE *file_ = fopen("error.dat","r");

	if(file_)
	{
		fseek( file_ , 0L, SEEK_SET );
		fscanf(file_,"%d\n",&toread);
	
		result = TheBrain.loadWeight(toread);
		fclose(file_);

		if(result == false)
		{
			MessageBox(NULL , "There is no data found in the files,please train the data and save" , "Error" , MB_OK);
			return false;
		}
		else 
		{
			successload = 1;
			return true;
		}
	}
}

bool ImageProcessor::savew()
{
	if(tfinish == 1)
	{
		TheBrain.saveWeight(filenumber);
		return true;
	}
	else
	{
		MessageBox(NULL,"There no data to save,please train data before save krub" , "Error" , MB_OK);
		return false;
	}

}
void ImageProcessor::adaptiveTH() 
{	
	if(fn != "NO")
	{
		FImage Images[2];
		char buffer[20];


		int www,remind,hhh;
		IplImage *img = NULL;
		IplImage *imgcl = NULL;
		unsigned char *_data = NULL;

		falcon.initial();

		IplImage* image;
		image = cvLoadImage( fn , 1 ); 
		
		www = image->width;
		hhh = image->height;

		if( (www%4) > 0 )
		{
    		remind = www%4;

			if(remind == 1) //this is only one
			{
				www = www - 1;
			}
			else			//this mean more than 1 ( 2, 3)
			{
				www = www + (4 - remind);
			}
			imgcl = cvCloneImage( image );
			img = cvCreateImage( cvSize(www, hhh), 8, 3 );
			cvResize( imgcl , img , CV_INTER_CUBIC );
			_data = reinterpret_cast<unsigned char *>(img->imageData);
		}
	    else
		{
			img = cvCloneImage( image );
			_data  = reinterpret_cast<unsigned char *>(img->imageData);
	    }
//		unsigned char *_data  = reinterpret_cast<unsigned char *>(image->imageData);
		CImg source((TBCOLOR *)_data, &CSize(img->width, img->height));  
		CImg tt((TBCOLOR *)_data, &CSize(img->width, img->height));

		Cimgproc.Rgb2Gray(&tt,&tt);
		Images[0].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );
		Images[1].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );

		//falcon.Threshold(Images[0], Images[1], windowSize );
		falcon.Threshold_normal(Images[0] , Images[1] , windowSize );

		CImg dst((TBCOLOR *)Images[1].m_data , &CSize( Images[1].m_width , Images[1].m_height ));
		Cimgproc.binRemoveSalt(&dst,&dst);

	    unsigned char *data__1 = reinterpret_cast<unsigned char *>(dst.m_pImgDat);

		IplImage *test = cvCreateImage( cvSize( dst.GetWidth() , dst.GetHeight() ) , 8 , 3);
		test->imageData = (char *)data__1;

		sprintf( buffer , "thresholdimg.bmp" );
		cvSaveImage( buffer , test );

	    cvNamedWindow( "AdaptiveTH" , CV_WINDOW_AUTOSIZE );
		cvShowImage( "AdaptiveTH", test );

		falcon.cleanmem();
	}
}
void ImageProcessor::showImage()
{
	IplImage* im;
	im = cvLoadImage( fn , 1 ); 

    cvNamedWindow( "Original Image", CV_WINDOW_AUTOSIZE );  
	cvShowImage( "Original Image", im );  
}
void ImageProcessor::initnn()
{
										//	TheBrain.Initialize(0,0,0);
}
void ImageProcessor::setscheme(int sch) 
{
	//TheBrain.setsch(sch);
	nnscheme = sch;
	MinError = 0.00001;
}
void ImageProcessor::setfilename(CString filen)
{
	fn = filen;	
}
CString ImageProcessor::getfilename()
{
	return fn;
}

void ImageProcessor::setBPparameter(float learnr,float minerror)
{
	learnRate = learnr;
	MinError = minerror;
}
void ImageProcessor::setBPWMparameter(BOOL momentum,float movalue)
{
	Momentum = momentum;
	Movalue = movalue;
}
void ImageProcessor::TrainTheBrain(float ***bigdata,int maxnum,int epo)
{
	FILE *ff;
	cross_flag = 0;
	int xxx = 760,yyy = 560;
	int		i,j,k,is_ok;
	int red, green, blue, color/*ste*/;
	double	error = 1,/*olderror,*/oerror = 500.0;
	int		c = 0/*tofinish*/;	//tofinish
	float tmp = (float)maxnum;
	int startx,starty,wnccounter;
	double leranrate,error_his[15];
	
	int stepup = 0;
	int flg = 0;
	int old_c = 0,to_exit = 0;
	int next_count = epo;						//  stepup * 
	int marked;

	is_ok = 0;
	allegro_init();
	install_keyboard();
	int ret = set_gfx_mode(GFX_AUTODETECT_WINDOWED, 800, 600, 0, 0);
	if (ret != 0)
	{
		allegro_message(allegro_error);
		return;
	}
	textprintf(screen, font, 0, 0, 15, "This graph show the error per iteration X is iter , Y is error");
	
	red = 255;
	green = 0;
	blue = 0;
	color = makecol(red,green,blue);
	
	//line(screen,(SCREEN_W-xxx)/2,(SCREEN_H-yyy)/2,(SCREEN_W-xxx)/2,SCREEN_H-((SCREEN_H-yyy)/2),color);
	//line(screen,(SCREEN_W-xxx)/2,SCREEN_H-((SCREEN_H-yyy)/2),SCREEN_W-((SCREEN_W - xxx)/2),SCREEN_H-((SCREEN_H - yyy)/2),color);

	red = 0;
	green = 255;
	blue = 0;
	color = makecol(red,green,blue);

	startx = (SCREEN_W-xxx)/2;
	starty = SCREEN_H - ((SCREEN_H-yyy)/2 + 10);

	while( (to_exit == 0) && (c < 38000) ) //(error > MinError)
	{
		error = 0;
		c++;
		wnccounter = 0;
		for(k = 0;k < 112;k++) 
		{
			for(i = 0;i < maxnum;i++)
			{
				for(j = 0;j < 65;j++)
					TheBrain.SetInput(j, bigdata[k][i][j]);	
			
				for(j = 65;j < 143;j++)
					TheBrain.SetDesiredOutput(j - 65, bigdata[k][i][j]);	
			
				TheBrain.FeedForward();
				//error += TheBrain.CalculateError();
				TheBrain.BackPropagate();

				//if(nnscheme == 1)
				//{
				//	tofinish = TheBrain.checkforfinish();
				//	if(tofinish == 1)
				//		wnccounter += 1;
				//}
			}
		}
		
		if(c == next_count) //minimum of epo is 5
		{
			error = preparevalidation();
			//error = TheBrain.validation();
			error_his[stepup] = error;
			TheBrain.saveWeight(stepup % 2); //save weight for file number 1
			if(oerror <= 1)
			{
				if(error > oerror) //this mean that it is ok!!!!!!!!!
				{
					//TheBrain.saveWeight(); //save weight for file number 2
					//error now must less than the old error
					if(error > MinError) //we imply here to more than the minimum error
					{
						to_exit = 1; //we don't automatically save weight
						//TheBrain.saveWeight(stepup % 2);
						ff = fopen("error.dat","wt");
						filenumber = stepup % 2;
						fprintf(ff,"%d\n",(int)(stepup % 2) ); //save what file to be load	
					}
				}
				else
				{
					//mean that we file local minima
					//here we'll adjust the value of epo
					//we recall back to the old value of c
					if(flg == 0) //mean that this is the first time
					{
						cross_flag = 1;
						falcon.cross_validate(bigdata,56);
						c = old_c;
						//reset the epo to 5
						marked = stepup;

						leranrate = TheBrain.getLearningRate();
						leranrate = leranrate * 0.6;
						TheBrain.SetLearningRate(leranrate);

						epo = epo / 2;     //100;    * 0.2                  * 0.2
						next_count = c + epo; 
						flg = 1;
						//next we must load the weight here
						//this is how we recall back
						if((stepup % 2) == 1)
							TheBrain.loadWeight(0);
						else
							TheBrain.loadWeight(1);
					}
					else
					{
						to_exit = 1; //we must exit here
						if( (stepup % 2) == 1 ) //mean here the stepup is now equal to 1,3,5,7,9
						{
							filenumber = 0;
							TheBrain.loadWeight(0);
							ff = fopen("error.dat","wt");
							fprintf(ff,"%d\n",filenumber);	
						}
						else
						{
							filenumber = 1;
							TheBrain.loadWeight(1);
							ff = fopen("error.dat","wt");
							fprintf(ff,"%d\n",filenumber);	
						}
					}
				}
			}
			textprintf(screen , font , 200 , 200 , 15 , "%.5f" , error);
			textprintf(screen , font , 400 , 200 , 15 , "%.5f" , oerror);

			stepup += 1;
			if(flg != 1)
			{
				next_count = next_count + epo;
			}
			oerror = error;
			old_c = c;
		}

		textprintf(screen , font , 600 , 200 , 15 , "%d" , c);

		//error = error / (tmp * 223);
		//if(nnscheme == 1)
		//{
		//	if((wnccounter >= (180 * maxnum))&&(is_ok == 0))					//if the weight not change for half of the total
		//	{
		//		learnRate = learnRate * 0.25;
		//		TheBrain.SetLearningRate(learnRate);
		//		is_ok = 1;
		//	}
		//	else if(wnccounter == (223 * maxnum))				//train till the weight is not change
		//	{
		//		c = 1000001;
		//	}
		//}
		//if(c == 1)
		//{
		//	erroryspace = error / 550.0;
			//we assume here that the error of the first iteration is the error(max)
		//	olderror = error;
		//}

		//if( (c % 5) == 0 ) //show the status of error every 5 times
		//{
		//	fprintf(ff,"%f\n",error);	
		//	ste = (int)(fabs(error - olderror) / erroryspace);
		//	startx += 5;
		//	olderror = error;
		//}
	}
	textprintf(screen, font, 0, 0, 15, "Press any key to exit now you must press esc to exit          ");
	readkey();
	allegro_exit();
	fclose(ff);

	FILE *ff_1;
	ff_1 = fopen("error_his.dat","wt");

	fprintf(ff_1,"marked is %d\n\n",marked);

	for(i = 0;i < stepup;i++)
	{
		fprintf(ff_1,"%.3f",error_his[i]);
		fprintf(ff_1,"\n");
	}
	fclose(ff_1);
}


double ImageProcessor::preparevalidation() 
{
	float ***f = new float** [56];
	char fer[20];
	int cou,qq,iii;
	int cc = 0;
	int **resu = new int* [56];
	double eval = 0.0;
	int numofcor = 0,totalchar = 0;
	int loveli = 15;

    FImage Images[3];

	for(int i = 0;i < 56;i++) //mean there are 56 files
	{

		f[i] = new float* [78];
		for(int j = 0;j < 78;j++) //mean there are 78 characters on each file
		{
			f[i][j] = new float [143];  //mean that one character can have 78 + 65 features to recognize
		}
	}
	for(int i = 0;i < 56;i++)
	{
		resu[i] = new int [78];
	}

//	if(firsttime == 1) //if it is the first time so we set the variable firsttime to 1 and 
//	{
	if(cross_flag == 0)
	{
		cou = falcon.train_1(56,f,2); //		cou = falcon.train_1(56,f,2);
	}
	else
	{
		cou = falcon.train_1(112,f,5); //mean here for cross validation
	}
//		firsttime = 0;
//	}

	if(cou == 0) //mean that is this the first time
	{
		char **filename = new char* [56];
//		firsttime = 0; //firsttime                                                               firsttime
		for(int i = 0;i < 56;i++)
			filename[i] = new char [20];

		for(int in = 0;in < 56;in++) 
		{
			if(in < 28)
				sprintf(fer,"v%d.bmp",in+1);
			else
			{
				qq = (in - 28) + 1;
				sprintf(fer,"v%dt.bmp",qq);
			}
			
			strcpy(filename[in],fer);
		}

		qq = 0; //what is qq used for
		falcon.settraining(2);
		falcon.starttrain(2);

		for(iii = 0;iii < 56;iii++) //mean that there are 56 files in this directory
		{
			if(iii == 0)
				loveli = 11;
			else
				loveli = 15;

//			else if(iii == 3)
//				specialwindow = 13;

//			if(iii == 56)
//			{
//				iii = 56;
				//break;
//			}
			falcon.initial();
			cc = 0;

			if(iii >= 28) 
				qq = 1;

			IplImage *img = cvLoadImage( filename[iii] , 1);

			if((img->width % 4) != 0)
				break;

		    unsigned char *_data  = reinterpret_cast<unsigned char *>(img->imageData);
			CImg source((TBCOLOR *)_data, &CSize(img->width, img->height));  
			CImg tt((TBCOLOR *)_data, &CSize(img->width, img->height));

		    Cimgproc.Rgb2Gray(&tt,&tt);
			Images[0].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );
			Images[1].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );

		    falcon.Threshold(Images[0], Images[1], loveli );//we replace specialwindow with 15
			CImg dst((TBCOLOR *)Images[1].m_data , &CSize( Images[1].m_width , Images[1].m_height ));
			Cimgproc.binRemoveSalt(&dst,&dst);

		    Images[2].Create((F_PIXEL*)dst.m_pImgDat , dst.GetWidth() , dst.GetHeight() );
	
			falcon.PutFloodfillBorder(Images[2]);
			falcon.AnalyseBlob(Images[2]);
			//falcon.BlobMoveFirst();					no need to call BlobMoveFirst
			
			falcon.BlobMoveFirst();
			falcon.blobextract(Images[2]);
			cou = falcon.Trai(f[iii],2,qq); //2 mean train with validation

			for(int i = 0;i < cou;i++)
			{
  				for(int j = 0;j < 65;j++)
				{
					TheBrain.SetInput(j, f[iii][i][j]);	//ff[i][j]
				}
				TheBrain.FeedForward();
				resu[iii][i] = TheBrain.GetMaxOutputID();
			}

			for(int i = 0;i < cou;i++) 
			{
				if(resu[iii][i] == i) //this is the correct matching  f[iii][i][65]
					numofcor += 1;

				totalchar += 1;
			}
		}
		falcon.stoptraining();

		for(int i = 0;i < 56;i++) 
		{
			delete[] filename[i]; 
		}									
		delete[] filename;
	}
	else
	{
		for(iii = 0;iii < 56;iii++)
		{
			for(int i = 0;i < cou;i++)
			{
  				for(int j = 0;j < 65;j++)
				{
					TheBrain.SetInput(j, f[iii][i][j]);	//ff[i][j]
				}
				TheBrain.FeedForward();
				resu[iii][i] = TheBrain.GetMaxOutputID();
			}
			
			for(int i = 0;i < cou;i++) 
			{
				if(resu[iii][i] == i) //this is the correct matching  f[iii][i][65]
					numofcor += 1;

				totalchar += 1;
			}
		}
	}

	for(int i = 0;i < 56;i++)
	{
		for(int j = 0;j < 78;j++) 
		{
			delete[] f[i][j];
		}
		delete[] f[i];
	}
	
	for(int i = 0;i < 56;i++) 
	{
		delete[] resu[i]; 
	}	

	delete[] resu;
	delete[] f;

	eval = (double)numofcor / (double)totalchar;		///////////////////////eval
	return eval;
}
void ImageProcessor::trainNetwork(int epochs)
{
	int specialwindow;
	float ***feature = new float** [112];
	int cou,iii;
	bool zz;
	char fer[15];
	char buff[15];
	int errorcounter = 0;
	int	*error = new int[112];
	
	int *error_num = new int[112];
	F_BLOB te;
	int cc = 0;
	int *siz = new int [78];
	CPoint t_left[78];
	CPoint bright[78]; 

    FImage Images[3];

	if(Momentum == FALSE)
	{
		zz = false;
	}
	else
	{
		zz = true;
	}

	for(int i = 0;i < 112;i++)
	{

		feature[i] = new float* [78];
		for(int j = 0;j < 78;j++) 
		{
			feature[i][j] = new float [143];
		}
	}
	cou = falcon.train_1(112,feature,1);
	if(cou == 0)
	{
		int qq;
		falcon.settraining(1);
	    char **filename = new char* [112];

		for(int in = 0;in < 112;in++)
			filename[in] = new char [20];

		for(int in = 0;in < 112;in++) 
		{
			if(in < 56)
				sprintf(fer,"%d.bmp",in+1);
			else
			{
				qq = (in - 56) + 1;
				sprintf(fer,"%dt.bmp",qq);
			}
			
			strcpy(filename[in],fer);
		}

		falcon.starttrain(1);
		qq = 0;
		for(iii = 0;iii < 112;iii++) 
		{
			falcon.initial();

			if(iii == 0)
				specialwindow = 11;
			else
				specialwindow = 15;

//			else if(iii == 3)
//				specialwindow = 13;

			if(iii == 56)
			{
				iii = 56;
			}
			cc = 0;

			if(iii >= 56) 
				qq = 1;

			IplImage *img = cvLoadImage( filename[iii] , 1);

			if((img->width % 4) != 0)
				break;

		    unsigned char *_data  = reinterpret_cast<unsigned char *>(img->imageData);
			CImg source((TBCOLOR *)_data, &CSize(img->width, img->height));  
			CImg tt((TBCOLOR *)_data, &CSize(img->width, img->height));

		    Cimgproc.Rgb2Gray(&tt,&tt);
			Images[0].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );
			Images[1].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );

		    falcon.Threshold(Images[0], Images[1], specialwindow );
			CImg dst((TBCOLOR *)Images[1].m_data , &CSize( Images[1].m_width , Images[1].m_height ));
			Cimgproc.binRemoveSalt(&dst,&dst);

		    Images[2].Create((F_PIXEL*)dst.m_pImgDat , dst.GetWidth() , dst.GetHeight() );
	
			falcon.PutFloodfillBorder(Images[2]);
			falcon.AnalyseBlob(Images[2]);
			falcon.BlobMoveFirst();
			while (falcon.BlobGetNext(te))
			{
				siz[cc] = te.size;
				if(siz[cc] >= 5)
				{
					t_left[cc] = CPoint( te.xmin , Images[2].m_height - te.ymin - 1);
					bright[cc] = CPoint( te.xmax , Images[2].m_height - te.ymax - 1);	    
					cc++;
				}
			}
			falcon.BlobMoveFirst();
			falcon.blobextract(Images[2]);
			cou = falcon.Trai(feature[iii],1,qq);
			
//			for(int kk = 0 ; kk < cc ; kk++) 
//			{
//				source.PutMark(&t_left[kk],&bright[kk],TBCOLOR(0,255,0));
//			}
//		    unsigned char *dat_1 = reinterpret_cast<unsigned char *>(source.m_pImgDat);
//		    IplImage *only = cvCreateImage( cvSize( source.GetWidth() , source.GetHeight() ) , 8 , 3);
//			only->imageData = (char *)dat_1;
//			sprintf(buff,"final%d.bmp",iii);

			falcon.cleanmem();
			if(cou < 78)
			{
				error[errorcounter] = iii;
				error_num[errorcounter] = cou;
				errorcounter++;
			}
			else
			{

			}
			cvReleaseImage(&img);
		}
		falcon.stoptraining();
		delete[] filename;//have a problem here must delete the pointer such 2 dimensional
	}

	if(successload == 0)
		TheBrain.Initialize(65,65,cou,nnscheme);

	TheBrain.SetLearningRate(learnRate);
	TheBrain.SetMomentum(zz,Movalue);
	TrainTheBrain(feature,cou,epochs);
	tfinish = 1;

	MessageBox(NULL , "Train completed" , "TEST" , MB_OK);
	for(int i = 0;i < 112;i++)
	{
		for(int j = 0;j < 78;j++) 
		{
			delete[] feature[i][j];
		}
		delete[] feature[i];
	}
	delete[] feature;
	delete[] error;
	delete[] error_num;
}
void ImageProcessor::execute(int *command,int& nnnn,int **flevel,int& nnnn2,int thresh)//this function is suitable for test than train 
{		
  if(fn == "NO")
	  return;

  float **ff = new float* [1000];

  FImage Images;//[3];

  FILE *file = fopen( "dd.dat" , "wt" );

  for(int i = 0;i < 1000;i++)
	  ff[i] = new float [65];

  F_BLOB tmpblob;
  int cc = 0;
  int *size = new int [1000];
  CPoint topleft[1000];
  CPoint botright[1000]; 

  falcon.initial();
  falcon.settraining(0);

  char *filename = "test_4.bmp";
  int www,remind,hhh;
  IplImage *img = NULL;
  IplImage *imgcl = NULL;
  unsigned char *_data = NULL;
  IplImage *test = cvLoadImage( "thresholdimg.bmp" , 1);
			
  www = test->width;
  hhh = test->height;
	
  if( (www%4) > 0 )
  {
    	remind = www%4;

		if(remind == 1) //this is only one
		{
			www = www - 1;
		}
		else			//this mean more than 1 ( 2, 3)
		{
			www = www + (4 - remind);
		}
		imgcl = cvCloneImage( test );
		img = cvCreateImage( cvSize(www, hhh), 8, 3 );
		cvResize( imgcl , img , CV_INTER_CUBIC );
		_data = reinterpret_cast<unsigned char *>(img->imageData);
  }
  else
  {
		img = cvCloneImage( test );
		_data  = reinterpret_cast<unsigned char *>(img->imageData);
  }

  CImg source((TBCOLOR *)_data, &CSize(img->width, img->height));  
//  CImg tt((TBCOLOR *)_data, &CSize(img->width, img->height));

//  Cimgproc.Rgb2Gray(&tt,&tt);
//  Images[0].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );
//  Images[1].Create((F_PIXEL*)tt.m_pImgDat, tt.GetWidth() , tt.GetHeight() );

//  falcon.Threshold(Images[0], Images[1], windowSize );
//  CImg dst((TBCOLOR *)Images[1].m_data , &CSize( Images[1].m_width , Images[1].m_height ));
//  Cimgproc.binRemoveSalt(&dst,&dst);

  //when the picture pass removesalt it is ready to do line segment
  Images.Create((F_PIXEL*)_data, img->width , img->height );

  int *line = new int[ img->height ];//dst.GetHeight()

  //Images[2].Create((F_PIXEL*)dst.m_pImgDat , dst.GetWidth() , dst.GetHeight() );

  falcon.LineConsider(Images,line);
  falcon.PutFloodfillBorder(Images);
  falcon.AnalyseBlob(Images);
//  falcon.cutoffblob();

  falcon.levelconsider(line, Images.m_height );
  falcon.l_e_v_e_l(Images,thresh); 
  falcon.blobextract(Images);

  falcon.BlobMoveFirst();
  while (falcon.BlobGetNext(tmpblob))
  {
		size[cc] = tmpblob.size;
		if(size[cc] >= 5)
		{
			topleft[cc] = CPoint( tmpblob.xmin ,  Images.m_height - tmpblob.ymin - 1);
			botright[cc] = CPoint( tmpblob.xmax , Images.m_height - tmpblob.ymax - 1);	    
			fprintf( file , " %d %d %d %d %d %d \n " ,size[cc],cc,topleft[cc].x,topleft[cc].y,botright[cc].x,botright[cc].y);
			cc++;
		}
  }

  int cccc = falcon.Trai(ff,0,0);
  //int *command = new int [cccc];
  nnnn = cccc;
  for(int i = 0;i < cccc;i++)
  {
  	 for(int j = 0;j < 65;j++)
	 {
		TheBrain.SetInput(j, ff[i][j]);	
	 }
	 TheBrain.FeedForward();
	 command[i] = TheBrain.GetMaxOutputID();
  }

  falcon.assignrecog(command);
  falcon.blob_reforming();
  falcon.gen_text();
  //  nnnn2 = falcon.getfinallevel(flevel);
  nnnn2 = falcon.getfinallevel(flevel);

  for(int i = 0 ; i < cc ; i++) 
  {
		source.PutMark(&topleft[i],&botright[i],TBCOLOR(0,255,0));
  }
  unsigned char *data__1 = reinterpret_cast<unsigned char *>(source.m_pImgDat);

  IplImage *onlytest = cvCreateImage( cvSize( source.GetWidth() , source.GetHeight() ) , 8 , 3);
  onlytest->imageData = (char *)data__1;

  cvNamedWindow( "After" , CV_WINDOW_AUTOSIZE );
  cvShowImage( "After", onlytest );

  falcon.cleanmem();

  for(int i = 0;i < 1000;i++)
	  delete[] ff[i];

  delete [] ff;
  delete [] line;
  delete [] size;
  //delete [] command;

  fclose(file);
//  cvReleaseImage(&onlytest);
//  cvReleaseImage(&img);
 }