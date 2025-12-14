// HISTOGRAM.cpp : implementation file
//

#include "stdafx.h"
#include "Y.h"
#include "HISTOGRAM.h"
#include "math.h"
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CHISTOGRAM dialog


CHISTOGRAM::CHISTOGRAM(CWnd* pParent /*=NULL*/)
	: CDialog(CHISTOGRAM::IDD, pParent)
{
	//{{AFX_DATA_INIT(CHISTOGRAM)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CHISTOGRAM::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CHISTOGRAM)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CHISTOGRAM, CDialog)
	//{{AFX_MSG_MAP(CHISTOGRAM)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CHISTOGRAM message handlers

void CHISTOGRAM::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	
	// TODO: Add your message handler code here
	int i,j;
	
	int color[256];
	int *k;
	k=k1;
	for(j=0;j<hpic;j++)
		{	
			for(i=0;i<wpic;i++)
			{
				if(color[*k]<0)color[*k]=0;
				color[*k]=color[*k]+1;
				k++;
			}		 
		}	
	int max;
	j=0;
	for(i=0;i<256;i++)
	{
		if(j<color[i])
		{
			j=color[i];
			max=i;
		}
	}
	int x,y;
	
	
	x=20;
	y=200;
	dc.MoveTo(x-1,y);
	dc.LineTo(19,20);
	dc.MoveTo(19,201);
	dc.LineTo(275,201);
	dc.MoveTo(x,y);

	for(j=0;j<=255;j++)
	{	
		if(color[j]<=0)
		{
			x++;
			dc.LineTo(x,200);
			dc.MoveTo(x,200);
		}
		else
		{
			y=(int)floor((180*color[j]/color[max]));
			x++;
			dc.LineTo(x,200-y);
			dc.MoveTo(x,200-y);
		}
				
				
				//dc.SetPixel(j+100,300-i,RGB(*k,*k,*k));
				

	}


	// Do not call CDialog::OnPaint() for painting messages
}
