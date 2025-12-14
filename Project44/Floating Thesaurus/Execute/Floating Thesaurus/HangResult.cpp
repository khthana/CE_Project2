// HangResult.cpp : implementation file
//

#include "stdafx.h"
#include "Dict.h"
#include "HangResult.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CHangResult dialog


CHangResult::CHangResult(CWnd* pParent /*=NULL*/)
	: CDialog(CHangResult::IDD, pParent)
{
	//{{AFX_DATA_INIT(CHangResult)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}

CHangResult::CHangResult(int w, int l, CWnd* pParent /*=NULL*/)
	: CDialog(CHangResult::IDD, pParent)
{
	win = w;
	lose = l;
	all = win+lose;

}

void CHangResult::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CHangResult)
	DDX_Control(pDX, IDC_WIN, m_cwin);
	DDX_Control(pDX, IDC_LOSE, m_close);
	DDX_Control(pDX, IDC_ALL, m_call);
	DDX_Control(pDX, IDC_PICT, m_picture);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CHangResult, CDialog)
	//{{AFX_MSG_MAP(CHangResult)
		// NOTE: the ClassWizard will add message map macros here
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CHangResult message handlers

BOOL CHangResult::OnInitDialog()
{
	CDialog::OnInitDialog();

	m_call.SetWindowText(SetFormatInt(all));
	m_cwin.SetWindowText(SetFormatInt(win));
	m_close.SetWindowText(SetFormatInt(lose));

	if (m_picture.Load(MAKEINTRESOURCE(IDR_RESULT),_T("GIF")))
		m_picture.Draw();

	return TRUE;
}

CString CHangResult::SetFormatInt(int i)
{
	CString temp = "";
	temp.Format("%d",i);
	return temp;
}
