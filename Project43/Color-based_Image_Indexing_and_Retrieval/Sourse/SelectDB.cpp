// SelectDB.cpp : implementation file
//

#include "stdafx.h"
#include "diblook.h"
#include "SelectDB.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSelectDB dialog


CSelectDB::CSelectDB(CWnd* pParent /*=NULL*/)
	: CDialog(CSelectDB::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSelectDB)
	m_data = _T("");
	m_EditData = _T("");
	//}}AFX_DATA_INIT
}


void CSelectDB::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSelectDB)
	DDX_Control(pDX, IDC_LISTDB, m_ListDB);
	DDX_Control(pDX, IDC_EDITSELECTDB, m_EditSelectDB);
	DDX_LBString(pDX, IDC_LISTDB, m_data);
	DDX_Text(pDX, IDC_EDITSELECTDB, m_EditData);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSelectDB, CDialog)
	//{{AFX_MSG_MAP(CSelectDB)
	ON_LBN_SELCHANGE(IDC_LISTDB, OnSelchangeListdb)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSelectDB message handlers

BOOL CSelectDB::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	SetDlgItemText(IDC_EDITSELECTDB,m_EditData);
	m_ListDB.AddString("hisDB1");
	m_ListDB.AddString("hisDB2");
	m_ListDB.AddString("hisDB3");
	m_ListDB.AddString("hisDB4");
	m_ListDB.AddString("hisDB5");
	m_ListDB.AddString("Other");
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CSelectDB::OnSelchangeListdb() 
{	
	UpdateData(TRUE);
	SetDlgItemText(IDC_EDITSELECTDB,m_data);	
}

void CSelectDB::OnOK() 
{
	UpdateData(TRUE);
	CDialog::OnOK();
}
