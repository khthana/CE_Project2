/*
	TcpScanPage.cpp
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <limits.h>
#include "window.h"
#include "win32api.h"
#include "CAsyncSock.h"
#include "CListCtrlEx.h"
#include "CPropertyPageDialog.h"
#include "TcpMessages.h"
#include "TcpScanConfig.h"
#include "TcpScanAddServiceDlg.h"
#include "TcpServicesPage.h"
#include "TcpScanPage.h"
#include "TcpScanVersion.h"
#include "resource.h"

static void AFXAPI DDV_ValidateIP(CDataExchange*,int,CString&);
static void AFXAPI DDV_ValidatePortList(CDataExchange*,int,CString&);
static void AFXAPI DDV_ValidatePortNumber(CDataExchange*,int,UINT&);

IMPLEMENT_DYNCREATE(CScanPage,CPropertyPageDialog)

BEGIN_MESSAGE_MAP(CScanPage,CPropertyPageDialog)
	// menu popup
	ON_COMMAND(IDM_SCAN_REMOVEPORT,OnScanPopupMenuRemovePort)
	ON_COMMAND(IDM_SCAN_SAVETOREGISTRY,OnScanPopupMenuSaveToRegistry)
	ON_COMMAND(IDM_SCAN_LOADFROMREGISTRY,OnScanPopupMenuLoadFromRegistry)
	ON_COMMAND(IDM_SCAN_ADDTOSERVICES,OnScanPopupMenuAddToServices)
	ON_COMMAND(IDM_SCAN_REMOVEFROMSERVICES,OnScanPopupMenuRemoveFromServices)
	ON_COMMAND(IDM_SCAN_LOADSERVICES,OnScanPopupMenuLoadServices)
	ON_COMMAND(IDM_SCAN_LOADFROMSERVICES,OnScanPopupMenuLoadFromServices)
	ON_COMMAND(IDM_SCAN_CLEARPORTS,OnScanPopupMenuClearPorts)

	// radio buttons (lista/intervallo)
	ON_BN_CLICKED(IDC_RADIO_PORTLIST,OnRadioButtonPortList)
	ON_BN_CLICKED(IDC_RADIO_PORTRANGE,OnRadioButtonPortRange)

	// per impostare il default per l'host fine
	ON_EN_KILLFOCUS(IDC_EDIT_STARTHOST,OnKillFocusStartHost)

	// scan (inviato dal socket)
	ON_MESSAGE(WM_ASYNCCONNECT,OnScan)
END_MESSAGE_MAP()

/*
	DoDataExchange()
*/
void CScanPage::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);

	DDX_Text(pDX,IDC_EDIT_STARTHOST,m_strStartHost);
	DDX_Text(pDX,IDC_EDIT_ENDHOST,m_strEndHost);
	DDX_Text(pDX,IDC_EDIT_PORTLIST,m_strPortList);
	DDX_Radio(pDX,IDC_RADIO_PORTLIST,m_nPortList);
	//DDX_Radio(pDX,IDC_RADIO_PORTRANGE,m_nPortRange); se i radio buttons vengono raggruppati si chiama solo il DDX relativo al primo
	DDX_Text(pDX,IDC_EDIT_STARTPORT,m_nStartPort);
	DDX_Text(pDX,IDC_EDIT_ENDPORT,m_nEndPort);
	DDX_Control(pDX,IDC_LIST_SCAN,m_wndScanList);

	// effettua i controlli solo se deve effettivamente validare i dati
	// (click su IDOK/IDCANCEL e non il semplice spostamento da una pagina all'altra)
	if(pDX->m_bSaveAndValidate && !KillPage())
	{
		CWnd* pWnd;

		if((pWnd = GetDlgItem(IDC_EDIT_STARTHOST))!=NULL)
			if(pWnd->IsWindowEnabled())
				DDV_ValidateIP(pDX,IDC_EDIT_STARTHOST,m_strStartHost);

		if((pWnd = GetDlgItem(IDC_EDIT_ENDHOST))!=NULL)
			if(pWnd->IsWindowEnabled())
				DDV_ValidateIP(pDX,IDC_EDIT_ENDHOST,m_strEndHost);

		if((pWnd = GetDlgItem(IDC_EDIT_PORTLIST))!=NULL)
			if(pWnd->IsWindowEnabled())
				DDV_ValidatePortList(pDX,IDC_EDIT_PORTLIST,m_strPortList);

		if((pWnd = GetDlgItem(IDC_EDIT_STARTPORT))!=NULL)
			if(pWnd->IsWindowEnabled())
				DDV_ValidatePortNumber(pDX,IDC_EDIT_STARTPORT,m_nStartPort);

		if((pWnd = GetDlgItem(IDC_EDIT_ENDPORT))!=NULL)
			if(pWnd->IsWindowEnabled())
				DDV_ValidatePortNumber(pDX,IDC_EDIT_ENDPORT,m_nEndPort);
	}
}

/*
	CScanPage()
*/
CScanPage::CScanPage() : CPropertyPageDialog(IDD_PAGE_SCAN)
{
	m_pConfig = NULL;
	m_pAsyncSock = new CAsyncSock(this);
	m_strStartHost = DEFAULT_HOST;
	m_strEndHost = DEFAULT_HOST;
	m_nPortFlag = 0;
	m_nPortList = 0;
	m_nPortRange = 1;
	m_strPortList = DEFAULT_PORTNUMBERS;
	m_nStartPort = 0;
	m_nEndPort = 0;

	SetPropertyPageOkButton("&Scan");
}

/*
	~CScanPage()
*/
CScanPage::~CScanPage()
{
	if(m_pAsyncSock)
		delete m_pAsyncSock,m_pAsyncSock = NULL;
}

/*
	OnInitDialog()

	Inizializzazione del dialogo.
	Rimappa la funzione base per impostare i numeri delle porte (in base al meccanismo di controllo 
	effettuato tramite UpdateData(), DDX, DDV e OnKillPage() deve impostare i valori a mano).
*/
BOOL CScanPage::OnInitDialog(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnInitDialog();

	// imposta i defaults per i campi numerici (per i campi stringa non serve)
	// (non puo' chiamare UpdateData() ma deve impostare a mano, vedi sopra)
	CWnd* pWnd;
	if((pWnd = GetDlgItem(IDC_EDIT_STARTPORT))!=NULL)
		pWnd->SetWindowText("0");
	if((pWnd = GetDlgItem(IDC_EDIT_ENDPORT))!=NULL)
		pWnd->SetWindowText("0");

	// crea il controllo per la lista per lo scanning
	CreateScanningList();
	
	return(FALSE);
}

/*
	OnSetActive()

	Attivazione della pagina.
	Rimappa la funzione base per cambiare il testo del bottone IDOK dello sheet.
*/
BOOL CScanPage::OnSetActive(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnSetActive();
	
	// modifica il testo del bottone IDOK dello sheet
	SetPropertySheetOkButton(GetPropertyPageOkButton());

	// disabilita il bottone IDOK se una qualsiasi delle pagine rimanenti e' attiva
	if(LookForBusyPages(IDD_PAGE_SCAN))
		DisablePropertySheetOkButton();

	return(TRUE);
}

/*
	OnKillActive()

	Disattivazione della pagina.
*/
BOOL CScanPage::OnKillActive(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnKillActive();

	UpdateData(TRUE);

	return(TRUE);
}

/*
	OnKillSheet()

	Chiusura del dialogo.
	Rimappa la funzione base per salvare la configurazione.
*/
void CScanPage::OnKillSheet(void)
{
	// si invia il messaggio per terminare lo scanning
	::SendMessage(this->m_hWnd,WM_ASYNCCONNECT,WM_CLOSE,WM_CLOSE);

	if(IsWindow(this->m_hWnd))
	{
		// aggiorna la configurazione prima di uscire
		// UpdateData(TRUE) non serve perche' non fa riferimento a un campo ma alla lista
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_HOST_COLSIZE_KEY,m_wndScanList.GetColWidth(0));
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_PORT_COLSIZE_KEY,m_wndScanList.GetColWidth(1));
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_DESC_COLSIZE_KEY,m_wndScanList.GetColWidth(2));
	}
}

/*
	OnOk()

	Chiamata dallo sheet per il click sul bottone (IDOK).
*/
void CScanPage::OnOk(void)
{
	// si imposta come pagina attiva
	EnterPageBusyState(IDD_PAGE_SCAN);

	// crea il socket per lo scanning
	if(!m_pAsyncSock)
		m_pAsyncSock = new CAsyncSock(this);

	// si invia il messaggio per iniziare lo scanning
	::PostMessage(this->m_hWnd,WM_ASYNCCONNECT,(WPARAM)-1,MAKELPARAM((WORD)-1,(WORD)-1));
}

/*
	OnCancel()

	Chiamata dallo sheet per il click sul bottone (IDCANCEL).
*/
void CScanPage::OnCancel(void)
{
	// si invia il messaggio per terminare lo scanning
	::PostMessage(this->m_hWnd,WM_ASYNCCONNECT,WM_CANCEL,WM_CANCEL);

	// resetta lo status
	LeavePageBusyState(IDD_PAGE_SCAN);
}

/*
	OnRadioButtonPortList()

	Abilita il campo lista e disabilita i campi intervallo.
*/
void CScanPage::OnRadioButtonPortList(void)
{
	char szPort[16];

	GetDlgItem(IDC_EDIT_PORTLIST)->EnableWindow(TRUE);
	
	if(GetDlgItem(IDC_EDIT_STARTPORT)->GetWindowText(szPort,sizeof(szPort)-1) <= 0)
		GetDlgItem(IDC_EDIT_STARTPORT)->SetWindowText("1");
	GetDlgItem(IDC_EDIT_STARTPORT)->EnableWindow(FALSE);
	
	if(GetDlgItem(IDC_EDIT_ENDPORT)->GetWindowText(szPort,sizeof(szPort)-1) <= 0)
		GetDlgItem(IDC_EDIT_ENDPORT)->SetWindowText("1");
	GetDlgItem(IDC_EDIT_ENDPORT)->EnableWindow(FALSE);

	m_nPortFlag = 0;
}

/*
	OnRadioButtonPortRange()

	Abilita i campi intervallo e disabilita il campo lista.
*/
void CScanPage::OnRadioButtonPortRange(void)
{
	char szPort[16];

	if(GetDlgItem(IDC_EDIT_ENDPORT)->GetWindowText(szPort,sizeof(szPort)-1) <= 0)
		GetDlgItem(IDC_EDIT_PORTLIST)->SetWindowText("1");
	GetDlgItem(IDC_EDIT_PORTLIST)->EnableWindow(FALSE);
	
	GetDlgItem(IDC_EDIT_STARTPORT)->EnableWindow(TRUE);
	GetDlgItem(IDC_EDIT_ENDPORT)->EnableWindow(TRUE);

	m_nPortFlag = 1;
}

/*
	OnKillFocusStartHost()

	Imposta il default per l'host fine.
*/
void CScanPage::OnKillFocusStartHost(void)
{
	CString strIP;

	// imposta l'host finale sull'iniziale solo se il primo e' vuoto
	if(GetDlgItemText(IDC_EDIT_ENDHOST,strIP)==0)
		if(GetDlgItemText(IDC_EDIT_STARTHOST,strIP)!=0)
			SetDlgItemText(IDC_EDIT_ENDHOST,strIP);
}

/*
	OnScanPopupMenuRemovePort()

	Elimina l'elemento selezionato dalla lista per lo scanning.
*/
void CScanPage::OnScanPopupMenuRemovePort(void)
{
	RemovePort();
}

/*
	OnScanPopupMenuSaveToRegistry()

	Salva la lista per lo scanning nel registro.
*/
void CScanPage::OnScanPopupMenuSaveToRegistry(void)
{
	if(SaveScanning())
		AfxMessageBox("The current scanning has been saved into the registry.",MB_ICONINFORMATION);
}

/*
	OnScanPopupMenuLoadFromRegistry()

	Carica la lista per lo scanning dal registro.
*/
void CScanPage::OnScanPopupMenuLoadFromRegistry(void)
{
	if(!LoadScanning())
		AfxMessageBox("Unable to load the scanning list from the registry.",MB_ICONWARNING);
}

/*
	OnScanPopupMenuAddToServices()

	Aggiunge la porta alla lista dei servizi.
*/
void CScanPage::OnScanPopupMenuAddToServices(void)
{
	int nItem = 0;
	BOOL bAdd = TRUE;

	if((nItem = m_wndScanList.GetCurrentItem()) >= 0)
	{
		bAdd = FALSE;

		// ricava i puntatori (classe e lista) per accedere alla pagina dei servizi
		CServicesPage* pServicesPage = NULL;
		CListCtrlEx* pServicesList = NULL;
		PROPERTYPAGE* p;
		if((p = FindPage(IDD_PAGE_SERVICES))!=(PROPERTYPAGE*)NULL)
		{
			pServicesPage = (CServicesPage*)p->page;
			pServicesList = &(pServicesPage->m_wndServicesList);
		}

		// e' riuscito ad ottenere il puntatore alla pagina dei servizi
		if(pServicesPage)
		{
			// imposta i campi per il servizio
			char szService[SERVICE_NAME+1] = {0};
			char szPort[PORT_NAME+1] = {0};

			m_wndScanList.GetItemText(nItem,2,szService,sizeof(szService)-1);
			m_wndScanList.GetItemText(nItem,1,szPort,sizeof(szPort)-1);

			CString strServiceName = szService;
			UINT nPortNumber = atoi(szPort);
			CString strProtoName = "tcp";
			CString strComment = " ";

			// dialogo per il servizio
			CTcpScanAddServiceDlg dlg(this,strServiceName,nPortNumber,strProtoName,strComment);
			if(dlg.DoModal()==IDOK)
			{
				// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
				// questa non e' stata ancora visualizzata
				if(!pServicesPage->Dirty())
					ActivatePage(IDD_PAGE_SERVICES);

				// aggiunge il servizio alla lista
				SERVICES s(strServiceName,nPortNumber,strProtoName,strComment);
				bAdd = pServicesPage->AddService(&s);
			}
			else
				bAdd = TRUE;
		}
	}
	
	if(!bAdd)
		AfxMessageBox("Unable to add the service to the list.",MB_ICONWARNING);
}

/*
	OnScanPopupMenuRemoveFromServices()

	Rimuove la porta dalla lista dei servizi.
*/
void CScanPage::OnScanPopupMenuRemoveFromServices(void)
{
	int nItem = 0;
	BOOL bFound = TRUE;

	if((nItem = m_wndScanList.GetCurrentItem()) >= 0)
	{
		bFound = FALSE;

		// ricava i puntatori (classe e lista) per accedere alla pagina dei servizi
		CServicesPage* pServicesPage = NULL;
		CListCtrlEx* pServicesList = NULL;
		PROPERTYPAGE* p;
		if((p = FindPage(IDD_PAGE_SERVICES))!=(PROPERTYPAGE*)NULL)
		{
			pServicesPage = (CServicesPage*)p->page;
			pServicesList = &(pServicesPage->m_wndServicesList);
		}

		// e' riuscito ad ottenere il puntatore alla pagina dei servizi
		if(pServicesPage)
		{
			// imposta i campi per il servizio
			char szService[SERVICE_NAME+1] = {0};
			char szPort[PORT_NAME+1] = {0};

			m_wndScanList.GetItemText(nItem,2,szService,sizeof(szService)-1);
			m_wndScanList.GetItemText(nItem,1,szPort,sizeof(szPort)-1);

			// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
			// questa non e' stata ancora visualizzata
			if(!pServicesPage->Dirty())
				ActivatePage(IDD_PAGE_SERVICES);

			// elimina il servizio alla lista
			SERVICES s(szService,atoi(szPort),"tcp"," ");
			bFound = pServicesPage->RemoveService(&s);
		}
	}
	
	if(!bFound)
		AfxMessageBox("There is no a such service into the list.",MB_ICONWARNING);
}

/*
	OnScanPopupMenuLoadServices()

	Carica la lista dei servizi con le porte presenti nella lista per lo scanning.
*/
void CScanPage::OnScanPopupMenuLoadServices(void)
{
	BOOL bLoad = TRUE;

	// ricava i puntatori (classe e lista) per accedere alla pagina dei servizi
	CServicesPage* pServicesPage = NULL;
	CListCtrlEx* pServicesList = NULL;
	PROPERTYPAGE* p;
	if((p = FindPage(IDD_PAGE_SERVICES))!=(PROPERTYPAGE*)NULL)
	{
		pServicesPage = (CServicesPage*)p->page;
		pServicesList = &(pServicesPage->m_wndServicesList);
	}

	// e' riuscito ad ottenere il puntatore alla pagina dei servizi
	if(pServicesPage)
	{
		bLoad = FALSE;

		// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
		// questa non e' stata ancora visualizzata
		if(!pServicesPage->Dirty())
			ActivatePage(IDD_PAGE_SERVICES);

		// elimina tutti gli elementi dalla lista dei servizi
		pServicesList->DeleteAllItems();

		// copia gli elementi presenti nella lista per lo scanning in quella per i servizi
		SERVICES s;
		char szService[SERVICE_NAME+1] = {0};
		char szPort[PORT_NAME+1] = {0};

		// per ogni elemento presente nelle lista per lo scanning
		int tot = m_wndScanList.GetItemCount();
		for(int i = 0; i < tot; i++)
		{
			// imposta i campi per il servizio
			m_wndScanList.GetItemText(i,2,szService,sizeof(szService)-1);
			m_wndScanList.GetItemText(i,1,szPort,sizeof(szPort)-1);

			strcpyn(s.service,szService,SERVICE_NAME+1);
			s.port = atoi(szPort);
			strcpy(s.proto,"tcp");
			strcpy(s.comment," ");

			// aggiuge il servizio alla lista
			pServicesPage->AddService(&s);
		}

		bLoad = TRUE;
	}
		
	if(bLoad)
		AfxMessageBox("The current scanning has been loaded into the services list.",MB_ICONINFORMATION);
	else
		AfxMessageBox("Unable to load current scanning into the services list.",MB_ICONWARNING);
}

/*
	OnScanPopupMenuLoadFromServices()

	Carica la lista per lo scanning con le porte presenti nella lista dei servizi.
*/
void CScanPage::OnScanPopupMenuLoadFromServices(void)
{
	// ricava i puntatori (classe e lista) per accedere alla pagina dei servizi
	CServicesPage* pServicesPage = NULL;
	CListCtrlEx* pServicesList = NULL;
	PROPERTYPAGE* p;
	if((p = FindPage(IDD_PAGE_SERVICES))!=(PROPERTYPAGE*)NULL)
	{
		pServicesPage = (CServicesPage*)p->page;
		pServicesList = &(pServicesPage->m_wndServicesList);
	}

	// e' riuscito ad ottenere il puntatore alla pagina dei servizi
	if(pServicesPage)
	{
		// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
		// questa non e' stata ancora visualizzata
		if(!pServicesPage->Dirty())
			ActivatePage(IDD_PAGE_SERVICES);

		// copia gli elementi presenti nella lista dei servizi in quella per lo scanning
		int tot = pServicesList->GetItemCount();
		if(tot > 0)
		{
			m_nPortFlag   = 0;
			m_nPortList   = 0;
			m_strPortList = "";
			m_nStartPort  = 0;
			m_nEndPort    = 0;
			
			char szPort[PORT_NAME+1] = {0};

			for(int i = 0; i < tot; i++)
			{
				pServicesList->GetItemText(i,1,szPort,sizeof(szPort)-1);
				m_strPortList += szPort;
				if(i+1!=tot)
					m_strPortList += ", ";
			}

			// aggiorna i campi della pagina
			UpdateData(FALSE);
			OnRadioButtonPortList();
		}
	}
}

/*
	OnScanPopupMenuClearPorts()
	
	Azzera i numeri di porte (lista/range) correnti.
*/
void CScanPage::OnScanPopupMenuClearPorts(void)
{
	m_strPortList  = "0";
	m_nStartPort = 0;
	m_nEndPort   = 0;
	m_wndScanList.DeleteAllItems();
	UpdateData(FALSE);
}

/*
	OnScan()

	Effettua lo scanning dell'host/porta specificati.
	Chiamata dallo sheet per il click sul bottone (IDOK).
*/
LONG CScanPage::OnScan(UINT wParam,LONG lParam)
{
	static char szPortBuffer[MAX_PORTLIST_STRING+1];
	static UINT* nPortArray = NULL;
	static UINT nScanIndex = (UINT)-1;
	static UINT nScanArray = 0;
	static char* pIpAddr = NULL;
	static TCPSCAN tcpscan;
	static char nItem[HOSTNAME_SIZE + 5 + 256 + 1];
	CString strStatus;

	::PeekAndPump();

	if(!m_pAsyncSock)
		return(0);

	// e' stato cliccato il bottone Cancel, annulla lo scanning
	if(CHECK_PARAM_MESSAGE(WM_CANCEL))
	{
		// resetta le variabili
		m_pAsyncSock->AsyncClose();
		delete m_pAsyncSock,m_pAsyncSock = NULL;

		wParam = (UINT)-1,lParam = (LONG)-1;
		nScanIndex = nScanArray;
		if(nPortArray)
		{
			delete [] nPortArray;
			nPortArray = NULL;
		}

		// elimina gli eventuali messaggi messi in coda dalle OnAsync...()
		MSG msg;
		while(::PeekMessage(&msg,this->m_hWnd,WM_ASYNCCONNECT,WM_ASYNCCONNECT,PM_REMOVE))
			;

		SetTitle(PROGRAM_NAME);

		nScanIndex = (UINT)-1;
		nScanArray = 0;
		if(nPortArray)
		{
			delete [] nPortArray;
			nPortArray = NULL;
		}

		// abilita il bottone Scan e trasforma Cancel in Exit
		EnablePropertySheetOkButton();
		SetPropertySheetCancelButton(IDCANCEL_EXIT_PROMPT);

		LeavePageBusyState(IDD_PAGE_SCAN);

		return(0);
	}
	// e' stato cliccato il bottone Exit, annulla lo scanning
	else if(CHECK_PARAM_MESSAGE(WM_CLOSE))
	{
		// resetta le variabili
		m_pAsyncSock->Close();
		wParam = lParam = 0;
		nScanIndex = nScanArray;
		if(nPortArray)
		{
			delete [] nPortArray;
			nPortArray = NULL;
		}

		return(0);
	}

	// prima chiamata, inizializza
	if(nScanIndex==(UINT)-1)
	{
		// aggiorna la dimensione delle colonne della lista
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_HOST_COLSIZE_KEY,m_wndScanList.GetColWidth(0));
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_PORT_COLSIZE_KEY,m_wndScanList.GetColWidth(1));
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_DESC_COLSIZE_KEY,m_wndScanList.GetColWidth(2));
		m_pConfig->Save();

		UINT i;

		// azzera per le chiamate successive (usa la variabile come indice corrente per l'array host/porta)
		nScanIndex = 0;

		// carica l'array per le porte (lista/intervallo)
		if(m_nPortFlag==0)
		{
			char *token;

			// conta il numero di porte per dimensionare l'array
			strcpyn(szPortBuffer,LPCTSTR(m_strPortList),sizeof(szPortBuffer));
			for(i = 1,token = strtok(szPortBuffer,".,; "); token!=NULL; i++)
				token = strtok(NULL,".,; ");

			nPortArray = new UINT[i];
			if(nPortArray)
			{
				// inserisce le porte nell'array
				strcpyn(szPortBuffer,LPCTSTR(m_strPortList),sizeof(szPortBuffer));
				for(i = 1,token = strtok(szPortBuffer,".,; "); token!=NULL; i++)
				{
					nPortArray[i] = (UINT)atol(token);
					token = strtok(NULL,".,; ");
				}

				// il primo elemento dell'array contiene il totale degli elementi presenti
				nPortArray[0] = (UINT)i - 1;

				// imposta la porta iniziale e finale per lo scanning
				m_nStartPort = nPortArray[1];
				m_nEndPort   = nPortArray[nPortArray[0]];
			}
		}
		else if(m_nPortFlag==1)
		{
			unsigned tot;
			
			// ricava il numero di porte per dimensionare l'array
			tot = (m_nEndPort-m_nStartPort) + 1;
			
			nPortArray = new UINT[tot+1];
			if(nPortArray)
			{
				// inserisce le porte nell'array
				for(i = 0; i < tot; i++)
					nPortArray[i+1] = m_nStartPort + i;
				
				// il primo elemento dell'array contiene il totale degli elementi presenti
				nPortArray[0] = tot;
			}
		}
		else
		{
			AfxMessageBox("No port number specified.",MB_ICONWARNING);
			return(0);
		}

		// imposta la dimensione max della linea di output per la lista
		strStatus.GetBuffer(MAX_PORTLIST_STRING+1);

		// crea la lista
		CreateScanningList();

		// compone la stringa
		strStatus.Format("scanning host %s through %s, TCP ports %u through %u...",m_strStartHost,m_strEndHost,m_nStartPort,m_nEndPort);
		SetTitle(strStatus);

		// inizializza la lista per le coppie host/porta
		nScanArray = 0;
		nScanArray = nPortArray[0];

		// disabilita il bottone Scan e trasforma Exit in Cancel
		DisablePropertySheetOkButton();
		SetPropertySheetCancelButton(IDCANCEL_CANCEL_PROMPT);
	}

	// alla prima chiamata wParam=lParam=0, alle successive (generate da OnAsyncConnect())
	// in wParam/lParam gli errori winsock (numero/stringa)
	BOOL bConnected = wParam==0;
	
	// se si tratta di una delle chiamate successive alla prima (alla prima chiamata wParam=0)
	if(wParam!=(UINT)-1)
	{
		char winsock[256+1];

		if(bConnected)
		{
			strcpyn(winsock,m_pAsyncSock->GetServiceByPort(tcpscan.port,"tcp"),sizeof(winsock)-1);
			strStatus.Format("%s:%d %s service running",tcpscan.ip,tcpscan.port,winsock);
			SetTitle(strStatus);
		}
		else
		{
			strcpyn(winsock,m_pAsyncSock->GetWSAErrorString(),sizeof(winsock)-1);
			strStatus.Format("%s:%d error: %s",tcpscan.ip,tcpscan.port,winsock);
			SetTitle(strStatus);
		}

		// chiude il socket
		m_pAsyncSock->Close();

		// il valore viene sempre ricaricato dalla configurazione e non dalla pagina
		// (la pagina relativa lo salva ad ogni cambio)
		BOOL m_bShowOnlyValidConn = m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SHOWCONN_KEY);

		// visualizza il risultato e registra sul file di log
		if(m_bShowOnlyValidConn ? bConnected : TRUE)
		{
			wsprintf(nItem,"%s;%d;%s",tcpscan.ip,tcpscan.port,winsock);
			m_wndScanList.AddItem(nItem,bConnected ? 1:0,IDM_SCAN);
		}

		::PeekAndPump();
	}

	// per qualsiasi chiamata (prima o successive), se non ha raggiunto la fine dell'array host/porta
	if(nScanIndex < nScanArray)
	{
		// ricava l'elemento corrente
		TCPSCAN* t = NULL;
		if(!pIpAddr)
			pIpAddr = (char*)m_pAsyncSock->ParseIPRange(m_strStartHost,m_strEndHost);

		if(pIpAddr)
		{
			strcpy(tcpscan.ip,pIpAddr);
			tcpscan.port = nPortArray[nScanIndex+1];
			t = &tcpscan;
		}

		if(t)
		{
			// il valore viene sempre ricaricato dalla configurazione e non dalla pagina
			// (la pagina relativa lo salva ad ogni cambio)
			int m_iScanDelay = m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCANDELAY_KEY);

			// ritardo tra le connessioni
			if(m_iScanDelay > 0)
			{
				strStatus.Format("scanning %s:%d (delayed %d secs.)",tcpscan.ip,tcpscan.port,m_iScanDelay);
				
				Delay(m_iScanDelay);

				if(nScanIndex==(UINT)-1 && nScanArray==0)
					return(0L);
			}
			else
				strStatus.Format("scanning %s:%d...",tcpscan.ip,tcpscan.port);
			
			SetTitle(strStatus);

			// scan della coppia host/porta
			if(m_pAsyncSock->Open())
			{
				//socket->SetSocketTimeout(10);
				m_pAsyncSock->AsyncConnect(t->ip,t->port);
			}
			else
			{
				// apertura fallita, invia autonomamente il messaggio
				int wsaerror = m_pAsyncSock->GetWSAErrorNumber();
				static char wsastring[128];
				strcpyn(wsastring,m_pAsyncSock->GetWSAErrorString(),sizeof(wsastring));
				::PostMessage(this->m_hWnd,WM_ASYNCCONNECT,wsaerror,MAKELPARAM(LOWORD(wsastring),HIWORD(wsastring)));
			}

			// incrementa l'elemento corrente dell'array
			nScanIndex++;
			if(nScanIndex >= nScanArray)
			{
				pIpAddr = (char*)m_pAsyncSock->ParseIPRange(m_strStartHost,m_strEndHost);
				if(pIpAddr)
					nScanIndex = 0;
			}
		}
	}
	else // scanning terminato
	{
		SetTitle(PROGRAM_NAME);

		nScanIndex = (UINT)-1;
		nScanArray = 0;
		if(nPortArray)
		{
			delete [] nPortArray;
			nPortArray = NULL;
		}

		// abilita il bottone Scan e trasforma Cancel in Exit
		EnablePropertySheetOkButton();
		SetPropertySheetCancelButton(IDCANCEL_EXIT_PROMPT);

		LeavePageBusyState(IDD_PAGE_SCAN);
	}

	return(0L);
}

/*
	CreateScanningList()

	Crea il controllo per la lista per lo scanning.
*/
BOOL CScanPage::CreateScanningList(void)
{
	BOOL bCreate = m_wndScanList.Create();

	if(bCreate)
	{
		// menu di default per lista vuota
		m_wndScanList.SetDefaultMenu(IDM_SCAN_EMPTY);

		// il click col destro imposta la riga come selezionata
		m_wndScanList.RightClickSelects(TRUE);

		// icone
		m_wndScanList.AddIcon(IDI_ICONPORTERROR);
		m_wndScanList.AddIcon(IDI_ICONPORT);
		
		// colonne
		m_wndScanList.AddCol("Host",'C',m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_HOST_COLSIZE_KEY));
		m_wndScanList.AddCol("Port",'N',m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_PORT_COLSIZE_KEY));
		m_wndScanList.AddCol("Description",'C',m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_DESC_COLSIZE_KEY));
	}

	return(bCreate);
}

/*
	RemovePort()

	Elimina l'elemento corrente della lista (controllo).
*/
void CScanPage::RemovePort(void)
{
	int nItem = 0;

	if((nItem = m_wndScanList.GetCurrentItem()) >= 0)
		m_wndScanList.DeleteItem(nItem);
}

/*
	SaveScanning()

	Salva lo scanning nel registro.
*/
BOOL CScanPage::SaveScanning(void)
{
	UpdateData(TRUE);

	// host inizio/fine
	m_pConfig->UpdateString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_STARTHOST_KEY,m_strStartHost);
	m_pConfig->UpdateString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_ENDHOST_KEY,m_strEndHost);
	
	// porte (lista/intervallo)
	m_pConfig->UpdateNumber(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTMODE_KEY,m_nPortFlag);
	if(m_nPortFlag!=0)
	{
		char szPort[(PORT_NAME*2)+1];
		wsprintf(szPort,"%u,%u",m_nStartPort,m_nEndPort);
		m_pConfig->UpdateString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTNUMBERS_KEY,szPort);
	}
	else
		m_pConfig->UpdateString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTNUMBERS_KEY,m_strPortList);
	
	m_pConfig->Save();

	return(TRUE);
}

/*
	LoadScanning()

	Carica lo scanning dal registro.
*/
BOOL CScanPage::LoadScanning(void)
{
	// crea la lista (controllo)
	BOOL bCreate = CreateScanningList();

	if(bCreate)
	{
		// carica lo scanning dal registro
		m_strStartHost.Format("%s",m_pConfig->GetString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_STARTHOST_KEY));
		m_strEndHost.Format("%s",m_pConfig->GetString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_ENDHOST_KEY));
		m_nPortFlag = m_pConfig->GetNumber(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTMODE_KEY);
		
		if(m_nPortFlag==0) // lista
		{
			m_strPortList.Format("%s",m_pConfig->GetString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTNUMBERS_KEY));
			OnRadioButtonPortList();
		}
		else // intervallo
		{
			int i;
			char* token;
			char szPort[(PORT_NAME*2)+1];
			strcpyn(szPort,m_pConfig->GetString(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTNUMBERS_KEY),sizeof(szPort)-1);

			m_nStartPort = m_nEndPort = 0;

			for(i = 0,token = strtok(szPort,".,; "); token!=NULL; i++)
			{
				if(i==0)
					m_nStartPort = (UINT)atol(token);

				m_nEndPort = (UINT)atol(token);
				
				token = strtok(NULL,".,; ");
			}

			OnRadioButtonPortRange();
		}

		m_nPortList = m_nPortFlag;
		UpdateData(FALSE);
	}

	return(bCreate);
}

/*
	DDV_...()
*/
void AFXAPI DDV_ValidateIP(CDataExchange* pDX,int nIDC,CString& cIpAddr)
{
	pDX->PrepareEditCtrl(nIDC);
	
	if(pDX->m_bSaveAndValidate)
		if(cIpAddr.GetLength() <= 0 || cIpAddr.GetLength() > HOSTNAME_SIZE)
		{
			AfxMessageBox("Must enter a valid ip/host name string.",MB_ICONWARNING);
			pDX->Fail();
		}
}

void AFXAPI DDV_ValidatePortList(CDataExchange* pDX,int nIDC,CString& cPortList)
{
	pDX->PrepareEditCtrl(nIDC);
	
	if(pDX->m_bSaveAndValidate)
		if(cPortList.GetLength() <= 0 || cPortList.GetLength() >= MAX_PORTLIST_STRING)
		{
			AfxMessageBox("Must enter a valid port number(s).",MB_ICONWARNING);
			pDX->Fail();
		}
}

void AFXAPI DDV_ValidatePortNumber(CDataExchange* pDX,int nIDC,UINT& uiPortNumber)
{
	pDX->PrepareEditCtrl(nIDC);
	
	if(pDX->m_bSaveAndValidate)
		if(uiPortNumber < 0 || uiPortNumber >= UINT_MAX)
		{
			AfxMessageBox("Must enter a valid port number.",MB_ICONWARNING);
			pDX->Fail();
		}
}
