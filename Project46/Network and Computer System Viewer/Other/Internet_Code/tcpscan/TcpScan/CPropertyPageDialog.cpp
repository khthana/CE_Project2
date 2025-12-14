/*
	CPropertyPageDialog.cpp
	Classe base per la pagina del dialogo basato sul property sheet (MFC).
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <stdio.h>
#include <stdlib.h>
#include "window.h"
#include "CPropertyPageList.h"
#include "CPropertyPageDialog.h"
#include "CPropertySheetDialog.h"
#include "CPropertySheetDialogMessages.h"

IMPLEMENT_DYNCREATE(CPropertyPageDialog,CPropertyPage)

BEGIN_MESSAGE_MAP(CPropertyPageDialog,CPropertyPage)
END_MESSAGE_MAP()

/*
	CPropertyPageDialog()
*/
CPropertyPageDialog::CPropertyPageDialog()
{
	Reset();
}

CPropertyPageDialog::CPropertyPageDialog(int nID) : CPropertyPage(nID)
{
	Reset();
}

/*
	Reset()
*/
void CPropertyPageDialog::Reset(void)
{
	m_bDirty = FALSE;
	m_bKillPage = FALSE;
	strcpyn(m_szOkButtonText,IDOK_PROMPT,MAX_BUTTON_PROMPT);
	m_nStatusBarId = 0;
	m_pPropertySheetWnd = NULL;
	m_pPropertyPageList = NULL;
}

#ifdef HAVE_STATUSBAR
/*
	SetStatusBar()
*/
BOOL CPropertyPageDialog::SetStatusBar(LPCSTR lpcszText)
{
	CWnd* pStatusBar = GetDlgItem(m_nStatusBarId);

	if(pStatusBar)
		pStatusBar->SetWindowText(lpcszText);
	
	return(pStatusBar!=NULL);
}

/*
	GetStatusBar()
*/
BOOL CPropertyPageDialog::GetStatusBar(LPSTR lpszText,int nSize)
{
	CWnd* pStatusBar = GetDlgItem(m_nStatusBarId);

	if(pStatusBar)
		pStatusBar->GetWindowText(lpszText,nSize);
	
	return(pStatusBar!=NULL);
}

/*
	GetStatusBar()
*/
LPCSTR CPropertyPageDialog::GetStatusBar(void)
{
	CWnd* pStatusBar = GetDlgItem(m_nStatusBarId);
	static char szText[_MAX_PATH+1];

	if(pStatusBar)
	{
		memset(szText,'\0',sizeof(szText));
		pStatusBar->GetWindowText(szText,sizeof(szText)-1);
	}

	return(pStatusBar ? szText : NULL);
}
#endif

/*
	FindPage()
*/
PROPERTYPAGE* CPropertyPageDialog::FindPage(int nID)
{
	PROPERTYPAGE* p = NULL;

	if(m_pPropertyPageList)
	{
		ITERATOR iter;
		if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				p = (PROPERTYPAGE*)iter->data;
				
				if(p->idd==nID)
					if(p->page)
						break;

				iter = m_pPropertyPageList->Next(iter);
			}
	}

	return(p);
}

/*
	EnterPageBusyState()
*/
BOOL CPropertyPageDialog::EnterPageBusyState(int nID)
{
	BOOL bFlag = FALSE;

	if(m_pPropertyPageList)
	{
		ITERATOR iter;
		PROPERTYPAGE* p;
		if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				p = (PROPERTYPAGE*)iter->data;
				
				if(p->idd==nID)
				{
					p->status = 1;
					bFlag = TRUE;
					break;
				}

				iter = m_pPropertyPageList->Next(iter);
			}
	}

	return(bFlag);
}

/*
	LeavePageBusyState()
*/
BOOL CPropertyPageDialog::LeavePageBusyState(int nID)
{
	BOOL bFlag = FALSE;

	if(m_pPropertyPageList)
	{
		ITERATOR iter;
		PROPERTYPAGE* p;
		if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				p = (PROPERTYPAGE*)iter->data;
				
				if(p->idd==nID)
				{
					p->status = 0;
					bFlag = TRUE;
					break;
				}

				iter = m_pPropertyPageList->Next(iter);
			}
	}

	return(bFlag);
}

/*
	LookForBusyPages()
*/
BOOL CPropertyPageDialog::LookForBusyPages(int nID)
{
	BOOL bFlag = FALSE;

	if(m_pPropertyPageList)
	{
		ITERATOR iter;
		PROPERTYPAGE* p;
		if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				p = (PROPERTYPAGE*)iter->data;
				
				if(p->status==1 && p->idd!=nID)
				{
					bFlag = TRUE;
					break;
				}

				iter = m_pPropertyPageList->Next(iter);
			}
	}

	return(bFlag);
}

/*
	LookForPageBusy()
*/
BOOL CPropertyPageDialog::LookForPageBusy(int nID)
{
	BOOL bFlag = FALSE;

	if(m_pPropertyPageList)
	{
		ITERATOR iter;
		PROPERTYPAGE* p;
		if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				p = (PROPERTYPAGE*)iter->data;
				
				if(p->status==1 && p->idd==nID)
				{
					bFlag = TRUE;
					break;
				}

				iter = m_pPropertyPageList->Next(iter);
			}
	}

	return(bFlag);
}

/*
	OnInitDialog()

	Inizializzazione del dialogo.
*/
BOOL CPropertyPageDialog::OnInitDialog(void)
{
	// deve chiamare il gestore originale
	// il flag viene utilizzato per sapere se la pagina e' stata visualizzata almeno una volta
	// se venisse chiamato un membro della pagina prima che quest'ultima sia stata visualizzata
	// verrebbe saltata la chiamata alla OnInitDialog() relativa
	m_bDirty = CPropertyPage::OnInitDialog();

	return(FALSE);
}

/*
	OnSetActive()

	Chiamata (da MFC e successivamente a OnInitDialog()) ogni volta che viene attivata la pagina
	(la OnInitDialog() viene chiamata solo alla prima attivazione).
*/
BOOL CPropertyPageDialog::OnSetActive(void)
{
	// deve chiamare il gestore originale
	CPropertyPage::OnSetActive();

	// imposta il flag per potersi muovere tra le pagine dello sheet senza bloccarsi sui DDV...()
	m_bKillPage = FALSE;
	
	// modifica il testo del bottone IDOK dello sheet
	SetPropertySheetOkButton(IDOK_PROMPT);

	return(TRUE);
}

/*
	OnKillActive()

	Chiamata (da MFC) ogni volta che la pagina perde il focus (Ctrl+Tab o click sul Tab di una pagina
	differente).
	Non viene chiamata alla chiusura dello sheet (vedi OnKillSheet()).
*/
BOOL CPropertyPageDialog::OnKillActive(void)
{
	// imposta il flag per potersi muovere tra le pagine dello sheet senza bloccarsi sui DDV...()
	m_bKillPage = TRUE;

	// salva il valore corrente del testo del bottone IDOK dello sheet
	GetPropertySheetOkButton(m_szOkButtonText);

	return(TRUE);
}

/*
	OnKillSheet()

	Chiamata dallo sheet prima della chiusura del dialogo.
	Lo sheet si occupa di intercettare il messaggio di chiusura del dialogo (SC_CLOSE) effettuando la
	chiamata dalla OnCancel(), suo unico punto di uscita.
	Prima di compiere operazioni che coinvolgano i controlli presenti nella pagina, assicurarsi che la
	pagina sia stata visualizzata.
*/
void CPropertyPageDialog::OnKillSheet(void)
{
	if(IsWindow(this->m_hWnd))
		;
}
