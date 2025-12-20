// FImgProc.cpp: implementation of the FImgProc class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "FImgProc.h"
#include "ImgProc1.h"
//#include "Settings.h"
#include <math.h>
#include <cv.h>      // include core library interface
#include <highgui.h> // include GUI library interface
 #pragma warning(disable : 4996)

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

FImgProc::FImgProc()
{
	training = 0;//mean not training now
}
void FImgProc::initial() 
{
	m_blobs = NULL;
	m_blobcount = 0;
	m_charcount = 0;
	m_charinp = NULL;
	m_dinp = NULL;
	ro = NULL;//
	rowid = NULL;//
	LEVEL = NULL;//
	finallevel = NULL;//
	blobseq = NULL;
	wideofline = NULL;
	
}
FImgProc::~FImgProc()
{
//	if (m_blobs != NULL) delete[] m_blobs;
//	if (m_charinp != NULL) delete[] m_charinp;
//	if (m_dinp != NULL) delete[] m_dinp;
}
void FImgProc::settraining(int toset)
{
	training = toset;
}
int FImgProc::Threshold_normal(const FImage &Source, FImage &Target, BYTE Range)
{
	F_PIXEL *pSrcPix = Source.m_data;
	F_PIXEL *pSrcEnd = pSrcPix + (Source.m_width * Source.m_height);
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	int count = 0;
	
	// Iterate through image pixels
	while(pSrcPix < pSrcEnd)
	{
		if (pSrcPix->blue >= Range)
			if (pSrcPix->green >= Range)
				if (pSrcPix->red >= Range)
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
					count++;
				}
				else
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
			else
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
		else
			pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;

		pTrgPix++;
		pSrcPix++;
	}
	return count;
}
void FImgProc::LineConsider(const FImage &Source,int *row)//specify row histogram of each row
{
	F_PIXEL *pSrc = Source.m_data;
	F_PIXEL *pEnd = pSrc + (Source.m_width * Source.m_height);
    int r;
	int index = 0;

	for(int k = 0;k < Source.m_height;k++)
		row[k] = 0;

	while(pSrc < pEnd)
	{
		r = index / Source.m_width;
		if((pSrc->blue == 255) && (pSrc->green == 255) && (pSrc->red == 255))
			row[r] += 1;
		
		index++;
		pSrc++;
	}
}
void FImgProc::levelconsider(int *row,int h)//specify the base line of each line the most bottom line 
{
	FILE *f = fopen( "test.dat" , "wt" );
	int temp1,temp2,baseline,numbaseline;
	int start = 0;
	int MIN,MAX;
	int *afBaseLine = new int [h/2];
    int *afWid = new int [h/2];
	int wid = 0;

	ro = new int [h/2];
	rowid = new int [h/2];

    numbaseline = 0;
	for(int index = 0;index < h;index++)
	{
		if(row[index] > 0)
		{
			if(start == 0)
			{
				//MAX = -32760;
				start = 1;
				temp1 = index;			
			}
			/*if(row[index] > MAX)
			{
				MAX = row[index];
				baseline = index;
			}*/
		}
		else if(row[index] == 0) 
		{
			if(start == 1)
			{
				start = 0;
				baseline = index - 1;
				if(baseline > temp1)
					wid = baseline - temp1;

                afBaseLine[numbaseline] = baseline;
				afWid[numbaseline] = wid;
				numbaseline++;
			}
		}
	}
	m_linecount = numbaseline;
	for(int tt = 0;tt < numbaseline;tt++)
	{
		  ro[tt] = afBaseLine[tt];
		  rowid[tt] = afWid[tt];

		  fprintf( f , " %d %d \n " , afBaseLine[tt] , afWid[tt] );
	}
	delete [] afBaseLine;
	delete [] afWid;
	fclose(f);
}


int FImgProc::Threshold(const FImage &Source, FImage &Target, BYTE Range)
{
	F_PIXEL *pSrcPix = Source.m_data;
	F_PIXEL *pSrcEnd = pSrcPix + (Source.m_width * Source.m_height);
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	F_PIXEL *temppix;

	int counter = 0;
	int lastxp = 0; //we start at position (0,0)
	int lastyp = 0; //and then iterate equal to the total number of pixel in window
	int pixelcounter = 0;
	int windowsum = 0;
	int mean,nextxp,nextyp;
	int finish = 0;
	BYTE **data = new BYTE* [Source.m_height];
	for(int tmp = 0;tmp < Source.m_height;tmp++)
		data[tmp] = new BYTE [Source.m_width];
	
	// Iterate through image pixels
do
{
	for(int r = 0;r < Range;r++)
	{
		for(int c = 0;c < Range;c++)
		{
			//flag1 = 0;
			//flag2 = 0;
			/*if
			{
				//next we grab the corresponding pixel value at that point
				temppix = pSrcPix + (((r + lastyp) * Source.m_width) + (c + lastxp));
				//if it is grayscale then the value of r and g and b is equal so we
				//check again
                if((temppix->blue == temppix->green)&&(temppix->green == temppix->red)&&(temppix->blue == temppix->red))
				{
					//data[r + lastyp][c + lastxp] = temppix->blue;
                    windowsum += temppix->blue;
				}
				flag1 = 1;
			}*/
			if(((c + lastxp) < Source.m_width)&&((r + lastyp) < Source.m_height))
			{
				temppix = pSrcPix + (((r + lastyp) * Source.m_width) + (c + lastxp));
                if((temppix->blue == temppix->green)&&(temppix->green == temppix->red)&&(temppix->blue == temppix->red))
				{
					//data[r + lastyp][c + lastxp] = temppix->blue;
                    windowsum += temppix->blue;
				}
				counter += 1;
				pixelcounter += 1;
			}
			//if((flag1 == 0)&&(flag2 == 0)) //mean cannot access any pixel
			//	break;
		}
	}
	mean = windowsum / counter;
	counter = 0;
	windowsum  = 0;
	for(int rr = 0;rr < Range;rr++)
	{
		for(int cc = 0;cc < Range;cc++)
		{
			if(((cc + lastxp) < Source.m_width) && ((rr + lastyp) < Source.m_height))
			{
				if(mean <= 255)
				{
					data[rr + lastyp][cc + lastxp] = mean;
				}
			}
		}
	}

	//next we calculate the next point lastyp and lastxp
	nextxp = lastxp + Range;
	nextyp = lastyp;
	if(nextxp >= Source.m_width)
	{ //we now move to the next line
		nextxp = 0;
		nextyp = lastyp + Range;
		if(nextyp >= Source.m_height)
		{
			nextyp = 0;
			finish = 1;
		}
	}
	if(finish == 0)
	{
		lastxp = nextxp;
		lastyp = nextyp;
	}

}while(finish == 0);

	if(pixelcounter == (Source.m_height * Source.m_width)) // check we iterate equal the number of pixel
	{
		pixelcounter = 0;
		while(pSrcPix < pSrcEnd)
		{
			int r,c;
			r = pixelcounter / Source.m_width;
			c = pixelcounter % Source.m_width;
		
			if (pSrcPix->blue >= data[r][c])
				if (pSrcPix->blue >= data[r][c])
					if (pSrcPix->green >= data[r][c])
						if (pSrcPix->green >= data[r][c])
							if (pSrcPix->red >= data[r][c])
								if (pSrcPix->red >= data[r][c])	// If color within range, set to white
								{
									pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
								}								
								else
									pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
							else
								pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
						else
							pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
					else
						pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
				else
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
			else
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;

			pSrcPix++;
			pTrgPix++;
			pixelcounter++;
		}
	}	
	/*	while (pSrcPix < pSrcEnd)
	{							pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
								count++;
							}*/
	for(int t = 0;t < Source.m_height;t++)
	{
		delete []data[t];
	}
	delete []data;

	return counter;
}

int FImgProc::Threshold(FImage &Target, const F_HSVRANGE &Range, int HueOffset)
{
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	int count = 0;
	
	int r, g, b;
	int h, s, v;
	int delta;
	int min, max;

	while (pTrgPix < pTrgEnd)
	{
		// Dereference data for fast accessing
		b = pTrgPix->blue;
		g = pTrgPix->green;
		r = pTrgPix->red;

		// Find max & min value using binary tree
		if (r > g)
			if (g > b) { max = r; min = b; }
			else
				if (r > b) { max = r; min = g; }
				else { max = b; min = g; }
		else
			if (g > b)
				if (r > b) { max  = g; min = b; }
				else { max = g; min = r; }
				else { max = b; min = r; }

		// Get & check value of intensity
		v = max;
		if ((Range.val_min > v) || (v > Range.val_max)) 
		{ 
			pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
		}
		else 
		{
			// Get & check saturation			
			delta = max - min;
			if( delta != 0 )
				s = (delta * 255) / max;
			else {
				s = 0;
				h = 0;
			}
			if ((Range.sat_min > s) || (s > Range.sat_max))
			{
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
			}
			else 
			{
				// Get & check hue
				if (delta != 0) {
					if (r == max)
						h = (60 * (g - b)) / delta;			// between yellow & magenta
					else if (g == max)
						h = 120 + ((60 * (b - r)) / delta);	// between cyan & yellow
					else
						h = 240 + ((60 * (r - g)) / delta);	// between magenta & cyan
					if( h < 0 ) h += 360;
					h = (h + HueOffset) % 360;
				}
				if ((Range.hue_min > h) || (h > Range.hue_max))
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
				}
				else 
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
					count++;
				}
			}
		} 

		pTrgPix++;
	} 

	return count;
}

int FImgProc::Threshold(const FImage &Source, FImage &Target, const F_HSVRANGE &Range, int HueOffset)
{
	F_PIXEL *pSrcPix = Source.m_data;
	F_PIXEL *pSrcEnd = pSrcPix + (Source.m_width * Source.m_height);
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	int count = 0;
	
	int r, g, b;
	int h, s, v;
	int delta;
	int min, max;

	while (pSrcPix < pSrcEnd)
	{
		// Dereference data for fast accessing
		b = pSrcPix->blue;
		g = pSrcPix->green;
		r = pSrcPix->red;

		// Find max & min value using binary tree
		if (r > g)
			if (g > b) { max = r; min = b; }
			else
				if (r > b) { max = r; min = g; }
				else { max = b; min = g; }
		else
			if (g > b)
				if (r > b) { max  = g; min = b; }
				else { max = g; min = r; }
				else { max = b; min = r; }

		// Get & check value of intensity
		v = max;
		if ((Range.val_min > v) || (v > Range.val_max)) 
		{ 
			pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
		}
		else 
		{
			// Get & check saturation			
			delta = max - min;
			if( delta != 0 )
				s = (delta * 255) / max;
			else {
				s = 0;
				h = 0;
			}
			if ((Range.sat_min > s) || (s > Range.sat_max))
			{
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
			}
			else 
			{
				// Get & check hue
				if (delta != 0) {
					if (r == max)
						h = (60 * (g - b)) / delta;			// between yellow & magenta
					else if (g == max)
						h = 120 + ((60 * (b - r)) / delta);	// between cyan & yellow
					else
						h = 240 + ((60 * (r - g)) / delta);	// between magenta & cyan
					if( h < 0 ) h += 360;
					h = (h + HueOffset) % 360;
				}
				if ((Range.hue_min > h) || (h > Range.hue_max))
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
				}
				else 
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
					count++;
				}
			}
		} 

		pSrcPix++;
		pTrgPix++;
	} 

	return count;
}

int FImgProc::AnalyseBlob(const FImage &Source)
{
	int pixcount = Source.m_width * Source.m_height;

	// Source image
	F_PIXEL *pSrcImg = Source.m_data;
	F_PIXEL *pSrcEnd = pSrcImg + (pixcount);
	int count = 0;

	// Stack
	int *pStackIndex = new int[pixcount];
	int stack = 0;	// Current stack size

	// Image map
	int *pImgMap = new int[pixcount];
	memset(pImgMap, -1, pixcount * sizeof(int));
	
	m_blobs = new F_BLOB[pixcount];
//  
	// Iterate through image pixels
	int oldp, tmp;
	for (int p=0; p<pixcount; p++)
	{
		if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
		{
			// Push this pixel
			pStackIndex[stack] = p;
			stack++;
			m_blobs[count].size = 0;
			m_blobs[count].xmin = m_blobs[count].xmax = p % Source.m_width;
			m_blobs[count].ymin = m_blobs[count].ymax = p / Source.m_width;

			// Floodfill
			oldp = p;
			while (stack > 0)
			{
				// Pop stack
				stack--;
				p = pStackIndex[stack];

				// Update pixel & blob
				pImgMap[p] = count;
				m_blobs[count].size++;
				tmp = p % Source.m_width;
				if (tmp < m_blobs[count].xmin) m_blobs[count].xmin = tmp;
				if (tmp > m_blobs[count].xmax) m_blobs[count].xmax = tmp;
				tmp = p / Source.m_width;
				if (tmp < m_blobs[count].ymin) m_blobs[count].ymin = tmp;
				if (tmp > m_blobs[count].ymax) m_blobs[count].ymax = tmp;

				// Push neighbors
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p -= Source.m_width;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p--;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p--;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p += Source.m_width;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p += Source.m_width;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}

			}
			p = oldp;

			count++;
		}
	}

	delete[] pImgMap;
	delete[] pStackIndex;

	m_blobcount = count;
	return count;
}

bool FImgProc::PutFloodfillBorder(FImage &Target)
{
	F_PIXEL *pTrgImg = Target.m_data;
	F_PIXEL *pTrgBorderL = pTrgImg;
	F_PIXEL *pTrgBorderR = pTrgImg + Target.m_width - 1;
	
	// Fill row
	memset(pTrgImg, 0, Target.m_width * sizeof(F_PIXEL));
	memset(pTrgImg + (Target.m_width * (Target.m_height - 1)), 0, Target.m_width * sizeof(F_PIXEL));

	// Fill column
	for (int i=0; i<Target.m_height; i++)
	{
		pTrgBorderL->blue = pTrgBorderL->green = pTrgBorderL->red = 0;
		pTrgBorderR->blue = pTrgBorderR->green = pTrgBorderR->red = 0;
		pTrgBorderL += Target.m_width;
		pTrgBorderR += Target.m_width;
	}

	return true;
}

bool FImgProc::PutFloodfillRegion(FImage &Target,int X1,int Y1,int X2,int Y2)
{
	//temppix = pSrcPix + (((r + lastyp) * Source.m_width) + (c + lastxp));

	int i,j;
	int iterX = abs(X1 - X2);
	int iterY = abs(Y1 - Y2);

	F_PIXEL *pTrgImg = Target.m_data;				
	F_PIXEL *temppix;

	for(i = 0;i < iterY;i++)
	{
		for(j = 0;j < iterX;j++)
		{
			temppix = pTrgImg + (((Y1 + i) * Target.m_width) + (X1 + j));
			if(temppix->blue == 255)
			{
				temppix->blue = 0;
				temppix->green = 0;
				temppix->red = 0;
			}
		}
	}
	return true;
}

int FImgProc::isOverlap(int xmin1,int ymin1,int xmax1,int ymax1,int xmin2,int ymin2,int xmax2,int ymax2) 
{
	BOOL isIntersect;
	isIntersect = FALSE;

	CPoint p11(xmin1,ymin1),p12(xmax1,ymin1),p13(xmin1,ymax1),p14(xmax1,ymax1);
	CPoint p21(xmin2,ymin2),p22(xmax2,ymin2),p23(xmin2,ymax2),p24(xmax2,ymax2);

	if( ((p11.x >= xmin2)&&(p11.x <= xmax2)&&(p11.y >= ymin2)&&(p11.y <= ymax2)) ||
		((p12.x >= xmin2)&&(p12.x <= xmax2)&&(p12.y >= ymin2)&&(p12.y <= ymax2)) ||
		((p13.x >= xmin2)&&(p13.x <= xmax2)&&(p13.y >= ymin2)&&(p13.y <= ymax2)) ||
		((p14.x >= xmin2)&&(p14.x <= xmax2)&&(p14.y >= ymin2)&&(p14.y <= ymax2)) ) 
	{
		isIntersect = TRUE;	
	}
	if( ((p21.x >= xmin1)&&(p21.x <= xmax1)&&(p21.y >= ymin1)&&(p21.y <= ymax1)) ||
        ((p22.x >= xmin1)&&(p22.x <= xmax1)&&(p22.y >= ymin1)&&(p22.y <= ymax1)) ||
		((p23.x >= xmin1)&&(p23.x <= xmax1)&&(p23.y >= ymin1)&&(p23.y <= ymax1)) ||
		((p24.x >= xmin1)&&(p24.x <= xmax1)&&(p24.y >= ymin1)&&(p24.y <= ymax1)) )
	{
		isIntersect = TRUE;
	}
	if(isIntersect == FALSE)
		return -1;
	else
		return 1;
	/*{
		if(size1 <= size2)
			return 1;//return  1  here mean that the first blob is smaller than the second blob
		else if(size1 > size2)
			return 2;//return  2  here mean that the second blob is smaller than the first blob 
	}*/
}
void FImgProc::validblob()
{
	int index;
	F_BLOB temp;
	F_BLOB *tmp = new F_BLOB [20]; //maximum number of split blob
	int k = 0;
	float ww,hh;
	for(index = 0;index < m_blobcount;index++)
	{
		temp = m_blobs[index];
		ww = (float)temp.xmax - temp.xmin; if(ww < 0) ww *= -1;
		hh = (float)temp.ymax - temp.ymin; if(hh < 0) hh *= -1;
		//we check only if ww is grater than hh
		hh *= 1.0; //don't know how to do this
		if(ww > hh)
		{
			if( (ww/hh) > 2.5 )
			{			
				tmp[k].xmin = (int)(temp.xmin + (ww*0.5));
				tmp[k].ymin = temp.ymin;
				tmp[k].xmax = temp.xmax;
				tmp[k].ymax = temp.ymax;
				tmp[k].size = (tmp[k].xmax - tmp[k].xmin) * (tmp[k].ymax - tmp[k].ymin);
				m_blobs[index].xmax = (tmp[k].xmin - 1);
				k++;
			}
		}
	}
	for(index = 0;index < k;index++) 
	{
		m_blobs[m_blobcount + index].xmin = tmp[index].xmin;
		m_blobs[m_blobcount + index].xmax = tmp[index].xmax;
		m_blobs[m_blobcount + index].ymin = tmp[index].ymin;
		m_blobs[m_blobcount + index].ymax = tmp[index].ymax;
		m_blobs[m_blobcount + index].size = tmp[index].size;
	}
	m_blobcount = m_blobcount + k;
	delete[] tmp;
}
void FImgProc::l_e_v_e_l(FImage& source,int thresh)
{
	int h = source.m_height;
	int w = source.m_width;

	validblob();

	int **DAT = new int* [h];
	for(int jj = 0;jj < h;jj++)
		DAT[jj] = new int [w];

	LEVEL = new int [m_blobcount]; //maximum number of line is 100   /*int **/
	finallevel = new int* [m_blobcount];        /*int ***/
	int **nbased = new int* [m_blobcount];
	int **nbasedrow = new int* [m_blobcount];
	int *nbaselevel = new int [m_blobcount];
	int *nlevelline = new int [m_blobcount];
	int *bmark = new int [m_blobcount];
	int *bb = new int [m_blobcount];
	int *arnewlevel = new int [m_blobcount];
	int *intersect = new int [3];		//3 is the maximum number of intersection
	F_BLOB *ttt = new F_BLOB [3];
	int a,flag,newlevel,min,max,minindex,maxindex,lecounter;
	int counter,c;//,cenx,ceny;
	F_BLOB tt;//tt1,tt2;
	lecounter = 0;



	for(int jj = 0;jj < m_blobcount;jj++)
	{
		bmark[jj] = -1;
		LEVEL[jj] = -1;
		nbased[jj] = new int [4];
		nbasedrow[jj] = new int [4];
		finallevel[jj] = new int [4];
	}

	
	for(int i = 0;i < m_blobcount;i++) 
	{
		for(int j = 0;j < 4;j++)
		{
			finallevel[i][j] = -1;
		}
	}

	for(int i = 0;i < h;i++)
	{
		for(int j = 0;j < w;j++)
		{
			DAT[i][j] = -1;
		}
	}
	for(c = 0;c < m_blobcount;c++)
	{
		tt = m_blobs[c];
		for(int i = tt.ymin;i <= tt.ymax;i++)
		{
			for(int j = tt.xmin;j <= tt.xmax;j++)
			{
				if(DAT[i][j] == -1)
					DAT[i][j] = c;
			}
		}
	}

	//for(c = 0;ro[c] != -1;c++) 
	//	++number;

	//for(counter = 0;counter < m_linecount;counter++)
	//{
		for(c = 0;(c < m_blobcount)/*&&(bmark[c] == -1)*/;c++) 
		{
			tt = m_blobs[c];

			for(int q = 0;q < m_blobcount;q++)
				bb[q] = 0;

			for(int i = tt.ymin;i <= tt.ymax;i++)
			{
				for(int j = tt.xmin;j <= tt.xmax;j++)
				{
					bb[DAT[i][j]] += 1;	
				}
			}

			a = 0;
			
			for(int q = 0;q < m_blobcount;q++) 
			{
				if(bb[q] > 0)
				{
					intersect[a] = q;
					a++;
				}
			}

			if(a > 1) //(tt.ymax == ro[counter])
			{
				//bmark[c] = 0;
				flag = 0;
				if(a == 2)
				{
					ttt[0] = m_blobs[intersect[0]];
					ttt[1] = m_blobs[intersect[1]];

					if(ttt[0].size < ttt[1].size)	
					{
						if(ttt[0].ymax < ttt[1].ymax)
						{
							LEVEL[intersect[0]] = 2;
							flag = 1;
							newlevel = ttt[0].ymax;
						}
					}
					else if(ttt[1].size < ttt[0].size)
					{
						if(ttt[1].ymax < ttt[0].ymax)
						{
							LEVEL[intersect[1]] = 3;
							flag = 1;
							newlevel = ttt[1].ymax;
						}
					}
				}
				else if(a == 3)
				{
					ttt[0] = m_blobs[intersect[0]];
					ttt[1] = m_blobs[intersect[1]];
					ttt[2] = m_blobs[intersect[2]];

					min = 32760;
					max = -32760;

					for(int i = 0;i < a;i++)
					{
						if(ttt[i].size < min)
						{
							min = ttt[i].size;
							minindex = i;
						}
						if(ttt[i].size > max)
						{
							max = ttt[i].size;
							maxindex = i;
						}
					}
					if(ttt[minindex].ymax < ttt[maxindex].ymax) 
					{
						LEVEL[intersect[minindex]] = 3;
						flag = 1;
						newlevel = ttt[minindex].ymax;
					}
				}
				if(flag == 1)
				{
					if(lecounter > 0) 
					{
						if(abs(arnewlevel[lecounter-1] - newlevel) <= 3)
						{
						}
						else
						{
							arnewlevel[lecounter] = newlevel;
							lecounter++;
						}
					}
					else
					{
						arnewlevel[lecounter] = newlevel;
						lecounter++;
					}
				}
			}
		}
	//}
	int nnn = 0; //mean the current group
	int first = 0;
	int maxwid,maxwidid,ccc = 0,tem,top,diff,threshold = 5;
	int nex,bbb = -5000,maxdif = -5000,mindif = 5000;
	wideofline = new int [m_linecount];
	//for(int jj = 0;jj < m_blobcount
	for(counter = 0;counter < m_linecount;counter++)
	{
		if(rowid[counter] == bbb) 
		{
			if(first == 1)
				threshold = maxdif;

			break;
		}
		else
			nex = counter + 1;

		for(;nex < m_linecount;nex++)
		{
			if(rowid[counter] > rowid[nex])
				maxwid = rowid[counter];
			else
				maxwid = rowid[nex];

			top = abs(ro[nex] - rowid[nex]);
			diff = abs( top - ro[counter] );
			if(rowid[counter] <= (rowid[nex] / 2)) 
			{
				if(diff > maxdif)
					maxdif = diff;

				bbb = rowid[nex];
				first = 1;
				break;
			}
			else if((rowid[counter] / 2) > rowid[nex]) 
			{
				if(diff < (rowid[counter] / 4))
				{
					if(diff > maxdif) 
						maxdif = diff;

					counter = counter + 1; 
				}
				else
				{
					if(diff < mindif)
						mindif = diff;
				}
				break;
			}
			else //we perform to find maxdiff to be the threshold
			{
				if(diff > maxdif)
					maxdif = diff;

				if(diff < mindif)
					mindif = diff;
			}
		}
	}

	if(thresh > -1)
	{
		threshold = thresh;
	}
	else
	{
		if(first == 0)
			threshold = mindif - 2;
		else if(first == 1) 
			threshold = threshold + threshold; //+ 1;
	}

	first = 1;
	int ol,ne,havenewline; //old and new of rowid of the current and next
	havenewline = 0;
	for(counter = 0;counter < m_linecount;counter++)
	{
		ol = rowid[counter];
		if(first == 1)//mean the first of that row
		{
			maxwid = rowid[counter];
			maxwidid = counter;
			ccc = 0;
		}
		tem = counter + 1;
		if((tem >= m_linecount)||(havenewline == 1))
		{
			diff = threshold + 1; //+ 1;  //we force it to grater than 5
		}
		else
		{
			top = abs(ro[tem] - rowid[tem]);
			diff = abs( top - ro[counter] );
		}
		if(diff <= threshold)
		{
			ne = rowid[tem];

			first = 0;
			if(rowid[tem] > maxwid)
			{
				maxwid = rowid[tem];
				maxwidid = tem;
			}
			else
			{
				////////////////////////////maxwid = 
			}
			nbased[nnn][ccc] = ro[counter];
			nbasedrow[nnn][ccc] = rowid[counter];
			ccc++;
			if(ne <= (ol / 2))		//abs(ol - ne)
				havenewline = 1;
			else
				havenewline = 0;
		}
		else
		{
			nbased[nnn][ccc] = ro[counter];
			nbasedrow[nnn][ccc] = rowid[counter];

			nbaselevel[nnn] = ro[maxwidid]; 
			wideofline[nnn] = maxwid;
			nlevelline[nnn] = ccc+1;
			first = 1;
			havenewline = 0;
			++nnn;
		}
	}
	int haam = 0;
	for(int k = 0;k < lecounter;k++)
	{
		for(int i = 0;i < nnn;i++) //group
		{
			flag = 0;
			for(int j = 0;j < nlevelline[i];j++) //each line in each group
			{
				if((arnewlevel[k] >= abs(nbased[i][j] - nbasedrow[i][j]))&&(arnewlevel[k] <= nbased[i][j]))
				{
					nbased[i][(nlevelline[i] - 1)+1] = arnewlevel[k];
					haam++;			//debug
					flag = 1;
				}
			}
			if(flag == 1)
			{
				nlevelline[i] = nlevelline[i] + 1;
			}
		}
	}
	if((haam == lecounter)||(haam == 0))
	{
		for(int i = 0;i < nnn;i++)
		{
			flag = 0;//flag is zero here
			min = 32760;
			max = -32760;
			for(int j = 0;j < nlevelline[i];j++) 
			{
				if(nbased[i][j] == nbaselevel[i]) 
				{
					finallevel[i][1] = nbased[i][j];
				}
				else if(nbased[i][j] > nbaselevel[i]) 
				{
					//level is 1 here finallevel is global variable
					finallevel[i][0] = nbased[i][j];
				}
				else if(nbased[i][j] < nbaselevel[i]) 
				{
					flag++;
					//next we find the maximum line
					if(nbased[i][j] > max)
						max = nbased[i][j];
					if(nbased[i][j] < min)
						min = nbased[i][j];
				}
			}
			if(flag == 1)
				finallevel[i][2] = max;
			else if(flag == 2) 
			{
				finallevel[i][2] = max;
				finallevel[i][3] = min;
			}
		}
		int c_c,minofupper,new__level = -1,indd = 0,idontknow = -1;
		int threshold = 4,flg = 0;

		for(int i = 0;i < nnn;i++)
		{
			for(int k = 0;k < 4;k++)
			{
				if(k >= 1)
				{
					if(abs(finallevel[i][k] - finallevel[i][k - 1]) < threshold) 
					{
						if(finallevel[i][k] < finallevel[i][k - 1]) 
							finallevel[i][k] = -1;
						else if(finallevel[i][k - 1] > finallevel[i][k]) 
							finallevel[i][k - 1] = -1;
					}
				}
			}
		}
		FILE *show = fopen("show.dat","wt");

		int stupidcounter = 0;
		int hey = 0;
		double ratiohw = 0.0;
		double diffwide = 1.0;
		int mustout,anotherlevel1;			// = 0;		//mustout is zero now
		numberofline = nnn;
		for(int i = 0;i < nnn;i++) 
		{
			min = 32760;
			max = -32760;
			minofupper = 0;
			mustout = 0;
			anotherlevel1 = -1;
			if((finallevel[i][1] != -1)&&((finallevel[i][2] == -1)||(finallevel[i][3] == -1)))
			{
				if(finallevel[i][2] != -1) 
					flg = 1;
				else
					flg = 0;
				if(i >= 1)
				{
					if(finallevel[i-1][0] != -1)
						minofupper = finallevel[i-1][0];
					else
						minofupper = finallevel[i-1][1]; 
				}
				int f_lag = 0;	
				//this is my house call technics
				diffwide = 0;
				double maxdiffwide = -1000000;
				for(int ui = 0;ui < m_blobcount;ui++) 
				{
					if(finallevel[i][1] == m_blobs[ui].ymax)
					{
						//diffwide += double(abs(m_blobs[ui].xmax - m_blobs[ui].xmin));
						diffwide = double(abs(m_blobs[ui].xmax - m_blobs[ui].xmin));

						if(diffwide > maxdiffwide)
							maxdiffwide = diffwide;

						//break;
						f_lag += 1;
					}
					else if((finallevel[i][1] > m_blobs[ui].ymax) && 
						   (m_blobs[ui].ymin >= (finallevel[i][1] - wideofline[i])) &&
						   (abs(finallevel[i][1] - m_blobs[ui].ymax) > (0.17 * wideofline[i])) &&
						   (abs(finallevel[i][1] - m_blobs[ui].ymax) < (0.3 * wideofline[i])))
					{
						anotherlevel1 = m_blobs[ui].ymax;
						f_lag += 10000;
						//diffwide += double(abs(m_blobs[ui].xmax - m_blobs[ui].xmin));
						diffwide = double(abs(m_blobs[ui].xmax - m_blobs[ui].xmin));

						if(diffwide > maxdiffwide) 
							maxdiffwide = diffwide;

					}
					if( (f_lag > 10000)&&( (f_lag % 10000) != 0 ) )
						break;
				}
				diffwide = diffwide / ( (f_lag / 10000) + (f_lag % 10000) );

				ratiohw = wideofline[i] / maxdiffwide;              //abs(m_blobs[ui].xmax - m_blobs[ui].xmin)

				if(anotherlevel1 > -1)
					threshold = abs(finallevel[i][1] - anotherlevel1);
				else
					threshold = 5;

				if(ratiohw < 1.38) 
				{
					//break;         //break from the outer loop
					mustout = 1;     //mustout is true 
				}
				else //here mustout is 0 automatically
				{
					hey = 1;
					//here we sure that the normal char is eliminated
				}

				int c_c1;
				f_lag = 00000000;
				new__level = -1;
				for(int j = 0;(j < m_blobcount)&&(mustout == 0);j++)
				{
					tt = m_blobs[j];	
					if((tt.ymax < finallevel[i][1])&&(tt.ymax > (finallevel[i][1] - wideofline[i]))) 
					{
						c_c = abs(finallevel[i][1] - tt.ymax);
						if(c_c >= threshold)
						{
							if(hey == 1)
							{	//we assume that the finallevel[i][1] is grater than tt.ymax
								if(anotherlevel1 != -1)
								{
									c_c1 = abs(tt.ymax - anotherlevel1);
									if(c_c1 < (0.5625 * (wideofline[i] - (finallevel[i][1] - anotherlevel1))))
									{
										f_lag = -1;
									}
								}
								if( (c_c < (0.5625 * wideofline[i])) || (f_lag == -1) )//||(anotherlevel1 != -1)&&(c_c1 <   //ignore
								{
								}
								else
								{
									if(c_c < min)
									{
										indd = j;
										min = c_c;
										new__level = tt.ymax;
										stupidcounter += 1;
									}
									if(c_c > max)
									{
										//indd__1 = j;
										max = c_c;
										idontknow = tt.ymax;
										stupidcounter += 1;//
									}
								}
							}
						}
					}
				}
				if(new__level != -1)
				{
					tt = m_blobs[indd]; //indd is the smaller difference between two
					if(flg == 0)
					{
						if((tt.ymax - tt.ymin) > (finallevel[i][1] - new__level)) 
						{
							finallevel[i][0] = finallevel[i][1];
							finallevel[i][1] = finallevel[i][1];//new__level;
							if(idontknow < new__level) 
							{
								finallevel[i][2] = idontknow;
							}
						}
						else
						{
							finallevel[i][2] = new__level;
							//tt = m_blobs[indd];
							int a1 = new__level - idontknow;
							int a2 = tt.ymax - tt.ymin;
							if( (abs(a1) >= abs(a2)) || (abs(a1-a2) <= 2) )
							{
								finallevel[i][3] = idontknow;
							}
						}
					}
					else //mean flg is 1 here
					{
						if((tt.ymax - tt.ymin) > (finallevel[i][1] - new__level))
						{
							finallevel[i][0] = finallevel[i][1];
							finallevel[i][1] = finallevel[i][1];//new__level; 
							finallevel[i][3] = finallevel[i][2];
							if(idontknow < new__level) 
							{
								finallevel[i][2] = idontknow;
							}
						}
						else
						{
							finallevel[i][3] = finallevel[i][2];
							finallevel[i][2] = new__level;

							if(finallevel[i][3] == finallevel[i][2]) 
								finallevel[i][3] = -1;
						}
					}
				}
			}
//			else if((finallevel[i][1] != -1)&&(finallevel[i][2] != -1)&&(finallevel[i][3] == -1))
//			{
				//finallevel[i][3] = finallevel[i][2] - nbasedrow[i][2] - 3;	
//			}
			for(int bn = 0;bn < 4;bn++) 
				fprintf( show , " %d \n" , finallevel[i][bn] );
		}
		
		for(int i = 0;i < nnn;i++) 
		{	/*
			*/
		}
		fclose(show);
	}

	int llcount = 0;

	for(int z = 0;z < (nnn-1);z++)
	{
		if( (finallevel[z+1][1] > finallevel[z][1]) && (finallevel[z+1][2] < finallevel[z][1]) )
		{
			int vv;
			vv = finallevel[z][2];
			finallevel[z][2] = finallevel[z][1];
			finallevel[z][3] = vv;
			finallevel[z][1] = finallevel[z+1][1];
			wideofline[z] = wideofline[z+1];
			llcount++;
		}
	}

	numberofline = nnn - llcount;

	for(int z = 0;z < numberofline;z++)
	{
		if(finallevel[z][1] > finallevel[z][2])
		{
			if(wideofline[z] > (finallevel[z][1] - finallevel[z][2]))
			{
				wideofline[z] = finallevel[z][1] - finallevel[z][2];
			}
		}
	}

	for(int mb = 0;mb < m_blobcount;mb++) 
	{
		delete[] nbased[mb];						 // = new int* [m_blobcount];
		delete[] nbasedrow[mb];						 // = new int* [m_blobcount];
	}
	
	for(int mb = 0;mb < h;mb++)
		delete[] DAT[mb];							 // = new int [w];

	delete[] DAT;
	delete[] nbased;
	delete[] nbasedrow;
	delete[] nbaselevel;                             // = new int [m_blobcount];
	delete[] nlevelline;                             // = new int [m_blobcount];
	delete[] bmark;                                  // = new int [m_blobcount];
	delete[] bb;                                     // = new int [m_blobcount];
	delete[] arnewlevel;                             // = new int [m_blobcount];
	delete[] intersect;                              // = new int [3];		//3 is the maximum number of intersection
	delete[] ttt;                                    // = new F_BLOB [3];
}

int FImgProc::getfinallevel(int **fff)
{
	int ik,jk;
	for(ik = 0;ik < numberofline;ik++)
		for(jk = 0;jk < 4;jk++) 
			fff[ik][jk] = finallevel[ik][jk];	

	return numberofline;
}

void FImgProc::cutoffblob()
{
	int i,invacount,vacount,j;
//	int *indexinvalid = new int [m_blobcount];
	F_BLOB *temp = new F_BLOB [m_blobcount];

	invacount = 0;
	vacount = 0;

	for(i = 0;i < m_blobcount;i++)
	{
		if(m_blobs[i].size <= 7)		//|| m_blobs[i]
		{
//			indexinvalid[invacount] = i;
			invacount++;
		}
		else
		{
			temp[vacount].l	   = m_blobs[i].l;
			temp[vacount].size = m_blobs[i].size;
			temp[vacount].xmax = m_blobs[i].xmax;
			temp[vacount].ymax = m_blobs[i].ymax;
			temp[vacount].xmin = m_blobs[i].xmin;
			temp[vacount].ymin = m_blobs[i].ymin;
			vacount++;
		}
	}

	m_blobcount = vacount;

	for(i = 0;i < m_blobcount;i++)
	{
		m_blobs[i].l	= temp[i].l;
		m_blobs[i].size = temp[i].size;
		m_blobs[i].xmax = temp[i].xmax;
		m_blobs[i].ymax = temp[i].ymax;
		m_blobs[i].xmin	= temp[i].xmin;
		m_blobs[i].ymin = temp[i].ymin;
	}

}

void FImgProc::blobextract(FImage& source)
{
	F_BLOB b1,b2;
	int cur = 0;
	int next;
	int result,w1,h1,w2,h2,temp/*,bc*/;

	m_charcount = m_blobcount;
	m_charinp = new C_INPUT [m_blobcount];
	m_dinp = new D_INPUT[m_blobcount];
	for(int i = 0;i < m_blobcount;i++)
	{
		m_charinp[i].dat = new BYTE* [32];
		m_dinp[i].dd = new float* [8];
		m_dinp[i].recognumber = -1;


		for(int k = 0;k < 32;k++)
		{
			m_charinp[i].dat[k] = new BYTE [32];
		}
		
		for(int k = 0;k < 8;k++)
		{
			m_dinp[i].dd[k] = new float [8];
		}
	}

	int *arInter = new int [m_blobcount];
	//int *twoblob = new int [m_blobcount];

	for(int j = 0;j < m_blobcount;j++)
	{
		arInter[j] = -1;
	//	twoblob[j] = -1;
	}

	while(cur < m_blobcount)
	{
		b1 = m_blobs[cur];
		next = cur + 1;
		while(next < m_blobcount)
		{
			b2 = m_blobs[next];
			//next we check for overlapped we use xmin ymin xmax ymax
		
			result = isOverlap(b1.xmin,b1.ymin,b1.xmax,b1.ymax,b2.xmin,b2.ymin,b2.xmax,b2.ymax);
			if(result != -1) 
			{
		//		if((w1 * h1) <= (w2 * h2))
					arInter[cur] = next;
		//		else
					arInter[next] = cur;
			}
			//else
			//	arInter[cur] = -1;
			next++;
		}
		cur++;
	}

	int abcd = 0;
	int t_size , t_xmax , t_xmin , t_ymax , t_ymin;
	//bc = 0;
	if( (training == 1) || (training == 2) ) 
		fprintf( fp , "%d\n" , m_blobcount );

	for(cur = 0;cur < m_blobcount;cur++)
	{
		if(arInter[cur] == -1) //no intersect  extract(F_BLOB blob,,int id)
			extract(m_blobs[cur],source,cur,0);
		else
		{
			b1 = m_blobs[cur];/////////////////////////////////////////////////////////////4
			b2 = m_blobs[arInter[cur]];

			w1 = b1.xmax - b1.xmin; if(w1 < 0) w1 = -w1;
			h1 = b1.ymax - b1.ymin; if(h1 < 0) h1 = -h1;
			w2 = b2.xmax - b2.xmin; if(w2 < 0) w2 = -w2;
			h2 = b2.ymax - b2.ymin; if(h2 < 0) h2 = -h2;

			if((w1 * h1) <= (w2 * h2))
			{
				temp = arInter[cur];
				if(m_blobs[temp].ymax != m_blobs[cur].ymax) 
				{
					extract(m_blobs[cur],source,cur,0);
					arInter[cur] = -1;
					if(arInter[temp] == cur)
					{
						arInter[temp] = -1;
					}
					else
					{
				
					}
				}
				else
				{
					extract(m_blobs[cur],source,cur,1);
					arInter[cur] = -1;
					m_blobs[temp].xmax = m_blobs[temp].xmin + abs(w2 - w1) - 1; //(w1 - (m_blobs[cur].xmax - m_blobs[temp].xmin));
					if(arInter[temp] == cur)
					{
						arInter[temp] = -1;
						//twoblob[bc] = cur;
						//bc++;
						//m_blobs[temp].size = m_blobs[cur].size;
						//
						//m_blobs[temp].xmin = m_blobs[cur].xmin;
						//m_blobs[temp].ymax = m_blobs[cur].ymax;
						//m_blobs[temp].ymin = m_blobs[cur].ymin;
					}
					else
					{
			//			extract(m_blobs[cur],source,temp,0);
			//			abcd = 1;	
					}
				}
				//temp is 9
			}
			else
			{
			//	if(abcd == 1)
			//	{
			//		abcd = 0;
			// 	}
			//	else
			//	{
				if(m_blobs[arInter[cur]].ymax == m_blobs[cur].ymax) 
				{
					temp = arInter[cur];
					extract(m_blobs[arInter[cur]],source,cur,1);
					arInter[cur] = -1;
					if(arInter[temp] == cur)
					{
						arInter[temp] = -1;
						//twoblob[bc] = cur;
						//bc++;

						t_size = m_blobs[temp].size;
						t_xmax = m_blobs[temp].xmax;
						t_xmin = m_blobs[temp].xmin;
						t_ymax = m_blobs[temp].ymax;
						t_ymin = m_blobs[temp].ymin;

						m_blobs[temp].size = m_blobs[cur].size;
						m_blobs[temp].xmax = m_blobs[cur].xmin;        //modify here krub + abs(w1 - w2) - 1; //(w1 - (m_blobs[cur].xmax - m_blobs[temp].xmin));
						m_blobs[temp].xmin = m_blobs[cur].xmin;

						if(m_blobs[temp].xmin >= m_blobs[temp].xmax)
							m_blobs[temp].xmax = m_blobs[cur].xmax;

						m_blobs[temp].ymax = m_blobs[cur].ymax;
						m_blobs[temp].ymin = m_blobs[cur].ymin;
					
						m_blobs[cur].size = t_size;
						m_blobs[cur].xmax = t_xmax;
						m_blobs[cur].xmin = t_xmin;
						m_blobs[cur].ymax = t_ymax;
						m_blobs[cur].ymin = t_ymin;

					}
					else
					{
						extract(m_blobs[cur],source,temp,0);
			//			abcd = 1;	
					}
				}
				else
				{
					temp = arInter[cur];
					extract(m_blobs[arInter[cur]],source,cur,0);
					arInter[cur] = -1;
					if(arInter[temp] == cur)
					{
						arInter[temp] = -1;
						//twoblob[bc] = cur;
						//bc++;
						t_size = m_blobs[temp].size;
						t_xmax = m_blobs[temp].xmax;
						t_xmin = m_blobs[temp].xmin;
						t_ymax = m_blobs[temp].ymax;
						t_ymin = m_blobs[temp].ymin;

						m_blobs[temp].size = m_blobs[cur].size;
						m_blobs[temp].xmax = m_blobs[cur].xmax + abs(w1 - w2) - 1; //(w1 - (m_blobs[cur].xmax - m_blobs[temp].xmin));
						m_blobs[temp].xmin = m_blobs[cur].xmin;
						m_blobs[temp].ymax = m_blobs[cur].ymax;
						m_blobs[temp].ymin = m_blobs[cur].ymin;

						m_blobs[cur].size = t_size;
						m_blobs[cur].xmax = t_xmax;
						m_blobs[cur].xmin = t_xmin;
						m_blobs[cur].ymax = t_ymax;
						m_blobs[cur].ymin = t_ymin;

					}
					else
					{
					
					}
				}
			}
		}
	}
	delete [] arInter;
}
void FImgProc::cleanmem()
{
	int i,j;

	for(i = 0;i < m_blobcount;i++)
	{
		for(j = 0;j < 32;j++) 
		{
			delete[] m_charinp[i].dat[j];
		}
		delete[] m_charinp[i].dat;
	}

	delete[] m_charinp;

	for(i = 0;i < m_blobcount;i++) 
	{
		for(j = 0;j < 8;j++)
		{
			delete[] m_dinp[i].dd[j];
		}
		delete[] m_dinp[i].dd;
	}

	delete[] m_dinp;
	delete[] m_blobs;

	if (ro != NULL) 
		delete[] ro;
	if (rowid != NULL) 
		delete[] rowid;
	if (wideofline != NULL) 
		delete[] wideofline;
	if (LEVEL != NULL) 
		delete[] LEVEL;
	if (blobseq != NULL) 
		//delete[] blobseq;

	//delete[] blobseq;delete[] blobseq;
	if (finallevel != NULL)
	{
		for(int n = 0;n < m_blobcount;n++)
		    delete[] finallevel[n];

		//delete[] finallevel;
	}
}
int FImgProc::normalize(F_PIXEL **b,int nWidth,int nHeight,int oWidth,int oHeight,int **d,int idn,BOOL bBilinear)
{
	//Bitmap bTemp = (Bitmap)b.Clone();
	//b = new Bitmap(nWidth, nHeight, bTemp.PixelFormat);
	F_PIXEL *tmp = new F_PIXEL [nWidth * nHeight];
	char buffer[15];
	/*int rcount,gcount,bcount;
	rcount = 0;
	gcount = 0;
	bcount = 0;
	int nrcount,ngcount,nbcount;
	nrcount = 0;
	ngcount = 0;
	nbcount = 0;*/

	double nXFactor = (double)oWidth/(double)nWidth;
	double nYFactor = (double)oHeight/(double)nHeight;

	if(bBilinear)
	{
		double fraction_x, fraction_y, one_minus_x, one_minus_y;
		int ceil_x, ceil_y, floor_x, floor_y;
		F_PIXEL c1;// = new Color();
		F_PIXEL c2;// = new Color();
		F_PIXEL c3;// = new Color();
		F_PIXEL c4;// = new Color();
		BYTE red, green, blue;

		BYTE b1, b2;

		for (int x = 0; x < nWidth; ++x)
			for (int y = 0; y < nHeight; ++y)
			{
				// Setup
				floor_x = (int)floor(x * nXFactor);
				floor_y = (int)floor(y * nYFactor);
				ceil_x = floor_x + 1;
				if (ceil_x >= oWidth) ceil_x = floor_x;
				ceil_y = floor_y + 1;
				if (ceil_y >= oHeight) ceil_y = floor_y;
				fraction_x = x * nXFactor - floor_x;
				fraction_y = y * nYFactor - floor_y;
				one_minus_x = 1.0 - fraction_x;
				one_minus_y = 1.0 - fraction_y;

//				if( (floor_y >= 0) && (floor_y < oHeight) && (floor_x >= 0) && (floor_x < oWidth) )
//				{
				if( (floor_y >= 0) && (floor_x >= 0) )
				{
					c1 = b[floor_y][floor_x];//b[(floor_y * oHeight) + floor_x];//bTemp.GetPixel(floor_x, floor_y);
					c2 = b[floor_y][ceil_x]; //b[(floor_y * oHeight) + ceil_x];//bTemp.GetPixel(ceil_x, floor_y);
					c3 = b[ceil_y][floor_x]; //b[(ceil_y * oHeight) + floor_x];//bTemp.GetPixel(floor_x, ceil_y);
					c4 = b[ceil_y][ceil_x];  //b[(ceil_y * oHeight) + ceil_x];//bTemp.GetPixel(ceil_x, ceil_y);
				}
//				}

				// Blue
				b1 = (BYTE)(one_minus_x * c1.blue + fraction_x * c2.blue);

				b2 = (BYTE)(one_minus_x * c3.blue + fraction_x * c4.blue);
						
				blue = (BYTE)(one_minus_y * (double)(b1) + fraction_y * (double)(b2));

				// Green
				b1 = (BYTE)(one_minus_x * c1.green + fraction_x * c2.green);

				b2 = (BYTE)(one_minus_x * c3.green + fraction_x * c4.green);
						
				green = (BYTE)(one_minus_y * (double)(b1) + fraction_y * (double)(b2));

				// Red
				b1 = (BYTE)(one_minus_x * c1.red + fraction_x * c2.red);

				b2 = (BYTE)(one_minus_x * c3.red + fraction_x * c4.red);
						
				red = (BYTE)(one_minus_y * (double)(b1) + fraction_y * (double)(b2));

				/*if( (blue >= 127)&&(green >= 127)&&(red >= 127) )
				{
					d[y][x] = 1;
					tmp[(y * nHeight) + x].blue = 255;
					tmp[(y * nHeight) + x].green = 255;
					tmp[(y * nHeight) + x].red = 255;
				}
				else
				{
					d[y][x] = 0;
					tmp[(y * nHeight) + x].blue = 0;
					tmp[(y * nHeight) + x].green = 0;
					tmp[(y * nHeight) + x].red = 0;
				}*/

				if( (blue == green) && (blue == red) && (green == red) )
					d[y][x] = blue;

				tmp[(y * nHeight) + x].blue = blue;
				tmp[(y * nHeight) + x].green = green;
				tmp[(y * nHeight) + x].red = red;
				

				//b.SetPixel(x,y, System.Drawing.Color.FromArgb(255, red, green, blue));
			}
	}
	
    unsigned char *data1 = reinterpret_cast<unsigned char *>(tmp);
	IplImage *test = cvCreateImage( cvSize(nWidth,nHeight) , 8 , 3); 

	test->imageData = (char *)data1;
	sprintf(buffer,"file_%d.bmp",idn);

	//cvSaveImage(buffer,test);

    //cvNamedWindow( "Ar" , CV_WINDOW_AUTOSIZE );
    //cvShowImage( "Ar", test );
    			
	//cvReleaseImage(&test);
	delete [] tmp;
	
	return 1;
}
void FImgProc::extract(F_BLOB blob,FImage& Source,int id,int zuck)
{//this function responsible for extract white point from original data and replace with black
	
	F_PIXEL *pSrc = Source.m_data;
	//F_PIXEL *pEnd = pSrc + (Source.m_width * Source.m_height);
	F_PIXEL *temp;
	F_PIXEL **newimage;
    int counter = 0;
	int hei = blob.ymax - blob.ymin; if(hei < 0) hei = -hei;
	int wid = blob.xmax - blob.xmin; if(wid < 0) wid = -wid;

	int aaay,aaax;
	aaay = 0;
	aaax = 0;

	if(zuck == 1)
	{
		for(int r = hei;r >= 0;r--)
		{
			temp = pSrc + (((r + blob.ymin) * Source.m_width) +  blob.xmin);
			if(temp->blue == 255)
			{
				aaay++;
			}
			else
				break;
		}
		aaay = hei - aaay - 1;

		if(aaay >= 0) 
		{
			for(int c = 0;c <= wid;c++)
			{
				temp = pSrc + (((aaay + blob.ymin) * Source.m_width) + (c + blob.xmin));
				if(temp->blue == 0)
				{
					aaax++;
				}
				else
					break;
			}
		}

		for(int r = 0;r <= aaay;r++)
		{
			for(int c = 0;c < aaax;c++)
			{
				temp = pSrc + (((r + blob.ymin) * Source.m_width) + (c + blob.xmin));
				if(temp->blue == 255)
				{
					temp->blue = 0;
					temp->green = 0;
					temp->red = 0;
				}
	//			else
	//				temp->blue = 0;
			}
		}
	}

	//hei += 1;
	//wid += 1;

	int xmin = blob.xmin;
	int xmax = blob.xmax;// + 1;
	int ymin = blob.ymin;
	int ymax = blob.ymax;// + 1;

	int **bdata = new int* [32];
	for(int t = 0;t < 32;t++)
		bdata[t] = new int [32];

	newimage = new F_PIXEL* [hei];
	for(int j = 0;j < hei;j++)
		newimage[j] = new F_PIXEL [wid];

	for(int r = 0;r < hei;r++)
	{
		for(int c = 0;c < wid;c++)
		{
//temppix = pSrcPix + (((r + lastyp) * Source.m_width) + (c + lastxp));
			temp = pSrc + (((r + ymin) * Source.m_width) + (c + xmin));
			//we sure that this is binary image already
			if(temp->blue == 255)//so check only y component
			{
				//bdata[r][c] = 1;
				temp->blue = temp->green = temp->red = 0;	//reset to zero
				newimage[r][c].blue = 255;
				newimage[r][c].green = 255;
				newimage[r][c].red = 255;
			}
			else if(temp->blue == 0) 
			{
				//bdata[r][c] = 0;
				newimage[r][c].blue = 0;
				newimage[r][c].green = 0;
				newimage[r][c].red = 0;
			}
			counter++;
		}
	}
	
	float fsum = 0;
	float did = 16.0 * 255.0;
	float divid;
	m_charinp[id].wid = wid;
	m_charinp[id].hei = hei;

	if((wid >= 1)&&(hei >= 1))
	{
		normalize(newimage,32,32,wid,hei,bdata,id,TRUE);
	}

	for(int ii = 0;ii < 32;ii++) 
	{
		for(int jj = 0;jj < 32;jj++)
		{
			//fprintf(fp , "%d" , bdata[ii][jj]);
			m_charinp[id].dat[ii][jj] = bdata[ii][jj];
		}
		//fprintf(fp , "\n");
	}
	divid = (float)wid/(float)hei;
//	if((training == 1)||(training == 2))
//

	m_dinp[id].ratio = divid;

	for(int i = 0;i < 8;i++) 
	{
		for(int j = 0;j < 8;j++) 
		{
			fsum = 0;
			for(int k = i*4;k < (i+1)*4;k++)
			{
				for(int l = j*4;l < (j+1)*4;l++) 
				{
					fsum += m_charinp[id].dat[k][l];
				}
			}
			fsum = fsum / did;
			m_dinp[id].dd[i][j] = fsum;
//			if((training == 1)||(training == 2))
//
		}
//		if((training == 1)||(training == 2))
//
	}

/*	if((training == 1)||(training == 2))
	{
	}*/

	for(int t = 0;t < hei;t++)
		delete [] newimage[t];

	for(int t = 0;t < 32;t++)
		delete [] bdata[t];

	delete [] bdata;
	delete [] newimage;
}
void FImgProc::cross_validate(float ***_dat,int nn)		//nn should be 112/2 = 56 here krub
{
	int temp,ttt;
	float ftemp;
	FILE *f;
	FILE *fp2;

	f = fopen("testpat.dat","r");

	if(f)
	{
		fseek( f , 0L, SEEK_SET );
		for(int index = 0;index < nn;index++) 
		{
			fscanf(f,"%d\n",&temp);
			for(int index_1 = 0;index_1 < temp;index_1++)
			{
				fscanf(f,"%f\n",&ftemp);
				_dat[index][index_1][64] = ftemp;
				for(int i = 0;i < 8;i++)
				{
					for(int j = 0;j < 8;j++) 
					{
						fscanf(f,"%f ",&ftemp);
						_dat[index][index_1][(i * 8) + j] = ftemp;
					}
					fscanf(f,"\n");
				}

				for(int k = 0;k < temp;k++) 
				{
					fscanf(f,"%d ",&ttt);
					_dat[index][index_1][k + 65] = (ttt * 1.0f);
				}
				fscanf(f,"\n");
			}
		}
		fclose(f);
	}

	fp2 = fopen("testpat_val.dat","r");

	if(fp2) 
	{
		fseek( f , 0L, SEEK_SET );
		for(int index = nn;index < (nn*2);index++) 
		{
			fscanf(f,"%d\n",&temp);
			for(int index_1 = 0;index_1 < temp;index_1++)
			{
				fscanf(f,"%f\n",&ftemp);
				_dat[index][index_1][64] = ftemp;
				for(int i = 0;i < 8;i++)
				{
					for(int j = 0;j < 8;j++) 
					{
						fscanf(f,"%f ",&ftemp);
						_dat[index][index_1][(i * 8) + j] = ftemp;
					}
					fscanf(f,"\n");
				}

				for(int k = 0;k < temp;k++) 
				{
					fscanf(f,"%d ",&ttt);
					_dat[index][index_1][k + 65] = (ttt * 1.0f);
				}
				fscanf(f,"\n");
			}
		}
		//return temp;
		fclose(fp2);
	}
}
int FImgProc::train_1(int nn,float ***b_dat,int ar)  //nn mean number of file
{
	int temp,ttt,offset = 0;
	float ftemp;
	FILE *f;

	if( (ar == 1) || (ar == 5) )
	{
		f = fopen("testpat.dat","r");
		offset = (nn / 2);
	}
	else
		f = fopen("testpat_val.dat","r");

	if(f)
	{
		fseek( f , 0L, SEEK_SET );
		for(int index = 0;index < nn;index++) 
		{
			fscanf(f,"%d\n",&temp);
			for(int index_1 = 0;index_1 < temp;index_1++)
			{
				fscanf(f,"%f\n",&ftemp);

				if( (ar == 5) && (index >= offset) )
					b_dat[index-offset][index_1][64] = ftemp;
				else if(ar != 5) 
					b_dat[index][index_1][64] = ftemp;

				for(int i = 0;i < 8;i++)
				{
					for(int j = 0;j < 8;j++) 
					{
						fscanf(f,"%f ",&ftemp);

						if( (ar == 5) && (index >= offset) )
							b_dat[index-offset][index_1][(i * 8) + j] = ftemp;
						else if(ar != 5) 
							b_dat[index][index_1][(i * 8) + j] = ftemp;

					}
					fscanf(f,"\n");
				}

				for(int k = 0;k < temp;k++) 
				{
					fscanf(f,"%d ",&ttt);

					if( (ar == 5) && (index >= offset) )
						b_dat[index-offset][index_1][k + 65] = (ttt * 1.0f);
					else if(ar != 5) 
						b_dat[index][index_1][k + 65] = (ttt * 1.0f);

				}
				fscanf(f,"\n");
			}
		}
		return temp;
	}
	else
		return 0;
}
void FImgProc::shellSort(int *numbers,int *numbers_2,int array_size)
{
  int i, j, increment, temp , temp_2;

  increment = 3;
  while (increment > 0)
  {
    for (i=0; i < array_size; i++)
    {
      j = i;
      temp = numbers[i];
	  temp_2 = numbers_2[i];
      while ((j >= increment) && (numbers[j-increment] > temp))
      {
        numbers[j] = numbers[j - increment];
		numbers_2[j] = numbers_2[j - increment];
        j = j - increment;
      }
      numbers[j] = temp;
	  numbers_2[j] = temp_2;
    }
    if (increment/2 != 0)
      increment = increment/2;
    else if (increment == 1)
      increment = 0;
    else
      increment = 1;
  }
}

void FImgProc::findinthelevel(int levelrow,int levelnum)
{
	int i , k , c0 , c1 , c2 , c3;
	F_BLOB tmp , tmp2;
    int xminbound,xmaxbound,l,xcenter;
	int ttttt = 0;
	int fg;
	int *xl1   = new int [m_blobcount];
	int *xl0id = new int [m_blobcount];
	int *xl1id = new int [m_blobcount];
	int *xl2id = new int [m_blobcount];
	int *xl3id = new int [m_blobcount];

	c0 = c1 = c2 = c3 = 0;
	
	for(k = 0;k < m_blobcount;k++) 
	{
		tmp = m_blobs[k];
		fg = 0;
//		if( abs(levelrow - tmp.ymax) < 3 )     //we must change here
//		{                 //ให้ทำการ check ว่าระดับที่ต่ำที่สุดของ blob อันนั้นเนี้ยอยู่ใน ขอบเขตของระดับที่ 1 หรือเปล่า
//			xl1[c1] = tmp.xmin;        //ถึงอย่างไรก็ตามเนี้ยให้ check ด้วยว่าระดับต่ำที่สุดของ blob ต้องมีค่าไม่เกิน
//			xl1id[c1] = k;             //กับระดับที่ สองด้วยเนื่องจากเรา การันตีแน่นอนแล้วว่าระดับที่ 2 นั้นเราหาได้แน่นอน
//			c1++;
//		}
		if((tmp.ymax <= levelrow)&&(tmp.ymax > (levelrow - wideofline[levelnum]))&&(fg == 0))
		{
			if((finallevel[levelnum][2] != -1) && (tmp.ymax <= finallevel[levelnum][2]))
			{
				fg = 1;
				m_blobs[k].l = 2;//2
				xl2id[c2] = k;//2
				c2++;//2
			}
			else
			{
				if((abs(tmp.ymax - tmp.ymin) < (wideofline[levelnum] / 2))&&(abs(tmp.ymax - levelrow) < 3)&&(tmp.ymax > levelrow))         
				{
					if(finallevel[levelnum][0] == -1)
						finallevel[levelnum][0] = tmp.ymax;

					fg = 1;
					m_blobs[k].l = 0;
					xl0id[c0] = k;
					c0++;
				}
				else
				{
					fg = 1;
					m_blobs[k].l = 1;
					xl1[c1] = tmp.xmin;
					xl1id[c1] = k;
					c1++;
				}
			}
		}
		if((finallevel[levelnum][3] != -1)&&(fg == 0))
		{
			//if(abs(finallevel[levelnum][3] - tmp.ymax) < 3) 
			if( tmp.ymax <= finallevel[levelnum][3] )
			{
				if(levelnum > 0)
				{
					if(finallevel[levelnum-1][0] > -1)
						ttttt = finallevel[levelnum-1][0];
					else
						ttttt = finallevel[levelnum-1][1]; 

					if( tmp.ymin > ttttt )
					{						
						fg = 1;
						m_blobs[k].l = 3;
						xl3id[c3] = k;
						c3++;
					}
				}
				else
				{
					//if( tmp.ymin > finallevel[levelnum - 1][
					fg = 1;
					m_blobs[k].l = 3;
					xl3id[c3] = k;
					c3++;
				}
			}
		}
		if((finallevel[levelnum][2] != -1)&&(fg == 0))
		{
			//&& ( tmp.ymax > finallevel[levelnum][3] ) )
			//if(abs(finallevel[levelnum][2] - tmp.ymax) < 5) 
			if( tmp.ymax <= finallevel[levelnum][2] ) 
			{
				if( (finallevel[levelnum][3] != -1) && (tmp.ymax > finallevel[levelnum][3]) )
				{
					fg = 1;
					m_blobs[k].l = 2;
					xl2id[c2] = k;
					c2++;
				}
				else
				{
					if(levelnum > 0)
					{
						if(finallevel[levelnum-1][0] > -1)
							ttttt = finallevel[levelnum-1][0];
						else
							ttttt = finallevel[levelnum-1][1]; 

						if( tmp.ymin > ttttt )
						{	
							fg = 1;
							m_blobs[k].l = 2;
							xl2id[c2] = k;
							c2++;
						}
					}
					else
					{
						//if( tmp.ymin > finallevel[levelnum - 1][	
						fg = 1;
						m_blobs[k].l = 2;
						xl2id[c2] = k;
						c2++;
					}		
				}
			}
		}
		if((finallevel[levelnum][0] != -1)&&(fg == 0))
		{
			// && ( tmp.ymax > finallevel[levelnum][1] ) )
			//if(abs(finallevel[levelnum][0] - tmp.ymax) < 5)
			if( tmp.ymax <= finallevel[levelnum][0] )
			{
				if( (finallevel[levelnum][1] != -1) && (tmp.ymax > finallevel[levelnum][1]) )
				{
					fg = 1;
					m_blobs[k].l = 0;
					xl0id[c0] = k;	
					c0++;
				}
				else
				{
					if(levelnum > 0)
					{
						if(finallevel[levelnum-1][0] > -1)
							ttttt = finallevel[levelnum-1][0];
						else
							ttttt = finallevel[levelnum-1][1]; 

						if( tmp.ymin > ttttt )
						{
							fg = 1;
							m_blobs[k].l = 0;
							xl0id[c0] = k;	
							c0++;
						}
					}
					else
					{
						//if( tmp.ymin > finallevel[levelnum - 1][	
						fg = 1;
						m_blobs[k].l = 0;
						xl0id[c0] = k;	
						c0++;
					}				
				}
			}
		}
	}

	
	if( (c0 > m_blobcount) || (c1 > m_blobcount) || (c2 > m_blobcount) || (c3 > m_blobcount) )
	{
		return;
	}

	shellSort(xl1,xl1id,c1);

	for(i = 0;i < c1;i++)
	{
		tmp = m_blobs[xl1id[i]];
		xminbound = tmp.xmin;
		xmaxbound = tmp.xmax;
		blobseq[cou__] = xl1id[i];
		cou__++;
		if(c0 > 0)
		{
			for(l = 0;l < c0;l++) 
			{
				tmp2 = m_blobs[xl0id[l]];
				xcenter = (tmp2.xmin + tmp2.xmax) / 2;

				if( ( (tmp2.xmin > xminbound) && (tmp2.xmin < xmaxbound) ) || ( (xcenter >= xminbound) && (xcenter <= xmaxbound) ) )
				{
					blobseq[cou__] = xl0id[l];
					cou__++;
				}	
			}
		}
		if(c2 > 0) 
		{
			for(l = 0;l < c2;l++) 
			{
				tmp2 = m_blobs[xl2id[l]];
				xcenter = (tmp2.xmin + tmp2.xmax) / 2;

				if( ( (tmp2.xmin > xminbound) && (tmp2.xmin < xmaxbound) ) || ( (xcenter >= xminbound) && (xcenter <= xmaxbound) ) )
				{
					blobseq[cou__] = xl2id[l];
					cou__++;
				}
			}
		}
		if(c3 > 0)
		{
			for(l = 0;l < c3;l++) 
			{
				tmp2 = m_blobs[xl3id[l]];
				xcenter = (tmp2.xmin + tmp2.xmax) / 2;

				if( ( (tmp2.xmin > xminbound) && (tmp2.xmin < xmaxbound) ) || ( (xcenter >= xminbound) && (xcenter <= xmaxbound) ) )
				{
					blobseq[cou__] = xl3id[l];
					cou__++;
				}
			}
		}
	}

	blobseq[cou__] = 0xFF;
	cou__++;
	//we mark the 0xFF for the newline character;
//	delete[] xl1;
//	delete[] xl0id;
//	delete[] xl1id;
//	delete[] xl2id;
//	delete[] xl3id;
}
void FImgProc::blob_reforming()
{
	int i;

	blobseq = new int [m_blobcount + numberofline]; //we plus the number of line of the \n character also

	for(int dong = 0;dong < (m_blobcount + numberofline);dong++)
		blobseq[dong] = -1;

	cou__ = 0;

	for(i = 0;i < numberofline;i++)
	{
		if(finallevel[i][1] != -1)
		{
			findinthelevel( finallevel[i][1] , i );
		}
	}	
}
BYTE FImgProc::get_character(int recnumber)
{
	BYTE toreturn;

	if(recnumber == 0)
		 toreturn = 0xA1;
	else if(recnumber == 1)
		 toreturn = 0xA2; 
	else if(recnumber == 2)
		 toreturn = 0xA2; 
	else if(recnumber == 3)
		 toreturn = 0xA4; 
	else if(recnumber == 4)
		 toreturn = 0xA5; 
	else if(recnumber == 5)
		 toreturn = 0xA6; 
	else if(recnumber == 6)
		 toreturn = 0xA7; 
	else if(recnumber == 7)
		 toreturn = 0xA8; 
	else if(recnumber == 8)
		 toreturn = 0xA9; 
	else if(recnumber == 9)
		 toreturn = 0xAA; 
	else if(recnumber == 10)
		 toreturn = 0xAB; 
	else if(recnumber == 11)
		 toreturn = 0xAC; 
	else if(recnumber == 12)
		 toreturn = 0xAD; 
	else if(recnumber == 13)
		 toreturn = 0xAE; 
	else if(recnumber == 14)
		 toreturn = 0xAF; 
	else if(recnumber == 15)
		 toreturn = 0xB0; 
	else if(recnumber == 16)
		 toreturn = 0xB1; 
	else if(recnumber == 17)
		 toreturn = 0xB2; 
	else if(recnumber == 18)
		 toreturn = 0xB3; 
	else if(recnumber == 19)
		 toreturn = 0xB4; 
	else if(recnumber == 20)
		 toreturn = 0xB5; 
	else if(recnumber == 21)
		 toreturn = 0xB6; 
	else if(recnumber == 22)
		 toreturn = 0xB7; 
	else if(recnumber == 23)
		 toreturn = 0xB8; 
	else if(recnumber == 24)
		 toreturn = 0xB9; 
	else if(recnumber == 25)
		 toreturn = 0xBA; 
	else if(recnumber == 26)
		 toreturn = 0xBB; 
	else if(recnumber == 27)
		 toreturn = 0xBC; 
	else if(recnumber == 28)
		 toreturn = 0xBD; 
	else if(recnumber == 29)
		 toreturn = 0xBE; 
	else if(recnumber == 30)
		 toreturn = 0xBF; 
	else if(recnumber == 31)
		 toreturn = 0xC0;
	else if(recnumber == 32)
		 toreturn = 0xC1;
	else if(recnumber == 33)
		 toreturn = 0xC2;
	else if(recnumber == 34)
		 toreturn = 0xC3;
	else if(recnumber == 35)
		 toreturn = 0xC4; 
	else if(recnumber == 36)
		 toreturn = 0xC5; 
	else if(recnumber == 37)
		 toreturn = 0xC6; 
	else if(recnumber == 38)
		 toreturn = 0xC7; 
	else if(recnumber == 39)
		 toreturn = 0xC8; 
	else if(recnumber == 40)
		 toreturn = 0xC9; 
	else if(recnumber == 41)
		 toreturn = 0xCA; 
	else if(recnumber == 42)
		 toreturn = 0xCB; 
	else if(recnumber == 43)
		 toreturn = 0xCC; 
	else if(recnumber == 44)
		 toreturn = 0xCD; 
	else if(recnumber == 45)
		 toreturn = 0xCE; 
    else if(recnumber == 46)
		 toreturn = 0xCF; 
    else if(recnumber == 47) //sara i
		 toreturn = 0xD1; 
	else if(recnumber == 48) //sara u
		 toreturn = 0xD2; 
	else if(recnumber == 49)  //chattawa
		 toreturn = 0xD4;
	else if(recnumber == 50)
		 toreturn = 0xD5;
	else if(recnumber == 51)
		 toreturn = 0xD6;
	else if(recnumber == 52)
		 toreturn = 0xD7;
	else if(recnumber == 53)
		 toreturn = 0xD8;
	else if(recnumber == 54)
		 toreturn = 0xD9;
	else if(recnumber == 55)
		 toreturn = 0xE0;
	else if(recnumber == 56)
		 toreturn = 0xE2;
	else if(recnumber == 57)
		 toreturn = 0xE3;
	else if(recnumber == 58)
		 toreturn = 0xE4;
	else if(recnumber == 59)
		 toreturn = 0xD2;
	else if(recnumber == 60)
		 toreturn = 0xE6;
	else if(recnumber == 61)
		 toreturn = 0xE7;
	else if(recnumber == 62)
		 toreturn = 0xE8;
	else if(recnumber == 63)
		 toreturn = 0xE9;
	else if(recnumber == 64)
		 toreturn = 0xEA;
	else if(recnumber == 65)
		 toreturn = 0xEB;
	else if(recnumber == 66)
		 toreturn = 0xEC;
	else if(recnumber == 67)
		 toreturn = 0xED;
	else if(recnumber == 68)
		 toreturn = 0xF0;
	else if(recnumber == 69)
		 toreturn = 0xF1;
	else if(recnumber == 70)
		 toreturn = 0xF2;
	else if(recnumber == 71)
		 toreturn = 0xF3;
	else if(recnumber == 72)
		 toreturn = 0xF4;
	else if(recnumber == 73)
		 toreturn = 0xF5;
	else if(recnumber == 74)
		 toreturn = 0xF6;
	else if(recnumber == 75)
		 toreturn = 0xF7;
	else if(recnumber == 76)
		 toreturn = 0xF8;
	else if(recnumber == 77)
		 toreturn = 0xF9;
	else 
		 toreturn = 0xFF;


	return toreturn;
}
void FImgProc::gen_text(void)
{
	FILE *filep = fopen( "result.txt" , "wt" );
	const int lev0[2] = { 0xD8 , 0xD9 };
	const int lev1[17] = { 0xD8 , 0xD9 , 0xD1 , 0xD4 , 0xD5 , 0xD6 , 0xD7 , 0xE7 , 0xE8 , 0xE9 , 0xEA , 0xEB , 0xEC , 0xED };
	const int lev2[12] = { 0xD1 , 0xD4 , 0xD5 , 0xD6 , 0xD7 , 0xE7 , 0xE8 , 0xE9 , 0xEA , 0xEB , 0xEC , 0xED };
	const int lev3[5] = { 0xE8 , 0xE9 , 0xEA , 0xEB , 0xEC };
	int i,di,clevel,livein,toignore;
	BYTE ch,oldch = 255;  //we set the oldch to equal 255 also
	livein = 0; //livein is 0 mean that the character is in that level
	for(i = 0;i < (m_blobcount + numberofline);i++) 
	{
		if(blobseq[i] != -1) 
		{
			di = blobseq[i];
			//here is the function to track the level of each blob in the correct sequence
			//for(int ilevel = 0;ilevel < numberofline;ilevel++) 
			//{
			//	if(abs(finallevel[ilevel][1] - m_blobs[di].ymax) < 3)
			//		clevel = 1;
			//	else if(abs(finallevel[ilevel][0] - m_blobs[di].ymax) < 3)
			//		clevel = 0;
			//	else if(abs(finallevel[ilevel][2] - m_blobs[di].ymax) < 3)
			//		clevel = 2;
			//	else if(abs(finallevel[ilevel][3] - m_blobs[di].ymax) < 3) 
			//		clevel = 3;
			//}
			if(di != 0xFF)
			{
				toignore = 0;
				ch = get_character(m_dinp[di].recognumber); //				ch = get_character(m_dinp[di].recognumber);

				if(m_blobs[di].l == 1) //this is the level 1
				{
					if((ch == 0xD1)&&(oldch != 0xD0)) //we must check that the oldch mustn't equal ch
						ch = 0xD0;
					else
					{
						livein = 0;
						for(int v = 0;v < 17;v++)
						{
							if(ch != lev1[v])
							{
								livein++;
							}
						}
						if(ch == 0xD1)
							toignore = 1;
						else if(livein < 17)
							ch = 0xFF;
					}
				}
				else if(m_blobs[di].l == 0) //this is the level 0 we must check if ch is not zero
				{
					if(ch != 0xD1)
					{
						livein = 0;
						for(int v = 0;v < 2;v++)
						{
							if(ch == lev0[v])
							{
								livein = 1;
								break;
							}
						}
						if(livein == 0)
							ch = lev0[0]; //we must change here to get the random from the array
					}
					else
						toignore = 1;
				}
				else if(m_blobs[di].l == 2)
				{
					livein = 0;
					for(int v = 0;v < 12;v++)
					{
						if(ch == lev2[v])
						{
							livein = 1;
							break;
						}
					}
					if(livein == 0)
						ch = lev2[0];
				}
				else if(m_blobs[di].l == 3)
				{
					livein = 0;
					for(int v = 0;v < 5;v++)
					{
						if(ch == lev3[v])
						{
							livein = 1;
							break;
						}
					}
					if(livein == 0)
						ch = lev3[0];
				}
				if(toignore == 0)
				{
					fprintf(filep,"%c",ch);
					oldch = ch;
				}
			}
			else
			{
				fprintf(filep,"\n");
				//--i;
			}
		}
	}
    fclose(filep);
}
void FImgProc::assignrecog(int *com)
{
	int i;
	for(i = 0;i < m_blobcount;i++) 
	{
		m_dinp[i].recognumber = com[i];
	}
}
int FImgProc::Trai(float **passing,int train,int italic)
{	
	int		i,j,k;
	
	if( (train == 1) || (train == 2) )
	{
	        int *firstrow = new int [46];		//number of element is 46 for the first row
          	int *seqfirst = new int [46];       //
           	int *secondrow = new int [32];		//number of element is 32 for the second row
            int *seqsecond = new int [32];
            int *combined = new int [78];

            for(i = 0;i < 46;i++) 
            {
            		firstrow[i] = m_blobs[i].xmin; 
              		seqfirst[i] = i;
          	}

           	shellSort(firstrow,seqfirst,46);

            for(i = 46;i < 78;i++) 
            {
            		secondrow[i-46] = m_blobs[i].xmin;
              		seqsecond[i-46] = i;
           	}

            shellSort(secondrow,seqsecond,32);

        	for( i = 0 ; i < m_blobcount ; i++ )
         	{
          		if(i < 46)
		      	     combined[i] = seqfirst[i];
              	else							
                	 combined[i] = seqsecond[i-46];
           	}            
		    for(i = 0;i < m_blobcount;i++)
		    {
				 fprintf(fp , "%.7f\n" ,  m_dinp[combined[i]].ratio);

			     for(j = 0;j < 8;j++) 
			     {
                      for(k = 0;k < 8;k++)
				      {
		                   passing[i][(j*8) + k] = m_dinp[combined[i]].dd[j][k];
						   fprintf(fp , "%.7f " ,  m_dinp[combined[i]].dd[j][k]);
      				  }
					  fprintf(fp , "\n");
   			     }
			     passing[i][64] = m_dinp[combined[i]].ratio;
				 
				 for(int ij = 0;ij < m_blobcount;ij++)
				 {
					 if(ij == i)
					    fprintf(fp , "%d " , 1);
					 else
					   	fprintf(fp , "%d " , 0);
				 }
				 fprintf(fp , "\n");

				 if(train == 1)
				 {
					for(j = 0;j < m_blobcount;j++) 
					{
						 if(j == i)										//combined[i])
							 passing[i][j+65] = 1.0;
					   	 else
							 passing[i][j+65] = 0.0;
					}
				 }
//				 else if(train == 2)
//				 {
//					passing[i][65] = combined[i];
//				 }
	        }       
  	        delete[] firstrow;	// = new int [46];		//number of element is 46 for the first row
	        delete[] seqfirst;	// = new int [46];       //
	        delete[] secondrow;	// = new int [32];		//number of element is 32 for the second row
	        delete[] seqsecond;	// = new int [32];
	        delete[] combined;	//= new int [78];
      }
      else				 //else if(train == 2) mean that validation krub
      {
		  for(i = 0;i < m_blobcount;i++)
		  {
               for(j = 0;j < 8;j++)
			   {
			    	for(k = 0;k < 8;k++)
				    {
		                 passing[i][(j*8) + k] = m_dinp[i].dd[j][k];	
                    }
		       }
			   passing[i][64] = m_dinp[i].ratio;
          }
     }

	return m_blobcount;
}
void FImgProc::starttrain(int ar)
{
	if( ar == 1 )
		fp = fopen( "testpat.dat" , "wt" );
	else
		fp = fopen( "testpat_val.dat" , "wt" );

}
void FImgProc::stoptraining()
{
	fclose(fp); //  	fclose(fp); 	fclose(fp);
}
void FImgProc::BlobMoveFirst(void)
{
	m_curblob = 0;
}

BOOL FImgProc::BlobGetNext(F_BLOB &Blob)
{
	if (m_curblob >= m_blobcount) return false;
	Blob = m_blobs[m_curblob];
	m_curblob++;
	return true;
}

BOOL FImgProc::BlobGetNext(F_BLOB &Blob, int SizeMin, int SizeMax)
{
	do
	{
		if ((m_blobs[m_curblob].size >= SizeMin) && (m_blobs[m_curblob].size <= SizeMax))
		{
			Blob = m_blobs[m_curblob];
			m_curblob++;
			return true;
		}
		m_curblob++;
	} while (m_curblob < m_blobcount);
	return false;
}


int FImgProc::AnalyseBlob__1(/*const FImage &Source*/int big[60][60])
{
	int pixcount = 60 * 60;
	int i,j;

	//int curr = (Source.m_width * y_topleft) + x_topleft;

	// Source image
	//F_PIXEL *pSrcImg = Source.m_data;
	//F_PIXEL *pSrcEnd = pSrcImg + (pixcount);
	int count = 0;

	// Stack
	int *pStackIndex = new int[pixcount];
	int stack = 0;	// Current stack size

	// Image map
	int *pImgMap = new int[pixcount];
	memset(pImgMap, -1, pixcount * sizeof(int));
	
	// Blobs array
	if (m_blobs != NULL) delete[] m_blobs;
	m_blobs = new F_BLOB[pixcount];

	// Iterate through image pixels
	int oldp, tmp;

	for (int p = 0;p < pixcount;p++)
	{
		i = p / 60;
		j = p % 60;

		if ((big[i][j] == 1) && (pImgMap[p] < 0))
		{
			// Push this pixel this is must the real point
			pStackIndex[stack] = p;
			stack++;
			m_blobs[count].size = 0;
			m_blobs[count].xmin = m_blobs[count].xmax = p % 60;
			m_blobs[count].ymin = m_blobs[count].ymax = p / 60;

			// Floodfill
			oldp = p;

			while (stack > 0)
			{
				// Pop stack
				stack--;
				p = pStackIndex[stack];
				i = p / 60;
				j = p % 60;

				// Update pixel & blob
				pImgMap[p] = count;
				m_blobs[count].size++;
				tmp = p % 60;
				if (tmp < m_blobs[count].xmin) m_blobs[count].xmin = tmp;
				if (tmp > m_blobs[count].xmax) m_blobs[count].xmax = tmp;
				tmp = p / 60;
				if (tmp < m_blobs[count].ymin) m_blobs[count].ymin = tmp;
				if (tmp > m_blobs[count].ymax) m_blobs[count].ymax = tmp;

				// Push neighbors
				p++;
				j++;
				if (p < pixcount)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p -= 60;
				i--;
				if (p > 0)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p--;
				j--;
				if (p > 0)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p--;
				j--;
				if (p > 0)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p += 60;
				i++;
				if (p < pixcount)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p += 60;
				i++;
				if (p < pixcount)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p++;
				j++;
				if (p < pixcount)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}
				p++;
				j++;
				if (p < pixcount)
					if ((big[i][j] == 1) && (pImgMap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						pImgMap[p] = 0;
					}

			}
			p = oldp;

			count++;
		}
	}

	delete[] pImgMap;
	delete[] pStackIndex;

	m_blobcount = count;
	return count;
}

