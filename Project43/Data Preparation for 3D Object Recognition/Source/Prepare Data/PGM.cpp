// PGM.cpp : implementation file
//

#include "stdafx.h"
#include "Y.h"
#include "PGM.h"
#include "YDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// PGM dialog


PGM::PGM(CWnd* pParent /*=NULL*/)
	: CDialog(PGM::IDD, pParent)
{	
	
	//{{AFX_DATA_INIT(PGM)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void PGM::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(PGM)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(PGM, CDialog)
	//{{AFX_MSG_MAP(PGM)
	ON_WM_PAINT()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// PGM message handlers

void PGM::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	
	// TODO: Add your message handler code here


  // output to image1 dialog	
	unsigned int i,j;
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

//	dc.ExtFloodFill( 52, 9, 180, FLOODFILLSURFACE );


	// Do not call CDialog::OnPaint() for painting messages
}


BOOL PGM::OnInitDialog() 
{
	CDialog::OnInitDialog();
//	theApp.D1 = this;	

	// TODO: Add extra initialization here
//	SetWindowPos( &wndTopMost , 100, 100, 320, 240,SWP_SHOWWINDOW );

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
