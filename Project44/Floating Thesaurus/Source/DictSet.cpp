// DictSet.cpp : implementation of the CDictSet class
//

#include "stdafx.h"
#include "Dict.h"
#include "DictSet.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDictSet implementation

IMPLEMENT_DYNAMIC(CDictSet, CDaoRecordset)

CDictSet::CDictSet(CDaoDatabase* pdb)
	: CDaoRecordset(pdb)
{
	//{{AFX_FIELD_INIT(CDictSet)
	m_code = _T("");
	m_tenglish = _T("");
	m_tsyn = _T("");
	m_tant = _T("");
	m_tword = _T("");
	m_eword = _T("");
	m_nFields = 6;
	//}}AFX_FIELD_INIT
	m_nDefaultType = dbOpenDynaset;
}

CString CDictSet::GetDefaultDBName()
{
	return _T("dict.mdb");
}


CString CDictSet::GetDefaultSQL()
{
	return _T("[dict]");
}

void CDictSet::DoFieldExchange(CDaoFieldExchange* pFX)
{
	//{{AFX_FIELD_MAP(CDictSet)
	pFX->SetFieldType(CDaoFieldExchange::outputColumn);
	DFX_Text(pFX, _T("[code]"), m_code);
	DFX_Text(pFX, _T("[tenglish]"), m_tenglish);
	DFX_Text(pFX, _T("[tsyn]"), m_tsyn);
	DFX_Text(pFX, _T("[tant]"), m_tant);
	DFX_Text(pFX, _T("[tword]"), m_tword);
	DFX_Text(pFX, _T("[eword]"), m_eword);
	//}}AFX_FIELD_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CDictSet diagnostics

#ifdef _DEBUG
void CDictSet::AssertValid() const
{
	CDaoRecordset::AssertValid();
}

void CDictSet::Dump(CDumpContext& dc) const
{
	CDaoRecordset::Dump(dc);
}
#endif //_DEBUG
