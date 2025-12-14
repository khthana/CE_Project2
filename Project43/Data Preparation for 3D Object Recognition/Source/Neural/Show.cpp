// Show.cpp : implementation file
//

#include "stdafx.h"
#include "Test.h"
#include "Show.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Show dialog


Show::Show(CWnd* pParent /*=NULL*/)
	: CDialog(Show::IDD, pParent)
{
	//{{AFX_DATA_INIT(Show)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	

}


void Show::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Show)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Show, CDialog)
	//{{AFX_MSG_MAP(Show)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Show message handlers

void Show::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	
	// TODO: Add your message handler code here
	unsigned int i,j;
	wpic = 320;
	hpic = 240;
	int *k;
		k=k1;
		for(j=0;j<hpic;j++)
		{	
			for(i=0;i<wpic;i++)
			{
				dc.SetPixel(i,j,RGB(*k,*k,*k));
				
				k++;
			}
		}

	
	// Do not call CDialog::OnPaint() for painting messages
}
