// Edge.cpp : implementation file
//

#include "stdafx.h"
#include "Y.h"
#include "Edge.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// Edge dialog


Edge::Edge(CWnd* pParent /*=NULL*/)
	: CDialog(Edge::IDD, pParent)
{
	//{{AFX_DATA_INIT(Edge)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void Edge::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(Edge)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(Edge, CDialog)
	//{{AFX_MSG_MAP(Edge)
	ON_WM_PAINT()
	ON_COMMAND(ID_IMAGEPROCESSING_SHOWIMAGE, OnImageprocessingShowimage)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// Edge message handlers

void Edge::OnPaint() 
{
	CPaintDC dc(this); // device context for painting
	
	// TODO: Add your message handler code here

  // output to image1 dialog	
	int i,j;
	int *k;
	
	k=newpic1;
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

BOOL Edge::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void Edge::OnImageprocessingShowimage() 
{
	// TODO: Add your command handler code here
	
}
