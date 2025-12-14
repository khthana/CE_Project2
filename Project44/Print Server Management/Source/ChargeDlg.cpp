// ChargeDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Basic.h"
#include "ChargeDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CChargeDlg dialog


CChargeDlg::CChargeDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CChargeDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CChargeDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CChargeDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CChargeDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CChargeDlg, CDialog)
	//{{AFX_MSG_MAP(CChargeDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CChargeDlg message handlers
