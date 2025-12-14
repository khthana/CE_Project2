// Port.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Port.h"
#include "Data.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CPort dialog


CPort::CPort(CWnd* pParent /*=NULL*/)
	: CDialog(CPort::IDD, pParent)
{
	//{{AFX_DATA_INIT(CPort)
	m_OpenPort = _T("");
	//}}AFX_DATA_INIT
}


void CPort::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CPort)
	DDX_Text(pDX, IDC_EDIT1, m_OpenPort);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CPort, CDialog)
	//{{AFX_MSG_MAP(CPort)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CPort message handlers

BOOL CPort::OnInitDialog() 
{
	CDialog::OnInitDialog();
	CString sql;
	CData db;
	// TODO: Add extra initialization here
	sql="Select * From HostActive Where IP='"+Oport+"'";
	db.Open(dbOpenDynaset,_T(sql));
	m_OpenPort=db.m_OpenPort;
	UpdateData(FALSE);
	db.Close();
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
