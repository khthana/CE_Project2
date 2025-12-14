// Stat.cpp : implementation file
//

#include "stdafx.h"
#include "NetView.h"
#include "Stat.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CStat

IMPLEMENT_DYNAMIC(CStat, CDaoRecordset)

CStat::CStat(CDaoDatabase* pdb)
	: CDaoRecordset(pdb)
{
	//{{AFX_FIELD_INIT(CStat)
	m_IP = _T("");
	m_Time = _T("");
	m_Date = _T("");
	m_nFields = 3;
	//}}AFX_FIELD_INIT
	m_nDefaultType = dbOpenDynaset;
}


CString CStat::GetDefaultDBName()
{
	return _T(".\\Host.mdb");
}

CString CStat::GetDefaultSQL()
{
	return _T("[Stat]");
}

void CStat::DoFieldExchange(CDaoFieldExchange* pFX)
{
	//{{AFX_FIELD_MAP(CStat)
	pFX->SetFieldType(CDaoFieldExchange::outputColumn);
	DFX_Text(pFX, _T("[IP]"), m_IP);
	DFX_Text(pFX, _T("[Time]"), m_Time);
	DFX_Text(pFX, _T("[Date]"), m_Date);
	//}}AFX_FIELD_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CStat diagnostics

#ifdef _DEBUG
void CStat::AssertValid() const
{
	CDaoRecordset::AssertValid();
}

void CStat::Dump(CDumpContext& dc) const
{
	CDaoRecordset::Dump(dc);
}
#endif //_DEBUG
