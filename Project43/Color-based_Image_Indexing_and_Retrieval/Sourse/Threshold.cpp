// Threshold.cpp : implementation file
//

#include "stdafx.h"
#include "diblook.h"
#include "Threshold.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CThreshold dialog


CThreshold::CThreshold(CWnd* pParent /*=NULL*/)
	: CDialog(CThreshold::IDD, pParent)
{
	//{{AFX_DATA_INIT(CThreshold)
	m_threshold = _T("");
	//}}AFX_DATA_INIT
}


void CThreshold::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CThreshold)
	DDX_Text(pDX, IDC_TRESHOLD, m_threshold);
	DDV_MaxChars(pDX, m_threshold, 3);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CThreshold, CDialog)
	//{{AFX_MSG_MAP(CThreshold)
	ON_EN_CHANGE(IDC_TRESHOLD, OnChangeTreshold)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CThreshold message handlers


void CThreshold::OnChangeTreshold() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	
	// TODO: Add your control notification handler code here
	
}
