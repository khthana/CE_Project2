// AddcreditDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Basic.h"
#include "AddcreditDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CAddcreditDlg dialog


CAddcreditDlg::CAddcreditDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAddcreditDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAddcreditDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CAddcreditDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAddcreditDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CAddcreditDlg, CDialog)
	//{{AFX_MSG_MAP(CAddcreditDlg)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAddcreditDlg message handlers
