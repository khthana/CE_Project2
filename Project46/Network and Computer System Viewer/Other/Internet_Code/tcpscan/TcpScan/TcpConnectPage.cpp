/*
	TcpConnectPage.cpp
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "strcpyn.h"
#include <limits.h>
#include "window.h"
#include "CAsyncSock.h"
#include "CPropertyPageDialog.h"
#include "TcpScanVersion.h"
#include "TcpScanConfig.h"
#include "TcpConnectPage.h"
#include "TcpMessages.h"
#include "resource.h"

//static void AFXAPI DDV_ValidateIP(CDataExchange*,int,CString&);
//static void AFXAPI DDV_ValidatePortNumber(CDataExchange*,int,unsigned int&);

IMPLEMENT_DYNCREATE(CConnectPage,CPropertyPageDialog)

BEGIN_MESSAGE_MAP(CConnectPage,CPropertyPageDialog)
	ON_CBN_KILLFOCUS(IDC_COMBO_HOST,OnKillFocusComboHost)
	ON_CBN_KILLFOCUS(IDC_COMBO_PORT,OnKillFocusComboPort)
	ON_MESSAGE(WM_ASYNCCONNECT,OnConnect)
	ON_MESSAGE(WM_ASYNCREAD,OnRead)
	ON_MESSAGE(WM_ASYNCWRITE,OnWrite)
	ON_MESSAGE(WM_ASYNCCLOSE,OnClose)
END_MESSAGE_MAP()

/*
	DoDataExchange()
*/
void CConnectPage::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);

	DDX_Control(pDX,IDC_COMBO_HOST,m_wndComboHost);
	DDX_Control(pDX,IDC_COMBO_PORT,m_wndComboPort);
	DDX_Text(pDX,IDC_EDIT_SEND,m_strHostSend);
	DDX_Text(pDX,IDC_EDIT_RECV,m_strHostRecv);

	// effettua i controlli solo se deve effettivamente validare i dati
	// (click su IDOK/IDCANCEL e non il semplice spostamento da una pagina all'altra)
	if(pDX->m_bSaveAndValidate && !KillPage())
	{
		;
	}
}

/*
	CConnectPage()
*/
CConnectPage::CConnectPage() : CPropertyPageDialog(IDD_PAGE_CONNECT)
{
	m_pConnectButtonText = "&Connect";
	m_pSendButtonText    = "&Send";
	m_pCancelButtonText  = "&Cancel";
	SetPropertyPageOkButton(m_pConnectButtonText);

	m_nMaxHostAddr       = 0;
	m_nMaxPortNumber     = 0;
	m_pConfig            = NULL;
	m_pAsyncSocket       = new CAsyncSock(this);

	m_strConnectHostAddr = DEFAULT_HOST;
	m_nConnectHostPort   = 0;
	m_strHostSend        = "";
	m_strHostRecv        = "";
}

/*
	~CConnectPage()
*/
CConnectPage::~CConnectPage()
{
	if(m_pAsyncSocket)
		delete m_pAsyncSocket,m_pAsyncSocket = NULL;
}

/*
	OnInitDialog()

	Inizializzazione del dialogo.
	Rimappa la funzione base per impostare l'host e la porta (in base al meccanismo di controllo 
	effettuato tramite UpdateData(), DDX, DDV e OnKillPage() deve impostare i valori a mano).
*/
BOOL CConnectPage::OnInitDialog(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnInitDialog();

	// numero max di host per il combo
	m_nMaxHostAddr = m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_MAX_HOSTENTRY_KEY);

	// carica il nome dell'host presente nella configurazione (se non e' stato specificato nessun nome imposta su quello di default)
	char* pHost = (char*)m_pConfig->GetString(TCPSCAN_CONNECT_KEY,TCPSCAN_HOST_KEY);
	if(strcmp(pHost,"")==0)
		pHost = LOCAL_HOST;

	m_strConnectHostAddr.Format("%s",pHost);

	// imposta il testo del combo per l'host, aggiungendolo come primo elemento
	m_wndComboHost.SetWindowText(m_strConnectHostAddr);
	UpdateData(FALSE);
	m_wndComboHost.AddString(m_strConnectHostAddr);

	// inserisce nel combo gli eventuali host presenti
	char* p;
	char szKey[REGKEY_MAX_KEY_NAME+1];
	for(int i = 0; i < m_nMaxHostAddr; i++)
	{
		_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_HOSTADDR_KEY,i);
		if(strcmp((p = (char*)m_pConfig->GetString(TCPSCAN_CONNECT_KEY,szKey)),"")!=0)
		{
			if(m_wndComboHost.FindStringExact(-1,p)==CB_ERR)
				m_wndComboHost.AddString(p);
		}
		else
			break;
	}
	m_wndComboHost.SetCurSel(0);

	// numero max di porte per il combo
	m_nMaxPortNumber = m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_MAX_PORTENTRY_KEY);

	// carica il numero della porta presente nella configurazione (se non e' stato specificato nessun nome imposta su quello di default)
	UINT nPortNumber = m_pConfig->GetNumber(TCPSCAN_CONNECT_KEY,TCPSCAN_PORT_KEY);
	if(nPortNumber==(UINT)-1)
		nPortNumber = 0;
	m_nConnectHostPort = nPortNumber;

	// imposta il testo del combo per la porta, aggiungendola come primo elemento
	char szPort[10];
	_snprintf(szPort,sizeof(szPort)-1,"%u",m_nConnectHostPort);
	m_wndComboPort.SetWindowText(szPort);
	UpdateData(FALSE);
	m_wndComboPort.AddString(szPort);

	// inserisce nel combo le eventuali porte presenti
	for(i = 0; i < m_nMaxPortNumber; i++)
	{
		_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_PORTNUMBER_KEY,i);
		if((nPortNumber = m_pConfig->GetNumber(TCPSCAN_CONNECT_KEY,szKey))!=(UINT)-1)
		{
			_snprintf(szPort,sizeof(szPort)-1,"%u",nPortNumber);
			if(m_wndComboPort.FindStringExact(-1,szPort)==CB_ERR)
				m_wndComboPort.AddString(szPort);
		}
		else
			break;
	}
	m_wndComboPort.SetCurSel(0);

	// imposta il default per il campo numerico (per i campi stringa non serve)
	// (non puo' chiamare UpdateData() ma deve impostare a mano, vedi sopra)
	CWnd* pCWnd;
	if((pCWnd = GetDlgItem(IDC_EDIT_HOSTPORT))!=NULL)
		pCWnd->SetWindowText("0");
	
	return(FALSE);
}

/*
	OnSetActive()

	Attivazione della pagina.
	Rimappa la funzione base per cambiare il testo del bottone IDOK dello sheet.
*/
BOOL CConnectPage::OnSetActive(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnSetActive();
	
	// modifica il testo del bottone IDOK dello sheet
	SetPropertySheetOkButton(GetPropertyPageOkButton());

	if(LookForBusyPages(IDD_PAGE_CONNECT))
		DisablePropertySheetOkButton();

	if(LookForPageBusy(IDD_PAGE_CONNECT))
		EnablePropertySheetOkButton();

	return(TRUE);
}

/*
	OnKillActive()

	Disattivazione della pagina.
*/
BOOL CConnectPage::OnKillActive(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnKillActive();

	return(TRUE);
}

/*
	OnKillSheet()

	Chiusura del dialogo.
*/
void CConnectPage::OnKillSheet(void)
{
	::SendMessage(this->m_hWnd,WM_ASYNCCONNECT,WM_CLOSE,WM_CLOSE);

	if(IsWindow(this->m_hWnd))
	{
		// la configurazione viene salvata nelle OnKillFocus...()
		;
	}
}

/*
	OnOk()
*/
void CConnectPage::OnOk(void)
{
	EnterPageBusyState(IDD_PAGE_CONNECT);

	int nWSAError = 0;
	static char szWSAString[128];
	strcpy(szWSAString,"0");
	::PostMessage(this->m_hWnd,WM_ASYNCCONNECT,nWSAError,MAKELPARAM(LOWORD(szWSAString),HIWORD(szWSAString)));
}

/*
	OnCancel()
*/
void CConnectPage::OnCancel(void)
{
	::PostMessage(this->m_hWnd,WM_ASYNCCONNECT,WM_CANCEL,WM_CANCEL);

	LeavePageBusyState(IDD_PAGE_CONNECT);
}

/*
	OnKillFocusComboHost()

	Aggiorna il valore utilizzato come host per la connessione e la configurazione.
*/
void CConnectPage::OnKillFocusComboHost(void)
{
	// ricava il testo del combo aggiornando di conseguenza il nome dell'host e la configurazione
	char szComboEntry[HOSTNAME_SIZE+1];
	m_wndComboHost.GetWindowText(szComboEntry,sizeof(szComboEntry));

	// controlla se e' stato cambiato il testo del combo
	if(strcmp(szComboEntry,LPCSTR(m_strConnectHostAddr))!=0)
	{
		// aggiorna il nome dell'host di default
		m_strConnectHostAddr.Format("%s",szComboEntry);

		// aggiorna il nome dell'host di default nella configurazione
		m_pConfig->UpdateString(TCPSCAN_CONNECT_KEY,TCPSCAN_HOST_KEY,szComboEntry);

		// cerca il testo del combo nella configurazione, se non lo trova deve inserirlo nel
		// nel combo e nella configurazione
		char* p;
		char szKey[REGKEY_MAX_KEY_NAME+1];
		BOOL bFound = FALSE;

		for(int i = 0; i < m_nMaxHostAddr; i++)
		{
			_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_HOSTADDR_KEY,i);
			if(strcmp((p = (char*)m_pConfig->GetString(TCPSCAN_CONNECT_KEY,szKey)),"")!=0)
			{
				if(strcmp(szComboEntry,p)==0)
				{
					bFound = TRUE;
					break;
				}
			}
			else
				break;
		}

		// non trovato, lo inserisce nel combo se gia' non esiste
		if(!bFound)
		{
			if(i==m_nMaxHostAddr)
				m_wndComboHost.DeleteString(0);

			if(m_wndComboHost.FindStringExact(-1,szComboEntry)==CB_ERR)
				m_wndComboHost.AddString(szComboEntry);
		}

		// aggiorna le entrate della configurazione con quanto presente nel combo (elimina e reinserisce)
		for(i = 0; i < m_nMaxHostAddr; i++)
		{
			_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_HOSTADDR_KEY,i);
			if(strcmp(m_pConfig->GetString(TCPSCAN_CONNECT_KEY,szKey),"")!=0)
				m_pConfig->Delete(TCPSCAN_CONNECT_KEY,szKey);
		}
		m_pConfig->Save();

		for(i = 0; i < m_nMaxHostAddr; i++)
		{
			if(m_wndComboHost.GetLBText(i,szComboEntry)!=CB_ERR)
			{
				_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_HOSTADDR_KEY,i);
				m_pConfig->Insert(TCPSCAN_CONNECT_KEY,szKey,szComboEntry);
			}
		}
		m_pConfig->Save();
	}
}

/*
	OnKillFocusComboPort()

	Aggiorna il valore utilizzato come port per la connessione e la configurazione.
*/
void CConnectPage::OnKillFocusComboPort(void)
{
	// ricava il testo del combo aggiornando di conseguenza la porta e la configurazione
	char szComboEntry[HOSTNAME_SIZE+1];
	m_wndComboPort.GetWindowText(szComboEntry,sizeof(szComboEntry));

	if(strcmp(szComboEntry,"")==0 || atoi(szComboEntry) < 0)
	{
		m_wndComboPort.SetWindowText("0");
		m_nConnectHostPort = 0;
		UpdateData(FALSE);
		return;
	}

	char szPort[16];
	_snprintf(szPort,sizeof(szPort)-1,"%u",m_nConnectHostPort);

	// controlla se e' stato cambiato il testo del combo
	if(strcmp(szComboEntry,szPort)!=0)
	{
		// aggiorna il nome dell'host di default
		m_nConnectHostPort = (UINT)atol(szComboEntry);

		// aggiorna la porta di default nella configurazione
		m_pConfig->UpdateNumber(TCPSCAN_CONNECT_KEY,TCPSCAN_PORT_KEY,m_nConnectHostPort);

		// cerca il testo del combo nella configurazione, se non lo trova deve inserirlo nel
		// nel combo e nella configurazione
		UINT nPortNumber;
		char szKey[REGKEY_MAX_KEY_NAME+1];
		BOOL bFound = FALSE;

		for(int i = 0; i < m_nMaxPortNumber; i++)
		{
			_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_PORTNUMBER_KEY,i);
			if((nPortNumber = m_pConfig->GetNumber(TCPSCAN_CONNECT_KEY,szKey))!=(UINT)-1)
			{
				_snprintf(szPort,sizeof(szPort)-1,"%u",nPortNumber);
				if(strcmp(szComboEntry,szPort)==0)
				{
					bFound = TRUE;
					break;
				}
			}
			else
				break;
		}

		// non trovato, lo inserisce nel combo se gia' non esiste
		if(!bFound)
		{
			if(i==m_nMaxPortNumber)
				m_wndComboPort.DeleteString(0);

			if(m_wndComboPort.FindStringExact(-1,szComboEntry)==CB_ERR)
				m_wndComboPort.AddString(szComboEntry);
		}

		// aggiorna le entrate della configurazione con quanto presente nel combo (elimina e reinserisce)
		for(i = 0; i < m_nMaxPortNumber; i++)
		{
			_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_PORTNUMBER_KEY,i);
			if(m_pConfig->GetNumber(TCPSCAN_CONNECT_KEY,szKey)!=(UINT)-1)
				m_pConfig->Delete(TCPSCAN_CONNECT_KEY,szKey);
		}
		m_pConfig->Save();

		for(i = 0; i < m_nMaxPortNumber; i++)
		{
			if(m_wndComboPort.GetLBText(i,szComboEntry)!=CB_ERR)
			{
				_snprintf(szKey,sizeof(szKey)-1,"%s%d",TCPSCAN_PORTNUMBER_KEY,i);
				nPortNumber = atol(szComboEntry);
				m_pConfig->Insert(TCPSCAN_CONNECT_KEY,szKey,nPortNumber);
			}
		}
		m_pConfig->Save();
	}
}

/*
	OnConnect()

	Effettua il collegamento all'host/porta specificati.
	Chiamata dallo sheet per il click sul bottone (IDOK).
*/
LONG CConnectPage::OnConnect(UINT wParam,LONG lParam)
{
	static int nConnectIndex = -1;
	static TCPSCAN tcpscan;
	char* p;
	char* pIpAddress = {LOCAL_HOST};
	CString strBuffer;

	// e' stato cliccato il bottone Cancel, annulla la connessione
	if(CHECK_PARAM_MESSAGE(WM_CANCEL))
	{
		if(m_pAsyncSocket)
			m_pAsyncSocket->Close();
		wParam = 1;
		lParam = 0;
	}
	// e' stato cliccato il bottone Exit, annulla la connessione
	else if(CHECK_PARAM_MESSAGE(WM_CLOSE))
	{
		if(m_pAsyncSocket)
			m_pAsyncSocket->Close();
		wParam = lParam = 0;
		return(0);
	}

	// controlla che il costruttore sia riuscito nella inizializzazione
	if(!m_pAsyncSocket)
	{
		AfxMessageBox("Unable to create the internal socket.",MB_ICONWARNING);
		return(0);
	}

	// per gestire i due tipi di connessione (aperta, come con FTP, o chiusa, come con HTTP)
	// ricava il testo del bottone IDOK per sapere se si tratta della prima chiamata o delle successive
	char szText[32];
	GetPropertySheetOkButton(szText);
	if(strcmp(szText,"&Send")==0)
	{
		nConnectIndex = 1;
	}
	else
	{
		if(nConnectIndex!=0)
			nConnectIndex = -1;
	}

	// prima chiamata, effettua la connessione
	if(nConnectIndex < 0)
	{
		// disabilita il bottone Connect e trasforma Exit in Cancel
		DisablePropertySheetOkButton();
		SetPropertySheetCancelButton(IDCANCEL_CANCEL_PROMPT);

		nConnectIndex = 0;

		while((p = (char*)m_pAsyncSocket->ParseIPRange(m_strConnectHostAddr,m_strConnectHostAddr))!=NULL)
			pIpAddress = p;

		m_strConnectHostAddr = pIpAddress;
		UpdateData(FALSE);

		strcpyn(tcpscan.ip,m_strConnectHostAddr,IP_ADDRESS_SIZE+1);
		tcpscan.port = m_nConnectHostPort;

		TCPSCAN* t = &tcpscan;

		// effettua il collegamento all'host/porta specificati
		if(m_pAsyncSocket->Open())
		{
			strBuffer.Format("connecting to %s:%d...",tcpscan.ip,tcpscan.port);
			SetTitle(strBuffer);
			//m_pAsyncSocket->SetSocketTimeout(10);
			m_pAsyncSocket->AsyncConnect(t->ip,t->port);
		}
		else
		{
			// apertura fallita, invia autonomamente il messaggio
			int nWSAError = m_pAsyncSocket->GetWSAErrorNumber();
			static char szWSAString[128];
			strcpyn(szWSAString,m_pAsyncSocket->GetWSAErrorString(),sizeof(szWSAString));
			::PostMessage(this->m_hWnd,WM_ASYNCCONNECT,nWSAError,MAKELPARAM(LOWORD(szWSAString),HIWORD(szWSAString)));
			strBuffer.Format("error: %s",szWSAString);
			SetTitle(strBuffer);
		}
	}
	else // chiamate successive
	{
		BOOL bConnected = (BOOL)((int)wParam==0);

		if(!bConnected)
		{
			if(m_pAsyncSocket->IsWSAError(wParam))
			{
				strBuffer.Format("%s:%d error: %s",tcpscan.ip,tcpscan.port,m_pAsyncSocket->GetWSAErrorString());
				SetTitle(strBuffer);
				AfxMessageBox(strBuffer,MB_ICONWARNING);
			}

			m_pAsyncSocket->Close();
			strBuffer.Format("%s:%d: connection closed",tcpscan.ip,tcpscan.port);
			SetTitle(strBuffer);
			AfxMessageBox(strBuffer,MB_ICONINFORMATION);

			// abilita il bottone Connect e trasforma Cancel in Exit
			SetPropertySheetOkButton(m_pConnectButtonText);
			EnablePropertySheetOkButton();
			SetPropertySheetCancelButton(IDCANCEL_EXIT_PROMPT);
			LeavePageBusyState(IDD_PAGE_CONNECT);
			
			nConnectIndex = -1;
		}
		else
		{
			if(nConnectIndex==0)
			{
				// abilita il bottone Send e trasforma Exit in Cancel
				SetPropertySheetOkButton(m_pSendButtonText);
				EnablePropertySheetOkButton();
				SetPropertySheetCancelButton(IDCANCEL_CANCEL_PROMPT);
				
				nConnectIndex = -1;
			}
			else
			{
				UpdateData(TRUE);

				if(m_strHostSend.GetLength() > 0)
				{
					m_pAsyncSocket->SetData(m_strHostSend);
					if(m_pAsyncSocket->Send() < 0)
						::PostMessage(this->m_hWnd,WM_ASYNCCLOSE,0,0);
				}
			}
		}

		SetTitle(PROGRAM_NAME);
	}
	
	return(0L);
}

/*
	OnRead()
	
	Chiamata dal socket per la ricezione dei dati.
*/
LONG CConnectPage::OnRead(UINT /*wParam*/,LONG /*lParam*/)
{
	while(m_pAsyncSocket->Receive() > 0)
		m_strHostRecv += m_pAsyncSocket->GetData();

	// aggiorna i campi della pagina
	UpdateData(FALSE);

	// per posizionarsi alla fine
	CEdit* pCEdit = (CEdit*)GetDlgItem(IDC_EDIT_RECV);
	if(pCEdit)
		pCEdit->LineScroll(pCEdit->GetLineCount());

	return(0L);
}

/*
	OnWrite()
	
	Chiamata dal socket per l'invio dei dati.
*/
LONG CConnectPage::OnWrite(UINT /*wParam*/,LONG /*lParam*/)
{
	if(m_strHostSend.GetLength() > 0)
	{
		m_pAsyncSocket->SetData(m_strHostSend);
		m_pAsyncSocket->Send();
	}

	return(0L);
}

/*
	OnClose()
	
	Chiamata dal socket per la chiusura.
*/
LONG CConnectPage::OnClose(UINT /*wParam*/,LONG /*lParam*/)
{
	m_pAsyncSocket->Close();

	// aggiorna il testo dei bottoni dello sheet
	SetPropertySheetOkButton(m_pConnectButtonText);
	EnablePropertySheetOkButton();
	SetPropertySheetCancelButton(IDCANCEL_EXIT_PROMPT);

	AfxMessageBox("Connection closed by the remote host.",MB_ICONINFORMATION);

	LeavePageBusyState(IDD_PAGE_CONNECT);

	return(0L);
}

/*
	DDV_...()
*/
/*
void AFXAPI DDV_ValidateIP(CDataExchange* pDX,int nIDC,CString& cIpAddr)
{
	pDX->PrepareEditCtrl(nIDC);
	
	if(pDX->m_bSaveAndValidate)
		if(cIpAddr.GetLength() <= 0 || cIpAddr.GetLength() > HOSTNAME_SIZE)
		{
			AfxMessageBox("Must enter a valid ip string.",MB_ICONWARNING);
			pDX->Fail();
		}
}

void AFXAPI DDV_ValidatePortNumber(CDataExchange* pDX,int nIDC,unsigned int& iPort)
{
	pDX->PrepareEditCtrl(nIDC);
	
	if(pDX->m_bSaveAndValidate)
		if(iPort < 0 || iPort >= UINT_MAX)
		{
			AfxMessageBox("Must enter a valid port number.",MB_ICONWARNING);
			pDX->Fail();
		}
}
*/