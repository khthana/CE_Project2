// IMAGE1.cpp : implementation file
//

#include "stdafx.h"
#include "Y.h"
#include "IMAGE1.h"
#include <stdlib.h>
#include <stdio.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CIMAGE1 dialog


CIMAGE1::CIMAGE1(CWnd* pParent /*=NULL*/)
	: CDialog(CIMAGE1::IDD, pParent)
{
	//{{AFX_DATA_INIT(CIMAGE1)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CIMAGE1::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CIMAGE1)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CIMAGE1, CDialog)
	//{{AFX_MSG_MAP(CIMAGE1)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CIMAGE1 message handlers

void CIMAGE1::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	
	// TODO: Add your message handler code here
// main variable 
//int xpic1[1][3000];
//int ypic1[1][3000];	
//int maxpic1[1];	

	
/*	{
	int i,j;
	
	CStdioFile s("d:right-pot.pgm",CFile::typeBinary);
	 CString m;
	 char p,p1,p2;
	 char width[3],height[3];
	 int pcount;
	 int length1,pl;
	 int wpic,hpic;
	 wpic = 320;
	 hpic = 240; 
	 s.ReadString(m);
	 p=m.GetAt(0); 
	 p1=m.GetAt(1); 
	 if((p='P')&&(p1='5')){
	 }
	 s.ReadString(m);
	 length1=m.GetLength();
	 pcount=0;
	 
	 p=m.GetAt(0); 
	 i=0; 	
	 while(p!=' '){
		 
		width[i++]=p;
		
		pcount++;
		p=m.GetAt(pcount); 
	 }
	 pcount++;
	 pl=length1-pcount;
	 p=m.GetAt(pcount); 
	 i=0;
	 while((pl>=1)){
		
		height[i++]=p;
		pcount++;
		pl--;
		if(pl>0)(p=m.GetAt(pcount)); 
	 }
	int width1=atoi(width);
	int height1=atoi(height);
	 
	char b[1];
	 
	 s.Read(b,1);
	 while(b[0]!=' '){
		 s.Read(b,1);
	 }
	

	 
	 int *k =new int[wpic*hpic];
	 int *k1;
	 int threshold = 0;	
	 k1 = k;
		for(j=0;j<hpic;j++)
		{	
			for(i=0;i<wpic;i++)
			{
				
				//s.Seek(form1+4,CFile::begin);
				//DWORD form1=s.GetPosition();			
				s.Read(b,1);
				*k = b[0];
				threshold=threshold+ b[0];		
				//form1++;
				k++;
				//	if(form1==form2){
				//	s.Seek(1,CFile::current);
				//	}

			}		 
		
		}	
			
		threshold = threshold/(wpic*hpic);
	k=k1;
	int *newpic = new int[hpic*wpic];
	int *newpic1;
	int value1;
	value1 = 7;
	newpic1 = newpic;
	// find threshold
		for(j=1;j<=hpic;j++)
		{	
			for(i=1;i<=wpic;i++)
			{
				// use threshold to find object
				//if(*k < threshold)*newpic =0 ;
				//	else *newpic =255;
				

				if(abs(*k - *(k+1))>value1 || abs(*k - *(k+wpic))>value1)
				
				{
					*newpic = 0;
				}
				else 
					*newpic = 255;
				k++;
				newpic++;
			}
		}
	
	// variable
	//int top[100] ;
	int max=1;
    int block_x[240*320];
	int block_y[240*320];
	
	
	
	int x_array[4][3000];
	int y_array[4][3000];
	int get_count_max[4];
	
	// move object 
	newpic=newpic1;	
	for(j=1;j<=hpic;j++)
		{	
			for(i=1;i<=wpic;i++)
			{
				if(*newpic==0)
				{
					block_x[max]=i;
					block_y[max]=j;
					max++;
				}
			newpic++;
			}//for
		}//for

	// select object
	int count_object=0;
	int tx,ty,bx,by;
		
	
	for(i=1;i<max;i++) // max of block
	{
		if(block_x[i] > 0 && block_y[i] > 0)
		{

		// new object move to x_array,y_array

			// move and delete in block
				x_array[count_object][1]=block_x[i];
				y_array[count_object][1]=block_y[i];
				
				// to test xpic1
				if(count_object == 2)
					{
						xpic1[0][1] = block_x[i];
						ypic1[0][1] = block_y[i];
					}
				
				
				// save address
				int count_max=0;
				int count_position;
			count_max++;
			block_x[i]=0;
			block_y[i]=0;
			//count_position++;
			
		for(count_position=1;count_position<=count_max;count_position++)
		{
			
			// check around
			
			for(j=i+1;j<max;j++)
			{
				tx=x_array[count_object][count_position];
				ty=y_array[count_object][count_position];
				bx=block_x[j];
				by=block_y[j];
				if(bx>0)
				if(bx==	tx-1 && by==ty-1||bx==	tx   && by==ty-1
					||bx==	tx+1 && by==ty-1||bx ==	tx-1 && by==ty
					||bx==	tx+1 && by==ty||bx ==tx-1 && by==ty+1
					||bx==	tx   && by==ty+1||bx==	tx+1 && by==ty+1)
					
				{
					// move
					count_max++;
					x_array[count_object][count_max]=bx;
					y_array[count_object][count_max]=by;
					
					// to test xpic1
					if(count_object == 2)
					{
						xpic1[0][count_max] = bx;
						ypic1[0][count_max] = by;
					}
					
					block_x[j]=0;
					block_y[j]=0;
				}//if 1
				
			

			}//for j around

		}//count_position
			
			// ************** number of point for object **********
				if(count_max>100)
				{
					// count_max too
					get_count_max[count_object]=count_max;
					count_object++;  
					
					// to test xpic1
					if(count_object==2){maxpic1[0]=count_max};
					
				}
		}//if block <> -1

	
	
	
	
	}//for loop 1


 
	// output to image1 dialog	
	
		k=newpic1;
		for(j=0;j<hpic;j++)
		{	
			for(i=0;i<wpic;i++)
			{
				dc.SetPixel(i,j,RGB(*k,*k,*k));
				
				k++;
			}
		}


	
// *********************** test ***********************
	
	
	//for (i=0 ;i<4;i++)

		{	
			for(j=1;j<get_count_max[2] ;j++)			
			{
				dc.SetPixel(x_array[2][j],y_array[2][j],RGB(0,0,0));
					
			}
		}

	}	*/


//************************* PICTURE 2 **************************


	{
	int i,j;
	
	CStdioFile s("d:left-pot.pgm",CFile::typeBinary);
	 CString m;
	 char p,p1,p2;
	 char width[3],height[3];
	 int pcount;
	 int length1,pl;
	 int wpic,hpic;
	 wpic = 320;
	 hpic = 240; 
	 s.ReadString(m);
	 p=m.GetAt(0); 
	 p1=m.GetAt(1); 
	 if((p='P')&&(p1='5')){
	 }
	 s.ReadString(m);
	 length1=m.GetLength();
	 pcount=0;
	 
	 p=m.GetAt(0); 
	 i=0; 	
	 while(p!=' '){
		 
		width[i++]=p;
		
		pcount++;
		p=m.GetAt(pcount); 
	 }
	 pcount++;
	 pl=length1-pcount;
	 p=m.GetAt(pcount); 
	 i=0;
	 while((pl>=1)){
		
		height[i++]=p;
		pcount++;
		pl--;
		if(pl>0)(p=m.GetAt(pcount)); 
	 }
	int width1=atoi(width);
	int height1=atoi(height);
	 
	char b[1];
	 
	 s.Read(b,1);
	 while(b[0]!=' '){
		 s.Read(b,1);
	 }
	

	 
	 int *k =new int[wpic*hpic];
	 int *k1;
	 int threshold = 0;	
	 k1 = k;
		for(j=0;j<hpic;j++)
		{	
			for(i=0;i<wpic;i++)
			{
				
				//s.Seek(form1+4,CFile::begin);
				//DWORD form1=s.GetPosition();			
				s.Read(b,1);
				*k = b[0];
				threshold=threshold+ b[0];		
				//form1++;
				k++;
				//	if(form1==form2){
				//	s.Seek(1,CFile::current);
				//	}

			}		 
		
		}	
			
		threshold = threshold/(wpic*hpic);
	k=k1;
	int *newpic = new int[hpic*wpic];
	int *newpic1;
	int value1;
	value1 = 7;
	newpic1 = newpic;
	// find threshold
		for(j=1;j<=hpic;j++)
		{	
			for(i=1;i<=wpic;i++)
			{
				// use threshold to find object
				//if(*k < threshold)*newpic =0 ;
				//	else *newpic =255;
				

				if(abs(*k - *(k+1))>value1 || abs(*k - *(k+wpic))>value1)
				
				{
					*newpic = 0;
				}
				else 
					*newpic = 255;
				k++;
				newpic++;
			}
		}
	
	// variable
	//int top[100] ;

		
	int max=1;
    int block_x[240*320];
	int block_y[240*320];
	
	
	// move object 
	newpic=newpic1;	
	for(j=1;j<=hpic;j++)
		{	
			for(i=1;i<=wpic;i++)
			{
				if(*newpic==0)
				{
					block_x[max]=i;
					block_y[max]=j;
					max++;
				}
			newpic++;
			}//for
		}//for

	// select object
	int count_object=0;
	int tx,ty,bx,by;
	int back_max;	
	back_max = max;
	//CObArray* pArray = new CObArray; 
	//CUIntArray* pArray = new CUIntArray; 
	// #define map 76800 = 320*240;
	
	int x_array[8000];
	int y_array[8000];
	
	int *px,*py;
	int *x_object[5];
	int *y_object[5];
	int max_block[5];
	// save min max of object
	int max_x[5];
	int max_y[5];
	int min_x[5];
	int min_y[5];

	px=&x_array[0];
	py=&y_array[0];
	x_object[0]=px;
	y_object[0]=py;

	//int get_count_max[4];

	
	
	for(i=1;i<back_max;i++) // max of block
	{
		if(block_x[i] > 0 && block_y[i] > 0)
		{

		// new object move to x_array,y_array

			// insert to x_object
				//x_array[count_object][1]=block_x[i];
				//y_array[count_object][1]=block_y[i];
				
				*px=block_x[i];
				*py=block_y[i];

				max_x[count_object]=*px;
				min_x[count_object]=*px;
				max_y[count_object]=*py;
				min_y[count_object]=*py;

				// save address
				int count_max=0;
				int count_position;
			count_max++;
		//  clear block
		//	block_x[i]=0;
		//	block_y[i]=0;
			//count_position++;
			int *spx,*spy;
			spx=px;
			spy=py;
			
		for(count_position=0;count_position<count_max;count_position++)
		{
			

			// check around
			for(j=i+1;j<back_max;j++)
			{
				//tx=x_array[count_object][count_position];
				//ty=y_array[count_object][count_position];
				tx = *spx;
				ty = *spy;

				bx=block_x[j];
				by=block_y[j];
				// if(bx>0)
				
				if(bx==	tx-1 && by==ty-1||bx==	tx   && by==ty-1
					||bx==	tx+1 && by==ty-1||bx ==	tx-1 && by==ty
					||bx==	tx+1 && by==ty||bx ==tx-1 && by==ty+1
					||bx==	tx   && by==ty+1||bx==	tx+1 && by==ty+1)
					
				{
					
					count_max++;
					 
					
					//x_array[count_object][count_max]=bx;
					//y_array[count_object][count_max]=by;
					 
				// insert to x_object
					px++;
					py++;
					*px=bx;
					*py=by;

				if(max_x[count_object]<*px)max_x[count_object]=*px;
				if(min_x[count_object]>*px)min_x[count_object]=*px;
				if(max_y[count_object]<*py)max_y[count_object]=*py;
				if(min_y[count_object]>*py)min_y[count_object]=*py;
	
	
					
					
					// to test xpic1
					/*if(count_object == 2)
					{
						xpic1[1][count_max] = bx;
						ypic1[1][count_max] = by;
					}
					*/
					block_x[j]=block_x[back_max];
					block_y[j]=block_y[back_max];
					back_max--;
					j--;
				}//if 1
				
			

			}//for j around
			spx++;
			spy++;
		}//count_position
			
			// ************** number of point for object **********
				if(count_max>100)
				{
					// count_max too
						//get_count_max[count_object]=count_max;
					max_block[count_object]=count_max;
					
					
					
					// to test xpic1
					/*if(count_object == 2) 
					{
						maxpic1[1]=count_max;
					}*/
					
					count_object++;
					px++;
					py++;
					x_object[count_object]=px;
					y_object[count_object]=py;

				}
				else
				{
					px=x_object[count_object];
					py=y_object[count_object];
				}

		}//if block <> -1

	
	
	
	
	}//for loop 1


 
	// output to image1 dialog	
/*	
		k=newpic1;
		for(j=0;j<hpic;j++)
		{	
			for(i=0;i<wpic;i++)
			{
				dc.SetPixel(i,j,RGB(*k,*k,*k));
				
				k++;
			}
		}

*/
	
// *********************** test ***********************
	
	
	//for (i=0 ;i<4;i++)

		px = x_object[2];
		py = y_object[2];
		{	
			for(j=1;j<max_block[2] ;j++)			
			{
				
				dc.SetPixel(*px,*py,RGB(0,0,0));
				px++;
				py++;
			}
		}

	}	

	
	// Do not call CDialog::OnPaint() for painting messages

}

BOOL CIMAGE1::PreCreateWindow(CREATESTRUCT& cs) 
{
	// TODO: Add your specialized code here and/or call the base class
	// Create a window without min/max buttons or sizable border 
    cs.style = WS_OVERLAPPED | WS_SYSMENU | WS_BORDER;

    // Size the window to 1/3 screen size and center it 
    cs.cy = 300;
    cs.cx = 300;
    cs.y = 10;
    cs.x = 10;

    
	return CDialog::PreCreateWindow(cs);
}
