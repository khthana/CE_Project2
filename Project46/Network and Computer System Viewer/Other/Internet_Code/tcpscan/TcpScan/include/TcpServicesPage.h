/*
	TcpServicesPage.h
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPSERVICESPAGE_H
#define _TCPSERVICESPAGE_H 1

#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "strcpyn.h"
#include "window.h"
#include "CSock.h"
#include "CNodeList.h"
#include "CTextFile.h"
#include "CListCtrlEx.h"
#include "CPropertyPageDialog.h"
#include "TcpMessages.h"
#include "TcpScanConfig.h"
#include "TcpScanPage.h"
#include "TcpScanAddServiceDlg.h"
#include "resource.h"

#define SERVICES_FROM_REGISTRY 0
#define SERVICES_FROM_DATABASE 1

class CServicesPage : public CPropertyPageDialog
{
	DECLARE_DYNCREATE(CServicesPage)

public:
	CServicesPage();
	~CServicesPage();
	
	// gestori
	void		DoDataExchange					(CDataExchange*);	// scambio dati
	BOOL		OnInitDialog					(void);			// inizializzazione dialogo (pagina)
	BOOL		OnSetActive					(void);			// attivazione pagina
	BOOL		OnKillActive					(void);			// disattivazione pagina
	void		OnKillSheet					(void);			// chiusura sheet
	void		OnOk							(void);			// click su IDOK dello sheet
	void		OnCancel						(void);			// click su IDCANCEL dello sheet

	// menu popup
	void		OnServicesPopupMenuAddPort		(void);			// IDM_SERVICES_ADDPORT
	void		OnServicesPopupMenuLoadAllPorts	(void);			// IDM_SERVICES_LOADALLPORTS
	void		OnServicesPopupMenuSetStartPort	(void);			// IDM_SERVICES_SETSTARTPORT
	void		OnServicesPopupMenuSetEndPort		(void);			// IDM_SERVICES_SETENDPORT
	void		OnServicesPopupMenuClearPorts		(void);			// IDM_SERVICES_CLEARPORTS
	void		OnServicesPopupMenuAddService		(void);			// IDM_SERVICES_ADDSERVICE
	void		OnServicesPopupMenuRemoveService	(void);			// IDM_SERVICES_REMOVESERVICE
	void		OnServicesPopupMenuSaveToRegistry	(void);			// IDM_SERVICES_SAVETOREGISTRY
	void		OnServicesPopupMenuLoadFromRegistry(void);			// IDM_SERVICES_LOADFROMREGISTRY
	void		OnServicesPopupMenuSaveToDatabase	(void);			// IDM_SERVICES_SAVETODATABASE
	void		OnServicesPopupMenuLoadFromDatabase(void);			// IDM_SERVICES_LOADFROMDATABASE

	// membri
	void		GetPropertySheetConfig			(CTcpScanConfig* pConfig) {m_pConfig = pConfig;}
	BOOL		AddService					(SERVICES* = NULL);
	BOOL		RemoveService					(SERVICES* = NULL);
	BOOL		LoadServices					(int);
	BOOL		SaveServices					(int);
	
	// variabili
	CString m_strServicesDatabase;							// IDC_COMBO_SERVICES
	CListCtrlEx m_wndServicesList;							// IDC_LIST_SERVICES

private:
	// gestori
	void		OnButtonServices				(void);			// seleziona il database dei servizi

	// membri
	BOOL		LoadServicesFromDatabase			(const char*);		// carica i servizi dal database
	BOOL		LoadServicesFromRegistry			(void);			// carica i servizi dal registro
	BOOL		SaveServicesToDatabase			(const char*);		// salva i servizi nel database
	BOOL		SaveServicesToRegistry			(void);			// salva i servizi nel registro

	// variabili
	int m_nMaxDatabaseEntry;									// numero max di files per il combo
	CServicesList* m_pServiceList;							// lista per i servizi
	CTcpScanConfig* m_pConfig;								// configurazione

	DECLARE_MESSAGE_MAP()
};

#endif // _TCPSERVICESPAGE_H
