// DlgEnterClass.cpp : implementation file
//

#include "stdafx.h"
#include "Project1.h"
#include "DlgEnterClass.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgEnterClass dialog


CDlgEnterClass::CDlgEnterClass(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgEnterClass::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgEnterClass)
	m_ClassName = _T("");
	//}}AFX_DATA_INIT
}


void CDlgEnterClass::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgEnterClass)
	DDX_Control(pDX, IDC_EDIT1, m_Edit1);
	DDX_Control(pDX, IDOK, m_ButtonOk);
	DDX_Text(pDX, IDC_EDIT1, m_ClassName);
	DDV_MaxChars(pDX, m_ClassName, 40);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgEnterClass, CDialog)
	//{{AFX_MSG_MAP(CDlgEnterClass)
	ON_EN_CHANGE(IDC_EDIT1, OnChangeEdit1)
	ON_EN_MAXTEXT(IDC_EDIT1, OnMaxtextEdit1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgEnterClass message handlers

BOOL CDlgEnterClass::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_ButtonOk.EnableWindow(false);
	
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CDlgEnterClass::OnChangeEdit1() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CDialog::OnInitDialog()
	// function and call CRichEditCtrl().SetEventMask()
	// with the ENM_CHANGE flag ORed into the mask.
	
	// TODO: Add your control notification handler code here
	
	UpdateData(true);
	if(m_ClassName.GetLength()==0)
		m_ButtonOk.EnableWindow(false);
	else 
		m_ButtonOk.EnableWindow(true);
}

void CDlgEnterClass::OnMaxtextEdit1() 
{
	// TODO: Add your control notification handler code here
	MessageBox("Limit 40 Characters","Enter Image's Class");
}
