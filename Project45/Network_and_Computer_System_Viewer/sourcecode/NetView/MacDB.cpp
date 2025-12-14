// MacDB.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "MacDB.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMacDB

IMPLEMENT_DYNAMIC(CMacDB, CDaoRecordset)

CMacDB::CMacDB(CDaoDatabase* pdb)
	: CDaoRecordset(pdb)
{
	//{{AFX_FIELD_INIT(CMacDB)
	m_Company_id = _T("");
	m_Organization = _T("");
	m_nFields = 2;
	//}}AFX_FIELD_INIT
	m_nDefaultType = dbOpenDynaset;
}


CString CMacDB::GetDefaultDBName()
{
	return _T(".\\Host.mdb");
}

CString CMacDB::GetDefaultSQL()
{
	return _T("[MacVendor]");
}

void CMacDB::DoFieldExchange(CDaoFieldExchange* pFX)
{
	//{{AFX_FIELD_MAP(CMacDB)
	pFX->SetFieldType(CDaoFieldExchange::outputColumn);
	DFX_Text(pFX, _T("[Company_id]"), m_Company_id);
	DFX_Text(pFX, _T("[Organization]"), m_Organization);
	//}}AFX_FIELD_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CMacDB diagnostics

#ifdef _DEBUG
void CMacDB::AssertValid() const
{
	CDaoRecordset::AssertValid();
}

void CMacDB::Dump(CDumpContext& dc) const
{
	CDaoRecordset::Dump(dc);
}
#endif //_DEBUG
