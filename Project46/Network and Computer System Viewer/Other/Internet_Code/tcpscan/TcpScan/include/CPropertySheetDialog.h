/*
	CPropertySheetDialog.h
	Classe base per il dialogo basato sul property sheet.
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CPROPERTYSHEETDIALOG_H
#define _CPROPERTYSHEETDIALOG_H 1

#include <string.h>
#include "strcpyn.h"
#include <ctype.h>
#include "window.h"
#include "CPropertyPageList.h"
#include "CPropertyPageDialog.h"
#include "CPropertySheetDialogMessages.h"

class CPropertySheetDialog : public CPropertySheet
{
	DECLARE_DYNCREATE(CPropertySheetDialog)

public:
	// costruttore/distruttore
	CPropertySheetDialog(CWnd* = NULL,CPropertyPageList* = NULL);
	virtual ~CPropertySheetDialog() {}

	// gestori
	virtual void	OnSysCommand		(UINT,LPARAM);				// menu di sistema
	virtual BOOL	OnInitDialog		(void);					// inizializzazione dialogo
	virtual void	OnOK				(void);					// bottone IDOK dello sheet
	virtual void	OnCancel			(void);					// bottone IDCANCEL dello sheet
	LONG			OnActivatePage		(UINT wParam,LONG lParam);	// attiva la pagina

	// membri
	inline BOOL	Create			(void) {return(m_bCreated);}	// per verificare la corretta inizializzazione dello sheet

private:
	// membri
	void		EnableSheetButton		(UINT);
	void		DisableSheetButton		(UINT);

	void		SetSheetOkButtonText	(LPCSTR);						// cambia il testo del bottone OK
	LPCSTR	GetSheetOkButtonText	(void);						// ricava il testo del bottone OK
	void		EnableSheetButtons		(LPCSTR = IDCANCEL_EXIT_PROMPT);	// abilita OK e imposta CANCEL
	void		DisableSheetButtons		(LPCSTR = IDCANCEL_CANCEL_PROMPT);	// disabilita OK e imposta CANCEL
	
	LONG		OnSetSheetOkButtonText	(UINT,LONG);					// idem per la chiamata dalle pagine
	LONG		OnGetSheetOkButtonText	(UINT,LONG);
	LONG		OnEnableSheetButtons	(UINT,LONG);
	LONG		OnDisableSheetButtons	(UINT,LONG);
	LONG		OnPropertySheetButton	(UINT,LONG);

	// variabili
	BOOL				m_bCreated;								// flag per esito costruttore
	CPropertyPageList*	m_pPropertyPageList;						// lista per le pagine dello sheet
	CPropertyPage*		m_pActivePageOnButtonClick;					// puntatore alla pagina che ha ricevuto il click su IDOK
	CStatusBarCtrl		m_StatusBar;								// status bar

	DECLARE_MESSAGE_MAP()
};

#endif // _CPROPERTYSHEETDIALOG_H
