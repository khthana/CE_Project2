/*
	TcpConnectPage.h
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPCONNECTPAGE_H
#define _TCPCONNECTPAGE_H 1

#include "window.h"
#include "CAsyncSock.h"
#include "CPropertyPageDialog.h"
#include "TcpScanConfig.h"

class CConnectPage : public CPropertyPageDialog
{
	DECLARE_DYNCREATE(CConnectPage)

public:
	CConnectPage();
	~CConnectPage();

	// gestori
	void		DoDataExchange			(CDataExchange*);	// scambio dati
	BOOL		OnInitDialog			(void);			// inizializzazione dialogo (pagina)
	BOOL		OnSetActive			(void);			// attivazione pagina
	BOOL		OnKillActive			(void);			// disattivazione pagina
	void		OnKillSheet			(void);			// chiusura sheet
	void		OnOk					(void);			// click su IDOK dello sheet
	void		OnCancel				(void);			// click su IDCANCEL dello sheet

	// membri
	void		GetPropertySheetConfig	(CTcpScanConfig* pConfig) {m_pConfig = pConfig;}
	
	// variabili
	CString	m_strConnectHostAddr;
	UINT		m_nConnectHostPort;
	CString	m_strHostSend;
	CString	m_strHostRecv;

private:
	// gestori
	void		OnKillFocusComboHost	(void);			// IDC_COMBO_HOST
	void		OnKillFocusComboPort	(void);			// IDC_COMBO_PORT

	// connessione
	LONG		OnConnect				(UINT,LONG);		// messaggi inviati dal socket
	LONG		OnRead				(UINT,LONG);
	LONG		OnWrite				(UINT,LONG);
	LONG		OnClose				(UINT,LONG);

	// variabili
	char*			m_pConnectButtonText;			// testo per il bottone IDOK dello sheet
	char*			m_pSendButtonText;				// testo per il bottone IDOK dello sheet
	char*			m_pCancelButtonText;			// testo per il bottone IDCANCEL dello sheet
	int				m_nMaxHostAddr;				// numero max di host per il combo
	int				m_nMaxPortNumber;				// numero max di porte per il combo
	CComboBox			m_wndComboHost;				// combo per il nome host
	CComboBox			m_wndComboPort;				// combo per la porta
	CTcpScanConfig*	m_pConfig;					// configurazione
	CAsyncSock*		m_pAsyncSocket;				// socket asincrono

	DECLARE_MESSAGE_MAP()
};

#endif // _TCPCONNECTPAGE_H
