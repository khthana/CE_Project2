// OnPrint.cpp : implementation file
//

#include "stdafx.h"
#include "Basic.h"
#include "OnPrint.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// OnPrint dialog


OnPrint::OnPrint(CWnd* pParent /*=NULL*/)
	: CDialog(OnPrint::IDD, pParent)
{
	//{{AFX_DATA_INIT(OnPrint)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void OnPrint::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(OnPrint)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(OnPrint, CDialog)
	//{{AFX_MSG_MAP(OnPrint)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// OnPrint message handlers
