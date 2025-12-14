// DibV1View.cpp : implementation of the CDibV1View class
//

#include "stdafx.h"
#include "DibV1.h"

#include "DibV1Doc.h"
#include "DibV1View.h"
#include <time.h>
#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDibV1View

IMPLEMENT_DYNCREATE(CDibV1View, CScrollView)

BEGIN_MESSAGE_MAP(CDibV1View, CScrollView)
	//{{AFX_MSG_MAP(CDibV1View)
	ON_COMMAND(ID_FINDSEEDP, OnFindseedp)
	ON_COMMAND(ID_NEXTBLOCK, OnNextblock)
	ON_COMMAND(ID_NEXTBLOCKEND, OnNextblockend)
	ON_COMMAND(ID_COMPLETEALL, OnCompleteall)
	ON_COMMAND(ID_SHOWVIEW_PARAGRAPH1, OnShowviewParagraph1)
	ON_COMMAND(ID_SHOWVIEW_PARAGRAPH2, OnShowviewParagraph2)
	ON_COMMAND(ID_CHARACTERNEXT, OnCharacternext)
	ON_COMMAND(ID_ZOOM_1, OnZoom1)
	ON_COMMAND(ID_ZOOM_2, OnZoom2)
	ON_COMMAND(ID_ZOOM_3, OnZoom3)
	ON_COMMAND(ID_ZOOM_MEDIUM, OnZoomMedium)
	ON_COMMAND(ID_LANGUAGE_ENGLISH, OnLanguageEnglish)
	ON_COMMAND(ID_LANGUAGE_THAI, OnLanguageThai)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDibV1View construction/destruction

CDibV1View::CDibV1View()
{
	// TODO: add construction code here
	BlockWidth = 16; //Can be 32,16,8,4,2,1
	BlockHeight = 32;
	Threshold = (int)(BlockHeight*BlockWidth*0.01);
	DoBlockMark = false;
	BitPixelNew = false;
	Block1New = false;
	AddonPixelNew = false;
	ParagraphNew = false;
	BitPixelParagraphNew = false;
	ViewSolution = 1;
	language = 1;
	
}

CDibV1View::~CDibV1View()
{
	if (BitPixelNew)	{delete[] BitPixel;}
	if (Block1New) {delete[] Block1;}
	if (AddonPixelNew) {delete[] AddonPixel;}
	if (ParagraphNew) {delete[] Paragraph;}
	if (BitPixelParagraphNew)	{delete[] BitPixelParagraph;}
}

BOOL CDibV1View::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CScrollView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CDibV1View drawing

void CDibV1View::OnDraw(CDC* pDC)
{
	CDibV1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here

	if (pDoc->ST_PictureIN)
	{
		HDC     hdc = pDC->GetSafeHdc();
        StretchDIBits( hdc,
                       0,
                       0,
                       pDoc->bmInfoHeader.biWidth/ViewSolution,
                       pDoc->bmInfoHeader.biHeight/ViewSolution,
                       0,
                       0,
                       pDoc->bmInfoHeader.biWidth,
                       pDoc->bmInfoHeader.biHeight,
                       pDoc->bmPixel,
                       pDoc->bmInfo,
                       DIB_RGB_COLORS,
                       SRCCOPY );
	CSize sizeTotal;
	sizeTotal.cx = pDoc->bmInfoHeader.biWidth/ViewSolution;
	sizeTotal.cy = pDoc->bmInfoHeader.biHeight/ViewSolution;
	SetScrollSizes(MM_TEXT, sizeTotal);
	}
}

void CDibV1View::OnInitialUpdate()
{
	CScrollView::OnInitialUpdate();

	CSize sizeTotal;
	// TODO: calculate the total size of this view
	sizeTotal.cx = sizeTotal.cy = 100;
	SetScrollSizes(MM_TEXT, sizeTotal);
}

/////////////////////////////////////////////////////////////////////////////
// CDibV1View diagnostics

#ifdef _DEBUG
void CDibV1View::AssertValid() const
{
	CScrollView::AssertValid();
}

void CDibV1View::Dump(CDumpContext& dc) const
{
	CScrollView::Dump(dc);
}

CDibV1Doc* CDibV1View::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CDibV1Doc)));
	return (CDibV1Doc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CDibV1View message handlers

void CDibV1View::OnFindseedp() 
{
	CDibV1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: Add your command handler code here
	if (pDoc->NewPic)
	{
		// ClearVariable
		if (BitPixelNew) {delete[] BitPixel; BitPixelNew = false;}
		if (AddonPixelNew) {delete[] AddonPixel;AddonPixelNew = false;}
		//if (Block1New) { delete[] Block1; Block1New = false;}
		// Block have error when delete
		if (ParagraphNew) {delete[] Paragraph;ParagraphNew = false;}
		if (BitPixelParagraphNew) {delete[] BitPixelParagraph;BitPixelParagraphNew = false;}

		// Initial Variable
		Paragraph = new CParagraph[100];
		ParagraphNew = true;
		PointerBlockFindSeed =0;
		PointerPixelFindSeedx =0;
		PointerPixelFindSeedy =0;
		PointerPixelx =0;
		PointerPixely =0;
		ParagraphCount=0;
		pDoc->NewPic = false;
		DoBlockMark = false;

		// PrepareFindSeed
		Preparebitformat();
		GenBlock();
	}
	else if (DoBlockMark)
	{
		PttoListSubP = NULL;
		ParagraphBlockMark(ParagraphCount-1);
	}
	FindParagraphSeed();
	WriteBlock(PointerBlock);
	BittobmPixel(2);
	Invalidate();
	
}

void CDibV1View::Preparebitformat()
{
	CDibV1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	PicWidth = ((long)pDoc->bmInfoHeader.biWidth/32)*32;
	PicHeight = ((long)pDoc->bmInfoHeader.biHeight/BlockHeight)*BlockHeight;
	long Widthfull;
	if ((pDoc->bmInfoHeader.biWidth%32)==0)
	{
		Widthfull = pDoc->bmInfoHeader.biWidth;
	}
	else
	{
		Widthfull = (((long)pDoc->bmInfoHeader.biWidth/32)+1)*32;
	}

	BitPixel = new BYTE[PicWidth*PicHeight];
	BitPixelNew = true;
	BitPixelParagraph = new BYTE[PicWidth*PicHeight];
	BitPixelParagraphNew = true;
	long x,y,z;
	for(y=0;y<PicHeight;y++)
	{
		for(x=0;x<PicWidth/8;x++)
		{
			z= (pDoc->bmInfoHeader.biHeight-y-1)*(Widthfull/8)+x;
			if(pDoc->bmPixel[z]&128){BitPixel[y*PicWidth+(x*8)] = 1;}
			else {BitPixel[y*PicWidth+(x*8)] = 0;}
			if(pDoc->bmPixel[z]&64){BitPixel[y*PicWidth+(x*8)+1] = 1;}
			else {BitPixel[y*PicWidth+(x*8)+1] = 0;}
			if(pDoc->bmPixel[z]&32){BitPixel[y*PicWidth+(x*8)+2] = 1;}
			else {BitPixel[y*PicWidth+(x*8)+2] = 0;}
			if(pDoc->bmPixel[z]&16){BitPixel[y*PicWidth+(x*8)+3] = 1;}
			else {BitPixel[y*PicWidth+(x*8)+3] = 0;}
			if(pDoc->bmPixel[z]&8){BitPixel[y*PicWidth+(x*8)+4] = 1;}
			else {BitPixel[y*PicWidth+(x*8)+4] = 0;}
			if(pDoc->bmPixel[z]&4){BitPixel[y*PicWidth+(x*8)+5] = 1;}
			else {BitPixel[y*PicWidth+(x*8)+5] = 0;}
			if(pDoc->bmPixel[z]&2){BitPixel[y*PicWidth+(x*8)+6] = 1;}
			else {BitPixel[y*PicWidth+(x*8)+6] = 0;}
			if(pDoc->bmPixel[z]&1){BitPixel[y*PicWidth+(x*8)+7] = 1;}
			else {BitPixel[y*PicWidth+(x*8)+7] = 0;}

			// Tell Which Bit is Which Paragraph
			BitPixelParagraph[y*PicWidth+(x*8)] = 255;
			BitPixelParagraph[y*PicWidth+(x*8)+1] = 255;
			BitPixelParagraph[y*PicWidth+(x*8)+2] = 255;
			BitPixelParagraph[y*PicWidth+(x*8)+3] = 255;
			BitPixelParagraph[y*PicWidth+(x*8)+4] = 255;
			BitPixelParagraph[y*PicWidth+(x*8)+5] = 255;
			BitPixelParagraph[y*PicWidth+(x*8)+6] = 255;
			BitPixelParagraph[y*PicWidth+(x*8)+7] = 255;
		}
	}
}

void CDibV1View::GenBlock()
{
	Block1 = new Block[(PicHeight/BlockHeight)*(PicWidth/BlockWidth)-1];
	Block1New = true;
	long x,y;
	for(y=0;y<PicHeight/BlockHeight;y++)
	{
		for(x=0;x<PicWidth/BlockWidth;x++)
		{
			Block1[y*(PicWidth/BlockWidth)+x].x = x*BlockWidth;
			Block1[y*(PicWidth/BlockWidth)+x].y = y*BlockHeight;
			Block1[y*(PicWidth/BlockWidth)+x].Checked = false;
			Block1[y*(PicWidth/BlockWidth)+x].count = -1;
		}
	}

	AddonPixel = new BYTE[PicHeight*PicWidth];
	AddonPixelNew = true;
	long PicSize=PicHeight*PicWidth;
	for(x=0;x<PicSize;x++)
	{
		AddonPixel[x]=0;
	}
}

BOOLEAN CDibV1View::FindParagraphSeed()
{

	long PointBlock = PointerBlockFindSeed;
	long Count=0;
	int i,j;
	while( (PointBlock<(PicHeight/BlockHeight)*(PicWidth/BlockWidth)) && (Count<Threshold) )
	{
		if(Block1[PointBlock].Checked == false)
		{
			Count=0;
			Block1[PointBlock].Checked = true;
			for(j=0;j<BlockHeight;j++)
			{
				for(i=0;i<BlockWidth;i++)
				{
					if (BitPixel[((Block1[PointBlock].y+j)*PicWidth+(Block1[PointBlock].x+i))])
					{
						Count++;
					}
					if (Count> Threshold) {break;}
				}
				if (Count> Threshold) {break;}
			}
			Block1[PointBlock].count = Count;
			if (Count<Threshold) {PointBlock++;}
		}
		else
		{
			PointBlock++;
		}	
	}
	if ((Count>=Threshold) && (PointBlock<(PicHeight/BlockHeight)*(PicWidth/BlockWidth)))
	{
		PttoListOrder = new LinkList;
		PttoListOrder->BlockPositionY = (int)(PointBlock/(PicWidth/BlockWidth));
		PttoListOrder->BlockPositionX = PointBlock - (PttoListOrder->BlockPositionY*(PicWidth/BlockWidth));
		PttoListOrder->direction = 'L';
		PttoListOrder->NextLinkList = NULL;
		Paragraph[ParagraphCount].HeadOrder = PttoListOrder;
		
		PttoList = new LinkList;
		PttoList->BlockPositionY = (int)(PointBlock/(PicWidth/BlockWidth));
		PttoList->BlockPositionX = PointBlock - (PttoList->BlockPositionY*(PicWidth/BlockWidth));
		PttoList->direction = 'L';
		PttoList->NextLinkList = NULL;
		Paragraph[ParagraphCount].HeadPosition = PttoList;

		Paragraph[ParagraphCount].Left = PttoList->BlockPositionX;
		Paragraph[ParagraphCount].Right = PttoList->BlockPositionX;
		Paragraph[ParagraphCount].Top = PttoList->BlockPositionY;
		Paragraph[ParagraphCount].Bottom = PttoList->BlockPositionY;
		ParagraphCount++;
		//Seed = PointBlock;
		PointerBlock = PointBlock;
		PointerBlockFindSeed = PointBlock;
		directionbegin =0;
		return true;
	}
	return false;
}

void CDibV1View::WriteBlock(long BlockIndex)
{
	long i,j;
	for(j=0;j<BlockHeight;j++)
	{
		for(i=0;i<BlockWidth;i++)
		{
			if (i==0 || i==(BlockWidth-1) || j==0 || j==(BlockHeight-1))
			{
				AddonPixel[((Block1[BlockIndex].y+j)*PicWidth+(Block1[BlockIndex].x+i))] =1;
			}
		}
	}
	
}

void CDibV1View::BittobmPixel(int Option)
{
	CDibV1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	long Widthfull;
	if ((pDoc->bmInfoHeader.biWidth%32)==0)
	{
		Widthfull = pDoc->bmInfoHeader.biWidth;
	}
	else
	{
		Widthfull = (((long)pDoc->bmInfoHeader.biWidth/32)+1)*32;
	}

	long x,y,z1;
	if (Option ==1){
		for(y=0;y<PicHeight;y++)
		{
			for(x=0;x<PicWidth/8;x++)
			{
				z1= (pDoc->bmInfoHeader.biHeight-y-1)*(Widthfull/8)+x;
				pDoc->bmPixel[z1]=BitPixel[y*PicWidth+(x*8)]*128
								+BitPixel[y*PicWidth+(x*8)+1]*64
								+BitPixel[y*PicWidth+(x*8)+2]*32
								+BitPixel[y*PicWidth+(x*8)+3]*16
								+BitPixel[y*PicWidth+(x*8)+4]*8
								+BitPixel[y*PicWidth+(x*8)+5]*4
								+BitPixel[y*PicWidth+(x*8)+6]*2
								+BitPixel[y*PicWidth+(x*8)+7];
					
			}
		}
	}
	else if (Option ==2){
		for(y=0;y<PicHeight;y++)
		{
			for(x=0;x<PicWidth/8;x++)
			{
				z1= (pDoc->bmInfoHeader.biHeight-y-1)*(Widthfull/8)+x;
				pDoc->bmPixel[z1]=(BitPixel[y*PicWidth+(x*8)]|AddonPixel[y*PicWidth+(x*8)]) *128
								+(BitPixel[y*PicWidth+(x*8)+1]|AddonPixel[y*PicWidth+(x*8)+1])*64
								+(BitPixel[y*PicWidth+(x*8)+2]|AddonPixel[y*PicWidth+(x*8)+2])*32
								+(BitPixel[y*PicWidth+(x*8)+3]|AddonPixel[y*PicWidth+(x*8)+3])*16
								+(BitPixel[y*PicWidth+(x*8)+4]|AddonPixel[y*PicWidth+(x*8)+4])*8
								+(BitPixel[y*PicWidth+(x*8)+5]|AddonPixel[y*PicWidth+(x*8)+5])*4
								+(BitPixel[y*PicWidth+(x*8)+6]|AddonPixel[y*PicWidth+(x*8)+6])*2
								+BitPixel[y*PicWidth+(x*8)+7]|AddonPixel[y*PicWidth+(x*8)+7];
					
			}
		}
	}
}

void CDibV1View::OnNextblock() 
{
	// TODO: Add your command handler code here
	/*
	long PicSize=PicHeight*PicWidth;
	for(long x=0;x<PicSize;x++)
	{
		AddonPixel[x]=0;
	}
	*/
	if(FindNextBlock(directionbegin))
	{
		DoBlockMark = true;
	}
	WriteBlock(PointerBlock);
	BittobmPixel(2);
	Invalidate();
}

BOOLEAN CDibV1View::FindNextBlock(int directionb)
{
	long begindirection = directionb;
	long rundirection = begindirection;
	int directionmove;
	int Count = -1;
	long PointBlock;
	int Blocky = (int)(PointerBlock/(PicWidth/BlockWidth));
	int Blockx = PointerBlock-(Blocky*(PicWidth/BlockWidth));

	do
	{
		switch (rundirection)
		{
		case 0:
			PointBlock = ((Blocky-1)*(PicWidth/BlockWidth))+Blockx;
			directionbegin = 5;
			directionmove = 0;
			if (PointBlock<0) {break;}
			if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
			{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		case 1:
			PointBlock = ((Blocky-1)*(PicWidth/BlockWidth))+Blockx+1;
			directionbegin = 6;
			directionmove = 1;
			if (PointBlock<0) {break;}
				if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
				{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		case 2:
			PointBlock = ((Blocky)*(PicWidth/BlockWidth))+Blockx+1;
			directionbegin = 7;
			directionmove = 2;
			if (PointBlock<0) {break;}
			if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
			{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		case 3:
			PointBlock = ((Blocky+1)*(PicWidth/BlockWidth))+Blockx+1;
			directionbegin = 0;
			directionmove = 3;
			if (PointBlock<0) {break;}
			if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
			{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		case 4:
			PointBlock = ((Blocky+1)*(PicWidth/BlockWidth))+Blockx;
			directionbegin = 1;
			directionmove = 4;
			if (PointBlock<0) {break;}
			if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
			{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		case 5:
			PointBlock = ((Blocky+1)*(PicWidth/BlockWidth))+Blockx-1;
			directionbegin = 2;
			directionmove = 5;
			if (PointBlock<0) {break;}
			if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
			{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		case 6:
			PointBlock = ((Blocky)*(PicWidth/BlockWidth))+Blockx-1;
			directionbegin = 3;
			directionmove = 6;
			if (PointBlock<0) {break;}
			if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
			{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		case 7 :
			PointBlock = ((Blocky-1)*(PicWidth/BlockWidth))+Blockx-1;
			directionbegin = 4;
			directionmove = 7;
			if (PointBlock<0) {break;}
			if (PointBlock<(PicWidth/BlockWidth)*(PicHeight/BlockHeight))
			{
				if (Block1[PointBlock].Checked == false)
				{
					Count=CountPointinBlock(PointBlock);
				}
				else
				{
					Count=Block1[PointBlock].count;
				}
			}
			break;
		}
		rundirection++;
		if (rundirection==8) {rundirection=0;}
	}while((PointBlock!=PointerBlockFindSeed) && (rundirection != begindirection) && (Count<Threshold));
	
	if (PointBlock!=PointerBlockFindSeed)
	{
		if(Count>=Threshold)
		{
			Paragraph[ParagraphCount-1].NumberofBlockround++;
			PointerBlock = PointBlock;
			LinkList* NewLinkList = new LinkList;
			
			NewLinkList->BlockPositionY = (int)(PointBlock/(PicWidth/BlockWidth));
			NewLinkList->BlockPositionX = PointBlock - (NewLinkList->BlockPositionY*(PicWidth/BlockWidth));
			if (NewLinkList->BlockPositionX < Paragraph[ParagraphCount-1].Left) 
			{
				Paragraph[ParagraphCount-1].Left = NewLinkList->BlockPositionX;
			}
			if (NewLinkList->BlockPositionX > Paragraph[ParagraphCount-1].Right) 
			{
				Paragraph[ParagraphCount-1].Right = NewLinkList->BlockPositionX;
			}
			if (NewLinkList->BlockPositionY < Paragraph[ParagraphCount-1].Top) 
			{
				Paragraph[ParagraphCount-1].Top = NewLinkList->BlockPositionY;
			}
			if (NewLinkList->BlockPositionY > Paragraph[ParagraphCount-1].Bottom) 
			{
				Paragraph[ParagraphCount-1].Bottom = NewLinkList->BlockPositionY;
			}
			switch (directionmove)
			{
			case 0 :
				NewLinkList->direction = 'L';
				break;
			case 1 :
				NewLinkList->direction = 'L';
				PttoListOrder->direction = 'L';
				PttoList->direction = 'L';
				break;
			case 2 :
				NewLinkList->direction = 'T';
				break;
			case 3 :
				NewLinkList->direction = 'R';
				if (PttoListOrder->direction != 'L')
				{
					PttoListOrder->direction = 'R';
					PttoList->direction = 'R';
				}
				break;
			case 4 :
				NewLinkList->direction = 'R';
				break;
			case 5 :
				NewLinkList->direction = 'R';
				if (PttoListOrder->direction != 'L')
				{
					PttoListOrder->direction = 'R';
					PttoList->direction = 'R';
				}
				break;
			case 6 :
				NewLinkList->direction = 'B';
				break;
			case 7 :
				NewLinkList->direction = 'L';
				PttoListOrder->direction = 'L';
				PttoList->direction = 'L';
				break;
			}
			NewLinkList->NextLinkList = NULL;

			LinkList *PtLinkList;
			LinkList *PtLinkListOld;
			LinkList *NewCopyBlock;

			NewCopyBlock = new LinkList;
			NewCopyBlock->BlockPositionX = NewLinkList->BlockPositionX;
			NewCopyBlock->BlockPositionY = NewLinkList->BlockPositionY;
			NewCopyBlock->direction = NewLinkList->direction;
			NewCopyBlock->NextLinkList = NULL;
			
			PtLinkList = Paragraph[ParagraphCount-1].HeadOrder;
			PtLinkListOld = NULL;
			while((PtLinkList != NULL) && PtLinkList->BlockPositionX<NewLinkList->BlockPositionX)
			{
				PtLinkListOld = PtLinkList;
				PtLinkList = PtLinkList->NextLinkList;
			}
			if (PtLinkList == NULL)
			{
				// Add tail of List
				PtLinkList = NewCopyBlock;
				PtLinkListOld->NextLinkList = PtLinkList;
			}
			else if(PtLinkListOld == NULL)
			{
				NewCopyBlock->NextLinkList = Paragraph[ParagraphCount-1].HeadOrder;
				Paragraph[ParagraphCount-1].HeadOrder = NewCopyBlock;
			}
			else if(PtLinkList->BlockPositionX>NewLinkList->BlockPositionX)
			{
				// Add in List
				NewCopyBlock->NextLinkList = PtLinkList;
				PtLinkListOld->NextLinkList = NewCopyBlock;
			}
			else if(PtLinkList->BlockPositionX=NewLinkList->BlockPositionX)
			{
				// Add in List
				if(NewLinkList->direction == 'L')
				{
					// Add before
					NewCopyBlock->NextLinkList = PtLinkList;
					PtLinkListOld->NextLinkList = NewCopyBlock;
				}
				else if(NewLinkList->direction == 'R')
				{
					// Add Back
					NewCopyBlock->NextLinkList = PtLinkList->NextLinkList;
					PtLinkList->NextLinkList = NewCopyBlock;					
				}
				else
				{
					// Add before
					NewCopyBlock->NextLinkList = PtLinkList;
					PtLinkListOld->NextLinkList = NewCopyBlock;
				}
			}
			else
			{
				AfxMessageBox("PtLinkList Else");
			}

			PttoListOrder = NewCopyBlock;

			PttoList->NextLinkList = NewLinkList;
			PttoList = NewLinkList;
		}
		else if (rundirection == begindirection) {return false;}
	}
	else {return false;}

	return true;
}

int CDibV1View::CountPointinBlock(long BlockPoint)
{
	int Count=0;
	int i,j;
	Block1[BlockPoint].Checked = true;
	for(j=0;j<BlockHeight;j++)
	{
		for(i=0;i<BlockWidth;i++)
		{
			if (BitPixel[((Block1[BlockPoint].y+j)*PicWidth+(Block1[BlockPoint].x+i))])
			{
				Count++;
			}
			if (Count> Threshold) {break;}
		}
		if (Count> Threshold) {break;}
	}
	Block1[BlockPoint].count = Count;
	return Count;
}


void CDibV1View::OnNextblockend() 
{
	// TODO: Add your command handler code here
	while(FindNextBlock(directionbegin))
	{
		WriteBlock(PointerBlock);
	}
	DoBlockMark = true;
	BittobmPixel(2);
	Invalidate();	
}

void CDibV1View::ParagraphBlockMark(int ParagraphIndex)
{
	LinkList *PtLinkList;
	LinkList *BlockCopy;
	LinkList *Ptfordelete;

	int LinkListPointerSize = PicHeight/BlockHeight;
	LinkListPointer* ptemp= new LinkListPointer[LinkListPointerSize];
	Paragraph[ParagraphIndex].LineList = ptemp;
	PtLinkList = Paragraph[ParagraphIndex].HeadOrder;	

	do
	{
		BlockCopy = new LinkList;
		BlockCopy->BlockPositionX = PtLinkList->BlockPositionX;
		BlockCopy->BlockPositionY = PtLinkList->BlockPositionY;
		BlockCopy->direction = PtLinkList->direction;
		BlockCopy->NextLinkList = NULL;

		if (Paragraph[ParagraphIndex].LineList[BlockCopy->BlockPositionY].Head == NULL)
		{
			Paragraph[ParagraphIndex].LineList[BlockCopy->BlockPositionY].Head = BlockCopy;
			Paragraph[ParagraphIndex].LineList[BlockCopy->BlockPositionY].Tail = BlockCopy;
		}
		else 
		{
			Paragraph[ParagraphIndex].LineList[BlockCopy->BlockPositionY].Tail->NextLinkList = BlockCopy;
			Paragraph[ParagraphIndex].LineList[BlockCopy->BlockPositionY].Tail = BlockCopy;
		}
		Paragraph[ParagraphIndex].LineList[BlockCopy->BlockPositionY].ListSize++;
		Ptfordelete = PtLinkList;
		PtLinkList = PtLinkList->NextLinkList;
		Ptfordelete->NextLinkList=NULL;
		// Delete Line of order
		delete Ptfordelete;
	}while(PtLinkList != NULL);
	
	int i,j,m;
	LinkList *PtLineList;
	LinkList *PtLineListOld;

	for(j=0;j<(PicHeight/BlockHeight);j++)
	{
		PtLineList = Paragraph[ParagraphIndex].LineList[j].Head;
		PtLineListOld = NULL; // Save 'L' direction LeftSide

		// Check SubParagraph
		LinkListSubParagraph* PtNewSubP;
		long blockindex;
		if (Paragraph[ParagraphIndex].LineList[j].ListSize>4)
		{
			if (PtLineList->BlockPositionX>Paragraph[ParagraphIndex].Left+3)
			{
				PtNewSubP = new LinkListSubParagraph;
				blockindex = PtLineList->BlockPositionY*(PicWidth/BlockWidth)+PtLineList->BlockPositionX;
				PtNewSubP->picrow = Block1[blockindex].y;
				PtNewSubP->blockrow = PtLineList->BlockPositionY;
				if (PttoListSubP == NULL)
				{
					Paragraph[ParagraphIndex].HeadSubParagraph = PtNewSubP;
					PttoListSubP = PtNewSubP;
				}
				else
				{
					PttoListSubP->NextSubParagraph = PtNewSubP;
					PttoListSubP= PttoListSubP->NextSubParagraph;
				}

			}
		}


		i=0;
		while(i<Paragraph[ParagraphIndex].LineList[j].ListSize)
		{
			if (PtLineList->direction == 'L') 
			{
				if (PtLineListOld != NULL)
				{
					for(m=PtLineListOld->BlockPositionX;m<=PtLineList->BlockPositionX;m++)
					{
						Block1[j*(PicWidth/BlockWidth)+m].Checked = true;
						BlocktoBitSetParagraph(j*(PicWidth/BlockWidth)+m,ParagraphIndex);
					}
				}
				else
				{
					// Mark Paragraph Bit not depend on PtLineListOld
					m = PtLineList->BlockPositionX;
					BlocktoBitSetParagraph(j*(PicWidth/BlockWidth)+m,ParagraphIndex);
				}
					PtLineListOld = PtLineList;
				
			}
			else if (PtLineList->direction == 'R') 
			{
				if (PtLineListOld != NULL)
				{
					for(m=PtLineListOld->BlockPositionX;m<=PtLineList->BlockPositionX;m++)
					{
						Block1[j*(PicWidth/BlockWidth)+m].Checked = true;
						BlocktoBitSetParagraph(j*(PicWidth/BlockWidth)+m,ParagraphIndex);
					}
					PtLineListOld = NULL;
				}
				else
				{
					// Mark Paragraph Bit not depend on PtLineListOld
					m = PtLineList->BlockPositionX;
					BlocktoBitSetParagraph(j*(PicWidth/BlockWidth)+m,ParagraphIndex);
				}
			}
			else
			{
				// Others Except direction L or R
				m=PtLineList->BlockPositionX;
				BlocktoBitSetParagraph(j*(PicWidth/BlockWidth)+m,ParagraphIndex);
			}
			PtLineList=PtLineList->NextLinkList;
			i++;
		}
		// Clear LineList[j]
		LinkList *PtLineListO = Paragraph[ParagraphIndex].LineList[j].Head;
		LinkList *PtLineListN;

		if (PtLineListO == NULL) {
			PtLineListN = NULL;	
		}
		else{
			PtLineListN = PtLineListO->NextLinkList;
		}
		
		while(PtLineListO >0)
		{
			delete PtLineListO;
			PtLineListO = PtLineListN;
			if (PtLineListN != NULL) {PtLineListN = PtLineListN->NextLinkList;}
		}
	}
	// Clear LineList
	delete[] Paragraph[ParagraphIndex].LineList;
	

}

void CDibV1View::OnCompleteall() 
{
	clock_t start,finish;
	start=clock();
	CDibV1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: Add your command handler code here
	if (pDoc->NewPic)
	{
		// ClearVariable
		if (BitPixelNew) {delete[] BitPixel; BitPixelNew = false;}
		if (AddonPixelNew) {delete[] AddonPixel;AddonPixelNew = false;}
		//if (Block1New) { delete[] Block1; Block1New = false;}
		// Block have error when delete
		if (ParagraphNew) {delete[] Paragraph;ParagraphNew = false;}
		if (BitPixelParagraphNew) {delete[] BitPixelParagraph;BitPixelParagraphNew = false;}

		// Initial Variable
		Paragraph = new CParagraph[100];
		PointerBlockFindSeed =0;
		ParagraphCount=0;
		pDoc->NewPic = false;
		DoBlockMark = false;

		// PrepareFindSeed
		Preparebitformat();
		GenBlock();
	}

	
	
	while(FindParagraphSeed())
	{
		directionbegin = 0;
		WriteBlock(PointerBlock);

		while(FindNextBlock(directionbegin))
		{
			WriteBlock(PointerBlock);
		}
		PttoListSubP = NULL;
		ParagraphBlockMark(ParagraphCount-1);	
	}

	BittobmPixel(2);
	finish=clock();
	CString bufferx;
	bufferx.Format("Time used %f sec.",(double)(finish-start)/CLOCKS_PER_SEC);
	AfxMessageBox(bufferx);
	Invalidate();
}

void CDibV1View::BlocktoBitSetParagraph(int BlockPoint,int Paragraph)
{
	int i,j;
	for(j=0;j<BlockHeight;j++)
	{
		for(i=0;i<BlockWidth;i++)
		{
			BitPixelParagraph[((Block1[BlockPoint].y+j)*PicWidth+(Block1[BlockPoint].x+i))] = Paragraph;
		}
	}
}

void CDibV1View::OnShowviewParagraph1() 
{
	// TODO: Add your command handler code here
	CDibV1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	long Widthfull;
	if ((pDoc->bmInfoHeader.biWidth%32)==0)
	{
		Widthfull = pDoc->bmInfoHeader.biWidth;
	}
	else
	{
		Widthfull = (((long)pDoc->bmInfoHeader.biWidth/32)+1)*32;
	}
	long x,y,z1;

	for(y=0;y<PicHeight;y++)
	{
		for(x=0;x<PicWidth/8;x++)
		{
			z1= (pDoc->bmInfoHeader.biHeight-y-1)*(Widthfull/8)+x;
			pDoc->bmPixel[z1]=0;
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=128;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+64;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+32;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+16;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+8;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+4;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+2;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==0){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+1;}

						//	+BitPixelParagraph[y*PicWidth+(x*8)+1]*64
						//	+BitPixelParagraph[y*PicWidth+(x*8)+2]*32
						//	+BitPixelParagraph[y*PicWidth+(x*8)+3]*16
						//	+BitPixelParagraph[y*PicWidth+(x*8)+4]*8
						//	+BitPixelParagraph[y*PicWidth+(x*8)+6]*2
						//	+BitPixelParagraph[y*PicWidth+(x*8)+7];
		}
	}
	
	Invalidate();
}

void CDibV1View::OnShowviewParagraph2() 
{
	// TODO: Add your command handler code here
	CDibV1Doc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);

	long Widthfull;
	if ((pDoc->bmInfoHeader.biWidth%32)==0)
	{
		Widthfull = pDoc->bmInfoHeader.biWidth;
	}
	else
	{
		Widthfull = (((long)pDoc->bmInfoHeader.biWidth/32)+1)*32;
	}

	long x,y,z1;

	for(y=0;y<PicHeight;y++)
	{
		for(x=0;x<PicWidth/8;x++)
		{
			z1= (pDoc->bmInfoHeader.biHeight-y-1)*(Widthfull/8)+x;
			pDoc->bmPixel[z1]=0;
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=128;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+64;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+32;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+16;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+8;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+4;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+2;}
			if (BitPixelParagraph[y*PicWidth+(x*8)]==1){pDoc->bmPixel[z1]=pDoc->bmPixel[z1]+1;}
		}
	}
	
	Invalidate();
	
}

BOOLEAN CDibV1View::FindCharacterSeed(int ParagraphIndex)
{
	// Must Set PointerPixelFindSeedx,PointerPixelFindSeedy and  PttoListChar
	// Before Use this function
	long BlockPosLT;
	long BlockPosRB;
	BOOLEAN SetFirstTime = true;
	
	int i,j;
	BlockPosLT = Paragraph[ParagraphIndex].Top*(PicWidth/BlockWidth)+Paragraph[ParagraphIndex].Left;
	BlockPosRB = Paragraph[ParagraphIndex].Bottom*(PicWidth/BlockWidth)+Paragraph[ParagraphIndex].Right;

	// increase Seed Pixel by one
	if (PointerPixelFindSeedx<Block1[BlockPosRB].x+BlockWidth-1)
	{
		PointerPixelFindSeedx++;
	}
	else
	{
		PointerPixelFindSeedx = Block1[BlockPosLT].x;
		PointerPixelFindSeedy++;
	}

	j= PointerPixelFindSeedy;
	while (j<Block1[BlockPosRB].y+BlockHeight)
	{
		if (SetFirstTime) 
		{
			i= PointerPixelFindSeedx;
			SetFirstTime = false;
		}
		else {i= Block1[BlockPosLT].x;}
		
		while (i<Block1[BlockPosRB].x+BlockWidth)
		{
			if (BitPixelParagraph[j*PicWidth+i]==ParagraphIndex)
			{
				if (BitPixel[j*PicWidth+i]==1){ break; }
			}
			i++;
		}
		if (BitPixel[j*PicWidth+i]==1){ break; }
		j++;
	}

	//========================
	
	if (BitPixel[j*PicWidth+i]==1)
	{
		LinkListChar* PttoListChartmp = new LinkListChar;
		PttoListChartmp->Left = i;
		PttoListChartmp->Right = i;
		PttoListChartmp->Top = j;
		PttoListChartmp->Bottom = j;
		PttoListChartmp->NextLinkList = NULL;
		PttoListChartmp->BackLinkList = NULL;
		PttoListChartmp->mark = 0;
		if (Paragraph[ParagraphIndex].CharHead==NULL)
		{
			PttoListChar = PttoListChartmp;
			Paragraph[ParagraphIndex].CharHead = PttoListChar;
		}
		else
		{
			PttoListChar->NextLinkList = PttoListChartmp;
			PttoListChartmp->BackLinkList = PttoListChar;
			PttoListCharOld = PttoListChar;
			PttoListChar = PttoListChartmp;
		}

		PointerPixelx = i;
		PointerPixely = j;
		PointerPixelFindSeedx = i;
		PointerPixelFindSeedy = j;
		directionpixelbegin =0;
		return true;
	}
	return false;
}

void CDibV1View::OnCharacternext() 
{
	// TODO: Add your command handler code here
	clock_t start,finish;
	start=clock();
	int ParagraphIndex;
	long BlockPosLT;
	int FindNextPixelReturn;
	for (ParagraphIndex =0;ParagraphIndex<ParagraphCount;ParagraphIndex++)
	{
		BlockPosLT = Paragraph[ParagraphIndex].Top*(PicWidth/BlockWidth)+Paragraph[ParagraphIndex].Left;
		
		PointerPixelFindSeedx = Block1[BlockPosLT].x;
		PointerPixelFindSeedy = Block1[BlockPosLT].y;
		PttoListChar = Paragraph[ParagraphIndex].CharHead;
		PttoPictureList = Paragraph[ParagraphIndex].PictureHead;
		PttoListCharOld = NULL;
		
		while(FindCharacterSeed(ParagraphIndex))
		{
			directionpixelbegin = 0;
			FindNextPixelReturn = FindNextPixel(directionpixelbegin,ParagraphIndex);
			while (FindNextPixelReturn==1)  // find around character
			{ 
				FindNextPixelReturn = FindNextPixel(directionpixelbegin,ParagraphIndex);
			}
			if (FindNextPixelReturn != 2) // because PttoListChar delete(clear) cause not Char
			{
				WriteBlockChar(); // Write at PttoListChar at
				MarkPixelChecked(1,ParagraphIndex); // MarkPixel PttoListChar
			}
			else
			{
				MarkPixelChecked(2,ParagraphIndex);
			}
		}
		// Character End Paragraph
		//MakeCharacterflow(ParagraphIndex);
		MakeHistogram(ParagraphIndex);
	}
	BittobmPixel(2);
	finish=clock();
	CString bufferx;
	bufferx.Format("Time used %f sec.",(double)(finish-start)/CLOCKS_PER_SEC);
	AfxMessageBox(bufferx);
	Invalidate();	
}

void CDibV1View::WriteBlockChar()
{
	long i;
	// Left Line
	for(i=PttoListChar->Top;i<=PttoListChar->Bottom;i++)
	{		
		AddonPixel[i*PicWidth+PttoListChar->Left] =1;		
	}
	// Right Line
	for(i=PttoListChar->Top;i<=PttoListChar->Bottom;i++)
	{		
		AddonPixel[i*PicWidth+PttoListChar->Right] =1;		
	}
	// Top Line
	for(i=PttoListChar->Left;i<=PttoListChar->Right;i++)
	{		
		AddonPixel[PttoListChar->Top*PicWidth+i] =1;		
	}
	// Bottom Line
	for(i=PttoListChar->Left;i<=PttoListChar->Right;i++)
	{		
		AddonPixel[PttoListChar->Bottom*PicWidth+i] =1;		
	}
}

int CDibV1View::FindNextPixel(int directionb,int ParagraphIndex)
{
	int rundirection = directionb;
	BOOLEAN MeetBlack = false;
	long Pixely = PointerPixely;
	long Pixelx = PointerPixelx;
	long PointPixel;

	do
	{
		switch (rundirection)
		{
		case 0:
			PointPixel = (Pixely-1)*PicWidth+Pixelx;
			directionpixelbegin = 5;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		case 1:
			PointPixel = (Pixely-1)*PicWidth+Pixelx+1;
			directionpixelbegin = 6;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		case 2:
			PointPixel = (Pixely)*PicWidth+Pixelx+1;
			directionpixelbegin = 7;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		case 3:
			PointPixel = (Pixely+1)*PicWidth+Pixelx+1;
			directionpixelbegin = 0;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		case 4:
			PointPixel = (Pixely+1)*PicWidth+Pixelx;
			directionpixelbegin = 1;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		case 5:
			PointPixel = (Pixely+1)*PicWidth+Pixelx-1;
			directionpixelbegin = 2;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		case 6:
			PointPixel = (Pixely)*PicWidth+Pixelx-1;
			directionpixelbegin = 3;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		case 7 :
			PointPixel = (Pixely-1)*PicWidth+Pixelx-1;
			directionpixelbegin = 4;
			if (PointPixel<0) {break;}
			if (BitPixel[PointPixel]==1)
			{
				MeetBlack = true;
			}
			break;
		}
		rundirection++;
		if (rundirection==8) {rundirection=0;}
	}while((PointPixel!=PointerPixelFindSeedy*PicWidth+PointerPixelFindSeedx) && (rundirection != directionb) && (MeetBlack==false));
	if (PointPixel==PointerPixelFindSeedy*PicWidth+PointerPixelFindSeedx) 
	{
		// DELETE Pointer Cause not case of Char
		if((PttoListChar->Right-PttoListChar->Left)<5 && (PttoListChar->Bottom-PttoListChar->Top)<5)
		{
			PttoListCharfordelete.Left = PttoListChar->Left;
			PttoListCharfordelete.Right = PttoListChar->Right;
			PttoListCharfordelete.Top = PttoListChar->Top;
			PttoListCharfordelete.Bottom = PttoListChar->Bottom;
			delete PttoListChar;
			if (PttoListCharOld > 0)   // HeadChar Point
			{
				PttoListChar = PttoListCharOld;
				PttoListChar->NextLinkList = NULL;
			}
			return 2;
		}
		else if ((PttoListChar->Right-PttoListChar->Left)>100 || (PttoListChar->Bottom-PttoListChar->Top)>100)
		{
			LinkListChar* NewPic;
			NewPic = new LinkListChar;
			NewPic->Left = PttoListChar->Left;
			NewPic->Right = PttoListChar->Right;
			NewPic->Top	= PttoListChar->Top;
			NewPic->Bottom = PttoListChar->Bottom;
			NewPic->NextLinkList = NULL;
			NewPic->BackLinkList = NULL;
			if (PttoPictureList==NULL) 
			{ 
				PttoPictureList = NewPic;
			}
			else 
			{
				PttoPictureList->NextLinkList = NewPic;
				NewPic->BackLinkList = PttoPictureList;
				PttoPictureList = PttoPictureList->NextLinkList;
			}
			PttoListCharfordelete.Left = PttoListChar->Left;
			PttoListCharfordelete.Right = PttoListChar->Right;
			PttoListCharfordelete.Top = PttoListChar->Top;
			PttoListCharfordelete.Bottom = PttoListChar->Bottom;
			delete PttoListChar;
			if (PttoListCharOld > 0)   // HeadChar Point
			{			
				PttoListChar = PttoListCharOld;
				PttoListChar->NextLinkList = NULL;
			}
			return 2;
		}
		// if keep Character
		return 0;
	}
	if (MeetBlack) 
	{
		PointerPixely = (long)PointPixel/PicWidth;
		PointerPixelx = PointPixel - (PointerPixely*PicWidth);
		if (PointerPixely>PttoListChar->Bottom) 
		{ 
			PttoListChar->Bottom = PointerPixely;
		}
		if (PointerPixely<PttoListChar->Top) 
		{ 
			PttoListChar->Top = PointerPixely;
		}
		if (PointerPixelx<PttoListChar->Left) 
		{ 
			PttoListChar->Left = PointerPixelx;
		}
		if (PointerPixelx>PttoListChar->Right) 
		{ 
			PttoListChar->Right = PointerPixelx;
		}
		return 1;
	}
	return 0;
}

void CDibV1View::MarkPixelChecked(int mode,int ParagraphIndex)
{
	long i,j;
	if (mode==1)
	{
		for(j=PttoListChar->Top;j<=PttoListChar->Bottom;j++)
		{
			for(i=PttoListChar->Left;i<=PttoListChar->Right;i++)
			{
				BitPixelParagraph[j*PicWidth+i] = ParagraphIndex+100;
			}
		}
	}
	else
	{
		for(j=PttoListCharfordelete.Top;j<=PttoListCharfordelete.Bottom;j++)
		{
			for(i=PttoListCharfordelete.Left;i<=PttoListCharfordelete.Right;i++)
			{
				BitPixelParagraph[j*PicWidth+i] = 255;
			}
		}
	}
}



void CDibV1View::OnZoom1() 
{
	// TODO: Add your command handler code here
	ViewSolution = 1;
	//AfxMessageBox("aaa");
	Invalidate();
}

void CDibV1View::OnZoom2() 
{
	// TODO: Add your command handler code here
	ViewSolution = 5;
	Invalidate();
}

void CDibV1View::OnZoom3() 
{
	// TODO: Add your command handler code here
	ViewSolution = 6;
	Invalidate();
}

void CDibV1View::OnZoomMedium() 
{
	// TODO: Add your command handler code here
	ViewSolution = 2;
	Invalidate();
}

void CDibV1View::MakeCharacterflow(int ParagraphIndex)
{
	// Clear Variable
	PttoChar1 = NULL;
	PttoChar2 = NULL;
	PttoChartmp = NULL;
	BaseChar = NULL;
	long pos;
	LinkListCharLine* PttoCharLine;

	PttoChar1 = Paragraph[ParagraphIndex].CharHead;
	if (PttoChar1 != NULL)  // Pass if not have any char
	{
		PttoChartmp = PttoChar1;
		pos = PttoChar1->Left;

		while((PttoChar1 != NULL) && (PttoChar1->Top<Paragraph[ParagraphIndex].Top*BlockHeight+64))
		{
			if (PttoChar1->Left<pos)
			{ 
				pos = PttoChar1->Left;
				PttoChartmp = PttoChar1;
			}
			PttoChar1=PttoChar1->NextLinkList;
		}
		// Now Get First Char of Line 1
		BaseChar = PttoChartmp;
		PttoCharLine = new LinkListCharLine;
		Paragraph[ParagraphIndex].HeadCharLine = PttoCharLine;
		
		PttoChartmp->mark =1;
		LinkListChar* charnew;
		charnew = new LinkListChar();
		charnew->Top = PttoChartmp->Top;
		charnew->Bottom = PttoChartmp->Bottom;
		charnew->Left = PttoChartmp->Left;
		charnew->Right = PttoChartmp->Right;
		charnew->Position = 2;
	
		PttoChar2 = charnew;
		PttoCharLine->HeadChar = PttoChar2; 
		// Find Next Char in Line
		// if Thai find down up and right following order;
		if (language == 1)
		{
			int x;
			do
			{
			FindCharBottom();
			FindCharTop();
			x = FindCharRight(ParagraphIndex);
			}while(x==1);
		}
		else if (language == 2)
		{
			while(FindCharRight(ParagraphIndex)){}; //since get 1 Line
		}
	}
}

void CDibV1View::FindCharBottom()
{
	PttoChar1 = BaseChar;
	PttoChartmp = NULL;
	while ((PttoChar1 != NULL) && PttoChar1->Top<PttoChar2->Bottom+(0.4*(PttoChar2->Bottom-PttoChar2->Top)))	{
		if (PttoChar1->mark !=1)
		{
			if ((PttoChar1->Left<PttoChar2->Right) && (PttoChar1->Left>PttoChar2->Left) && (PttoChar1->Bottom-PttoChar1->Top)<(0.5*(PttoChar2->Bottom-PttoChar2->Top)))
			{
				PttoChartmp = PttoChar1;
				break;
			}
		}
		PttoChar1 = PttoChar1->NextLinkList;
	}

	if(PttoChartmp!=NULL)
	{
		PttoChartmp->mark =1;
		LinkListChar* charnew;
		charnew = new LinkListChar();
		charnew->Top = PttoChartmp->Top;
		charnew->Bottom = PttoChartmp->Bottom;
		charnew->Left = PttoChartmp->Left;
		charnew->Right = PttoChartmp->Right;
		charnew->BackLinkList = PttoChar2;
		charnew->NextLinkList = NULL;
		charnew->Position = 3;
		PttoChar2->NextLinkList = charnew; 
		PttoChar2 = PttoChar2->NextLinkList;
	}
}

void CDibV1View::FindCharTop()
{
	LinkListChar* charnew;
	PttoChar1 = BaseChar;
	PttoChartmp = NULL;
	while ((PttoChar1 != NULL) && PttoChar1->Top<PttoChar2->Bottom+(0.4*(PttoChar2->Bottom-PttoChar2->Top)) )
	{
		if (PttoChar1->mark !=1)
		{
			if ((PttoChar1->Left<PttoChar2->Right) && (PttoChar1->Left>PttoChar2->Left) && (PttoChar1->Bottom-PttoChar1->Top)<(0.5*(PttoChar2->Bottom-PttoChar2->Top)))
			{
				PttoChartmp = PttoChar1;
				PttoChartmp->mark =1;	
				// because have more than one Upper
				charnew = new LinkListChar();
				charnew->Top = PttoChartmp->Top;
				charnew->Bottom = PttoChartmp->Bottom;
				charnew->Left = PttoChartmp->Left;
				charnew->Right = PttoChartmp->Right;
				charnew->BackLinkList = PttoChar2;
				charnew->NextLinkList = NULL;
				charnew->Position = 1;
				PttoChar2->NextLinkList = charnew; 
				PttoChar2 = PttoChar2->NextLinkList;
			}
		}
		PttoChar1 = PttoChar1->BackLinkList;
	}
}

int CDibV1View::FindCharRight(int ParagraphIndex)
{
	int res;
	PttoChar1 = Paragraph[ParagraphIndex].CharHead;
	PttoChartmp = NULL;
	BOOLEAN genfirst = false;
	int function;
	while ((PttoChar1 != NULL) && (PttoChar1->Top<=BaseChar->Bottom) )
	{
		if (genfirst)
		{
			if (PttoChar1->mark !=1)
			{
				if ( (PttoChar1->Bottom-PttoChar1->Top > 1.15*(BaseChar->Bottom-BaseChar->Top)) 
					&& (PttoChar1->Left <BaseChar->Left) )
				{
					PttoChartmp = PttoChar1;
					function = 1;
				}
				else if ( (PttoChar1->Bottom-PttoChar1->Top > 0.7*(BaseChar->Bottom-BaseChar->Top)) 
					&& (PttoChar1->Left <BaseChar->Left) )
				{
					PttoChartmp = PttoChar1;
					function = 2;
				}
				else if( (PttoChar1->Bottom > BaseChar->Top) && (PttoChar1->Bottom < BaseChar->Bottom) && (PttoChar1->Bottom-PttoChar1->Top < 0.5*(BaseChar->Bottom-BaseChar->Top)) && (PttoChar1->Left <BaseChar->Left))
				{ // Case sara a'
					PttoChartmp = PttoChar1;
					function = 3;
				}
			}
		}
		else
		{   // NOT have (PttoChar1->Left <BaseChar->Left)
			if (PttoChar1->mark !=1)
			{
				if ( (PttoChar1->Bottom-PttoChar1->Top > 1.15*(BaseChar->Bottom-BaseChar->Top)))
				{
					PttoChartmp = PttoChar1;
					function = 1;
					genfirst = true;
				}
				else if ( (PttoChar1->Bottom-PttoChar1->Top > 0.7*(BaseChar->Bottom-BaseChar->Top)))
				{
					PttoChartmp = PttoChar1;
					function = 2;
					genfirst = true;
				}
				else if( (PttoChar1->Bottom > BaseChar->Top) && (PttoChar1->Bottom < BaseChar->Bottom) && (PttoChar1->Bottom-PttoChar1->Top < 0.5*(BaseChar->Bottom-BaseChar->Top)))
				{ // Case sara a'
					PttoChartmp = PttoChar1;
					function = 3;
					genfirst = true;
				}
			}
		}
		PttoChar1 = PttoChar1->NextLinkList;
	}

	if(PttoChartmp!=NULL)
	{
		if (function ==1)  // unnormal Char Big size
		{
			PttoChartmp->mark =1;
			LinkListChar* charnew;
			charnew = new LinkListChar();
			charnew->Top = PttoChartmp->Top;
			charnew->Bottom = PttoChartmp->Bottom;
			charnew->Left = PttoChartmp->Left;
			charnew->Right = PttoChartmp->Right;
			charnew->BackLinkList = PttoChar2;
			charnew->NextLinkList = NULL;
			charnew->Position = function+10;
			PttoChar2->NextLinkList = charnew; 
			PttoChar2 = PttoChar2->NextLinkList;
			res = FindCharRight(ParagraphIndex);
			if (res==1){return 1;}
			if (res==0){return 0;}
		}
		else if (function ==2) // normal Char
		{
			BaseChar = PttoChartmp;
			PttoChartmp->mark =1;
			LinkListChar* charnew;
			charnew = new LinkListChar();
			charnew->Top = PttoChartmp->Top;
			charnew->Bottom = PttoChartmp->Bottom;
			charnew->Left = PttoChartmp->Left;
			charnew->Right = PttoChartmp->Right;
			charnew->BackLinkList = PttoChar2;
			charnew->NextLinkList = NULL;
			charnew->Position = function+10;
			PttoChar2->NextLinkList = charnew; 
			PttoChar2 = PttoChar2->NextLinkList;
			return 1;
		}
		else if (function ==3) // unnormal Char Small Size
		{
			PttoChartmp->mark =1;
			LinkListChar* charnew;
			charnew = new LinkListChar();
			charnew->Top = PttoChartmp->Top;
			charnew->Bottom = PttoChartmp->Bottom;
			charnew->Left = PttoChartmp->Left;
			charnew->Right = PttoChartmp->Right;
			charnew->BackLinkList = PttoChar2;
			charnew->NextLinkList = NULL;
			charnew->Position = function+10;
			PttoChar2->NextLinkList = charnew; 
			PttoChar2 = PttoChar2->NextLinkList;
			// FindRight again if is point or sara a'
			res = FindCharRight(ParagraphIndex);
			if (res==1){return 1;}
			if (res==0){return 0;}
		}
	}
	else
	{
		return 0;
	}
	return 0;
}

void CDibV1View::OnLanguageEnglish() 
{
	// TODO: Add your command handler code here
	language = 2;
	BlockWidth = 32; //Can be 32,16,8,4,2,1
	BlockHeight = 32;
}

void CDibV1View::OnLanguageThai() 
{
	// TODO: Add your command handler code here
	language = 1;
	BlockWidth = 16; //Can be 32,16,8,4,2,1
	BlockHeight = 32;
}

void CDibV1View::MakeHistogram(int ParagraphIndex)
{
	Paragraph[ParagraphIndex].Histogram = new int[(Paragraph[ParagraphIndex].Bottom-Paragraph[ParagraphIndex].Top+1)*BlockHeight];
	long i,j,x,y,count;
	for(j=0,y=Paragraph[ParagraphIndex].Top*BlockHeight;j<(Paragraph[ParagraphIndex].Bottom-Paragraph[ParagraphIndex].Top+1)*BlockHeight;j++,y++)
	{
		count=0;
		for(i=0,x=Paragraph[ParagraphIndex].Left*BlockWidth;i<(Paragraph[ParagraphIndex].Right-Paragraph[ParagraphIndex].Left+1)*BlockWidth;i++,x++)
		{
			if((BitPixelParagraph[y*PicWidth+x]==ParagraphIndex+100) && (BitPixel[y*PicWidth+x]==1))
			{
				count++;
			}
		}
		Paragraph[ParagraphIndex].Histogram[j] = count;
	}
}
