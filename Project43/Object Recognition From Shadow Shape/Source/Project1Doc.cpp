// Project1Doc.cpp : implementation of the CProject1Doc class
//

#include "stdafx.h"
#include "Project1.h"

#include "Project1Doc.h"
#include "DlgSetting.h"

#include "DlgEnterClass.h"

#include "Dib.h"
#include <math.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CProject1Doc

IMPLEMENT_DYNCREATE(CProject1Doc, CDocument)

BEGIN_MESSAGE_MAP(CProject1Doc, CDocument)
	//{{AFX_MSG_MAP(CProject1Doc)
	ON_COMMAND(ID_BUTTON_TRAIN, OnButtonTrain)
	ON_COMMAND(ID_BUTTON_LOAD, OnButtonLoad)
	ON_COMMAND(ID_BUTTON_SAVE_AS, OnButtonSaveAs)
	ON_UPDATE_COMMAND_UI(ID_BUTTON_SAVE_AS, OnUpdateButtonSaveAs)
	ON_UPDATE_COMMAND_UI(ID_BUTTON_TRAIN, OnUpdateButtonTrain)
	ON_UPDATE_COMMAND_UI(ID_BUTTON_LOAD, OnUpdateButtonLoad)
	ON_COMMAND(ID_BUTTON__SAVE_AS, OnButtonSaveAs)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CProject1Doc construction/destruction

CProject1Doc::CProject1Doc()
{
	// TODO: add one-time construction code here

	push = PUSH_NULL;
	MinimumBasePt = 1.0;

	en_image = false;
	en_load = true;	
	en_save_m = false;
	en_save_l = false;
	en_save_as = true;	
	en_train = false;
	en_class = false, 	
	en_show = true; 
	en_clear = false;

	m_pDIB = NULL;

	CentroidX = CentroidY = 0;
	NumChainPt = 0;

	memset(TempTbl,WHITE,PICSIZE);
	memset(SegmentTbl,WHITE,PICSIZE);
	memset(EdgeTbl,WHITE,PICSIZE);
	
	int i,j;
	for(i=0;i<12;i++)		
		Piece[i].Area = Piece[i].MaxRad = Piece[i].MinRad = Piece[i].Bound = 0;

	InputName ="";
	for(i=0;i<48;i++)
		InputLayer.Data[i] = 0;
	
	NumPrototype = 0;
	for(i=0;i< MAXPROTOTYPE ;i++)
	{
		Network[i].Name = "";
		Network[i].Rad  = 0;
		for(j=0;j<48;j++)
			Network[j].Data[j] = 0;		
	}

}

CProject1Doc::~CProject1Doc()
{
	if(m_pDIB != NULL)
		delete m_pDIB;
}

BOOL CProject1Doc::OnNewDocument()
{
//	if (!CDocument::OnNewDocument())
//		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CProject1Doc serialization

void CProject1Doc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	
		CFile* fp = ar.GetFile();
		ASSERT(fp);
		ar.Flush();

		

		if(m_pDIB != NULL)
			delete m_pDIB;
		m_pDIB = new CDIBitmap;

		if(!m_pDIB->LoadDIB(fp))
		{
			AfxMessageBox("Error loading DIB file.");
			return;
		}

		en_train = true;
		en_class = true;
		
		// Image Segmentation
		Segmentation();
				
		// Determination centroid point
	    CalcCentroid();

		// Edge Detection		
		EdgeDetection();

		// Chain coding
		ChainCoding();
		CalcChain();
	
		push = PUSH_IMAGE;
	}
}

/////////////////////////////////////////////////////////////////////////////
// CProject1Doc diagnostics

#ifdef _DEBUG
void CProject1Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CProject1Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CProject1Doc commands

// Result : SegmentTbl[PICSIZE]
void CProject1Doc::Segmentation()
{
	
	int i;
	memcpy(SegmentTbl,m_pDIB->m_pBits,16384);
	
	for(i=0;i<PICSIZE;i++)
		SegmentTbl[i] = (SegmentTbl[i] < 200 )? BLACK:WHITE;

}

// Result : CentroidX, CentroidY
void CProject1Doc::CalcCentroid()
{	
	int i,j;
	double xj,xi,xb;

		 xi = xj = xb = 0;
		for (i=0;i<128;i++)
			for (j=0;j<128;j++)
				if (SegmentTbl[i*128+j] == BLACK)
				{
					xi = i + xi;
					xj = j + xj;
					xb = 1 + xb;
				}
		if (xb!=0)
		{
          CentroidX = (xj/xb);
          CentroidY = (xi/xb);
		}
		else 
		{
			CentroidX = CentroidY = 0;						
        }

}

// Result : EdgeTbl[PICSIZE] 
void CProject1Doc::EdgeDetection()
{
	int i,j;
	memset(EdgeTbl,BLACK,16384);

	for(i=1;i<127;i++)	
		for(j=1;j<127;j++)							
			EdgeTbl[i*128+j] = - SegmentTbl[(i+1)*128 + j]
							 - SegmentTbl[(i-1)*128 + j]
							 - SegmentTbl[i*128 + (j+1)]
							 - SegmentTbl[i*128 + (j-1)]
							 - SegmentTbl[(i+1)*128 + (j+1)]
							 - SegmentTbl[(i-1)*128 + (j+1)]
							 - SegmentTbl[(i+1)*128 + (j-1)]
							 - SegmentTbl[(i-1)*128 + (j-1)]
							 + 8*SegmentTbl[i*128 + j];
	
	for(i=0;i<PICSIZE;i++)
		EdgeTbl[i] = (EdgeTbl[i] > 200 )? BLACK:WHITE;
}

// Result : ChainCode[].x,y
//			, NumChainPt
void CProject1Doc::ChainCoding()
{
	int i,j;
	NumChainPt=0;

	for(i=0;i<127;i++)
		for(j=0;j<127;j++)
			if(EdgeTbl[j*128+i]==BLACK)
			{
				ChainCode[NumChainPt].X = i;
				ChainCode[NumChainPt].Y = j;
				NumChainPt++;
			}

}

// Result : ChainCode[].*
void CProject1Doc::CalcChain()
{
	
	CalcChainRadius();
	CalcChainMaxRadiusPt();
	CalcChainRadiusNormalize();
	CalcChainDegree();
		
}

// Result : ChainCode[].Rad 
void CProject1Doc::CalcChainRadius()
{	
	int i;

	for(i=0;i<NumChainPt;i++)
		ChainCode[i].Rad = (double)sqrt(pow((CentroidX-ChainCode[i].X),2)+ pow((CentroidY-ChainCode[i].Y),2));	
	
}

// Result : MaxRadPt
void CProject1Doc::CalcChainMaxRadiusPt()
{	
	int i;
	MaxRadPt = 0;

	for(i=0;i<NumChainPt;i++)
		if(ChainCode[MaxRadPt].Rad<ChainCode[i].Rad)
			MaxRadPt = i;

}

// Result :ChainCode[].Deg
void CProject1Doc::CalcChainDegree()
{
	double x1,y1,x2,y2;
	
	int i;
	// U = (a,b), V = (c,d)
	double a,b,c,d,UV,Ul,Vl,zeta;

	x1 = CentroidX;
	y1 = CentroidY;
	x2 = CentroidX+50; 
	y2 = CentroidY; 
	a = x2-x1;
	b = y2-y1;
	
	
	for(i=0;i<NumChainPt;i++)		
	{
		c = ChainCode[i].X-x1;
		d = ChainCode[i].Y-y1;

		UV = a*c+b*d;				
		Ul = sqrt(a*a+b*b);
		Vl = sqrt(c*c+d*d);

		zeta = acos(UV/(Ul*Vl));		
		zeta = zeta*180/3.142857;

		//if(c>0 && d>0) ;
		//if(c<0 && d>0) ;
		if(c<0 && d<0) zeta = 360-zeta;
		if(c>0 && d<0) zeta = 360-zeta;
		
		ChainCode[i].Deg = (int) zeta;
	}	
}

// Result : ChainCode[].RadNrml,
void CProject1Doc::CalcChainRadiusNormalize()
{
	int i;	
	
	for(i=0;i<NumChainPt;i++)
		ChainCode[i].RadNrml = (double)(ChainCode[i].Rad/ChainCode[MaxRadPt].Rad);
	
}


void CProject1Doc::CalcTChainRotate(double deg)
{
	int i;		
	for(i=0;i<NumChainPt;i++)
	{
		TChainCode[i].Deg = TChainCode[i].Deg - deg;
		if(TChainCode[i].Deg<0)
			TChainCode[i].Deg += 360;
	}

}

void CProject1Doc::CalcEachPiece(int base)
{

	CalcEachPieceArea(base);

	GetTChainCode();
	CalcTChainRotate(TChainCode[base].Deg);				
	CalcEachPieceBound(base);
	CalcEachPieceMaxRad(base);
	CalcEachPieceMinRad(base);

}

void CProject1Doc::GetTChainCode()
{	

	int i;
	NumTChainPt = NumChainPt;
	TMaxRadPt = MaxRadPt;

	for(i=0;i<NumTChainPt;i++)
	{
		TChainCode[i].Deg = ChainCode[i].Deg ;
		TChainCode[i].Rad = ChainCode[i].Rad;
		TChainCode[i].RadNrml = ChainCode[i].RadNrml;
		TChainCode[i].X = ChainCode[i].X;
		TChainCode[i].Y = ChainCode[i].Y;
	}
}
	 
void CProject1Doc::CalcEachPieceArea(int base)
{
	
	int i,j;
	for(i=0;i<12;i++)	
	{
		Piece[i].Area = 0;
		Piece[i].MaxRad = 0;
		Piece[i].MinRad = 0;
		Piece[i].Bound = 0;
	}

	double x1,y1,x2,y2;
	int TotalArea;

	// U = (a,b), V = (c,d)
	double a,b,c,d,UV,zeta,Ul,Vl;

	x1 = CentroidX;
	y1 = CentroidY;
	x2 = CentroidX+50;
	y2 = CentroidY;
	a = x2-x1;
	b = y2-y1;

	TotalArea = 0; 
	for(i=0;i<PICSIZE;i++)
		if(SegmentTbl[i]==BLACK) TotalArea++;
	
	
	for(i=0;i<128;i++)
		for(j=0;j<128;j++)
			if(SegmentTbl[j*128+i]==BLACK)
			{
				c = (double)i-x1;
				d = (double)j-y1;

				UV = a*c+b*d;
				
				Ul = sqrt(a*a+b*b);
				Vl = sqrt(c*c+d*d);
				zeta = acos(UV/(Ul*Vl));
				zeta=zeta*180/3.142857;

				//if(c>0 && d>0) ;
				//if(c<0 && d>0) ;
				if(c<0 && d<0) zeta = 360-zeta;
				if(c>0 && d<0) zeta = 360-zeta;			
				
				
				zeta = (int) zeta;
				zeta = zeta - ChainCode[base].Deg;
				if(zeta<0)
					zeta += 360;								
				
				if(0<=zeta && zeta<30) Piece[0].Area++;
				else if(30<=zeta && zeta<60) Piece[1].Area++;
				else if(60<=zeta && zeta<90) Piece[2].Area++;
				else if(90<=zeta && zeta<120) Piece[3].Area++;
				else if(120<=zeta && zeta<150) Piece[4].Area++;
				else if(150<=zeta && zeta<180) Piece[5].Area++;
				else if(180<=zeta && zeta<210) Piece[6].Area++;
				else if(210<=zeta && zeta<240) Piece[7].Area++;
				else if(240<=zeta && zeta<270) Piece[8].Area++;
				else if(270<=zeta && zeta<300) Piece[9].Area++;
				else if(300<=zeta && zeta<330) Piece[10].Area++;
				else if(330<=zeta && zeta<360) Piece[11].Area++;

			}
		
			for(i=0;i<12;i++)
				Piece[i].Area/=TotalArea;

}

void CProject1Doc::CalcEachPieceBound(int base)
{

	int i,j;
	for(i=0;i<12;i++)
	{
		Piece[i].Bound = 0;
		for(j=0;j<NumTChainPt;j++)
		{
			if(TChainCode[j].Deg >= i*30  && TChainCode[j].Deg < (i+1)*30)
				Piece[i].Bound++;
		}
		Piece[i].Bound=Piece[i].Bound/NumTChainPt;
	}

}

void CProject1Doc::CalcEachPieceMaxRad(int base)
{
	
	int i,j;
	for(i=0;i<12;i++)
	{
		if(Piece[i].Bound == 0) Piece[i].MaxRad = 0;
		else 
		{
			Piece[i].MaxRad = 0;		
			for(j=0;j<NumTChainPt;j++)
				if(Piece[i].MaxRad < TChainCode[j].RadNrml && TChainCode[j].Deg >= i*30  && TChainCode[j].Deg < (i+1)*30 )
						Piece[i].MaxRad = TChainCode[j].RadNrml;
		}
	}

}

void CProject1Doc::CalcEachPieceMinRad(int base)
{

	int i,j;
	for(i=0;i<12;i++)
	{
		if(Piece[i].Bound == 0) Piece[i].MinRad = 0;
		else 
		{
			Piece[i].MinRad = 1;		
			for(j=0;j<NumTChainPt;j++)
				if(Piece[i].MinRad > TChainCode[j].RadNrml && TChainCode[j].Deg >= i*30 && TChainCode[j].Deg < (i+1)*30 )
						Piece[i].MinRad = TChainCode[j].RadNrml;
		}
	}

}


void CProject1Doc::OnButtonTrain() 
{
	// TODO: Add your command handler code here
	
	CDlgEnterClass Dlg;
	if(Dlg.DoModal()!=IDOK) return;
	InputName = Dlg.m_ClassName;

	en_save_m = true;
	en_clear = true;	
	
	int b,i,j;

	int sort[PICSIZE];
	int n_sort;
	
	n_sort = 0;
	NumBasePt = 0;

	double Max;
	
	
	do {		
		Max = MinimumBasePt-0.1;
		for(i=0;i<NumChainPt;i++)
		{
			
			BOOL found = false;
			for(j=0;j<n_sort;j++)
			{
				if(i == sort[j])
					found = true;				
			}
				
			if(!found && ChainCode[i].RadNrml>Max )
			{				
				Max = ChainCode[i].RadNrml;
				b = i;				
			}
		}
		
		sort[n_sort] = b;
		n_sort++;

		GetTChainCode();
		CalcTChainRotate(TChainCode[b].Deg);	
		CalcEachPiece(b);
		
		for(i=0;i<12;i++)
		{
			InputLayer.Data[4*i] = Piece[i].Area;
			InputLayer.Data[4*i+1] = Piece[i].Bound;
			InputLayer.Data[4*i+2] = Piece[i].MaxRad;
			InputLayer.Data[4*i+3] = Piece[i].MinRad;
		}	

		BOOL Insert=true;
		double rad,result;
		rad = 0.5;

		if(NumPrototype==0) 
		{				
			rad = 0.5;
			//Insert = true;						
		}
		else 
		{
	 		for(i=0;i<NumPrototype;i++)
			{
				result = 0;
				for(j=0;j<48;j++)
				{
					result += (InputLayer.Data[j]-Network[i].Data[j])
							*(InputLayer.Data[j]-Network[i].Data[j]);
				}
				
				if(result<=0.000000 ) // case : rename image's class
				{
					Insert=false;
					Network[i].Name = InputName;
				}
				else if(result<=Network[i].Rad && Network[i].Name==InputName)
				{
					Insert = false;
				}
				else if(result>Network[i].Rad && Network[i].Name==InputName)
				{																		
					
				}
				else if(result<=Network[i].Rad && Network[i].Name!=InputName)
				{						
					result = result*9/10;
					Network[i].Rad = result;
					if(result<rad) rad = result;
					
				}
				else if(result>Network[i].Rad && Network[i].Name!=InputName)
				{						
					if(result<rad)
						rad = result*9/10;
				}							
			} // for
		} // if else 
		
		if(Insert && NumPrototype < MAXPROTOTYPE) 
		{
			Network[NumPrototype].Name = InputName;
			Network[NumPrototype].Rad = rad;
			for(i=0;i<48;i++)		
				Network[NumPrototype].Data[i] = InputLayer.Data[i];
			NumPrototype++;

			BasePt[NumBasePt] = b;
			NumBasePt++;
		}

	} while(ChainCode[b].RadNrml>MinimumBasePt);

	push = PUSH_TRAIN;
	UpdateAllViews(NULL);

}

//////////////////////////////////////////////
//

void CProject1Doc::OnButtonLoad() 
{
	// TODO: Add your command handler code here

	struct structnode {
		char Name[50];
		double rad;
		double Data[48];
	} var;

	
	CFile file;
	CFileDialog dlg(true,"rce","*.rce",OFN_HIDEREADONLY,"Rce File (*.rce)|*.rce||");
	if(dlg.DoModal()!=IDOK) 
		return;
	FileName = dlg.GetPathName();
	if(!file.Open(FileName,CFile::modeRead|CFile::typeBinary)) 
		return;

	int i;
	NumPrototype=0;
	while(file.Read(&var, sizeof(var)))
	{				
		Network[NumPrototype].Name = (CString)var.Name;
		Network[NumPrototype].Rad=var.rad;
		for(i=0;i<48;i++) 
			Network[NumPrototype].Data[i]=var.Data[i];

		NumPrototype++;
	}

	file.Close();
	
	en_clear = true;
	en_save_l= true;
	en_save_m = false;
	
}

void CProject1Doc::OnButtonSaveAs() 
{
	// TODO: Add your command handler code here
	
	struct structnode {
		char Name[50];
		double rad;
		double Data[48];
	} var;

	CFile file;
	CFileDialog dlg(false,"rce","*.rce",OFN_HIDEREADONLY,"Rec File (*.rce)|*.rce||");
	if(dlg.DoModal()!=IDOK) 
		return;
	if(!file.Open(dlg.GetPathName(),CFile::modeCreate|CFile::modeWrite|CFile::typeBinary)) 
		return;

	int i,j;
	for(i=0;i<NumPrototype;i++)
	{
		for (j=0;j<Network[i].Name.GetLength();j++)
			var.Name[j] = (char) Network[i].Name.GetAt(j);
		var.Name[j]='\0';

		var.rad=Network[i].Rad;
		for(j=0;j<48;j++)
			var.Data[j]=Network[i].Data[j];
		file.Write(&var, sizeof(var));
	}

	file.Close();

}

void CProject1Doc::OnUpdateButtonSaveAs(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	
	if(en_save_as)
		pCmdUI->Enable(true);
	else 
		pCmdUI->Enable(false);
}

void CProject1Doc::OnUpdateButtonTrain(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here

	if(en_train)
		pCmdUI->Enable(true);
	else 
		pCmdUI->Enable(false);
	
}

void CProject1Doc::OnUpdateButtonLoad(CCmdUI* pCmdUI) 
{
	// TODO: Add your command update UI handler code here
	if(en_load)
		pCmdUI->Enable(true);
	else 
		pCmdUI->Enable(false);
}



