// SearchOnline.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "SearchOnline.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSearchOnline dialog


CSearchOnline::CSearchOnline(CWnd* pParent /*=NULL*/)
	: CDialog(CSearchOnline::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSearchOnline)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CSearchOnline::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSearchOnline)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSearchOnline, CDialog)
	//{{AFX_MSG_MAP(CSearchOnline)
	ON_BN_CLICKED(IDOnlineOK, OnOnlineOK)
	ON_BN_CLICKED(IDOnlineCANCEL, OnOnlineCANCEL)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSearchOnline message handlers

void CSearchOnline::OnOnlineOK() 
{
	CDialog::OnOK();	
}

void CSearchOnline::OnOnlineCANCEL() 
{
	CDialog::OnCancel();	
}

