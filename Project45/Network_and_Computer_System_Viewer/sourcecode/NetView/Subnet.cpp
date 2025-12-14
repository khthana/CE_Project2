// Subnet.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Subnet.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSubnet

IMPLEMENT_DYNAMIC(CSubnet, CDaoRecordset)

CSubnet::CSubnet(CDaoDatabase* pdb)
	: CDaoRecordset(pdb)
{
	//{{AFX_FIELD_INIT(CSubnet)
	m_ID = 0;
	m_Subnet = _T("");
	m_nFields = 2;
	//}}AFX_FIELD_INIT
	m_nDefaultType = dbOpenDynaset;
}


CString CSubnet::GetDefaultDBName()
{
	return _T(".\\Host.mdb");
}

CString CSubnet::GetDefaultSQL()
{
	return _T("[Subnet]");
}

void CSubnet::DoFieldExchange(CDaoFieldExchange* pFX)
{
	//{{AFX_FIELD_MAP(CSubnet)
	pFX->SetFieldType(CDaoFieldExchange::outputColumn);
	DFX_Long(pFX, _T("[ID]"), m_ID);
	DFX_Text(pFX, _T("[Subnet]"), m_Subnet);
	//}}AFX_FIELD_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CSubnet diagnostics

#ifdef _DEBUG
void CSubnet::AssertValid() const
{
	CDaoRecordset::AssertValid();
}

void CSubnet::Dump(CDumpContext& dc) const
{
	CDaoRecordset::Dump(dc);
}
#endif //_DEBUG
