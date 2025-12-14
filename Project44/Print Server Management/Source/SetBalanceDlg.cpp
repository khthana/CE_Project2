// SetBalanceDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Basic.h"
#include "SetBalanceDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSetBalanceDlg dialog


CSetBalanceDlg::CSetBalanceDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSetBalanceDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSetBalanceDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CSetBalanceDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSetBalanceDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSetBalanceDlg, CDialog)
	//{{AFX_MSG_MAP(CSetBalanceDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSetBalanceDlg message handlers
