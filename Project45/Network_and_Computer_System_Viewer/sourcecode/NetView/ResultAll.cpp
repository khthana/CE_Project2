// ResultAll.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "ResultAll.h"
#include "Data.h"
#include "MacDB.h"
#include "Redirect.h"
#include "WWaitTarget.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CResultAll dialog


CResultAll::CResultAll(CWnd* pParent /*=NULL*/)
	: CDialog(CResultAll::IDD, pParent)
{
	//{{AFX_DATA_INIT(CResultAll)
	//}}AFX_DATA_INIT
}


void CResultAll::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CResultAll)
	DDX_Control(pDX, IDC_EDIT1, m_Edit1);
	DDX_Control(pDX, IDC_LIST1, m_clist);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CResultAll, CDialog)
	//{{AFX_MSG_MAP(CResultAll)
	ON_WM_CLOSE()
	ON_WM_TIMER()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CResultAll message handlers

BOOL CResultAll::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	CWWaitTarget wait;
	wait.Show();

	CMacDB mdb;
	CData db;

	LV_COLUMN column;
	LVITEM item;
	CImageList *imgnormal;


	imgnormal=new CImageList();
	imgnormal->Create(32,32,ILC_COLOR32,2,0);
	imgnormal->Add(AfxGetApp()->LoadIcon(IDI_ICON1));
	imgnormal->Add(AfxGetApp()->LoadIcon(IDI_ICON2));
	imgnormal->Add(AfxGetApp()->LoadIcon(IDI_ICON3));
	imgnormal->Add(AfxGetApp()->LoadIcon(IDI_ICON4));

	m_clist.SetImageList(imgnormal,LVSIL_SMALL);

	column.mask=LVCF_FMT|LVCF_SUBITEM|LVCF_TEXT|LVCF_WIDTH;
	column.fmt=LVCFMT_LEFT;
	column.pszText="Topic";
	column.iSubItem=0;
	column.cx=125;
	m_clist.InsertColumn(0,&column);

	column.pszText="Detail";
	column.iSubItem=1;
	column.cx=220;
	m_clist.InsertColumn(1,&column);

	int i;
	CString sql,buf,find_os;
	LPTSTR ptr;
	sql="Select * From HostActive Where IP='"+nIP+"'";
	db.Open(dbOpenDynaset,_T(sql));

	//Processor
	item.mask=LVIF_TEXT|LVIF_IMAGE;
	item.iItem=0;
	item.iSubItem=0;
	item.iImage=3;
	item.pszText="Host Name";
	i=m_clist.InsertItem(&item);

	item.mask=LVIF_TEXT;
	item.iItem=i;
	item.iSubItem=1;
	buf=db.m_Host;
	ptr=buf.LockBuffer();
	item.pszText=ptr;
	buf.UnlockBuffer();
	m_clist.SetItem(&item);

	//Operating System
	if(db.m_OSName=="")
	{
		db.Close();
		find_os = ".\\bin\\nmap-3.00\\nmap.exe -O " + nIP;
		CRedirect Redirect(find_os, &m_Edit1);
		//SetTimer(TimerNUM,1000,NULL);
		Redirect.Run();
		Redirect.Stop();
		FindOS();
		sql="Select * From HostActive Where IP='"+nIP+"'";
		db.Open(dbOpenDynaset,_T(sql));
		
	}

	item.mask=LVIF_TEXT|LVIF_IMAGE;
	item.iItem=1;
	item.iSubItem=0;
	item.iImage=1;
	item.pszText="Operating System";
	i=m_clist.InsertItem(&item);

	item.mask=LVIF_TEXT;
	item.iItem=i;
	item.iSubItem=1;
	buf=db.m_OSName;
	ptr=buf.LockBuffer();
	item.pszText=ptr;
	buf.UnlockBuffer();
	m_clist.SetItem(&item);

	//MAC Address
	item.mask=LVIF_TEXT|LVIF_IMAGE;
	item.iItem=2;
	item.iSubItem=0;
	item.iImage=2;
	item.pszText="MAC Address";
	i=m_clist.InsertItem(&item);

	item.mask=LVIF_TEXT;
	item.iItem=i;
	item.iSubItem=1;
	buf=db.m_Mac;
	ptr=buf.LockBuffer();

	LPTSTR ptr1;

	item.pszText=_strupr(ptr);
	ptr1=_strupr(ptr);
	buf.UnlockBuffer();
	m_clist.SetItem(&item);
	
	buf=(LPTSTR)ptr1;
	CString nvendor;
	nvendor=buf.Mid(0,8);

	sql="Select * From MacVendor Where Company_id='"+nvendor+"'";
	mdb.Open(dbOpenDynaset,_T(sql));
	
	//NetworkCard
	item.mask=LVIF_TEXT|LVIF_IMAGE;
	item.iItem=3;
	item.iSubItem=0;
	item.iImage=2;
	item.pszText="Network Card";
	i=m_clist.InsertItem(&item);

	item.mask=LVIF_TEXT;
	item.iItem=i;
	item.iSubItem=1;
	buf=mdb.m_Organization;
	ptr=buf.LockBuffer();
	item.pszText=ptr;
	buf.UnlockBuffer();
	m_clist.SetItem(&item);
	// TODO: Add extra initialization here
	db.Close();
	mdb.Close();
	wait.Close ();
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CResultAll::FindOS()
{
	int whereOSStart=0;
	int whereOSStop=0;
	int pos_host1;
	int pos_host2;
//	int checkfind;
	int wherePortStart=0;
	int wherePortStop=0;

	CString strTemp;
	CString OS,Op;
	CString host,sql;
	CData db;
	
	m_Edit1.GetWindowText(strTemp);

	whereOSStart = strTemp.Find("guess");
	whereOSStart = strTemp.Find(" ",whereOSStart)+1;
	whereOSStop = strTemp.Find("\n",whereOSStart);

	pos_host1 = strTemp.Find("Interesting ports on")+21;
	pos_host2 = strTemp.Find(" (",pos_host1);
	host = strTemp.Mid(pos_host1,pos_host2-pos_host1);
	sql="Select * From HostActive Where Host='"+host+"'";
	db.Open(dbOpenDynaset,_T(sql));
	OS = strTemp.Mid(whereOSStart,whereOSStop-whereOSStart);
	db.Edit();

	wherePortStart = strTemp.Find("Service",wherePortStop);
	wherePortStop = strTemp.Find("Remote",wherePortStart);
	Op = strTemp.Mid(wherePortStart+8,wherePortStop-(wherePortStart+8));
	Op.Replace("open    ","");
	db.m_OpenPort=Op;
	
	if(OS.Find("Windows")!=-1)
		db.m_OS=1;
	else if(OS.Find("Linux")!=-1)
		db.m_OS=2;
	else if(OS.Find("Mac")!=-1)
		db.m_OS=3;
	else if(OS.Find("BSD")!=-1)
		db.m_OS=4;
	else if((OS.Find("Laser")!=-1)||(OS.Find("printer")!=-1)||(OS.Find("Printer")!=-1)||(OS.Find("Jet")!=-1))
		db.m_OS=6;
	else if(OS.Find("Cisco")!=-1)
		db.m_OS=7;

	db.m_OSName=OS;
	db.Update();
	db.Close();
	m_Edit1.Clear();
}

void CResultAll::OnClose() 
{
	// TODO: Add your message handler code here and/or call default
	
	CDialog::OnClose();
}

void CResultAll::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	sec++;
	if (sec==120)
	{
		MessageBox("Can't find OS","Error",MB_OK);
		CDialog::OnOK();
	}

	CDialog::OnTimer(nIDEvent);
}
