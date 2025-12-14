// Snmp.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Snmp.h"
#include "Redirect.h"
#include "WWaitTarget.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSnmp dialog


CSnmp::CSnmp(CWnd* pParent /*=NULL*/)
	: CDialog(CSnmp::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSnmp)
	m_snmp = _T("");
	//}}AFX_DATA_INIT
}


void CSnmp::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSnmp)
	DDX_Control(pDX, IDC_EDIT2, m_Edit2);
	DDX_Control(pDX, IDC_TREE1, m_ctree);
	DDX_Text(pDX, IDC_EDIT1, m_snmp);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CSnmp, CDialog)
	//{{AFX_MSG_MAP(CSnmp)
	ON_NOTIFY(TVN_SELCHANGED, IDC_TREE1, OnSelchangedTree1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSnmp message handlers

BOOL CSnmp::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here

	CWWaitTarget wait;
	wait.Show();

	TV_INSERTSTRUCT insert;
	HTREEITEM htreeitem;

	CImageList *img;
	CBitmap bmp;
	CString buf;
	
	CString temp;
	CString variable;
	CString value;
	CString OID[8];
	OID[0] = "system.sysDescr.0";
	OID[1] = "system.sysServices.0";
	OID[2] = "system.sysName.0";
	OID[3] = "system.sysLocation.0";
	OID[4] = "system.sysContact.0";
	OID[5] = "system.sysUpTime.0";
	OID[6] = "server.svShareTable.svShareEntry.svShareName.0";
	OID[7] = "interfaces.ifNumber.0";
	
	buf = ".\\bin\\snmputil\\check.exe get " + nIP + " public " + OID[0];
	CRedirect Redirect(buf, &m_Edit2);
	Redirect.Run();
	m_Edit2.GetWindowText(temp);
	if (temp.Find("error")==-1)
	{
		m_Edit2.SetWindowText("");
		for(int i=0;i<8;i++)
		{
			int start;
			int stop;
			int startvalue;
			buf = ".\\bin\\snmputil\\snmputil.exe get " + nIP + " public " + OID[i];
			CRedirect Redirect(buf, &m_Edit2);
			Redirect.Run();

			m_Edit2.GetWindowText(temp);
		
			start = temp.Find("Variable",0);
			stop = temp.Find("Value",start);
			variable = temp.Mid(start+11,stop-(start+11));
		
			start = temp.Find("Value",0);
			startvalue = temp.Find("= ",start);
			stop = temp.Find("\n",start);
			snmp[i]="";
			snmp[i] = temp.Mid(start+11,stop-(start+11));
			m_Edit2.SetWindowText("");
		}
	}
	else
	{
		MessageBox("SNMP not open","Result",MB_OK);
		EndDialog(0);
	}
	img=new CImageList();
	img->Create(20,20,ILC_MASK,5,0);

	bmp.LoadBitmap(IDB_BITMAP8);
	img->Add(&bmp,RGB(255,255,255));
	bmp.DeleteObject();

	bmp.LoadBitmap(IDB_BITMAP9);
	img->Add(&bmp,RGB(255,255,255));
	bmp.DeleteObject();

	m_ctree.SetImageList(img,TVSIL_NORMAL);

	
	insert.hParent=NULL;
	insert.hInsertAfter=TVI_LAST;
	insert.item.mask=TVIF_IMAGE|TVIF_SELECTEDIMAGE|TVIF_TEXT;
	insert.item.iImage=0;
	insert.item.iSelectedImage=0;
	insert.item.pszText="System";
	htreeitem=m_ctree.InsertItem(&insert);

	insert.hParent=htreeitem;
	insert.item.iImage=1;
	insert.item.iSelectedImage=1;
	LPTSTR ptr;
	for(int i=0;i<7;i++)
	{
		ptr=OID[i].LockBuffer();
		insert.item.pszText=ptr;
		OID[i].UnlockBuffer();
		if(i==5)
			htreeitem=m_ctree.InsertItem(&insert);
		else
			m_ctree.InsertItem(&insert);
	}
	
	insert.hParent=NULL;
	insert.hInsertAfter=TVI_LAST;
	insert.item.mask=TVIF_IMAGE|TVIF_SELECTEDIMAGE|TVIF_TEXT;
	insert.item.iImage=0;
	insert.item.iSelectedImage=0;
	insert.item.pszText="Interfaces";
	htreeitem=m_ctree.InsertItem(&insert);

	insert.hParent=htreeitem;
	insert.item.iImage=1;
	insert.item.iSelectedImage=1;
	insert.item.pszText="interfaces.ifNumber.0";
	htreeitem=m_ctree.InsertItem(&insert);
	
	m_ctree.Expand(htreeitem,TVE_EXPAND);

	wait.Close();

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

void CSnmp::OnSelchangedTree1(NMHDR* pNMHDR, LRESULT* pResult) 
{
	NM_TREEVIEW* pNMTreeView = (NM_TREEVIEW*)pNMHDR;
	// TODO: Add your control notification handler code here
	HTREEITEM htreeitem;
	CString buf;
	htreeitem = m_ctree.GetSelectedItem();
	buf=m_ctree.GetItemText(htreeitem);
	if(buf=="system.sysDescr.0")
		m_snmp=snmp[0];
	else if(buf=="system.sysServices.0")
		m_snmp=snmp[1];
	else if(buf=="system.sysName.0")
		m_snmp=snmp[2];
	else if(buf=="system.sysLocation.0")
		m_snmp=snmp[3];
	else if(buf=="system.sysContact.0")
		m_snmp=snmp[4];
	else if(buf=="system.sysUpTime.0")
		m_snmp=snmp[5];
	else if(buf=="server.svShareTable.svShareEntry.svShareName.0")
		m_snmp=snmp[6];
	else if(buf=="interfaces.ifNumber.0")
		m_snmp=snmp[7];
	else
		m_snmp="";
	UpdateData(FALSE);
	*pResult = 0;
}
