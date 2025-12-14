// DBconnect.cpp: implementation of the CDBconnect class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "firewallserver.h"
#include "DBconnect.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////
// DBconnect doen't have it own dialog , just query data from database & send the data to DBpartDlg
CDBconnect::CDBconnect()
{

}

CDBconnect::~CDBconnect()
{

}
/* Get ClientList -- Query all Clients from Database 
   Return all_ip */
CString CDBconnect::GetClientList()
{
	CString buffer;
	buffer.Format("SELECT ClientIP FROM [Client]"); 

    CString all_ip;								// list of all IP
	CString m_ip;								// Get one ipaddr at one time 

	rs.m_pDatabase = &(theApp.m_db);
	rs.Open(CRecordset::forwardOnly,buffer);

	int i=0;
	while (i<rs.GetRecordCount())
	{
	rs.GetFieldValue("ClientIP",m_ip);
	all_ip = all_ip + m_ip+ " " ;
	rs.MoveNext();
	i++;
	}
	rs.Close();
	CString tempi;
	tempi.Format("%d",i);
    all_ip = tempi+" "+all_ip;
	return all_ip;
}

/* Send ruleset to Agent by getting IPaddr from DBpartDlg */
void CDBconnect::SendRule(CString ipsending)
{
	CString buffer;

	buffer.Format("SELECT * FROM [Rule] WHERE [Rule] in (SELECT [Rule] FROM [Ruleset] WHERE [Group]=(SELECT [Group] FROM [Client] WHERE ClientIP='"+ipsending+"'))"); 
    rs.m_pDatabase = &(theApp.m_db);
	rs.Open(CRecordset::forwardOnly,buffer);
	int i=0;
	CString rule="";
	while (i<rs.GetRecordCount())				
	{
	rs.GetFieldValue("Rule", m_ruleNo);	
	rs.GetFieldValue("SrcAddr",m_SrcAddr);
	rs.GetFieldValue("SrcMask",m_SrcMask);
	rs.GetFieldValue("SrcPort",m_SrcPort);
	rs.GetFieldValue("SPRange",m_SPRange);
	rs.GetFieldValue("DstAddr",m_DstAddr);
	rs.GetFieldValue("DstMask",m_DstMask);
	rs.GetFieldValue("DstPort",m_DstPort);
	rs.GetFieldValue("DPRange",m_DPRange);
	rs.GetFieldValue("Ptcol",m_Ptcol);
	rule = rule+m_ruleNo+" "+m_SrcAddr+" "+m_SrcMask+" "+m_SrcPort+" "+m_SPRange+" "+m_DstAddr+" "+m_DstMask+" "+m_DstPort+" "+m_DPRange+" "+m_Ptcol+"\n\r";
	rs.MoveNext();
	i++;
	}
	rs.Close();
	CStdioFile WriteFile("rule.txt", CFile::modeCreate|CFile::modeWrite);  // write ruleset to rule.txt
    WriteFile.WriteString(rule);
	WriteFile.Close();
	theApp.SendRuleSet(ipsending);							// Send ipaddr to SendRuleSet when "Start Filter" button is clicked

}


/* Remove Client by getting IPaddr from DBpartDlg */ 
void CDBconnect::RemoveIP(CString ip)
{
	CString buffer;
	buffer.Format("DELETE FROM Client WHERE ClientIP = '"+ip+"'");
    theApp.m_db.ExecuteSQL(buffer);
	MessageBox(NULL,ip+" has been deleted","Remove IP",MB_OK);
}

/* use for changing password at first time 
   Anyway , this function isn't used right now */
void CDBconnect::SetPasswd(CString ip, CString passwd)
{
	CString buffer;
	buffer.Format("INSERT INTO IPPasswd (ClientIP,Passwd) VALUES ('"+ip+"','"+passwd+"')");
	theApp.m_db.ExecuteSQL(buffer);
	MessageBox(NULL,"Insert Completed","Message",NULL);
	
}

