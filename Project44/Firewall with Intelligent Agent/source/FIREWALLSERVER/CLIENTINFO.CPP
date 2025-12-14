// ClientInfo.cpp : implementation file
//

#include "stdafx.h"
#include "firewallserver.h"
#include "ClientInfo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CClientInfo dialog


CClientInfo::CClientInfo(CWnd* pParent /*=NULL*/)
	: CDialog(CClientInfo::IDD, pParent)
{
	//{{AFX_DATA_INIT(CClientInfo)
	m_group = _T("");
	m_ipaddr = _T("");
	m_row = _T("");
	//}}AFX_DATA_INIT
}


void CClientInfo::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CClientInfo)
	DDX_Control(pDX, IDC_RULELIST, m_rulelist);
	DDX_Control(pDX, IDC_GROUP, m_cngroup);
	DDX_Text(pDX, IDC_GROUP, m_group);
	DDX_Text(pDX, IDC_IPADDR, m_ipaddr);
	DDX_LBString(pDX, IDC_RULELIST, m_row);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CClientInfo, CDialog)
	//{{AFX_MSG_MAP(CClientInfo)
	ON_EN_CHANGE(IDC_GROUP, OnChangeGroup)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CClientInfo message handlers

BOOL CClientInfo::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	m_ipaddr = ipaddr;                               // m_ipaddr get IP from DBpartDlg via GetIPAddr function
	CString buffer;
	buffer.Format("SELECT [Client].[Group] FROM [Client] WHERE ClientIP = '"+ipaddr+"'");
    rs.m_pDatabase = &(theApp.m_db);
	rs.Open(CRecordset::forwardOnly,buffer);
	rs.GetFieldValue("Group",m_group);
	rs.Close();

	CFont font;                                      // Set font that will be displayed on Dialog
	font.CreateFont(20,0,0,0,400,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH,"Lucida Console");
	m_rulelist.SetFont(&font);
	buffer.Format("SELECT * FROM [Rule] WHERE [Rule] in (SELECT [Rule] FROM [Ruleset] WHERE [Group]=(SELECT [Group] FROM [Client] WHERE ClientIP='"+ipaddr+"'))"); 
	rs.Open(CRecordset::forwardOnly,buffer);
	i=0;  // count number of rules
	while (i<rs.GetRecordCount())
	{
		/* Get all column one row/time from Rule Table */
		CString rulelist="";                         // rulelist is composed of all column in each row
		rs.GetFieldValue("Rule",m_rule);
	    rs.GetFieldValue("SrcAddr",m_srcaddr);
	    rs.GetFieldValue("SrcMask",m_srcmask);
	    rs.GetFieldValue("SrcPort",m_srcport);
	    rs.GetFieldValue("SPRange",m_sprange);
	    rs.GetFieldValue("DstAddr",m_dstaddr);
	    rs.GetFieldValue("DstMask",m_dstmask);
	    rs.GetFieldValue("DstPort",m_dstport);
	    rs.GetFieldValue("DPRange",m_dprange);
	    rs.GetFieldValue("Ptcol",m_protocol);
		rs.MoveNext();

		/* Each variable has different size 
		   these use to make the data display in perfect order*/
		int a,b,c,d,e,f,g,h;
		a = m_srcaddr.Find(" ");
		for(int j=a;j<16;j++)
		{  m_srcaddr=m_srcaddr+" ";}
		b = m_srcmask.Find(" ");
		if (b>0)
		{
		for(j=b;j<15;j++)
		{  m_srcmask=m_srcmask+" ";}
		}
		m_srcmask=m_srcmask+"  ";
		c = m_srcport.Find(" ");
		for(j=c;j<5;j++)
		{  m_srcport=m_srcport+" ";}
		d = m_sprange.Find(" ");
		for(j=d;j<5;j++)
		{  m_sprange=m_sprange+" ";}
		e = m_dstaddr.Find(" ");
		for(j=e;j<16;j++)
		{  m_dstaddr=m_dstaddr+" ";}
		f = m_dstmask.Find(" ");
		if (f>0)
		{
		for(j=f;j<15;j++)
		{  m_dstmask=m_dstmask+" ";}
		}
		m_dstmask=m_dstmask+"  ";
		g = m_dstport.Find(" ");
		for(j=g;j<5;j++)
		{  m_dstport=m_dstport+" ";}
		h = m_dprange.Find(" ");
		for(j=h;j<5;j++)
		{  m_dprange=m_dprange+" ";}
        /* end for making variable size */

		rulelist = m_rule+"  "+m_srcaddr+m_srcmask+m_srcport+m_sprange+m_dstaddr+m_dstmask+m_dstport+m_dprange+"  "+m_protocol;
		i++;
		m_rulelist.AddString(rulelist);					 // Add rulelist in Listbox
	}
	rs.Close();
	UpdateData(FALSE);
	return TRUE;  
}

void CClientInfo::GetIPAddr(CString ip)
{
	ipaddr = ip;                                         // Get "ip" from DBpartDlg 
}

/* OnChangeGroup is used when changing group for Client ( Update group for Client) */
void CClientInfo::OnChangeGroup()
{
    UpdateData(TRUE);
	CString buffer;
	rs.Close();
	buffer.Format("UPDATE Client SET [Group]="+m_group+" WHERE ClientIP ='"+m_ipaddr+"'");
    theApp.m_db.ExecuteSQL(buffer);

 
	for(int j=1;j<=i;j++)
	m_rulelist.DeleteString(0);
	CFont font;											 // Set font that will be displayed on Dialog
	font.CreateFont(20,0,0,0,400,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH,"Lucida Console");
	m_rulelist.SetFont(&font);
	//buffer.Format("{CALL ipinfo(\'%s\')}",ipaddr);       // Get ruleset of specifying ipaddr --ipinfo is a stored procedure
	buffer.Format("SELECT * FROM [Rule] WHERE [Rule] in (SELECT [Rule] FROM [Ruleset] WHERE [Group]=(SELECT [Group] FROM [Client] WHERE ClientIP='"+ipaddr+"'))"); 
	rs.m_pDatabase = &(theApp.m_db);
	rs.Open(CRecordset::forwardOnly,buffer);
	int i=0;
	while (i<rs.GetRecordCount())
	{
	
		CString rulelist="";
		rs.GetFieldValue("Rule",m_rule);
	    rs.GetFieldValue("SrcAddr",m_srcaddr);
	    rs.GetFieldValue("SrcMask",m_srcmask);
	    rs.GetFieldValue("SrcPort",m_srcport);
	    rs.GetFieldValue("SPRange",m_sprange);
	    rs.GetFieldValue("DstAddr",m_dstaddr);
	    rs.GetFieldValue("DstMask",m_dstmask);
	    rs.GetFieldValue("DstPort",m_dstport);
	    rs.GetFieldValue("DPRange",m_dprange);
	    rs.GetFieldValue("Ptcol",m_protocol);
		rs.MoveNext();
		/* Each variable has different size 
		   these use to make the data display in perfect order*/
		int a,b,c,d,e,f,g,h;
		a = m_srcaddr.Find(" ");
		for(int j=a;j<16;j++)
		{  m_srcaddr=m_srcaddr+" ";}
		b = m_srcmask.Find(" ");
		if (b>0)
		{
		for(j=b;j<15;j++)
		{  m_srcmask=m_srcmask+" ";}
		}
		m_srcmask=m_srcmask+"  ";
		c = m_srcport.Find(" ");
		for(j=c;j<5;j++)
		{  m_srcport=m_srcport+" ";}
		d = m_sprange.Find(" ");
		for(j=d;j<5;j++)
		{  m_sprange=m_sprange+" ";}
		e = m_dstaddr.Find(" ");
		for(j=e;j<16;j++)
		{  m_dstaddr=m_dstaddr+" ";}
		f = m_dstmask.Find(" ");
		if (f>0)
		{
		for(j=f;j<15;j++)
		{  m_dstmask=m_dstmask+" ";}
		}
		m_dstmask=m_dstmask+"  ";
		g = m_dstport.Find(" ");
		for(j=g;j<5;j++)
		{  m_dstport=m_dstport+" ";}
		h = m_dprange.Find(" ");
		for(j=h;j<5;j++)
		{  m_dprange=m_dprange+" ";}
		/* end for making variable size */
		rulelist = m_rule+"  "+m_srcaddr+m_srcmask+m_srcport+m_sprange+m_dstaddr+m_dstmask+m_dstport+m_dprange+"  "+m_protocol;
		i++;
		m_rulelist.AddString(rulelist);
	}
	
	rs.Close();
	UpdateData(FALSE);

	

}

