// Data.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Data.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CData

IMPLEMENT_DYNAMIC(CData, CDaoRecordset)

CData::CData(CDaoDatabase* pdb)
	: CDaoRecordset(pdb)
{
	//{{AFX_FIELD_INIT(CData)
	m_ID = 0;
	m_IP = _T("");
	m_Host = _T("");
	m_Id_subnet = 0;
	m_OS = 0;
	m_OSName = _T("");
	m_Mac = _T("");
	m_OpenPort = _T("");
	m_Nimda = 0;
	m_Snmp = 0;
	m_Share = 0;
	m_nFields = 11;
	//}}AFX_FIELD_INIT
	m_nDefaultType = dbOpenDynaset;
}


CString CData::GetDefaultDBName()
{
	return _T(".\\Host.mdb");
}

CString CData::GetDefaultSQL()
{
	return _T("[HostActive],[Subnet]");
}

void CData::DoFieldExchange(CDaoFieldExchange* pFX)
{
	//{{AFX_FIELD_MAP(CData)
	pFX->SetFieldType(CDaoFieldExchange::outputColumn);
	DFX_Long(pFX, _T("[ID]"), m_ID);
	DFX_Text(pFX, _T("[IP]"), m_IP);
	DFX_Text(pFX, _T("[Host]"), m_Host);
	DFX_Long(pFX, _T("[Id_subnet]"), m_Id_subnet);
	DFX_Long(pFX, _T("[OS]"), m_OS);
	DFX_Text(pFX, _T("[OSName]"), m_OSName);
	DFX_Text(pFX, _T("[Mac]"), m_Mac);
	DFX_Text(pFX, _T("[Open_Port]"), m_OpenPort);
	DFX_Long(pFX, _T("[Nimda]"), m_Nimda);
	DFX_Long(pFX, _T("[Snmp]"), m_Snmp);
	DFX_Long(pFX, _T("[Share]"), m_Share);
	//}}AFX_FIELD_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CData diagnostics

#ifdef _DEBUG
void CData::AssertValid() const
{
	CDaoRecordset::AssertValid();
}

void CData::Dump(CDumpContext& dc) const
{
	CDaoRecordset::Dump(dc);
}
#endif //_DEBUG
