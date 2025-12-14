// Project1View.cpp : implementation of the CProject1View class
//

#include "stdafx.h"
#include "Project1.h"

#include "Project1Doc.h"
#include "Project1View.h"

#include "DlgEnterClass.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CProject1View

IMPLEMENT_DYNCREATE(CProject1View, CScrollView)

BEGIN_MESSAGE_MAP(CProject1View, CScrollView)
	//{{AFX_MSG_MAP(CProject1View)
	ON_COMMAND(ID_BUTTON_CLASS, OnButtonClass)
	ON_COMMAND(ID_BUTTON_CLEAR, OnButtonClear)
	ON_COMMAND(ID_BUTTON_SAVE, OnButtonSave)
	ON_UPDATE_COMMAND_UI(ID_BUTTON_CLASS, OnUpdateButtonClass)
	ON_UPDATE_COMMAND_UI(ID_BUTTON_CLEAR, OnUpdateButtonClear)
	ON_UPDATE_COMMAND_UI(ID_BUTTON_SAVE, OnUpdateButtonSave)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CProject1View construction/destruction

CProject1View::CProject1View()
{
	// TODO: add construction code here

}

CProject1View::~CProject1View()
{
}

BOOL CProject1View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CScrollView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CProject1View drawing

void CProject1View::OnDraw(CDC* pDC)
{
	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here
	
	CFont fontText;
	CString s;	

	fontText.CreateFont(10,0,0,0,400,false,false,0,
					ANSI_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,
					DEFAULT_QUALITY,DEFAULT_PITCH | FF_SWISS, "Arial");
	pDC	->SelectObject(&fontText);

	if(pDoc->push != PUSH_NULL)
	{	
		pDC->TextOut(55,135,"IMAGE"); 
		pDC->TextOut(165,135,"IMAGE SEGMENTATION"); 
		pDC->TextOut(330,135,"EDGE DETECTION"); 


		if(pDoc->m_pDIB == NULL)
			return;

		if(pDoc->m_pDIB->m_pBMI == NULL)
			return;
		
		::StretchDIBits(pDC->GetSafeHdc(),
			0,
			0,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			0,
			0,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			pDoc->m_pDIB->GetBMBitsPtr(),	
			pDoc->m_pDIB->GetBMHdrPtr(),
			DIB_RGB_COLORS,
			SRCCOPY);

		::StretchDIBits(pDC->GetSafeHdc(),
			150,
			0,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			0,
			0,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			pDoc->SegmentTbl,
			pDoc->m_pDIB->GetBMHdrPtr(),
			DIB_RGB_COLORS,
			SRCCOPY);

		::StretchDIBits(pDC->GetSafeHdc(),
			300,
			0,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			0,
			0,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			pDoc->EdgeTbl,
			pDoc->m_pDIB->GetBMHdrPtr(),
			DIB_RGB_COLORS,
			SRCCOPY);
	}

	BYTE Tbl[PICSIZE];
	
	int sx=170,sy=300;
	int i,j,k,l;
	int Base;


	if(pDoc->push == PUSH_TRAIN) 
	{								

		sizeTotal.cy = 200 + pDoc->NumBasePt*150;		
		SetScrollSizes(MM_TEXT, sizeTotal);
		
		for(i=0;i<pDoc->NumBasePt;i++)
		{						
			Base = pDoc->BasePt[i];
			GetVChainCode();
			CalcVChainRotate(VChainCode[Base].Deg);
			
			memcpy(Tbl,pDoc->EdgeTbl,16384);
			for(l=0;l<5;l++)
			{
				Tbl[(int)VChainCode[Base].Y*128+(int)VChainCode[Base].X+l] = 0;
				Tbl[(int)VChainCode[Base].Y*128+(int)VChainCode[Base].X-l] = 0;
				Tbl[(int)(VChainCode[Base].Y-l)*128+(int)VChainCode[Base].X] = 0;
				Tbl[(int)(VChainCode[Base].Y+l)*128+(int)VChainCode[Base].X] = 0;			
			}

			// Draw Centroid point in EdgeTbl
			for(l=0;l<5;l++)
			{
				Tbl[(int)pDoc->CentroidY*128+(int)pDoc->CentroidX+l] = 0;
				Tbl[(int)pDoc->CentroidY*128+(int)pDoc->CentroidX-l] = 0;
				Tbl[(int)(pDoc->CentroidY-l)*128+(int)pDoc->CentroidX] = 0;
				Tbl[(int)(pDoc->CentroidY+l)*128+(int)pDoc->CentroidX] = 0;
			}

			::StretchDIBits(pDC->GetSafeHdc(),
				0,
				sy-128+i*150,
				pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
				pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
				0,
				0,
				pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
				pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
				Tbl,
				pDoc->m_pDIB->GetBMHdrPtr(),
				DIB_RGB_COLORS,
				SRCCOPY);		

			for(k=0;k<360;k++)
				for(j=0;j<110;j+=10)
					pDC->SetPixel(sx+k,sy-j+i*150,RGB(0,255,255));
	
			for(k=0;k<390;k+=30)
				for(j=0;j<100;j++)
					pDC->SetPixel(sx+k,sy-j+i*150,RGB(0,255,255));
				
			pDC->MoveTo(sx,sy-110+i*150);
			pDC->LineTo(sx,sy+i*150);
			pDC->LineTo(sx+370,sy+i*150);
			
			for(k=0;k<10;k++)
				for(j=10;j<110;j+=10)				
					pDC->SetPixel(sx-k,sy-j+i*150,RGB(0,0,0));

			for(k=30;k<390;k+=30)
				for(j=0;j<5;j++)
					pDC->SetPixel(sx+k,sy+j+i*150,RGB(0,0,0));
				
			
			pDC->TextOut(sx-5,sy-125+i*150,"Radius"); 
			pDC->TextOut(sx+380,sy-5+i*150,"Degree"); 
			int n;
			for(n=0;n<11;n++) 
			{
				s.Format("%1.1lf",(double)n/10);		
				pDC->TextOut(sx-30,sy-n*10-5+i*150,s);	
			}
			
			for(n=0;n<390;n+=30)
			{
				s.Format("%d",n);
				pDC->TextOut(sx+n-5,sy+10+i*150,s);
			}

			for(j=0;j<VNumChainPt;j++)
			{
				pDC->SetPixel(sx + (int) VChainCode[j].Deg,
							  sy - (int) (VChainCode[j].RadNrml*100-i*150),
							  RGB(0,0,0));				
			}

		}

	}

	
	if(pDoc->push == PUSH_CLASS) 
	{

		sizeTotal.cy = 350;		
		SetScrollSizes(MM_TEXT, sizeTotal);

		memcpy(Tbl,pDoc->EdgeTbl,16384);
		GetVChainCode();
		CalcVChainRotate(VChainCode[VMaxRadPt].Deg);
				
		for(i=0;i<5;i++)
		{
			Tbl[(int)VChainCode[VMaxRadPt].Y*128+(int)VChainCode[VMaxRadPt].X+i] = 0;
			Tbl[(int)VChainCode[VMaxRadPt].Y*128+(int)VChainCode[VMaxRadPt].X-i] = 0;
			Tbl[(int)(VChainCode[VMaxRadPt].Y-i)*128+(int)VChainCode[VMaxRadPt].X] = 0;
			Tbl[(int)(VChainCode[VMaxRadPt].Y+i)*128+(int)VChainCode[VMaxRadPt].X] = 0;			
		}

		for(i=0;i<5;i++)
		{
			Tbl[(int)pDoc->CentroidY*128+(int)pDoc->CentroidX+i] = 0;
			Tbl[(int)pDoc->CentroidY*128+(int)pDoc->CentroidX-i] = 0;
			Tbl[(int)(pDoc->CentroidY-i)*128+(int)pDoc->CentroidX] = 0;
			Tbl[(int)(pDoc->CentroidY+i)*128+(int)pDoc->CentroidX] = 0;
		}

		::StretchDIBits(pDC->GetSafeHdc(),
			0,
			sy-128,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			0,
			0,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biWidth,
			pDoc->m_pDIB->m_pBMI->bmiHeader.biHeight,
			Tbl,
			pDoc->m_pDIB->GetBMHdrPtr(),
			DIB_RGB_COLORS,
			SRCCOPY);	
		
		for(i=0;i<360;i++)
			for(j=0;j<110;j+=10)
				pDC->SetPixel(sx+i,sy-j,RGB(0,255,255));
	
		for(i=0;i<390;i+=30)
			for(j=0;j<100;j++)
				pDC->SetPixel(sx+i,sy-j,RGB(0,255,255));
		
		pDC->MoveTo(sx,sy-110);
		pDC->LineTo(sx,sy);
		pDC->LineTo(sx+370,sy);
		
		for(i=0;i<10;i++)
			for(j=10;j<110;j+=10)
				pDC->SetPixel(sx-i,sy-j,RGB(0,0,0));

		for(i=30;i<390;i+=30)
			for(j=0;j<5;j++)
				pDC->SetPixel(sx+i,sy+j,RGB(0,0,0));
			
		
		pDC->TextOut(sx-5,sy-125,"Radius"); 
		pDC->TextOut(sx+380,sy-5,"Degree"); 
		int n;
		for(n=0;n<11;n++) 
		{
			s.Format("%1.1lf",(double)n/10);		
			pDC->TextOut(sx-30,sy-n*10-5,s);	
		}
		
		for(n=0;n<390;n+=30)
		{
			s.Format("%d",n);
			pDC->TextOut(sx+n-5,sy+10,s);
		}

			for(i=0;i<VNumChainPt;i++)
		{
			pDC->SetPixel(sx + (int) VChainCode[i].Deg,
						  sy - (int) (VChainCode[i].RadNrml*100),
						  RGB(0,0,0));				
		}
		
	}
	
	
}

void CProject1View::OnInitialUpdate()
{
	CScrollView::OnInitialUpdate();		
	
	// TODO: calculate the total size of this view
	
	
	sizeTotal.cx = 580;
	sizeTotal.cy = 200;
	
		//GetTotalSize();
	
	SetScrollSizes(MM_TEXT, sizeTotal);
}

/////////////////////////////////////////////////////////////////////////////
// CProject1View diagnostics

#ifdef _DEBUG
void CProject1View::AssertValid() const
{
	CScrollView::AssertValid();
}

void CProject1View::Dump(CDumpContext& dc) const
{
	CScrollView::Dump(dc);
}

CProject1Doc* CProject1View::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CProject1Doc)));
	return (CProject1Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CProject1View message handlers
void CProject1View::GetVChainCode()
{	

	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);	

	int i;
	VNumChainPt = pDoc->NumChainPt;
	VMaxRadPt = pDoc->MaxRadPt;

	for(i=0;i<VNumChainPt;i++)
	{
		VChainCode[i].Deg = pDoc->ChainCode[i].Deg ;
		VChainCode[i].Rad = pDoc->ChainCode[i].Rad;
		VChainCode[i].RadNrml = pDoc->ChainCode[i].RadNrml;
		VChainCode[i].X = pDoc->ChainCode[i].X;
		VChainCode[i].Y = pDoc->ChainCode[i].Y;
	}
}

void CProject1View::CalcVChainRotate(double deg)
{
	int i;		
	for(i=0;i<VNumChainPt;i++)
	{
		VChainCode[i].Deg = VChainCode[i].Deg + 360-deg;
		if(VChainCode[i].Deg>=360)
			VChainCode[i].Deg -= 360;
	}

}

void CProject1View::OnButtonClass() 
{
	// TODO: Add your command handler code here
	
	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);		

	CString ImageName = "";
	
	pDoc->GetTChainCode();
	pDoc->CalcEachPiece(pDoc->TMaxRadPt);
	
	int i,j;

	for(i=0;i<12;i++)
	{
		pDoc->InputLayer.Data[4*i] = pDoc->Piece[i].Area;
		pDoc->InputLayer.Data[4*i+1] = pDoc->Piece[i].Bound;
		pDoc->InputLayer.Data[4*i+2] = pDoc->Piece[i].MaxRad;
		pDoc->InputLayer.Data[4*i+3] = pDoc->Piece[i].MinRad;
	}

	int n=0;
	int found=false;
	double result,Temp=1.0;
	for(i=0;i<pDoc->NumPrototype;i++)
	{
		result = 0;
		for(j=0;j<48;j++)
		{
			result += (pDoc->InputLayer.Data[j]-pDoc->Network[i].Data[j])
					*(pDoc->InputLayer.Data[j]-pDoc->Network[i].Data[j]);
		}

		if(result<pDoc->Network[i].Rad)
		{
			if(ImageName != pDoc->Network[i].Name)
			{
				ImageName = pDoc->Network[i].Name;
				n++;
			}
		}

	}

	pDoc->push = PUSH_CLASS;
	pDoc->UpdateAllViews(NULL);

	CString Str(_T("."));
	if(n==0)
		Str= "Don't know.";
	else if(n==1)
		Str.Format(_T("This image 's class is %s."),ImageName);
	else if(n>1)
		Str = "More than one class are active.";
		
	MessageBox(Str,"Classification");
	
}

void CProject1View::OnButtonClear() 
{
	// TODO: Add your command handler code here
	
	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	if(MessageBox("Do you want to clear network?",NULL,MB_YESNO|MB_ICONEXCLAMATION)!=IDYES) 
		return;
	
	pDoc->push = PUSH_CLEAR;

	int i,j;

	pDoc->InputName ="";
	for(i=0;i<48;i++)
		pDoc->InputLayer.Data[i] = 0;

	for(i=0;i<pDoc->NumPrototype;i++)
	{
		pDoc->Network[i].Name = "";
		pDoc->Network[i].Rad = 0;
		for(j=0;j<48;j++)
			pDoc->Network[i].Data[j] = 0;
	}
	pDoc->NumPrototype = 0;

	pDoc->en_save_m = true;
	pDoc->en_clear = false;

}

void CProject1View::OnButtonSave() 
{
	// TODO: Add your command handler code here
	
	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	if(MessageBox("Do you want to save changes?",NULL,MB_YESNO|MB_ICONEXCLAMATION)!=IDYES) 
		return;

	struct structnode {
		char Name[50];
		double rad;
		double Data[48];
	} var;

	CFile file;	
	if(!file.Open(pDoc->FileName,CFile::modeCreate|CFile::modeWrite|CFile::typeBinary)) 
		return;

	int i,j;
	for(i=0;i<pDoc->NumPrototype;i++)
	{
		for (j=0;j<pDoc->Network[i].Name.GetLength();j++)
			var.Name[j] = (char) pDoc->Network[i].Name.GetAt(j);
		var.Name[j]='\0';

		var.rad=pDoc->Network[i].Rad;
		for(j=0;j<48;j++)
			var.Data[j]=pDoc->Network[i].Data[j];
		file.Write(&var, sizeof(var));
	}

	file.Close();

	pDoc->en_save_m = false;
}

void CProject1View::OnUpdateButtonClass(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	
	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	if(pDoc->en_class)
		pCmdUI->Enable(true);
	else 
		pCmdUI->Enable(false);
}

void CProject1View::OnUpdateButtonClear(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here

	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	if(pDoc->en_clear)
		pCmdUI->Enable(true);
	else 
		pCmdUI->Enable(false);
	
}

void CProject1View::OnUpdateButtonSave(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	
	CProject1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	//if(pDoc->loaded)
	if(pDoc->en_save_l && pDoc->en_save_m)
		pCmdUI->Enable(true);
	else 
		pCmdUI->Enable(false);
}

