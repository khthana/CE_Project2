// ProgressDlg.cpp : implementation file
//

#include "stdafx.h"
#include "first.h"
#include "ProgressDlg.h"
#include "Dibapi.h"
#include "process.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// ProgressDlg dialog


ProgressDlg::ProgressDlg(CWnd* pParent /*=NULL*/)
	: CDialog(ProgressDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(ProgressDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void ProgressDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(ProgressDlg)
	DDX_Control(pDX, IDC_LIST_OUTPUT, m_output);
	DDX_Control(pDX, IDC_PROGRESS, m_progress);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(ProgressDlg, CDialog)
	//{{AFX_MSG_MAP(ProgressDlg)
	ON_BN_CLICKED(IDC_START, OnStart)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// ProgressDlg message handlers

BOOL ProgressDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	extern int file_count;

	m_progress.SetRange(0,file_count);
	m_progress.SetStep(1);
	m_progress.SetPos(0);


	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}


void ProgressDlg::OnStart() 
{
	extern BOOL open_list;
	extern int file_count,success;
	extern CString file_path[30],pic_path;
	extern int event;
	int pos,temp;

	success=0;
	pPalDIB=NULL;
	hDIB=NULL;
	if (open_list)
	{		
		m_output.AddString("Output folder : "+pic_path);
		m_output.AddString("");
		m_output.AddString("Output name");
		while (event < file_count)
		{	
			file_name = file_path[event];
			//open first file in list
			pPalDIB = new CPalette;
			::LoadBMP(file_path[event],&hDIB,pPalDIB,&bmHeight,&bmWidth);
			temp = success;
			OnExecute();
			m_progress.StepIt();
			pos = file_name.Find(".",0);
			file_name.Delete(pos+1,3);
			file_name+="xls";
			file_name.Delete(0,pic_path.GetLength()+1);
			if (success > temp)
			{
				m_output.AddString("     "+file_name);
			}
			else
			{
				m_output.AddString("     Can't open file "+file_name);
			}

			//point to next file
			event = event+1;
			if (hDIB != NULL)
			{
				::GlobalFree((HGLOBAL) hDIB);
			}
			if (pPalDIB != NULL)
			{
				delete pPalDIB;
			}

		}
		if (event == file_count)
		{
			m_output.AddString("");
			char count[20];
			sprintf(count,"Total input file : %d",file_count);
			m_output.AddString(count);
			sprintf(count,"Total success file : %d",success);
			m_output.AddString(count);
			open_list=FALSE;
			event = 0;
			file_count =0;
			MessageBox("         FINISH",NULL,MB_OK);
			//AfxMessageBox("FINISH");
			CDialog::OnOK();
		}
	}
}

void ProgressDlg::OnExecute()
{
	extern int l,r,u,d,threshold;
	extern int stand[1000][1000],tr[50];
	CPoint start_point,end_point;
	CPoint point;

	
	start_point.x=0;
	start_point.y=0;
	end_point.x=bmWidth-1;
	end_point.y=bmHeight-1;
	
	int x1,x2,y1,y2,i1,j1;
	
	for (i1=0;i1<=50;i1++) tr[i1]=0;

	for (i1=0;i1<1000;i1++)
		for (j1=0;j1<1000;j1++)
			stand[i1][j1]=9;


	x1 = start_point.x;
	x2 = end_point.x;
	y1 = start_point.y;
	y2 = end_point.y;

	l=x1;
	r=x2;
	u=y1;
	d=y2;

	

	threshold = ::findThreshold(hDIB,pPalDIB,x1,x2,y1,y2,2,2);
	::Binarization1(hDIB,pPalDIB,x1,x2,y1,y2);

	//Invalidate();

	::Find_Col(hDIB,pPalDIB);
//	::Find_Row();
//	::Total_Row();
//	Print_col(pDoc->hDIB);
	
//	Print_cr(pDoc->hDIB);

	::Initial_stand();	
	::Sub_Exe(hDIB,pPalDIB);
//	Invalidate();
	::Find_Row();

	::Total_Row();

//	Print_col(pDoc-> hDIB);
//	Print_cr(pDoc-> hDIB);


	::Binary_Row(hDIB,pPalDIB,file_name);

	/*BOOL success;
	success = WriteDIB(pDoc->hDIB);
	if (success == false)
		AfxMessageBox("Can not write bitmap");*/
}

