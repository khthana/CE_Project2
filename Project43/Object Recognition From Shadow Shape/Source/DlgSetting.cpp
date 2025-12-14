// DlgSetting.cpp : implementation file
//

#include "stdafx.h"
#include "Project1.h"
#include "DlgSetting.h"

#include "MainFrm.h"
#include "Project1Doc.h"
#include "Project1View.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgSetting dialog


CDlgSetting::CDlgSetting(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgSetting::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgSetting)
	m_value = 0.0;
	m_slidervalue = 0;
	//}}AFX_DATA_INIT
}


void CDlgSetting::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgSetting)
	DDX_Control(pDX, IDC_EDIT1, m_Edit);
	DDX_Control(pDX, IDC_SLIDER1, m_Slider);
	DDX_Text(pDX, IDC_EDIT1, m_value);
	DDX_Slider(pDX, IDC_SLIDER1, m_slidervalue);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgSetting, CDialog)
	//{{AFX_MSG_MAP(CDlgSetting)
	ON_WM_HSCROLL()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgSetting message handlers

BOOL CDlgSetting::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here

	CProject1View* pView = (CProject1View*) ((CWnd*)((CMainFrame*)AfxGetMainWnd()->GetActiveWindow())->GetActiveView());
    CProject1Doc* pDoc = pView->GetDocument();

	m_Slider.SetRange(0,10);					
	m_value = pDoc->MinimumBasePt;
	m_slidervalue = (int)(m_value*100-90);		

	UpdateData(false);	

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgSetting::OnHScroll(UINT nSBCode, UINT nPos, CScrollBar* pScrollBar) 
{
	// TODO: Add your message handler code here and/or call default	

	CSliderCtrl *s;
	s =(CSliderCtrl*) pScrollBar;
	if(s==&m_Slider) 
	{
		UpdateData(true);
		m_value = 0.9+(double)m_slidervalue/100;
		UpdateData(false);
	}

	CDialog::OnHScroll(nSBCode, nPos, pScrollBar);
}


