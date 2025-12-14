// DlgShow.cpp : implementation file
//

#include "stdafx.h"
#include "Project1.h"
#include "DlgShow.h"

#include "MainFrm.h"
#include "Project1Doc.h"
#include "Project1View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgShow dialog


CDlgShow::CDlgShow(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgShow::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgShow)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgShow::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgShow)
	DDX_Control(pDX, IDC_LIST2, m_List2);
	DDX_Control(pDX, IDC_LIST1, m_List1);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgShow, CDialog)
	//{{AFX_MSG_MAP(CDlgShow)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgShow message handlers

BOOL CDlgShow::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	
	CProject1View* pView = (CProject1View*) ((CWnd*)((CMainFrame*)AfxGetMainWnd()->GetActiveWindow())->GetActiveView());
    CProject1Doc* pDoc = pView->GetDocument();	
	
	CString Str(_T("."));
	int i,j;

	// Init List 1		
	
	for(i=0;i<48;i++)
	{
		Str.Format("%d",i+1);
		m_List1.InsertColumn(i,Str,LVCFMT_LEFT,70);
	}

	// Init List 2
	
	m_List2.InsertColumn(0,"Dif",LVCFMT_LEFT,70);			
	m_List2.InsertColumn(1,"Rad",LVCFMT_LEFT,70);
	m_List2.InsertColumn(2,"Name",LVCFMT_LEFT,70);
	
	for(i=0;i<48;i++)
	{
		Str.Format("%d",i+1);
		m_List2.InsertColumn(3+i,Str,LVCFMT_LEFT,70);
	}

	// Insert List 2

	if(pDoc->en_class) 
	{
		pDoc->GetTChainCode();
		pDoc->CalcEachPiece(pDoc->TMaxRadPt);	
		for(i=0;i<12;i++)
		{
			pDoc->InputLayer.Data[4*i] = pDoc->Piece[i].Area;
			pDoc->InputLayer.Data[4*i+1] = pDoc->Piece[i].Bound;
			pDoc->InputLayer.Data[4*i+2] = pDoc->Piece[i].MaxRad;
			pDoc->InputLayer.Data[4*i+3] = pDoc->Piece[i].MinRad;
		}	
	
		Str.Format(_T("%lf"),pDoc->InputLayer.Data[0]);		
		m_List1.InsertItem(0,Str);	
		for(i=1;i<48;i++) 
		{
			Str.Format(_T("%lf"),pDoc->InputLayer.Data[i]);
			m_List1.SetItemText(0,i,Str);
		}
	}

	
	// Insert List 2
	
	for(i=pDoc->NumPrototype-1;i>-1;i--)
	{
		double temp=0;
		for(j=0;j<48;j++)
		{
			temp += (pDoc->InputLayer.Data[j]-pDoc->Network[i].Data[j])
					*(pDoc->InputLayer.Data[j]-pDoc->Network[i].Data[j]);
		}		
				
		Str.Format("%lf",temp);
		m_List2.InsertItem(0,Str);
		
		Str.Format(_T("%lf"),pDoc->Network[i].Rad);
		m_List2.SetItemText(0,1,Str);

		m_List2.SetItemText(0,2,pDoc->Network[i].Name);
		
		for(j=0;j<48;j++) 
		{
			Str.Format(_T("%lf"),pDoc->Network[i].Data[j]);
			m_List2.SetItemText(0,3+j,Str);
		}		
	}	



	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
