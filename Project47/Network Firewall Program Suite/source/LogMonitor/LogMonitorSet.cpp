// LogMonitorSet.cpp : implementation of the CLogMonitorSet class
//

#include "stdafx.h"
#include "LogMonitor.h"
#include "LogMonitorSet.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorSet implementation

IMPLEMENT_DYNAMIC(CLogMonitorSet, CRecordset)

CLogMonitorSet::CLogMonitorSet(CDatabase* pdb)
	: CRecordset(pdb)
{
	//{{AFX_FIELD_INIT(CLogMonitorSet)
	m_AttackType = _T("");
	m_AttackDate = _T("");
	m_AttackTime = _T("");
	m_Group = _T("");
	m_AttackDst = _T("");
	m_AttackSrc = _T("");
	m_LogNo = 0;
	m_User = _T("");
	m_nFields = 8;
	//}}AFX_FIELD_INIT
	m_nDefaultType = snapshot;
}

CString CLogMonitorSet::GetDefaultConnect()
{
	return _T("ODBC;DSN=Firewall Log");
}

CString CLogMonitorSet::GetDefaultSQL()
{
	return _T("[LogTable]");
}

void CLogMonitorSet::DoFieldExchange(CFieldExchange* pFX)
{
	//{{AFX_FIELD_MAP(CLogMonitorSet)
	pFX->SetFieldType(CFieldExchange::outputColumn);
	RFX_Text(pFX, _T("[AttackType]"), m_AttackType);
	RFX_Text(pFX, _T("[AttackDate]"), m_AttackDate);
	RFX_Text(pFX, _T("[AttackTime]"), m_AttackTime);
	RFX_Text(pFX, _T("[Group]"), m_Group);
	RFX_Text(pFX, _T("[AttackDst]"), m_AttackDst);
	RFX_Text(pFX, _T("[AttackSrc]"), m_AttackSrc);
	RFX_Long(pFX, _T("[LogNo]"), m_LogNo);
	RFX_Text(pFX, _T("[User]"), m_User);
	//}}AFX_FIELD_MAP
}

/////////////////////////////////////////////////////////////////////////////
// CLogMonitorSet diagnostics

#ifdef _DEBUG
void CLogMonitorSet::AssertValid() const
{
	CRecordset::AssertValid();
}

void CLogMonitorSet::Dump(CDumpContext& dc) const
{
	CRecordset::Dump(dc);
}
#endif //_DEBUG
