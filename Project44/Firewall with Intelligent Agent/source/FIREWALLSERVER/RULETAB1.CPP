// RuleTab1.cpp : implementation file
//

#include "stdafx.h"
#include "firewallserver.h"
#include "RuleTab1.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRuleTab dialog


CRuleTab::CRuleTab(CWnd* pParent /*=NULL*/)
	: CDialog(CRuleTab::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRuleTab)
	m_row = _T("");
	//}}AFX_DATA_INIT
	m_pRuleRecord = new CRuleRecord();
}


void CRuleTab::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRuleTab)
	DDX_Control(pDX, IDC_RULELIST, m_rulelist);
	DDX_Control(pDX, IDC_NEW, m_bNew);
	DDX_LBString(pDX, IDC_RULELIST, m_row);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRuleTab, CDialog)
	//{{AFX_MSG_MAP(CRuleTab)
	ON_BN_CLICKED(IDC_NEW, OnNew)
	ON_LBN_DBLCLK(IDC_RULELIST, OnDblclkRulelist)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRuleTab message handlers

/* DoubleClick on any Rule , RuleRecord Dialog will appear for updating 
   All data in that row is "m_row" will be sent to GetRule in RuleRecord Dialog */
void CRuleTab::OnDblclkRulelist() 
{
	int position=m_rulelist.GetCurSel();
	UpdateData(TRUE);
	m_rulelist.GetText(position,m_row);
	EndDialog(0);
	m_pRuleRecord->GetRule(m_row);
	m_pRuleRecord->DoModal();	
}


BOOL CRuleTab::OnInitDialog() 
{
	CDialog::OnInitDialog();
	CRecordset rs;
	CString buffer;
	CFont font;								 // Set font that will be displayed on ListBox
	font.CreateFont(20,0,0,0,400,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH,"Lucida Console");
	m_rulelist.SetFont(&font);
	buffer.Format("SELECT * FROM [Rule]");   // Get all rule in Rule Table
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
	return TRUE;  
}

/* Add New Rule by using RuleRecord Dialog 
   Click "New Rule" button RuleRecord Dialog will appear
   In this case , m_row = "" */
void CRuleTab::OnNew() 
{   
	EndDialog(0);
	m_pRuleRecord->GetRule(m_row);
	m_pRuleRecord->DoModal();
	
	
}
