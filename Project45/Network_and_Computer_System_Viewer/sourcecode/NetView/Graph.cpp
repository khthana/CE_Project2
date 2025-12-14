// Graph.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Graph.h"
#include "Stat.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CGraph dialog


CGraph::CGraph(CWnd* pParent /*=NULL*/)
	: CDialog(CGraph::IDD, pParent)
{
	//{{AFX_DATA_INIT(CGraph)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CGraph::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CGraph)
	DDX_Control(pDX, IDC_MSCHART1, m_Chart);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CGraph, CDialog)
	//{{AFX_MSG_MAP(CGraph)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CGraph message handlers

BOOL CGraph::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	CStat x;
	long monCount=0;
	long tueCount=0;
	long wedCount=0;
	long thuCount=0;
	long friCount=0;
	long satCount=0;
	long sunCount=0;

	x.Open(dbOpenDynaset,_T("Select * From Stat Where Date LIKE 'Mon*'"));
	while(!x.IsEOF())
	{
		monCount = monCount+1;
		x.MoveNext();
	}
	x.Close();
	
	
	x.Open(dbOpenDynaset,_T("Select * From Stat Where Date LIKE 'Tue*'"));
	while(!x.IsEOF())
	{
		tueCount = tueCount+1;
		x.MoveNext();
	}
	x.Close();

	x.Open(dbOpenDynaset,_T("Select * From Stat Where Date LIKE 'Wed*'"));
	while(!x.IsEOF())
	{
		wedCount = wedCount+1;
		x.MoveNext();
	}
	x.Close();

	x.Open(dbOpenDynaset,_T("Select * From Stat Where Date LIKE 'Thu*'"));
	while(!x.IsEOF())
	{
		thuCount = thuCount+1;
		x.MoveNext();
	}
	x.Close();

	x.Open(dbOpenDynaset,_T("Select * From Stat Where Date LIKE 'Fri*'"));
	while(!x.IsEOF())
	{
		friCount = friCount+1;
		x.MoveNext();
	}
	x.Close();
	//_ltoa(friCount,buf,10);
	//MessageBox(buf,"xx",MB_OK);

	x.Open(dbOpenDynaset,_T("Select * From Stat Where Date LIKE 'Sat*'"));
	while(!x.IsEOF())
	{
		satCount = satCount+1;
		x.MoveNext();
	}
	x.Close();

	x.Open(dbOpenDynaset,_T("Select * From Stat Where Date LIKE 'Sun*'"));
	while(!x.IsEOF())
	{
		sunCount = sunCount+1;
		x.MoveNext();
	}
	x.Close();

	char temp[255];
	

	
	m_Chart.SetRow(1);
	_ltoa(monCount,temp,10);
	m_Chart.SetData(temp);

	m_Chart.SetRow(2);
	_ltoa(tueCount,temp,10);
	m_Chart.SetData(temp);

	m_Chart.SetRow(3);
	_ltoa(wedCount,temp,10);
	m_Chart.SetData(temp);

	m_Chart.SetRow(4);
	_ltoa(thuCount,temp,10);
	m_Chart.SetData(temp);

	m_Chart.SetRow(5);
	_ltoa(friCount,temp,10);
	m_Chart.SetData(temp);

	m_Chart.SetRow(6);
	_ltoa(satCount,temp,10);
	m_Chart.SetData(temp);

	m_Chart.SetRow(7);
	_ltoa(sunCount,temp,10);
	m_Chart.SetData(temp);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
