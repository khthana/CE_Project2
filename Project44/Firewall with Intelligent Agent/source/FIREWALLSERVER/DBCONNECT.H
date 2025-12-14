// DBconnect.h: interface for the CDBconnect class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_DBCONNECT_H__2B6D5BA3_6D5E_43BD_B623_79E127CA6AAB__INCLUDED_)
#define AFX_DBCONNECT_H__2B6D5BA3_6D5E_43BD_B623_79E127CA6AAB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class CDBconnect  
{
public:
	void SetPasswd(CString ip,CString passwd); //use for changing password at first time
	void RemoveIP(CString ip);                 //Remove Client by getting IPaddr from DBpartDlg
	void SendRule(CString ipsending);          //Send ruleset to Agent by getting IPaddr from DBpartDlg
	CString GetClientList();				   //Query all Clients from Database 
	CDBconnect();
	virtual ~CDBconnect();
private:
	CString m_ruleNo;						
	CString m_SrcAddr;
	CString m_SrcMask;
	CString m_SrcPort;
	CString m_SPRange;
	CString m_DstAddr;
	CString m_DstMask;
	CString m_DstPort;
	CString m_DPRange;
	CString m_Ptcol;
	CRecordset rs;

};

#endif // !defined(AFX_DBCONNECT_H__2B6D5BA3_6D5E_43BD_B623_79E127CA6AAB__INCLUDED_)
