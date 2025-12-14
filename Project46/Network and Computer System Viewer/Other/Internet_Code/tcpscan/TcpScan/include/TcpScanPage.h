/*
	TcpScanPage.h
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPSCANPAGE_H
#define _TCPSCANPAGE_H 1

#include "window.h"
#include "CAsyncSock.h"
#include "CListCtrlEx.h"
#include "CPropertyPageDialog.h"
#include "TcpScanConfig.h"

#define MAX_PORTLIST_STRING 2048

class CScanPage : public CPropertyPageDialog
{
	DECLARE_DYNCREATE(CScanPage)

public:
	CScanPage();
	~CScanPage();

	// gestori
	void		DoDataExchange					(CDataExchange*);	// scambio dati
	BOOL		OnInitDialog					(void);			// inizializzazione dialogo (pagina)
	BOOL		OnSetActive					(void);			// attivazione pagina
	BOOL		OnKillActive					(void);			// disattivazione pagina
	void		OnKillSheet					(void);			// chiusura sheet
	void		OnOk							(void);			// click su IDOK dello sheet
	void		OnCancel						(void);			// click su IDCANCEL dello sheet
	
	// radio buttons
	void		OnRadioButtonPortList			(void);			// lista
	void		OnRadioButtonPortRange			(void);			// intervallo

	// menu popup
	void		OnScanPopupMenuRemovePort		(void);			// IDM_SCAN_REMOVEPORT
	void		OnScanPopupMenuSaveToRegistry		(void);			// IDM_SCAN_SAVETOREGISTRY
	void		OnScanPopupMenuLoadFromRegistry	(void);			// IDM_SCAN_LOADFROMREGISTRY
	void		OnScanPopupMenuAddToServices		(void);			// IDM_SCAN_ADDTOSERVICES
	void		OnScanPopupMenuRemoveFromServices	(void);			// IDM_SCAN_REMOVEFROMSERVICES
	void		OnScanPopupMenuLoadServices		(void);			// IDM_SCAN_LOADSERVICES
	void		OnScanPopupMenuLoadFromServices	(void);			// IDM_SCAN_LOADFROMSERVICES
	void		OnScanPopupMenuClearPorts		(void);			// IDM_SCAN_CLEARPORTS

	// membri
	void		GetPropertySheetConfig			(CTcpScanConfig* pConfig) {m_pConfig = pConfig;}
	BOOL		CreateScanningList				(void);
	void		RemovePort					(void);
	BOOL		SaveScanning					(void);
	BOOL		LoadScanning					(void);

	// variabili
	CString	m_strStartHost;								// host iniziale
	CString	m_strEndHost;									// host finale
	int		m_nPortFlag;									// flag interno per selezione bottone radio
	int		m_nPortList;									// lista
	int		m_nPortRange;									// intervallo
	CString	m_strPortList;									// lista porte
	UINT		m_nStartPort;									// porta iniziale
	UINT		m_nEndPort;									// porta finale
	CListCtrlEx m_wndScanList;								// lista scanning

private:
	// gestori
	void		OnKillFocusStartHost			(void);			// imposta l'host fine con l'host inizio
	LONG		OnScan						(UINT,LONG);		// scanning dell'host

	// variabili
	CTcpScanConfig* m_pConfig;								// configurazione
	CAsyncSock* m_pAsyncSock;								// socket asincrono

	DECLARE_MESSAGE_MAP()
};

#endif // _TCPSCANPAGE_H
