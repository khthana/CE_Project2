// firstView.cpp : implementation of the CFirstView class
//

#include "stdafx.h"
#include "first.h"

#include "dibapi.h"
#include "firstDoc.h"
#include "firstView.h"
#include  <math.h>


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CFirstView

IMPLEMENT_DYNCREATE(CFirstView, CView)

BEGIN_MESSAGE_MAP(CFirstView, CView)
	//{{AFX_MSG_MAP(CFirstView)
	ON_WM_LBUTTONDOWN()
	ON_COMMAND(ID_SELECT_AREA, OnSelectArea)
	ON_WM_MOUSEMOVE()
	ON_WM_LBUTTONUP()
	ON_UPDATE_COMMAND_UI(ID_SELECT_AREA, OnUpdateSelectArea)
	ON_COMMAND(ID_EXECUTE, OnExecute)
	ON_COMMAND(ID_SMOOTH, OnSmooth)
	ON_COMMAND(ID_HIST_EQUA, OnHistEqua)
	ON_COMMAND(ID_SELECTFRAMECOLOR, OnSelectframecolor)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CFirstView construction/destruction

CFirstView::CFirstView()
{
	extern int threshold;
	// TODO: add construction code here
	threshold=0;
}

CFirstView::~CFirstView()
{
}

BOOL CFirstView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CFirstView drawing

void CFirstView::OnDraw(CDC* pDC)
{
	CFirstDoc* pDoc = GetDocument();
	//ASSERT_VALID(pDoc);

	extern BOOL open_list;
	pDC1 = pDC;

	DrawDIB(pDC,pDoc->hDIB,pDoc->pPalDIB);

	// Draw box boundary
	UINT x1 = pDoc->start_point.x;
	UINT y1 = pDoc->start_point.y;
	UINT x2 = pDoc->end_point.x;
	UINT y2 = pDoc->end_point.y;
		
	CBrush brush(boxColor);
	if (pDoc->select)
	{
		pDC->FrameRect(CRect(x1,y1,x2,y2),&brush);
	}

}

/////////////////////////////////////////////////////////////////////////////
// CFirstView diagnostics

#ifdef _DEBUG
void CFirstView::AssertValid() const
{
	CView::AssertValid();
}

void CFirstView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CFirstDoc* CFirstView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CFirstDoc)));
	return (CFirstDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CFirstView message handlers

void CFirstView::DrawDIB(CDC *pDC, HGLOBAL hDIB, CPalette *pPal)

{
	LPVOID	lpDIBBits;		// Pointer to DIB bits
	BOOL	bSuccess=FALSE; 	// Success/fail flag

	BITMAPINFO &bmInfo = *(LPBITMAPINFO)hDIB ;
	int nColors = bmInfo.bmiHeader.biClrUsed ? bmInfo.bmiHeader.biClrUsed : 
						1 << bmInfo.bmiHeader.biBitCount;


	if( bmInfo.bmiHeader.biBitCount > 8 )
		lpDIBBits = (LPVOID)((LPDWORD)(bmInfo.bmiColors +
			bmInfo.bmiHeader.biClrUsed) +
			((bmInfo.bmiHeader.biCompression == BI_BITFIELDS) ? 3 : 0));
	else
		lpDIBBits = (LPVOID)(bmInfo.bmiColors + nColors);
	
	if(pPal && (pDC->GetDeviceCaps(RASTERCAPS) & RC_PALETTE))
	{
		pDC->SelectPalette(pPal, FALSE);
		pDC->RealizePalette();
	}

	::SetDIBitsToDevice(pDC->m_hDC, 				// hDC
				   0,					// DestX
				   0,					// DestY
				   bmInfo.bmiHeader.biWidth,		// nDestWidth
				   bmInfo.bmiHeader.biHeight,		// nDestHeight
				   0,					// SrcX
				   0,					// SrcY
				   0,					// nStartScan
				   bmInfo.bmiHeader.biHeight,		// nNumScans
				   lpDIBBits,				// lpBits
				   (LPBITMAPINFO)hDIB,			// lpBitsInfo
				   DIB_RGB_COLORS); 			// wUsage
	//pDC->TextOut(0, 0, "Hello!");
}

void CFirstView::OnLButtonDown(UINT nFlags, CPoint point) 
{
	CFirstDoc* pDoc = GetDocument();
/*
	pix_color = ::GetPixel(pDoc->hDIB,pDoc->pPalDIB,point.x,point.y);
	char str1[10];
	char str2[10];
	char str3[10];
	wsprintf(str1,"RED = %d",pix_color.rgbRed);
	wsprintf(str2,"GREEN = %d",pix_color.rgbGreen);
	wsprintf(str3,"BLUE = %d",pix_color.rgbBlue);
	AfxMessageBox(str1);
	AfxMessageBox(str2);
	AfxMessageBox(str3);
*/
	CClientDC aDC(this);//1
	OnPrepareDC(&aDC);	//2
	aDC.DPtoLP(&point);	//3
	/////////////////////////////////////////////////////////////
	//dieo modify set capturing mouse message
	/////////////////////////////////////////////////////////////
	SetCapture();
	//end dieo modify

	if (pDoc->hDIB != NULL)
	{	
		pDoc -> start_point = point;
		////////////////////////////////////////////////////////
		// dieo modify set end point  initial start = end point
		////////////////////////////////////////////////////////
		pDoc -> end_point = point;
		// end dieo modify
		Invalidate(false);
	}
	else
		AfxMessageBox("no image");
	CView::OnLButtonDown(nFlags, point);
}


/*int CFirstView::AvgBright(int x1,int x2,int y1,int y2)
{
	CFirstDoc* pDoc = GetDocument();
	int i,j;
	int sum,count,bright;
	count=0;sum=0;
	int Avg=0;
		for (j=y1;j<=y2;j++)
			for (i=x1;i<=x2;i++)
			{	bright=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
				sum=sum+bright;
				count++;
			}
		Avg=sum/count;
		
	return Avg;
}
*/


BOOL CFirstView::WriteDIB(HGLOBAL hDIB)
{
	BITMAPFILEHEADER	hdr;
	LPBITMAPINFOHEADER	lpbi;

	if (!hDIB)
		return FALSE;

	CFile file;
	if( !file.Open("c:\\ja\\Ja_project\\first\\pic\\binary1.bmp",CFile::modeWrite|CFile::modeCreate))
	{
		AfxMessageBox("Can not open file");
		return FALSE;
	}

	lpbi = (LPBITMAPINFOHEADER)hDIB;

	int nColors = 1 << lpbi->biBitCount;

	// Fill in the fields of the file header 
	// type of file must be BM
	hdr.bfType		= ((WORD) ('M' << 8) | 'B');	// is always "BM"
	// size (in bytes) of bitmap file
	hdr.bfSize		= GlobalSize(hDIB) + sizeof(hdr);
	// must be zero
	hdr.bfReserved1 	= 0;
	// must be zero
	hdr.bfReserved2 	= 0;
	// offset from BitmapInfoHeader to bitmap bits
	// lpbi->biSize = size of BitmapInfoHeader
	hdr.bfOffBits		= (DWORD) (sizeof( hdr ) + lpbi->biSize +
						nColors * sizeof(RGBQUAD));

	// Write the file header
	file.Write(&hdr, sizeof(hdr));

	// Write the DIB header and the bits
	file.Write(lpbi,GlobalSize(hDIB));
	file.Close();
	return TRUE;
}


void CFirstView::OnSelectArea() 
{
	CFirstDoc* pDoc = GetDocument();
	if (pDoc->select == false)
		pDoc->select = true;
	else
		pDoc->select = false;
}

void CFirstView::OnMouseMove(UINT nFlags, CPoint point) 
{
	CClientDC aDC(this);
	OnPrepareDC(&aDC);
	CFirstDoc* pDoc = GetDocument();

	if (pDoc->hDIB != NULL)
	{
		// dieo modify (this == GetCapture())
		while (nFlags && (this == GetCapture()))
		{
			int width,height;
			width=pDoc->bmWidth;
			height=pDoc->bmHeight;
			if ((point.x >= width)||(point.y >= height))
			{
				if (point.x >= width)
					point.x = width - 1;
				if (point.y >= height)
					point.y = height - 1;
			}
			aDC.DPtoLP(&point);
			pDoc->end_point = point;
			nFlags = 0;			
			Invalidate(false);
		}
	}
	
	else
		AfxMessageBox("no image");	
	CView::OnMouseMove(nFlags, point);
}

void CFirstView::OnLButtonUp(UINT nFlags, CPoint point) 
{
	if(this == GetCapture())
		ReleaseCapture();	//Stop capturing mouse message	
	CView::OnLButtonUp(nFlags, point);
}

void CFirstView::OnUpdateSelectArea(CCmdUI* pCmdUI) 
{
	CFirstDoc* pDoc = GetDocument();
	pCmdUI->SetCheck(pDoc->select);	
}

void CFirstView::Text_Draw(HGLOBAL hDIB, CPalette *pPal)
{

	pDC1->TextOut(0, 0, "Hello!");

}

void CFirstView::Print_cr(HGLOBAL hDIB) 
{
	CFirstDoc* pDoc = GetDocument();
	RGBQUAD pixColor = {0,0,0,0};
	int i,j,k,temp=0;

	extern int tc,tr[50],u,l,pc[100],ur[50][50],dr[50][50];




for (k=0;k<=tc-1;k++)
{	
	for (i=0;i<=tr[k];i++)
	{
		temp=ur[k][i]+u;
		for (j=l+pc[k];j<l+pc[k+1];j++)
		{
			pixColor.rgbBlue = 255;
			pixColor.rgbGreen = 255;
			pixColor.rgbRed = 255;
			pixColor.rgbReserved = 0;
			SetPixel(pDoc->hDIB,pDoc->pPalDIB,pixColor,j,temp);

		}

		temp=dr[k][i]+u;
		for (j=l+pc[k];j<l+pc[k+1];j++)
		{
			pixColor.rgbBlue = 255;
			pixColor.rgbGreen = 255;
			pixColor.rgbRed = 255;
			pixColor.rgbReserved = 0;
			SetPixel(pDoc->hDIB,pDoc->pPalDIB,pixColor,j,temp);

		}
		

	}

}

}



void CFirstView::Print_col(HGLOBAL hDIB) 
{
	extern int tc,pc[100],d,u,l;
	CFirstDoc* pDoc = GetDocument();
	RGBQUAD pixColor = {0,0,0,0};
	int a=0,b=0,temp1=0;
	for (a=0;a<=tc;a++)
	{
		temp1=pc[a]+l;
		for (b=u;b<=d;b++)
		{
			pixColor.rgbBlue = 255;
			pixColor.rgbGreen = 255;
			pixColor.rgbRed = 255;
			pixColor.rgbReserved = 0;
			SetPixel(pDoc->hDIB,pDoc->pPalDIB,pixColor,temp1,b);

		}
	}

}
	


void CFirstView::OnExecute() 
{
	CFirstDoc* pDoc = GetDocument();

	extern int l,r,u,d,threshold;
	extern int stand[1000][1000],tr[50];
	if (pDoc->select)
	{
		if (pDoc->start_point == pDoc->end_point)
		{
			AfxMessageBox("Please select area before execute");
			return;
		}
	}
	else
	{
		int width,height;
		CPoint point;
		pDoc->start_point.x=0;
		pDoc->start_point.y=0;
		width=pDoc->bmWidth-1;
		point.x=width;
		height=pDoc->bmHeight-1;
		point.y=height;
		pDoc->end_point=point;
	}
	int x1,x2,y1,y2,i1,j1;
	
	for (i1=0;i1<=50;i1++) tr[i1]=0;

	for (i1=0;i1<1000;i1++)
		for (j1=0;j1<1000;j1++)
			stand[i1][j1]=9;


	x1 = pDoc->start_point.x;
	x2 = pDoc->end_point.x;
	y1 = pDoc->start_point.y;
	y2 = pDoc->end_point.y;

	l=x1;
	r=x2;
	u=y1;
	d=y2;

	

	threshold = ::findThreshold(pDoc->hDIB,pDoc->pPalDIB,x1,x2,y1,y2,2,2);
	::Binarization1(pDoc->hDIB,pDoc->pPalDIB,x1,x2,y1,y2);


	Invalidate();

	

	::Find_Col(pDoc->hDIB,pDoc->pPalDIB);
//	::Find_Row();
//	::Total_Row();
//	Print_col(pDoc->hDIB);
	
//	Print_cr(pDoc->hDIB);

	::Initial_stand();	
	::Sub_Exe(pDoc->hDIB,pDoc->pPalDIB);
	Invalidate();
	::Find_Row();

	::Total_Row();

//	Print_col(pDoc-> hDIB);
//	Print_cr(pDoc-> hDIB);


	::Binary_Row(pDoc->hDIB,pDoc->pPalDIB,pDoc->file_name);

	/*BOOL success;
	success = WriteDIB(pDoc->hDIB);
	if (success == false)
		AfxMessageBox("Can not write bitmap");*/
}

void CFirstView::Hist_Equalize(HGLOBAL hDIB)
{
	CFirstDoc* pDoc = GetDocument();
	int x1,x2,y1,y2;
	int color,sum,total;
	int k,i,j,temp1;
	float temp;
	x1 = pDoc->start_point.x;
	x2 = pDoc->end_point.x;
	y1 = pDoc->start_point.y;
	y2 = pDoc->end_point.y;
	total = 0;
	for (k=0;k<256;k++)
		pDoc->hist[k]=0;
	for (j=y1;j<=y2;j++)
	{
		for (i=x1;i<=x2;i++)
		{
			color=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
			pDoc->hist[color] = pDoc->hist[color] + 1;
			total = total+1;
		}
	}
	sum = 0;
	i=k=0;
	for (k=0;k<256;k++)
	{
		sum = 0;
		for (i=0;i<=k;i++)
		{
			sum = sum + pDoc->hist[i];
		}
		sum = sum*255;
		temp = (float)sum/(float)total;
		temp1 = ::round(temp);

		pDoc->new_color[k]=temp1;
	}
	RGBQUAD pixColor = {0,0,0,0};
	for (j=y1;j<=y2;j++)
		for (i=x1;i<=x2;i++)
		{
			color=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
			pixColor.rgbBlue = pDoc->new_color[color];
			pixColor.rgbGreen = pDoc->new_color[color];
			pixColor.rgbRed = pDoc->new_color[color];
			pixColor.rgbReserved = 0;			
			SetPixel(pDoc->hDIB,pDoc->pPalDIB,pixColor,i,j);
		}
}


void CFirstView::OnSmooth() 
{
	CFirstDoc* pDoc = GetDocument();
	int p[9];
	int temp[2][500];
	int i,j,l;
	RGBQUAD pixColor = {0,0,0,0};
	if (pDoc->select)
	{
		if (pDoc->start_point == pDoc->end_point)
		{
			AfxMessageBox("Please select area before execute");
			return;
		}
	}
	else
	{
		int width,height;
		CPoint point;
		pDoc->start_point.x=0;
		pDoc->start_point.y=0;
		width=pDoc->bmWidth-1;
		point.x=width;
		height=pDoc->bmHeight-1;
		point.y=height;
		pDoc->end_point=point;
	}
	int x1,x2,y1,y2;
	x1 = pDoc->start_point.x;
	x2 = pDoc->end_point.x;
	y1 = pDoc->start_point.y;
	y2 = pDoc->end_point.y;

	for (j = y1; j <= y2; j++)
	{	for (i = x1; i <= x2; i++)
		{
			if (i==x1)
			{
				if (j==y1)
				{	
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j+1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j+1).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3])/4;
				}
				else if (j==y2)
				{
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j-1).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j-1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3])/4;
				}
				else
				{	
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j-1).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j-1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j).rgbBlue;
					p[4]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j+1).rgbBlue;
					p[5]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j+1).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3]+p[4]+p[5])/6;
				}
			}
			else if(j==y1)
			{
				if(i==x2)
				{
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j+1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j+1).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3])/4;					
				}
				else
				{
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j+1).rgbBlue;
					p[4]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j+1).rgbBlue;
					p[5]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j+1).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3]+p[4]+p[5])/6;
				}
			}
			else if(i == x2)
			{
				if(j==y2)
				{
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3])/4;					
				}
				else
				{
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j).rgbBlue;
					p[4]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j+1).rgbBlue;
					p[5]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j+1).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3]+p[4]+p[5]);
				}
			}
			else if(j == y2)
			{
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j-1).rgbBlue;
					p[4]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j).rgbBlue;
					p[5]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3]+p[4]+p[5])/6;
			}
			else
			{
					p[0]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j).rgbBlue;
					p[1]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j-1).rgbBlue;
					p[2]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j-1).rgbBlue;
					p[3]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j-1).rgbBlue;
					p[4]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j).rgbBlue;
					p[5]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j).rgbBlue;
					p[6]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i-1,j+1).rgbBlue;
					p[7]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i,j+1).rgbBlue;
					p[8]=::GetPixel(pDoc->hDIB,pDoc->pPalDIB,i+1,j+1).rgbBlue;
					temp[(j-y1)%2][i-x1]=(p[0]+p[1]+p[2]+p[3]+p[4]+p[5]+p[6]+p[7]+p[8])/9;
			}
			int k;
			for (k=0;k<9;k++)
			{
				p[k]=0;
			}
		}
		if (((j-y1)%2) == 1)
		{
			for (l=x1;l<=x2;l++)
			{
				pixColor.rgbBlue = temp[0][l-x1];
				pixColor.rgbGreen = temp[0][l-x1];
				pixColor.rgbRed = temp[0][l-x1];
				pixColor.rgbReserved = 0;
				SetPixel(pDoc->hDIB,pDoc->pPalDIB,pixColor,l,j-1);
			}
		}
		else if(j != y1)
		{
			for (l=x1;l<=x2;l++)
			{
				pixColor.rgbBlue = temp[1][l-x1];
				pixColor.rgbGreen = temp[1][l-x1];
				pixColor.rgbRed = temp[1][l-x1];
				pixColor.rgbReserved = 0;
				SetPixel(pDoc->hDIB,pDoc->pPalDIB,pixColor,l,j-1);
			}
		}
		if (j==y2)
		{
			for (l=x1;l<=x2;l++)
			{
				pixColor.rgbBlue = temp[(j-y1)%2][l-x1];
				pixColor.rgbGreen = temp[(j-y1)%2][l-x1];
				pixColor.rgbRed = temp[(j-y1)%2][l-x1];
				pixColor.rgbReserved = 0;
				SetPixel(pDoc->hDIB,pDoc->pPalDIB,pixColor,l,j);
			}
		}
	}
	Invalidate();
}

void CFirstView::OnHistEqua() 
{
	CFirstDoc* pDoc = GetDocument();
	if (pDoc->select)
	{
		if (pDoc->start_point == pDoc->end_point)
		{
			AfxMessageBox("Please select area before execute");
			return;
		}
	}
	else
	{
		int width,height;
		CPoint point;
		pDoc->start_point.x=0;
		pDoc->start_point.y=0;
		width=pDoc->bmWidth-1;
		point.x=width;
		height=pDoc->bmHeight-1;
		point.y=height;
		pDoc->end_point=point;

	}
	
	Hist_Equalize(pDoc->hDIB);
	Invalidate();
}

void CFirstView::OnSelectframecolor() 
{
	CColorDialog dlgColor(boxColor);
	if (dlgColor.DoModal() == IDOK)
	{
		boxColor = dlgColor.GetColor();
		Invalidate();
	}		
}

