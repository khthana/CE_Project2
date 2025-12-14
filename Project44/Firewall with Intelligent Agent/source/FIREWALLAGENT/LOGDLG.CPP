// LogDlg.cpp : implementation file
//

#include "stdafx.h"
#include "FirewallAgent.h"
#include "LogDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLogDlg dialog


CLogDlg::CLogDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLogDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLogDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT

}


void CLogDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLogDlg)
	DDX_Control(pDX, IDC_LOGLIST, m_loglist);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CLogDlg, CDialog)
	//{{AFX_MSG_MAP(CLogDlg)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLogDlg message handlers

BOOL CLogDlg::OnInitDialog() 
{

	CDialog::OnInitDialog();
    CString buf;
    CFont font;
	font.CreateFont(20,0,0,0,400,0,0,0,ANSI_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,DEFAULT_PITCH,"Lucida Console");
	m_loglist.SetFont(&font);
	while (Log.GetLength()>5)
	{
	buf = Log;
	int end = Log.Find("\n\r");
    Log.Delete(0,end+2);
	buf.Delete(end+1,Log.GetLength()-1);
	//m_loglist.AddString(buf);
	
    
	for(int k=0;k<11;k++)
	{   int space = buf.Find(" ");
        CString str;
		str = buf;
		str.Delete(space,buf.GetLength()-space);
		buf.Delete(0,space+1);
		while (buf.Find(" ") == 0)
			buf.Delete(0,1);

	    switch (k)
		{
		case 0  : m_rule = str;
		          break;
		case 1  : m_srcaddr = str;
				  break;
		case 2  : m_srcmask = str;
			      break;
		case 3  : m_srcport = str;
			      break;
		case 4  : m_sprange = str;
			      break;
		case 5  : m_dstaddr = str;
			      break;
		case 6  : m_dstmask = str;
			      break;
		case 7  : m_dstport = str;
			      break;
		case 8  : m_dprange = str;
			      break;
		case 9  : m_protocol = str;
			      break;
		case 10 : m_nofilter.Format("%s",str);
			      break;
		} // end switch
	} // end for


	int a,b,c,d,e,f,g,h,o;
	CString rulelist="";
	
	
	a = m_srcaddr.GetLength();
	for(int j=a;j<15;j++)
	{  m_srcaddr=m_srcaddr+"  ";}
	b = m_srcmask.GetLength();
	if (b>0)
	{
	for(j=b;j<15;j++)
	{  m_srcmask=m_srcmask+"  ";}
	}
	m_srcmask=m_srcmask+"  ";
	
	c = m_srcport.Find(" ");
	for(j=c;j<5;j++)
	{  m_srcport=m_srcport+" ";}
	d = m_sprange.Find(" ");
	for(j=d;j<5;j++)
	{  m_sprange=m_sprange+" ";}
	e = m_dstaddr.GetLength();
	for(j=e;j<15;j++)
	{  m_dstaddr=m_dstaddr+"  ";}
	f = m_dstmask.GetLength();
	if (f>0)
	{
	for(j=f;j<15;j++)
	{  m_dstmask=m_dstmask+"  ";}
	}
	m_dstmask=m_dstmask+"  ";
	g = m_dstport.Find(" ");
	for(j=g;j<5;j++)
	{  m_dstport=m_dstport+" ";}
	h = m_dprange.Find(" ");
	for(j=h;j<5;j++)
	{  m_dprange=m_dprange+" ";}
	o = m_protocol.Find(" ");
	for(j=o;j<5;j++)
	{  m_protocol=m_protocol+" ";}

	
	rulelist = m_rule + "  " + m_srcaddr + m_srcmask + m_srcport + 
		m_sprange + m_dstaddr + m_dstmask + m_dstport + m_dprange + 
		"  " + m_protocol + " " + m_nofilter;
		
	m_loglist.AddString(rulelist);
	

	} // end while
	return TRUE;  
}



void CLogDlg::GetLog(CString buffer)
{
   Log = buffer;
   
}
