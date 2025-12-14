/*
	CPropertySheetDialog.cpp
	Classe base per il dialogo basato sul property sheet.
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <string.h>
#include "strcpyn.h"
#include <ctype.h>
#include "window.h"
#include "CPropertyPageList.h"
#include "CPropertyPageDialog.h"
#include "CPropertySheetDialog.h"
#include "CPropertySheetDialogMessages.h"
#include "resource.h"

IMPLEMENT_DYNCREATE(CPropertySheetDialog,CPropertySheet)

BEGIN_MESSAGE_MAP(CPropertySheetDialog,CPropertySheet)
	// bottoni dello sheet
	ON_BN_CLICKED(IDOK,OnOK)
	ON_BN_CLICKED(IDCANCEL,OnCancel)

	// menu di sistema
	ON_WM_SYSCOMMAND()

	// attivazione pagina
	ON_MESSAGE(WM_ACTIVATEPAGE,OnActivatePage)

	// bottoni dello sheet
	ON_MESSAGE(WM_SETPROPERTYSHEET_IDOKBUTTON,OnPropertySheetButton)
	ON_MESSAGE(WM_GETPROPERTYSHEET_IDOKBUTTON,OnPropertySheetButton)
	ON_MESSAGE(WM_SETPROPERTYSHEET_IDCANCELBUTTON,OnPropertySheetButton)
	ON_MESSAGE(WM_GETPROPERTYSHEET_IDCANCELBUTTON,OnPropertySheetButton)
	ON_MESSAGE(WM_ENABLEPROPERTYSHEET_IDOKBUTTON,OnPropertySheetButton)
	ON_MESSAGE(WM_DISABLEPROPERTYSHEET_IDOKBUTTON,OnPropertySheetButton)
	ON_MESSAGE(WM_ENABLEPROPERTYSHEET_IDCANCELBUTTON,OnPropertySheetButton)
	ON_MESSAGE(WM_DISABLEPROPERTYSHEET_IDCANCELBUTTON,OnPropertySheetButton)
END_MESSAGE_MAP()

/*
	CPropertySheetDialog()
*/
CPropertySheetDialog::CPropertySheetDialog(CWnd* pParentWnd,CPropertyPageList* pPropertyPageList) : CPropertySheet(" ",pParentWnd)
{
	// flag per esito costruttore
	m_bCreated = FALSE;

	// elimina il bottone Apply dello sheet
	this->CPropertySheet::m_psh.dwFlags = this->CPropertySheet::m_psh.dwFlags|PSH_NOAPPLYNOW;

	// crea le pagine presenti nella lista
	ITERATOR iter;
	PROPERTYPAGE* p;
	m_pPropertyPageList = pPropertyPageList;
	
	if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			p = (PROPERTYPAGE*)iter->data;
			if(p)
			{
				if(p->idd > 0)
					if(p->page)
					{
						CPropertyPageDialog* page = (CPropertyPageDialog*)p->page;

						// aggiunge la pagina allo sheet
						AddPage(page);
						
						// passa il puntatore alla lista delle pagine affinche' ogni pagina sia in grado di
						// accedere alle restanti
						page->SetPageList(m_pPropertyPageList);

						// passa il puntatore alla propria finestra affinche' ogni pagina sia in grado di
						// modificare il testo dei bottoni dello sheet (IDOK, IDCANCEL)
						// la chiamata deve essere effettuata nel costruttore perche' la OnInitDialog() chiama
						// la OnSetActive() della pagina di default e quest'ultima necessita il puntatore alla
						// finestra dello sheet
						page->SetPropertySheetWnd(this);
					}
			}

			iter = m_pPropertyPageList->Next(iter);
		}

	// puntatore alla pagina attiva quando viene cliccato IDOK
	m_pActivePageOnButtonClick = NULL;

	// flag per esito costruttore
	m_bCreated = TRUE;
}

/*
	OnSysCommand()

	Intercetta il messaggio di chiusura.
	La chiusura del dialogo puo' avvenire attraverso il bottone CANCEL (IDCANCEL), tramite ALT+F4 o
	tramite il menu di sistema.
	Per far si che lo sheet abbia un unico punto d'uscita, in modo tale da poter comunicare a ogni
	pagina che il dialogo sta per essere chiuso, deve essere intercettato il messaggio di chiusura
	(SC_CLOSE) e chiamato il gestore relativo (OnCancel()).
	Dato che la OnCancel() verifica il testo del bottone CANCEL (IDCANCEL), se riceve il messaggio
	di chiusura (SC_CLOSE), deve impostare il testo del bottone per l'uscita.
	La OnCancel() si occupa di chiamare la OnKillSheet() di ogni pagina in modo tale che ognuna possa
	eseguire il proprio codice di terminazione.
*/
void CPropertySheetDialog::OnSysCommand(UINT id,LPARAM lParam)
{
	// chiusura del dialogo (IDCANCEL, ALT+F4, menu di sistema)
	if((id & 0xFFF0)==SC_CLOSE)
	{
		// cambia il testo del bottone IDCANCEL da cancel in exit
		// (le pagine si comportano diversamente a seconda del testo del bottone)
		CWnd* pWnd;
		if((pWnd = GetDlgItem(IDCANCEL))!=NULL)
			pWnd->SetWindowText(IDCANCEL_EXIT_PROMPT);
		
		// termina, chiamando il codice relativo di ogni pagina
		CPropertySheetDialog::OnCancel();
	}

	// chiama il gestore originale
	CPropertySheet::OnSysCommand(id,lParam);
}

/*
	OnInitDialog()

	Inizializza il property sheet.
	Rimappa la funzione membro per modificare lo stile del dialogo.
*/
BOOL CPropertySheetDialog::OnInitDialog(void)
{
	// notare che la CPropertySheet::OnInitDialog() chiama la OnInitDialog() e la OnSetActive()
	// della pagina di default (la prima ad essere aggiunta con AddPage())
	CPropertySheet::OnInitDialog();

	// aggiungere n pixel per la barra di stato
	CRect rectOld;
	GetWindowRect(&rectOld);
	SetWindowPos(NULL,0,0,rectOld.Width(),rectOld.Height()/*+n*/,SWP_NOMOVE|SWP_NOZORDER|SWP_NOACTIVATE);

	// menu
/*	CMenu menu;
	menu.LoadMenu(IDM_SERVICES);
	SetMenu(&menu);
	DrawMenuBar();
	menu.Detach();
*/

	// status bar
/*	RECT rect = {0,0,100,20};
	m_StatusBar.Create(WS_CHILD|WS_VISIBLE|CCS_BOTTOM,rect,this,0);
	static int parts[3] = {200,300,-1};
	m_StatusBar.SetParts(3,&parts[0]);
*/
	// modifica solo il testo del bottone IDCANCEL, il testo del bottone IDOK viene modificato
	// dalla OnSetActive() delle pagine
	CWnd* pWnd;
	if((pWnd = GetDlgItem(IDCANCEL))!=NULL)
		pWnd->SetWindowText(IDCANCEL_EXIT_PROMPT);

	// aggiunge il bottone per minimizzare lo sheet alla barra del titolo
	::SetWindowLong(m_hWnd,GWL_STYLE,GetStyle()|WS_MINIMIZEBOX);
	
	// aggiunge l'entrata per minimizzare al menu di sistema
	GetSystemMenu(FALSE)->InsertMenu((UINT)-1,MF_BYPOSITION|MF_STRING,SC_ICON,"Minimize");
	DrawMenuBar();

	return(TRUE);
}

/*
	OnOK()

	Gestore del bottone IDOK.
	Informa la pagina relativa del click sul bottone.
	Prima di informare la pagina ne aggiorna le variabili relative con quanto presente nel dialogo
	relativo, controllando che le pagina sia stata visualizzata perche' in caso contrario qualsiasi
	riferimento fallirebbe (handle nullo).
	Deve salvare il puntatore alla pagina (attiva) su cui e' stato cliccato IDOK affinche' la OnCancel()
	possa inviare il messaggio alla pagina giusta.
*/
void CPropertySheetDialog::OnOK(void)
{
	// ricava il puntatore alla pagina attiva
	CPropertyPage* pActivePage = GetActivePage();

	// salva il puntatore
	m_pActivePageOnButtonClick = pActivePage;

	// cerca la pagina nella lista, aggiornando le variabili membro
	// se vengono passati i controlli (DDV), informa la pagina del click su IDOK (invio del messaggio e
	// chiamata alla virtuale OnOk())
	ITERATOR iter;
	PROPERTYPAGE* p;
	if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			p = (PROPERTYPAGE*)iter->data;
			if(p)
			{
				if(p->idd > 0)
					if(p->page)
					{
						CPropertyPageDialog* page = (CPropertyPageDialog*)p->page;

						// confronta la pagina corrente con quella presente nella lista
						if(pActivePage->IsKindOf(p->runtimeclass))
						{
							// aggiorna le variabili membro della pagina con i campi del dialogo relativo
							if(page->UpdateData(TRUE))
								page->OnOk();
							break;
						}
					}
			}

			iter = m_pPropertyPageList->Next(iter);
		}
}

/*
	OnCancel()

	Gestore del bottone IDCANCEL.
	Informa la pagina relativa del click sul bottone.
	La funzione viene utilizzata per gestire i due prompt del bottone, Exit (default) e Cancel (impostato
	dalle pagine). A seconda del prompt del bottone invia il messaggio relativo (chiudere il dialogo o
	cancellare l'operazione corrente).
	Il gestore funziona come unico punto di uscita dello sheet, per cui si occupa di chiamare la OnKillSheet()
	di ogni pagina in modo tale che ognuna di esse possa eseguire il proprio codice di terminazione.
*/
void CPropertySheetDialog::OnCancel(void)
{
	CWnd* pWnd;
	CString cText;

	// ricava il puntatore alla pagina attiva e la imposta come corrente
	// il puntatore non e' relativo alla pagina correntemente visualizzata, ma a quella su cui e' stato
	// cliccato IDOK: in tal modo puo' inviare il WM_CANCEL alla pagina giusta dato la pagina corrente
	// (visualizzata) puo' non corrispondere a quella attiva (che ha ricevuto l'IDOK)
	// esempio: mentre sta' svolgendo il task relativo alla prima pagina, l'utente si sposta sulla seconda
	// e da li effettua il click su IDCANCEL
	CPropertyPage* pActivePage = (m_pActivePageOnButtonClick ? m_pActivePageOnButtonClick : GetActivePage());
	if(GetActivePage()!=pActivePage)
		SetActivePage(pActivePage);

	// ricava il puntatore al bottone
	if((pWnd = GetDlgItem(IDCANCEL))!=NULL)
	{
		// ricava il testo del bottone
		pWnd->GetWindowText(cText);
		
		// e' stata richiesta la chiusura del dialogo
		if(cText==IDCANCEL_EXIT_PROMPT)
		{
			ITERATOR iter;
			PROPERTYPAGE* p;

			if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
				while(iter!=(ITERATOR)NULL)
				{
					p = (PROPERTYPAGE*)iter->data;
					
					if(p->idd > 0)
						if(p->page)
						{
							CPropertyPageDialog* page = (CPropertyPageDialog*)p->page;
							if(page)
								page->OnKillSheet();
						}

					iter = m_pPropertyPageList->Next(iter);
				}

			// chiude il dialogo
			EndDialog(IDOK);
		}
		// e' stata richiesta la cancellazione dell'operazione corrente
		else if(cText==IDCANCEL_CANCEL_PROMPT)
		{
			ITERATOR iter;
			PROPERTYPAGE* p;

			if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
				while(iter!=(ITERATOR)NULL)
				{
					p = (PROPERTYPAGE*)iter->data;
					
					if(p->idd > 0)
						if(p->page)
						{
							CPropertyPageDialog* page = (CPropertyPageDialog*)p->page;
							if(page)
								if(pActivePage->IsKindOf(p->runtimeclass))
								{
									page->OnCancel();
									break;
								}
						}

					iter = m_pPropertyPageList->Next(iter);
				}
		}
		// chiude il dialogo e vaffanculo
		else
			EndDialog(IDCANCEL);
	}
}

/*
	OnActivatePage()
*/
LONG CPropertySheetDialog::OnActivatePage(UINT wParam,LONG /*lParam*/)
{
	int idd = (int)wParam;
	CPropertyPage* pActivePage = GetActivePage();

	ITERATOR iter;
	PROPERTYPAGE* p;
	if((iter = m_pPropertyPageList->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			p = (PROPERTYPAGE*)iter->data;
			
			if(p->idd==idd)
				if(p->page)
					SetActivePage((CPropertyPage*)p->page);

			iter = m_pPropertyPageList->Next(iter);
		}

	SetActivePage(pActivePage);
	
	return(0);
}

/*
	SetSheetOkButtonText()

	Imposta il testo del bottone OK (IDOK) dello sheet.
*/
void CPropertySheetDialog::SetSheetOkButtonText(LPCSTR text)
{
	CWnd* pWnd;
	
	if((pWnd = GetDlgItem(IDOK))!=NULL)
	{
		pWnd->EnableWindow(TRUE);
		pWnd->SetWindowText(text);
	}
}

/*
	GetSheetOkButtonText()

	Ricava il testo del bottone OK (IDOK) dello sheet.
*/
LPCSTR CPropertySheetDialog::GetSheetOkButtonText(void)
{
	CWnd* pWnd;
	static char text[32];
	
	if((pWnd = GetDlgItem(IDOK))!=NULL)
	{
		pWnd->EnableWindow(TRUE);
		pWnd->GetWindowText(text,sizeof(text)-1);
	}

	return(text);
}

/*
	EnableSheetButtons()

	Abilita il bottone OK (IDOK) e cambia il testo del bottone CANCEL (IDCANCEL) con IDCANCEL_EXIT_PROMPT
	o con quanto passato dal chiamante.
*/
void CPropertySheetDialog::EnableSheetButtons(LPCSTR text)
{
	CWnd* pWnd;
	
	if((pWnd = GetDlgItem(IDOK))!=NULL)
		pWnd->EnableWindow(TRUE);
	if((pWnd = GetDlgItem(IDCANCEL))!=NULL)
		pWnd->SetWindowText(text ? text : IDCANCEL_EXIT_PROMPT);
}

/*
	DisableSheetButtons()

	Disabilita il bottone OK (IDOK) e cambia il testo del bottone CANCEL (IDCANCEL) con IDCANCEL_CANCEL_PROMPT
	o con quanto passato dal chiamante.
*/
void CPropertySheetDialog::DisableSheetButtons(LPCSTR text)
{
	CWnd* pWnd;

	if((pWnd = GetDlgItem(IDOK))!=NULL)
		pWnd->EnableWindow(FALSE);
	if((pWnd = GetDlgItem(IDCANCEL))!=NULL)
		pWnd->SetWindowText(text ? text : IDCANCEL_CANCEL_PROMPT);
}

/*
	On...()
*/
LONG CPropertySheetDialog::OnSetSheetOkButtonText(UINT /*wParam*/,LONG lParam)
{
	SetSheetOkButtonText((const char*)lParam);
	return(0);
}

LONG CPropertySheetDialog::OnGetSheetOkButtonText(UINT /*wParam*/,LONG lParam)
{
	strcpy((char*)lParam,GetSheetOkButtonText());
	return(0);
}

LONG CPropertySheetDialog::OnEnableSheetButtons(UINT /*wParam*/,LONG lParam)
{
	EnableSheetButtons((const char*)lParam);
	return(0);
}

LONG CPropertySheetDialog::OnDisableSheetButtons(UINT /*wParam*/,LONG lParam)
{
	DisableSheetButtons((const char*)lParam);
	return(0);
}

LONG CPropertySheetDialog::OnPropertySheetButton(UINT wParam,LONG lParam)
{
	int message = (int)wParam;
	LPSTR prompt = (LPSTR)lParam;
	CWnd* pIDOk = this->GetDlgItem(IDOK);
	CWnd* pIDCancel = this->GetDlgItem(IDCANCEL);

	switch(message)
	{
		case WM_SETPROPERTYSHEET_IDOKBUTTON:
			if(pIDOk)
				pIDOk->SetWindowText(prompt);
			break;
		case WM_GETPROPERTYSHEET_IDOKBUTTON:
			if(pIDOk)
				pIDOk->GetWindowText(prompt,MAX_BUTTON_PROMPT);
			break;
		case WM_SETPROPERTYSHEET_IDCANCELBUTTON:
			if(pIDCancel)
				pIDCancel->SetWindowText(prompt);
			break;
		case WM_GETPROPERTYSHEET_IDCANCELBUTTON:
			if(pIDCancel)
				pIDCancel->GetWindowText(prompt,MAX_BUTTON_PROMPT);
			break;
		case WM_ENABLEPROPERTYSHEET_IDOKBUTTON:
			if(pIDOk)
				pIDOk->EnableWindow(TRUE);
			break;
		case WM_DISABLEPROPERTYSHEET_IDOKBUTTON:
			if(pIDOk)
				pIDOk->EnableWindow(FALSE);
			break;
		case WM_ENABLEPROPERTYSHEET_IDCANCELBUTTON:
			if(pIDCancel)
				pIDCancel->EnableWindow(TRUE);
			break;
		case WM_DISABLEPROPERTYSHEET_IDCANCELBUTTON:
			if(pIDCancel)
				pIDCancel->EnableWindow(FALSE);
			break;
	}

	return(0);
}

/*
	EnableSheetButton()
*/
void CPropertySheetDialog::EnableSheetButton(UINT id)
{
	CWnd* pWnd;

	if((pWnd = GetDlgItem(id))!=NULL)
		pWnd->EnableWindow(TRUE);
}

/*
	DisableSheetButton()
*/
void CPropertySheetDialog::DisableSheetButton(UINT id)
{
	CWnd* pWnd;

	if((pWnd = GetDlgItem(id))!=NULL)
		pWnd->EnableWindow(FALSE);
}
