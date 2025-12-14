/*
	TcpServicesPage.cpp
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "TcpServicesPage.h"

IMPLEMENT_DYNCREATE(CServicesPage,CPropertyPageDialog)

BEGIN_MESSAGE_MAP(CServicesPage,CPropertyPageDialog)
	// bottoni
	ON_BN_CLICKED(IDC_BUTTON_SERVICES,OnButtonServices)

	// menu popup
	ON_COMMAND(IDM_SERVICES_ADDPORT,OnServicesPopupMenuAddPort)
	ON_COMMAND(IDM_SERVICES_LOADALLPORTS,OnServicesPopupMenuLoadAllPorts)
	ON_COMMAND(IDM_SERVICES_SETSTARTPORT,OnServicesPopupMenuSetStartPort)
	ON_COMMAND(IDM_SERVICES_SETENDPORT,OnServicesPopupMenuSetEndPort)
	ON_COMMAND(IDM_SERVICES_CLEARPORTS,OnServicesPopupMenuClearPorts)
	ON_COMMAND(IDM_SERVICES_ADDSERVICE,OnServicesPopupMenuAddService)
	ON_COMMAND(IDM_SERVICES_REMOVESERVICE,OnServicesPopupMenuRemoveService)
	ON_COMMAND(IDM_SERVICES_SAVETOREGISTRY,OnServicesPopupMenuSaveToRegistry)
	ON_COMMAND(IDM_SERVICES_LOADFROMREGISTRY,OnServicesPopupMenuLoadFromRegistry)
	ON_COMMAND(IDM_SERVICES_SAVETODATABASE,OnServicesPopupMenuSaveToDatabase)
	ON_COMMAND(IDM_SERVICES_LOADFROMDATABASE,OnServicesPopupMenuLoadFromDatabase)
END_MESSAGE_MAP()

/*
	DoDataExchange()
*/
void CServicesPage::DoDataExchange(CDataExchange* pDX)
{
	CPropertyPage::DoDataExchange(pDX);

	DDX_Control(pDX,IDC_LIST_SERVICES,m_wndServicesList);
}

/*
	CServicesPage()
*/
CServicesPage::CServicesPage() : CPropertyPageDialog(IDD_PAGE_SERVICES)
{
	m_nMaxDatabaseEntry = 0;
	m_pServiceList = NULL;
	m_pConfig = NULL;
	m_strServicesDatabase = "";

	SetPropertyPageOkButton("&Reload");
}

/*
	~CServicesPage()
*/
CServicesPage::~CServicesPage()
{
	if(m_pServiceList)
		delete m_pServiceList,m_pServiceList = NULL;
}

/*
	OnInitDialog()

	Inizializzazione del dialogo.
	Rimappa la funzione base per ricavare la lista dei servizi dal database.
*/
BOOL CServicesPage::OnInitDialog(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnInitDialog();

	// numero max di nomi database per il combo
	m_nMaxDatabaseEntry = m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_MAX_DATABASEENTRY_KEY);
	
	// carica il nome del database presente nella configurazione (se non e' stato specificato nessun nome ricava imposta su quello di default)
	char* database = (char*)m_pConfig->GetString(TCPSCAN_SERVICES_KEY,TCPSCAN_DATABASE_KEY);
	if(strcmp(database,"")==0)
	{
		DWORD dwVersion = ::GetVersion();
		DWORD dwWindowsMajorVersion = (DWORD)(LOBYTE(LOWORD(dwVersion)));
		char szWindowsDir[_MAX_PATH+1];

		::GetWindowsDirectory(szWindowsDir,sizeof(szWindowsDir));

		// Windows NT
		if(dwVersion < 0x80000000)
			m_strServicesDatabase.Format("%s\\system32\\drivers\\etc\\services",szWindowsDir);
		// Win32s
		else if(dwWindowsMajorVersion < 4)
			m_strServicesDatabase = "";
		// Windows 95
		else
			m_strServicesDatabase.Format("%s\\services",szWindowsDir);
	}
	else
		m_strServicesDatabase.Format("%s",database);

	// imposta il testo del combo col nome del database, aggiungendolo come primo elemento
	CComboBox* pComboBox = (CComboBox*)GetDlgItem(IDC_COMBO_SERVICES);
	pComboBox->SetWindowText(m_strServicesDatabase);
	UpdateData(FALSE);
	pComboBox->AddString(m_strServicesDatabase);

	// inserisce nel combo gli eventuali nomi files presenti
	char* p;
	char szKey[REGKEY_MAX_KEY_NAME+1];
	
	for(int i = 0; i < m_nMaxDatabaseEntry; i++)
	{
		wsprintf(szKey,"%s%d",TCPSCAN_DATABASEFILE_KEY,i);
		if(strcmp((p = (char*)m_pConfig->GetString(TCPSCAN_SERVICES_KEY,szKey)),"")!=0)
		{
			if(pComboBox->FindStringExact(-1,p)==CB_ERR)
				pComboBox->AddString(p);
		}
		else
			break;
	}
	
	pComboBox->SetCurSel(0);

	// carica la lista dei servizi
	LoadServices(SERVICES_FROM_DATABASE);

	return(FALSE);
}

/*
	OnSetActive()

	Attivazione della pagina.
	Rimappa la funzione base per cambiare il testo del bottone IDOK dello sheet ed impostare i valore
	del combo.
*/
BOOL CServicesPage::OnSetActive(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnSetActive();
	
	// modifica il testo del bottone IDOK dello sheet
	SetPropertySheetOkButton(GetPropertyPageOkButton());

	if(LookForBusyPages(IDD_PAGE_SERVICES))
		DisablePropertySheetOkButton();

	// imposta il testo del combo col nome del database
	CComboBox* pComboBox = (CComboBox*)GetDlgItem(IDC_COMBO_SERVICES);
	pComboBox->SetWindowText(m_strServicesDatabase);
	UpdateData(FALSE);

	return(TRUE);
}

/*
	OnKillActive()

	Chiamata (da MFC) ogni volta che la pagina perde il focus (Ctrl+Tab o click sul Tab di una pagina
	differente dello sheet). Non viene chiamata alla chiusura del dialogo.
*/
BOOL CServicesPage::OnKillActive(void)
{
	// deve chiamare il gestore originale
	CPropertyPageDialog::OnKillActive();

	return(TRUE);
}

/*
	OnKillSheet()

	Chiusura del dialogo.
	Rimappa la funzione base per salvare la configurazione.
*/
void CServicesPage::OnKillSheet(void)
{
	if(IsWindow(this->m_hWnd))
	{
		// aggiorna la configurazione prima di uscire
		// UpdateData(TRUE) non serve perche' non fa riferimento a un campo ma alla lista
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_SERVICE_COLSIZE_KEY,m_wndServicesList.GetColWidth(0));
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_PORT_COLSIZE_KEY,m_wndServicesList.GetColWidth(1));
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_PROTOCOL_COLSIZE_KEY,m_wndServicesList.GetColWidth(2));
		m_pConfig->UpdateNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_COMMENT_COLSIZE_KEY,m_wndServicesList.GetColWidth(3));
	}
}

/*
	OnOk()

	Carica la lista dei servizi.
	Chiamata dallo sheet per il click sul bottone (IDOK).
*/
void CServicesPage::OnOk(void)
{
	EnterPageBusyState(IDD_PAGE_SERVICES);

	LoadServices(SERVICES_FROM_DATABASE);

	LeavePageBusyState(IDD_PAGE_SERVICES);
}

/*
	OnCancel()

	Carica la lista dei servizi.
	Chiamata dallo sheet per il click sul bottone (IDCANCEL).
*/
void CServicesPage::OnCancel(void)
{
	LeavePageBusyState(IDD_PAGE_SERVICES);
}

/*
	OnButtonServices()

	Seleziona il database dei servizi.
*/
void CServicesPage::OnButtonServices(void)
{
	CFileDialog dlg(TRUE,
				NULL,
				NULL,
				OFN_FILEMUSTEXIST|OFN_HIDEREADONLY,
				"All Files (*.*)|*.*|TXT Files (*.txt)|*.txt||",
				AfxGetMainWnd()
				);

	// selezione del database
	if(dlg.DoModal()==IDOK)
	{
		m_strServicesDatabase.Format("%s",dlg.m_ofn.lpstrFile);

		// imposta il testo del combo col nome del database
		CComboBox* pComboBox = (CComboBox*)GetDlgItem(IDC_COMBO_SERVICES);
		pComboBox->SetWindowText(m_strServicesDatabase);
		UpdateData(FALSE);
		
		// carica la lista dei servizi
		LoadServices(SERVICES_FROM_DATABASE);
	}
}
/*
	OnServicesPopupMenuAddPort()

	Aggiunge il numero della porta selezionata alla lista per lo scanning.
*/
void CServicesPage::OnServicesPopupMenuAddPort(void)
{
	int nTot = m_wndServicesList.GetItemCount();
	
	// controlla che la lista non sia vuota
	if(nTot > 0)
	{
		// ricava i puntatori (classe) per accedere alla pagina dello scanning
		CScanPage* pScanPage = NULL;
		PROPERTYPAGE* p;
		if((p = FindPage(IDD_PAGE_SCAN))!=(PROPERTYPAGE*)NULL)
			pScanPage = (CScanPage*)p->page;

		// e' riuscito ad ottenere il puntatore alla pagina dello scanning
		if(pScanPage)
		{
			char szPort[16];

			// ricava gli elementi selezionati
			for(int i = 0; i < nTot; i++)
			{
				// se l'elemento e' stato selezionato
				if(m_wndServicesList.GetItemSelection(i))
				{
					// azzera la selezione
					m_wndServicesList.SetItemSelection(i,FALSE);

					// ricava il numero della porta relativo all'elemento
					m_wndServicesList.GetItemText(i,1,szPort,sizeof(szPort)-1);
					
					// aggiunge il numero della porta alla lista
					if(pScanPage->m_strPortList.GetLength()+strlen(szPort)+2 < MAX_PORTLIST_STRING)
					{
						if(pScanPage->m_strPortList=="0")
							pScanPage->m_strPortList.Empty();

						if(!pScanPage->m_strPortList.IsEmpty())
							pScanPage->m_strPortList += ", ";

						pScanPage->m_strPortList += szPort;

						// aggiorna i campi della pagina
						pScanPage->m_nPortFlag = pScanPage->m_nPortList = 0;

						// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
						// questa non e' stata ancora visualizzata
						if(!pScanPage->Dirty())
							ActivatePage(IDD_PAGE_SCAN);

						pScanPage->UpdateData(FALSE);
						pScanPage->OnRadioButtonPortList();
					}
					else
					{
						AfxMessageBox("Unable to add the port number to the list (maximum length reached).",MB_ICONWARNING);
						break;
					}
				}
			}
		}
	}
}

/*
	OnServicesPopupMenuLoadAllPorts()
	
	Aggiunge tutti i numeri delle porte alla lista per lo scanning.
*/
void CServicesPage::OnServicesPopupMenuLoadAllPorts(void)
{
	int nTot = m_wndServicesList.GetItemCount();

	// controlla che la lista non sia vuota
	if(nTot > 0)
	{
		// ricava i puntatori (classe) per accedere alla pagina dello scanning
		CScanPage* pScanPage = NULL;
		PROPERTYPAGE* p;
		if((p = FindPage(IDD_PAGE_SCAN))!=(PROPERTYPAGE*)NULL)
			pScanPage = (CScanPage*)p->page;

		// e' riuscito ad ottenere il puntatore alla pagina dello scanning
		if(pScanPage)
		{
			int* nPortArray = new int[nTot];

			if(nPortArray)
			{
				char szPort[16];

				// per ogni elemento della lista
				for(int i = 0; i < nTot; i++)
				{
					// ricava il numero della porta
					m_wndServicesList.GetItemText(i,1,szPort,sizeof(szPort)-1);

					// aggiunge il numero della porta all'array
					nPortArray[i] = (unsigned int)atol(szPort);
				}
				
				if(i > 0)
				{
					CString strPort;
					pScanPage->m_strPortList.Empty();
					pScanPage->m_strPortList.Format("%d",nPortArray[0]);
					
					// aggiunge il numero della porta alla lista
					for(i = 1; i < nTot; i++)
					{
						if(pScanPage->m_strPortList.GetLength()+7 < MAX_PORTLIST_STRING)
						{
							strPort.Format(", %d",nPortArray[i]);
							pScanPage->m_strPortList += strPort;
						}
						else
						{
							AfxMessageBox("Unable to add the port number to the list (maximum length reached).",MB_ICONWARNING);
							break;
						}
					}

					// aggiorna i campi della pagina
					pScanPage->m_nPortFlag = pScanPage->m_nPortList = 0;

					// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
					// questa non e' stata ancora visualizzata
					if(!pScanPage->Dirty())
						ActivatePage(IDD_PAGE_SCAN);

					pScanPage->UpdateData(FALSE);
					pScanPage->OnRadioButtonPortList();
				}

				delete [] nPortArray;
			}
		}
	}
}

/*
	OnServicesPopupMenuSetStartPort()

	Imposta la lista per lo scanning con il numero della porta selezionata come iniziale.
*/
void CServicesPage::OnServicesPopupMenuSetStartPort(void)
{
	int nItem = m_wndServicesList.GetCurrentItem();

	// ricava l'elemento corrente della lista
	if(nItem >= 0)
	{
		// ricava i puntatori (classe) per accedere alla pagina dello scanning
		CScanPage* pScanPage = NULL;
		PROPERTYPAGE* p;
		if((p = FindPage(IDD_PAGE_SCAN))!=(PROPERTYPAGE*)NULL)
			pScanPage = (CScanPage*)p->page;

		// e' riuscito ad ottenere il puntatore alla pagina dello scanning
		if(pScanPage)
		{
			char szPort[16];

			// ricava il numero della porta relativo
			m_wndServicesList.GetItemText(nItem,1,szPort,sizeof(szPort)-1);
			
			// imposta la porta iniziale
			if((unsigned int)atol(szPort) <= pScanPage->m_nEndPort)
			{
				// aggiorna i campi della pagina
				pScanPage->m_nStartPort = (unsigned int)atol(szPort);
				pScanPage->m_nPortFlag = pScanPage->m_nPortList = 1;

				// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
				// questa non e' stata ancora visualizzata
				if(!pScanPage->Dirty())
					ActivatePage(IDD_PAGE_SCAN);

				pScanPage->UpdateData(FALSE);
				pScanPage->OnRadioButtonPortRange();
			}
			else
				AfxMessageBox("The start port must be smaller than the end port.",MB_ICONWARNING);
		}
	}
}

/*
	OnServicesPopupMenuSetEndPort()
	
	Imposta la lista per lo scanning con il numero della porta selezionata come finale.
*/
void CServicesPage::OnServicesPopupMenuSetEndPort(void)
{
	int nItem = m_wndServicesList.GetCurrentItem();

	// ricava l'elemento corrente della lista
	if(nItem >= 0)
	{
		// ricava i puntatori (classe) per accedere alla pagina dello scanning
		CScanPage* pScanPage = NULL;
		PROPERTYPAGE* p;
		if((p = FindPage(IDD_PAGE_SCAN))!=(PROPERTYPAGE*)NULL)
			pScanPage = (CScanPage*)p->page;

		// e' riuscito ad ottenere il puntatore alla pagina dello scanning
		if(pScanPage)
		{
			char szPort[16];
			
			// ricava il numero della porta relativo
			m_wndServicesList.GetItemText(nItem,1,szPort,sizeof(szPort)-1);
			
			// imposta la porta finale
			if((unsigned int)atol(szPort) >= pScanPage->m_nStartPort)
			{
				// aggiorna i campi della pagina
				pScanPage->m_nEndPort  = (unsigned int)atol(szPort);
				pScanPage->m_nPortFlag = pScanPage->m_nPortList = 1;

				// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
				// questa non e' stata ancora visualizzata
				if(!pScanPage->Dirty())
					ActivatePage(IDD_PAGE_SCAN);

				pScanPage->UpdateData(FALSE);
				pScanPage->OnRadioButtonPortRange();
			}
			else
				AfxMessageBox("The end port must be greater than the start port.",MB_ICONWARNING);
		}
	}
}

/*
	OnServicesPopupMenuClearPorts()
	
	Azzera i numeri di porte (lista/range) correnti.
*/
void CServicesPage::OnServicesPopupMenuClearPorts(void)
{
	// ricava i puntatori (classe) per accedere alla pagina dello scanning
	CScanPage* pScanPage = NULL;
	PROPERTYPAGE* p;
	if((p = FindPage(IDD_PAGE_SCAN))!=(PROPERTYPAGE*)NULL)
		pScanPage = (CScanPage*)p->page;

	// e' riuscito ad ottenere il puntatore alla pagina dello scanning
	if(pScanPage)
	{
		// fa in modo che venga chiamato il codice di inizializzazione della pagina se 
		// questa non e' stata ancora visualizzata
		if(!pScanPage->Dirty())
			ActivatePage(IDD_PAGE_SCAN);

		pScanPage->OnScanPopupMenuClearPorts();
	}
}

/*
	OnServicesPopupMenuAddService()
	
	Aggiunge un servizio alla lista dei servizi.
*/
void CServicesPage::OnServicesPopupMenuAddService(void)
{
	AddService();
}

/*
	OnServicesPopupMenuRemoveService()
	
	Rimuove uno o piu' servizi dalla lista dei servizi.
*/
void CServicesPage::OnServicesPopupMenuRemoveService(void)
{
	RemoveService();
}

/*
	OnServicesPopupMenuSaveToRegistry()
	
	Salva la lista dei servizi nel registro.
*/
void CServicesPage::OnServicesPopupMenuSaveToRegistry(void)
{
	if(SaveServices(SERVICES_FROM_REGISTRY))
		AfxMessageBox("The services list has been saved into the registry.",MB_ICONINFORMATION);
	else
		AfxMessageBox("Unable to save the services list into the registry.",MB_ICONWARNING);
}

/*
	OnServicesPopupMenuLoadFromRegistry()
	
	Carica la lista dei servizi dal registro.
*/
void CServicesPage::OnServicesPopupMenuLoadFromRegistry(void)
{
	if(!LoadServices(SERVICES_FROM_REGISTRY))
		AfxMessageBox("Unable to load services from the registry.",MB_ICONWARNING);
}

/*
	OnServicesPopupMenuSaveToDatabase()
	
	Salva la lista dei servizi nel database.
*/
void CServicesPage::OnServicesPopupMenuSaveToDatabase(void)
{
	if(SaveServices(SERVICES_FROM_DATABASE))
		AfxMessageBox("The services list has been saved into the local database.",MB_ICONINFORMATION);
	else
		AfxMessageBox("Unable to save the services list into the local database.",MB_ICONWARNING);
}

/*
	OnServicesPopupMenuLoadFromDatabase()
	
	Carica la lista dei servizi dal database.
*/
void CServicesPage::OnServicesPopupMenuLoadFromDatabase(void)
{
	if(!LoadServices(SERVICES_FROM_DATABASE))
		AfxMessageBox("Unable to load services from the local database.",MB_ICONWARNING);
}

/*
	AddService()

	Aggiunge il servizio alla lista.
*/
BOOL CServicesPage::AddService(SERVICES* s)
{
	BOOL bAdded = FALSE;

	if(!s)
	{
		CString strServiceName = "";
		UINT nPortNumber = 0;
		CString strProtocolName = "tcp";
		CString strComment = "";

		CTcpScanAddServiceDlg dlg(this,strServiceName,nPortNumber,strProtocolName,strComment);
		
		if(dlg.DoModal()==IDOK)
			s = new SERVICES(strServiceName,nPortNumber,strProtocolName,strComment.GetLength() > 0 ? strComment : " ");
	}

	if(s)
	{
		char szItem[SERVICE_NAME+PORT_NAME+PROTOCOL_NAME+COMMENT_NAME+1];
		wsprintf(szItem,"%s;%d;%s;%s",s->service,s->port,s->proto,s->comment);
		bAdded = m_wndServicesList.AddItem(szItem,0,IDM_SERVICES)!=LB_ERR;
	}

	return(bAdded);
}

/*
	RemoveService()

	Elimina il servizio dalla lista.
*/
BOOL CServicesPage::RemoveService(SERVICES* s)
{
	BOOL bRemoved = FALSE;

	if(s)
	{
		char szService[SERVICE_NAME+1] = {0};
		char szPort[PORT_NAME+1] = {0};
		int nTot = m_wndServicesList.GetItemCount();
		
		for(int i = 0; i < nTot; i++)
		{
			m_wndServicesList.GetItemText(i,0,szService,sizeof(szService)-1);
			m_wndServicesList.GetItemText(i,1,szPort,sizeof(szPort)-1);

			if(atoi(szPort)==(int)s->port && strcmp(szService,s->service)==0)
			{
				m_wndServicesList.DeleteItem(i);
				bRemoved = TRUE;
				break;
			}
		}
	}
	else
	{
		BOOL bFound;
		
		do
		{
			bFound = FALSE;

			// per ogni elemento della lista
			int nTot = m_wndServicesList.GetItemCount();

			for(int i = 0; i < nTot; i++)
			{
				// se l'elemento e' stato selezionato lo elimina
				if(m_wndServicesList.GetItemSelection(i))
				{
					m_wndServicesList.DeleteItem(i);
					bFound = TRUE;
					break;
				}
			}
		} while(bFound);

		bRemoved = bFound;
	}

	return(bRemoved);
}

/*
	LoadServices()

	Carica i servizi.
*/
BOOL CServicesPage::LoadServices(int nFrom)
{
	BOOL bLoaded = FALSE;

	if(nFrom!=SERVICES_FROM_DATABASE && nFrom!=SERVICES_FROM_REGISTRY)
		return(bLoaded);

	// crea la lista
	if(m_wndServicesList.Create())
	{
		// menu di default per lista vuota
		m_wndServicesList.SetDefaultMenu(IDM_SERVICES_EMPTY);
		
		// il click col destro imposta la riga come selezionata
		m_wndServicesList.RightClickSelects(TRUE);

		// icone
		m_wndServicesList.AddIcon(IDI_TCPSCAN);
		
		// colonne
		m_wndServicesList.AddCol("Service",'C',m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_SERVICE_COLSIZE_KEY));
		m_wndServicesList.AddCol("Port",'N',m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_PORT_COLSIZE_KEY));
		m_wndServicesList.AddCol("Protocol",'C',m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_PROTOCOL_COLSIZE_KEY));
		m_wndServicesList.AddCol("Comment",'C',m_pConfig->GetNumber(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_COMMENT_COLSIZE_KEY));

		if(nFrom==SERVICES_FROM_DATABASE)
		{
			// ricava il testo del combo aggiornando di conseguenza il nome del database e la configurazione
			CComboBox* pComboBox = (CComboBox*)GetDlgItem(IDC_COMBO_SERVICES);
			char szComboEntry[_MAX_PATH+1];
			pComboBox->GetWindowText(szComboEntry,sizeof(szComboEntry));
			m_strServicesDatabase.Format("%s",szComboEntry);
			m_pConfig->UpdateString(TCPSCAN_SERVICES_KEY,TCPSCAN_DATABASE_KEY,m_strServicesDatabase);

			// cerca il testo del combo nella configurazione, se non lo trova deve inserirlo nel
			// nel combo e nella configurazione
			char* p;
			char szKey[REGKEY_MAX_KEY_NAME+1];
			BOOL bFound = FALSE;

			for(int i = 0; i < m_nMaxDatabaseEntry; i++)
			{
				wsprintf(szKey,"%s%d",TCPSCAN_DATABASEFILE_KEY,i);
				if(strcmp((p = (char*)m_pConfig->GetString(TCPSCAN_SERVICES_KEY,szKey)),"")!=0)
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
				if(i==m_nMaxDatabaseEntry)
					pComboBox->DeleteString(0);

				if(pComboBox->FindStringExact(-1,szComboEntry)==CB_ERR)
					pComboBox->AddString(szComboEntry);
			}

			// aggiorna le entrate della configurazione con quanto presente nel combo (elimina e reinserisce)
			for(i = 0; i < m_nMaxDatabaseEntry; i++)
			{
				wsprintf(szKey,"%s%d",TCPSCAN_DATABASEFILE_KEY,i);
				if(strcmp(m_pConfig->GetString(TCPSCAN_SERVICES_KEY,szKey),"")!=0)
					m_pConfig->Delete(TCPSCAN_SERVICES_KEY,szKey);
			}
			m_pConfig->Save();

			for(i = 0; i < m_nMaxDatabaseEntry; i++)
			{
				if(pComboBox->GetLBText(i,szComboEntry)!=CB_ERR)
				{
					wsprintf(szKey,"%s%d",TCPSCAN_DATABASEFILE_KEY,i);
					m_pConfig->Insert(TCPSCAN_SERVICES_KEY,szKey,szComboEntry);
				}
			}
			m_pConfig->Save();
			
			// carica i servizi dal database
			bLoaded = LoadServicesFromDatabase(m_strServicesDatabase);

			// imposta il testo del combo col nome del database
			pComboBox->SetWindowText(m_strServicesDatabase);
			UpdateData(FALSE);
		}
		else if(nFrom==SERVICES_FROM_REGISTRY)
			// carica i servizi dal registro
			bLoaded = LoadServicesFromRegistry();
	}

	return(bLoaded);
}
 
/*
	LoadServicesFromDatabase()

	Carica la lista con i servizi presenti nel database.
	Il formato del database e' il seguente:
	<service> <port>/<protocol> [aliases...] [#comment]
	Il carattere #, all'interno del file, viene usato come commento.
*/
BOOL CServicesPage::LoadServicesFromDatabase(const char* database)
{
	int i;
	int nRead = 0;
	CTextFile servicesFile;
	char *pToken;
	char szItem[SERVICE_NAME+PORT_NAME+PROTOCOL_NAME+COMMENT_NAME+1];
	char szService[SERVICE_NAME+1];
	char szPortNumber[PORT_NAME+1];
	char szProtocol[PROTOCOL_NAME+1];
	char szComment[COMMENT_NAME+1];
	SERVICES* s;
	ITERATOR iter;

	// crea la lista (per le chiamate successive alla prima)
	if(m_pServiceList)
		delete m_pServiceList,m_pServiceList = NULL;

	m_pServiceList = new CServicesList();

	// apre il file dei servizi caricandolo
	if(servicesFile.Open(database))
	{
		while((nRead = servicesFile.ReadLine(szItem,sizeof(szItem)-1))!=FILE_EOF)
		{
			// salta i commenti e le linee vuote
			if(szItem[0]=='#' || isspace(szItem[0]) || szItem[0]=='\r' || nRead==0)
				continue;

			memset(szService,'\0',sizeof(szService));
			memset(szPortNumber,'\0',sizeof(szPortNumber));
			memset(szProtocol,'\0',sizeof(szProtocol));
			memset(szComment,'\0',sizeof(szComment));

			if((pToken = strchr(szItem,'#'))!=NULL)
			{
				pToken++;

				while(*pToken && isspace(*pToken))
					pToken++;

				for(i = 0; i < sizeof(szComment) && *pToken && !isspace(*pToken); i++)
					szComment[i] = *pToken++;
			}

			for(i = 0,pToken = strtok(szItem," \t/"); pToken!=NULL; i++)
			{
				switch(i)
				{
					case 0:
						strcpyn(szService,pToken,sizeof(szService));
						break;
					case 1:
						strcpyn(szPortNumber,pToken,sizeof(szPortNumber));
						break;
					case 2:
						strcpyn(szProtocol,pToken,sizeof(szProtocol));
						break;
					default:
						break;
				}

				pToken = strtok(NULL," \t/");
			}
			
			// solo TCP
			if(strcmp(szProtocol,"tcp")==0)
			{
				BOOL bFound = FALSE;

				// controlla che il servizio non esista gia'
				if((iter = m_pServiceList->First())!=(ITERATOR)NULL)
					while(iter!=(ITERATOR)NULL)
					{
						s = (SERVICES*)iter->data;
						if(strcmp(s->service,szService)==0)
						{
							bFound = TRUE;
							break;
						}

						iter = m_pServiceList->Next(iter);
					}
				
				// carica il servizio
				if(!bFound)
				{
					s = new SERVICES(szService,atoi(szPortNumber),szProtocol,szComment[0]!='\0' ? szComment : " ");
					if(s)
						m_pServiceList->Add(s);
				}
			}
		}

		servicesFile.Close();

		// elimina gli elementi della lista
		m_wndServicesList.DeleteAllItems();

		// ricarica la lista
		if((iter = m_pServiceList->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				s = (SERVICES*)iter->data;
				wsprintf(szItem,"%s;%d;%s;%s",s->service,s->port,s->proto,s->comment);
				m_wndServicesList.AddItem(szItem,0,IDM_SERVICES);

				iter = m_pServiceList->Next(iter);
			}
	}
	else
		AfxMessageBox("Unable to open the services file.",MB_ICONWARNING);

	return(m_pServiceList->Count() > 0);
}

/*
	LoadServicesFromRegistry()

	Carica la lista con i servizi presenti nel registro.
	Il formato del registro e' il seguente:
	Service[0...n] = <service name>;<port number>;<protocol>;<comment>
*/
BOOL CServicesPage::LoadServicesFromRegistry(void)
{
	int i;
	char* p;
	char szItem[SERVICE_NAME+PORT_NAME+PROTOCOL_NAME+COMMENT_NAME+1];
	SERVICES* s;
	ITERATOR iter;

	if(m_pServiceList)
		delete m_pServiceList,m_pServiceList = NULL;
	
	m_pServiceList = new CServicesList();

	// per ognuno dei servizi presenti nel registro
	int nTotServices = m_pConfig->GetNumber(TCPSCAN_SERVICES_KEY,TCPSCAN_TOTSERVICES_KEY);
	for(i = 0; i < nTotServices; i++)
	{
		// imposta il nome della chiave (Service[0...n]) e recupera il valore
		wsprintf(szItem,"%s%d",TCPSCAN_SERVICENAME_KEY,i);
		if(strcmp((p = (char*)m_pConfig->GetString(TCPSCAN_SERVICES_KEY,szItem)),"")!=0)
		{
			// carica il servizio
			if((s = new SERVICES("???",0,"???"))!=NULL)
			{
				int n;
				char* pToken;
				strcpyn(szItem,p,sizeof(szItem));

				for(n = 0,pToken = strtok(szItem,";"); pToken!=NULL; n++)
				{
					switch(n)
					{
						case 0:
							strcpyn(s->service,pToken,SERVICE_NAME+1);
							break;
						case 1:
							s->port = atoi(pToken);
							break;
						case 2:
							strcpyn(s->proto,pToken,PROTOCOL_NAME+1);
							break;
						case 3:
							strcpyn(s->comment,pToken,COMMENT_NAME+1);
						default:
							break;
					}

					pToken = strtok(NULL,";");
				}
				
				m_pServiceList->Add(s);
			}
		}
	}

	// elimina gli elementi della lista
	m_wndServicesList.DeleteAllItems();

	// ricarica la lista
	if((iter = m_pServiceList->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			s = (SERVICES*)iter->data;
			wsprintf(szItem,"%s;%d;%s;%s",s->service,s->port,s->proto,s->comment);
			m_wndServicesList.AddItem(szItem,0,IDM_SERVICES);

			iter = m_pServiceList->Next(iter);
		}

	return(m_pServiceList->Count() > 0);
}

/*
	SaveServices()

	Salva i servizi.
*/
BOOL CServicesPage::SaveServices(int nFrom)
{
	BOOL bSaved = FALSE;

	if(nFrom!=SERVICES_FROM_DATABASE && nFrom!=SERVICES_FROM_REGISTRY)
		return(bSaved);

	// salva i servizi nel database
	if(nFrom==SERVICES_FROM_DATABASE)
	{
		CComboBox* pComboBox = (CComboBox*)GetDlgItem(IDC_COMBO_SERVICES);
		char szComboEntry[_MAX_PATH+1];
		pComboBox->GetWindowText(szComboEntry,sizeof(szComboEntry));
		m_strServicesDatabase.Format("%s",szComboEntry);
		
		bSaved = SaveServicesToDatabase(m_strServicesDatabase);
	}
	// salva i servizi nel registro
	else if(nFrom==SERVICES_FROM_REGISTRY)
		bSaved = SaveServicesToRegistry();

	return(bSaved);
}

/*
	SaveServicesToRegistry()

	Salva nel registro la lista con i servizi.
*/
BOOL CServicesPage::SaveServicesToRegistry(void)
{
	int i;
	int nTot,nTotServices;
	char szKey[REGKEY_MAX_KEY_NAME+1];
	char szService[(MAX_CTRLITEM_SIZE*3)+1];

	// elimina dalla configurazione le entrate presenti
	nTotServices = m_pConfig->GetNumber(TCPSCAN_SERVICES_KEY,TCPSCAN_TOTSERVICES_KEY);
	for(i = 0; i < nTotServices; i++)
	{
		wsprintf(szKey,"%s%d",TCPSCAN_SERVICENAME_KEY,i);
		m_pConfig->Delete(TCPSCAN_SERVICES_KEY,szKey);
	}

	// inserisce nella configurazione le entrate presenti nella lista
	nTot = m_wndServicesList.GetItemCount();
	if(nTot <= 0)
		return(TRUE);

	nTotServices = 0;
	for(i = 0; i < nTot; i++)
	{
		// costruisce il valore da inserire nella configurazione:
		// nome chiave (Service[0...n]) e valore (servizio;porta;protocollo;descrizione)
		if(m_wndServicesList.GetItemText(i,0,szService,sizeof(szService)-1) > 0)
		{
			strcat(szService,";");
			int len = strlen(szService);
		
			if(m_wndServicesList.GetItemText(i,1,szService+len,sizeof(szService)-len) > 0)
			{
				strcat(szService,";");
				len = strlen(szService);
				
				if(m_wndServicesList.GetItemText(i,2,szService+len,sizeof(szService)-len) > 0)
				{
					strcat(szService,";");
					len = strlen(szService);

					if(m_wndServicesList.GetItemText(i,3,szService+len,sizeof(szService)-len) > 0)
					{
						wsprintf(szKey,"%s%d",TCPSCAN_SERVICENAME_KEY,i);
						m_pConfig->Insert(TCPSCAN_SERVICES_KEY,szKey,szService);
						nTotServices++;
					}
				}
			}
		}
	}
	
	// aggiorna il totale dei servizi presenti
	m_pConfig->UpdateNumber(TCPSCAN_SERVICES_KEY,TCPSCAN_TOTSERVICES_KEY,nTotServices);

	// salva la configurazione nel registro
	m_pConfig->Save();

	return(nTotServices > 0);
}

/*
	SaveServicesToDatabase()

	Salva nel registro la lista con i servizi.
*/
BOOL CServicesPage::SaveServicesToDatabase(const char* database)
{
	int i,len;
	int nTotServices = 0;
	char szService[(MAX_CTRLITEM_SIZE*4)+1];
	char szComment[COMMENT_NAME+1];
	CTextFile servicesFile;

	// crea il database
	if(servicesFile.Create(database))
	{
		// salva nel database le entrate presenti nella lista
		nTotServices = m_wndServicesList.GetItemCount();
		for(i = 0; i < nTotServices; i++)
		{
			// costruisce il valore da inserire nel database:
			// <service> <port></><protocol> <#comment>
			if(m_wndServicesList.GetItemText(i,0,szService,sizeof(szService)-1) > 0)
			{
				strcat(szService,"\t");
				len = strlen(szService);
			
				if(m_wndServicesList.GetItemText(i,1,szService+len,sizeof(szService)-len) > 0)
				{
					strcat(szService,"/");
					len = strlen(szService);
					
					if(m_wndServicesList.GetItemText(i,2,szService+len,sizeof(szService)-len) > 0)
					{
						if(m_wndServicesList.GetItemText(i,3,szComment,sizeof(szComment)) > 0)
						{
							if(szComment[0]!='\0' && szComment[0]!=' ')
							{
								strcat(szService,"\t# ");
								strcat(szService,szComment);
							}

							strcat(szService,"\r\n");
							servicesFile.Write(szService,strlen(szService));
						}
					}
				}
			}
		}
		
		servicesFile.Close();
	}

	return(nTotServices > 0);
}
