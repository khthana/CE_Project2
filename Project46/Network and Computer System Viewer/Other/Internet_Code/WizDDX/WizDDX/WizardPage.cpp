#include "stdafx.h"
#include "WizardPage.h"
#include "WizardSheet.h"

IMPLEMENT_DYNAMIC(CWizardPage, CPropertyPageEx)


CWizardPage::CWizardPage() : CPropertyPageEx(), m_pps(NULL)
{
}

CWizardPage::CWizardPage(UINT nIDTemplate, UINT nIDCaption, UINT nIDHeaderTitle, UINT nIDHeaderSubTitle) 
	: CPropertyPageEx(nIDTemplate, nIDCaption, nIDHeaderTitle, nIDHeaderSubTitle), m_pps(NULL)
{
}

CWizardPage::CWizardPage(LPCTSTR lpszTemplateName, UINT nIDCaption, UINT nIDHeaderTitle, UINT nIDHeaderSubTitle)
: CPropertyPageEx(lpszTemplateName, nIDCaption, nIDHeaderTitle, nIDHeaderSubTitle), m_pps(NULL)
{
}

CWizardPage::~CWizardPage()
{
}



BEGIN_MESSAGE_MAP(CWizardPage, CPropertyPageEx)
	//{{AFX_MSG_MAP(CWizardPage)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()


LRESULT CWizardPage::OnWizardNext() 
{
	// TODO: Add your specialized code here and/or call the base class
	UpdateData();
	return CPropertyPageEx::OnWizardNext();
}

LRESULT CWizardPage::OnWizardBack()
{
	UpdateData();
	return CPropertyPageEx::OnWizardBack();
}


BOOL CWizardPage::OnWizardFinish()
{
	UpdateData();
	return CPropertyPage::OnWizardFinish();
}


BOOL CWizardPage::OnSetActive()
{

	int act  = m_pps->GetActiveIndex();
	int count= m_pps->GetPageCount();

	if(act==0)
	   m_pps->SetWizardButtons(PSWIZB_NEXT);
	else if(act+1==count)
	   m_pps->SetWizardButtons(PSWIZB_BACK | PSWIZB_FINISH);
	else
       m_pps->SetWizardButtons(PSWIZB_BACK | PSWIZB_NEXT);

	return CPropertyPageEx::OnSetActive();
}


BOOL CWizardPage::OnNotify(WPARAM wParam, LPARAM lParam, LRESULT* pResult) 
{
	return CPropertyPageEx::OnNotify(wParam,lParam,pResult);
}



void CWizardPage::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPageEx::DoDataExchange(pDX);
	m_pps->DoDataExchange(pDX);
}
