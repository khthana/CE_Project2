// SetCreditDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Basic.h"
#include "SetCreditDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSetCreditDlg dialog


CSetCreditDlg::CSetCreditDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSetCreditDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSetCreditDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CSetCreditDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSetCreditDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSetCreditDlg, CDialog)
	//{{AFX_MSG_MAP(CSetCreditDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSetCreditDlg message handlers
