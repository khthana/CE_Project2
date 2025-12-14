/*
	CAsyncSock.cpp
	Classe per interfaccia Winsock (modalita' asincrona).
	Luca Piergentili, 06/07/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "strcpyn.h"
#include "window.h"
#include "CSock.h"
#include "CAsyncSockMessages.h"
#include "CAsyncSock.h"

BEGIN_MESSAGE_MAP(CSockWnd,CWnd)
	ON_MESSAGE(WM_ASYNCSELECT,OnAsyncSelect)
	ON_MESSAGE(WM_ASYNCGETHOSTBYNAME,OnAsyncGetHostByName)
	ON_MESSAGE(WM_ASYNCGETHOSTBYADDR,OnAsyncGetHostByAddr)
	ON_MESSAGE(WM_ASYNCGETSERVBYNAME,OnAsyncGetServByName)
	ON_MESSAGE(WM_ASYNCGETSERVBYPORT,OnAsyncGetServByPort)
END_MESSAGE_MAP()

/*
	CSockWnd()

	Crea la finestra interna utilizzata per la gestione dei messaggi WSA.
	In input il puntatore alla classe CAsyncSock (utilizzato per le callback) ed il puntatore
	alla finestra dell'applicazione.
*/
CSockWnd::CSockWnd(CAsyncSock* pAsyncSock,CWnd* pParent)
{
	// ptr per le callback di CAsyncSock
	m_pAsyncSock = pAsyncSock;

	// AsyncGetHostByName()
	m_hAsyncGetHostByName = (HANDLE)0;				// handle restituito da WSAAsyncGetXByY()
	m_lpszAsyncGetHostByName	= (LPSTR)NULL;			// ptr al buffer interno di CAsyncSock
	m_nAsyncGetHostByName = 0;					// dim. del buffer
	memset(m_szIPAddr,'\0',sizeof(m_szIPAddr));		// buffer interno

	// AsyncGetHostByAddr()
	m_hAsyncGetHostByAddr = (HANDLE)0;				// handle restituito da WSAAsyncGetXByY()
	m_lpszAsyncGetHostByAddr	= (LPSTR)NULL;			// ptr al buffer interno di CAsyncSock
	m_nAsyncGetHostByAddr = 0;					// dim. del buffer
	memset(m_szHostName,'\0',sizeof(m_szHostName));	// buffer interno

	// AsyncGetServByName()
	m_hAsyncGetServByName = (HANDLE)0;				// handle restituito da WSAAsyncGetXByY()
	m_lpszAsyncGetServByName	= (LPSTR)NULL;			// ptr al buffer interno di CAsyncSock
	m_nAsyncGetServByName = 0;					// dim. del buffer
	m_nPort = 0;								// # porta interno

	// AsyncGetServByPort()
	m_hAsyncGetServByPort = (HANDLE)0;				// handle restituito da WSAAsyncGetXByY()
	m_lpszAsyncGetServByPort	= (LPSTR)NULL;			// ptr al buffer interno di CAsyncSock
	m_nAsyncGetServByPort = 0;					// dim. del buffer
	memset(m_szService,'\0',sizeof(m_szService));	// buffer interno

	// crea la finestra per i messaggi asincroni
	CString strClassName = AfxRegisterWndClass(CS_BYTEALIGNCLIENT|CS_BYTEALIGNWINDOW,0,0,0);
	CreateEx(0,strClassName,"CSockWnd",0,1,1,1,1,(pParent ? pParent->m_hWnd : NULL),NULL,NULL);
}

/*
	~CSockWnd()

	Cancella le eventuali richieste asincrone pendenti.
*/
CSockWnd::~CSockWnd(void)
{
	if(m_hAsyncGetHostByName!=(HANDLE)0)
		::WSACancelAsyncRequest(m_hAsyncGetHostByName);

	if(m_hAsyncGetHostByAddr!=(HANDLE)0)
		::WSACancelAsyncRequest(m_hAsyncGetHostByAddr);

	if(m_hAsyncGetServByName!=(HANDLE)0)
		::WSACancelAsyncRequest(m_hAsyncGetServByName);

	if(m_hAsyncGetServByPort!=(HANDLE)0)
		::WSACancelAsyncRequest(m_hAsyncGetServByPort);
}

/*
	AsyncGetHostByName()

	Ricava l'ip relativo all'host in modo asincrono, chiamando la WSAAsyncGetHostByName().
	Imposta la OnAsyncGetHostByName() come callback per WSAAsyncGetHostByName() per poter
	formattare i dati ricevuti.

	input:
	LPCSTR			puntatore al buffer contenente il nome dell'host
	LPSTR			puntatore al buffer per WSAAsyncGetHostByName() (CAsyncSock)
	UINT				dimensione del buffer (CAsyncSock)

	output:
	int				0 o codice d'errore WSA
*/
int CSockWnd::AsyncGetHostByName(LPCSTR lpcszHost,LPSTR pBuffer,UINT nBufSize)
{
	int nWSAError = WSA_FAILURE;

	m_lpszAsyncGetHostByName = pBuffer;
	m_nAsyncGetHostByName = nBufSize;
	memset(m_lpszAsyncGetHostByName,'\0',m_nAsyncGetHostByName);

	// controlla che sia stato passato un puntatore valido alla classe
	if(m_pAsyncSock)
	{
		// effettua la richiesta asincrona passando l'handle della finestra interna ed il ptr al buffer di CAsyncSock
		if((m_hAsyncGetHostByName=::WSAAsyncGetHostByName(this->m_hWnd,WM_ASYNCGETHOSTBYNAME,lpcszHost,m_lpszAsyncGetHostByName,m_nAsyncGetHostByName))==(HANDLE)0)
		{
			// in caso di errore deve inviare il messaggio autonomamente perche' la On...() non verra' chiamata
			nWSAError = m_pAsyncSock->GetWSALastError(WSA_GETLASTERROR);
			::PostMessage(this->m_hWnd,WM_ASYNCGETHOSTBYNAME,0,MAKELPARAM(0,nWSAError));
		}
		else
			nWSAError = 0;
	}

	return(nWSAError);
}

/*
	OnAsyncGetHostByName()

	Callback per WSAAsyncGetHostByName().
	Formatta i dati ricevuti e chiama la callback di CAsyncSock.

	input:
	UINT				(wParam) codice d'errore WSA
	LONG				(lParam) puntatore al buffer riempito da WSAAsyncGetHostByName()

	output:
	LONG				0L (il codice d'errore viene passato alla callback di CAsyncSock come wParam)
*/
#pragma warning(disable:4305)
LONG CSockWnd::OnAsyncGetHostByName(UINT /*wParam*/,LONG lParam)
{
	int nWSAError = WSAGETASYNCERROR(lParam);

	m_hAsyncGetHostByName = (HANDLE)0;
	memset(m_szIPAddr,'\0',sizeof(m_szIPAddr));

	// errore Winsock
	if(nWSAError!=0)
	{
		// azzera il buffer di CAsyncSock
		memset(m_lpszAsyncGetHostByName,'\0',m_nAsyncGetHostByName);
	}
	else
	{
		// copia dal buffer di CAsyncSock a quello interno
		struct in_addr st_addr = {0};
		st_addr.s_addr = *((u_long FAR *)(((struct hostent FAR *)m_lpszAsyncGetHostByName)->h_addr));
		strcpyn(m_szIPAddr,::inet_ntoa(st_addr),sizeof(m_szIPAddr));
	}

	// chiama la callback di CAsyncSock
	if(m_pAsyncSock)
		m_pAsyncSock->AsyncGetHostByNameCallBack(nWSAError,MAKELPARAM(LOWORD(m_szIPAddr),HIWORD(m_szIPAddr)));

	return(0L);
}
#pragma warning(default:4305)

/*
	AsyncGetHostByAddr()

	Ricava il nome host relativo all'ip in modo asincrono, chiamando la WSAAsyncGetHostByAddr().
	Imposta la OnAsyncGetHostByAddr() come callback per WSAAsyncGetHostByAddr() per poter
	formattare i dati ricevuti.

	input:
	LPCSTR			puntatore al buffer contenente l'indirizzo ip
	LPSTR			puntatore al buffer per WSAAsyncGetHostByAddr() (CAsyncSock)
	UINT				dimensione del buffer (CAsyncSock)

	output:
	int				0 o codice d'errore WSA
*/
int CSockWnd::AsyncGetHostByAddr(LPCSTR lpcszIPAddr,LPSTR pBuffer,UINT nBufSize)
{
	int nWSAError = WSA_FAILURE;
	
	m_lpszAsyncGetHostByAddr = pBuffer;
	m_nAsyncGetHostByAddr = nBufSize;
	memset(m_lpszAsyncGetHostByAddr,'\0',m_nAsyncGetHostByAddr);

	// controlla che sia stato passato un puntatore valido alla classe
	if(m_pAsyncSock)
	{
		// controlla se si tratta dell'host locale
		if(lstrcmp(lpcszIPAddr,m_pAsyncSock->GetLocalHostAddr())==0)
		{
			HOSTENT stHostEnt = {0};
			stHostEnt.h_name = (char FAR *)m_pAsyncSock->GetLocalHostName();
			memcpy(m_lpszAsyncGetHostByAddr,&stHostEnt,sizeof(HOSTENT));
			::PostMessage(this->m_hWnd,WM_ASYNCGETHOSTBYADDR,0,0);
			nWSAError = 0;
			goto done;
		}

		// converte da "n.n.n.n" in n.n.n.n
		static struct in_addr st_addr;
		memset(&st_addr,'\0',sizeof(struct in_addr));
		st_addr.s_addr = ::inet_addr(lpcszIPAddr);

		if(st_addr.s_addr!=INADDR_NONE)
		{
			// effettua la richiesta asincrona passando l'handle della finestra interna ed il ptr al buffer di CSock
			if((m_hAsyncGetHostByAddr=::WSAAsyncGetHostByAddr(this->m_hWnd,WM_ASYNCGETHOSTBYADDR,(const char FAR*)&st_addr,sizeof(struct in_addr),PF_INET,m_lpszAsyncGetHostByAddr,m_nAsyncGetHostByAddr))==(HANDLE)0)
			{
				// in caso di errore deve inviare il messaggio autonomamente perche' la On...() non verra' chiamata
				nWSAError = m_pAsyncSock->GetWSALastError(WSA_GETLASTERROR);
				::PostMessage(this->m_hWnd,WM_ASYNCGETHOSTBYADDR,0,MAKELPARAM(0,nWSAError));
			}
			else
				nWSAError = 0;
		}
		else
			nWSAError = WSAEDESTADDRREQ;
	}

done:

	return(nWSAError);
}

/*
	OnAsyncGetHostByAddr()

	Callback per WSAAsyncGetHostByAddr().
	Formatta i dati ricevuti e chiama la callback di CAsyncSock.

	input:
	UINT				(wParam) codice d'errore WSA
	LONG				(lParam) puntatore al buffer utilizzato da WSAAsyncGetHostByAddr()

	output:
	LONG				0L (il codice d'errore viene passato alla callback di CAsyncSock in wParam)
*/
#pragma warning(disable:4305)
LONG CSockWnd::OnAsyncGetHostByAddr(UINT /*wParam*/,LONG lParam)
{
	int nWSAError = WSAGETASYNCERROR(lParam);

	m_hAsyncGetHostByAddr = (HANDLE)0;
	memset(m_szHostName,'\0',sizeof(m_szHostName));

	if(nWSAError!=0)
	{
		// azzera il buffer di CAsyncSock
		memset(m_lpszAsyncGetHostByAddr,'\0',m_nAsyncGetHostByAddr);
	}
	else
	{
		// copia dal buffer di CAsyncSock a quello interno
		strcpyn(m_szHostName,((LPHOSTENT)m_lpszAsyncGetHostByAddr)->h_name,sizeof(m_szHostName));
	}

	// chiama la callback di CAsyncSock
	if(m_pAsyncSock)
		m_pAsyncSock->AsyncGetHostByAddrCallBack(nWSAError,MAKELPARAM(LOWORD(m_szHostName),HIWORD(m_szHostName)));

	return(0L);
}
#pragma warning(default:4305)

/*
	AsyncGetServByName()

	Ricava il # della porta relativa al servizio in modo asincrono, chiamando la WSAAsyncGetServByName().
	Imposta la OnAsyncGetServByName() come callback per WSAAsyncGetServByName() per poter formattare i 
	dati ricevuti.

	input:
	LPCSTR			puntatore al buffer con il nome del servizio
	LPCSTR			puntatore al buffer con il protocollo (default tcp)
	LPSTR			puntatore al buffer per WSAAsyncGetServByName() (CAsyncSock)
	UINT				dimensione del buffer (CAsyncSock)

	output:
	int				0 o codice d'errore WSA
*/
int CSockWnd::AsyncGetServByName(LPCSTR lpcszService,LPCSTR lpcszProto,LPSTR pBuffer,UINT nBufSize)
{
	int nWSAError = WSA_FAILURE;

	m_lpszAsyncGetServByName = pBuffer;
	m_nAsyncGetServByName = nBufSize;
	memset(m_lpszAsyncGetServByName,'\0',m_nAsyncGetServByName);

	// controlla che sia stato passato un puntatore valido alla classe
	if(m_pAsyncSock)
	{
		m_nPort = 0;

		// prima di chiamare winsock controlla nell'array dei servizi di CSock
		ITERATOR iter;
		SERVICES* s;
		if((iter = m_pAsyncSock->m_pServicesList.First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				s = (SERVICES*)iter->data;
				if(stricmp(lpcszService,s->service)==0)
					if(lstrcmpi(lpcszProto,s->proto)==0)
					{
						m_nPort = s->port;
						break;
					}

				iter = m_pAsyncSock->m_pServicesList.Next(iter);
			}

		if(m_nPort==0)
		{
			// effettua la richiesta asincrona passando l'handle della finestra interna ed il ptr al buffer di CAsyncSock
			if((m_hAsyncGetServByName=::WSAAsyncGetServByName(this->m_hWnd,WM_ASYNCGETSERVBYNAME,lpcszService,lpcszProto,m_lpszAsyncGetServByName,m_nAsyncGetServByName))==(HANDLE)0)
			{
				// in caso di errore deve inviare il messaggio autonomamente perche' la On...() non verra' chiamata
				nWSAError = m_pAsyncSock->GetWSALastError(WSA_GETLASTERROR);
				::PostMessage(this->m_hWnd,WM_ASYNCGETSERVBYNAME,0,MAKELPARAM(0,nWSAError));
			}
			else
				nWSAError = 0;
		}
		else
		{
			struct servent se = {0};
			se.s_port = (short)m_nPort;
			memset(m_lpszAsyncGetServByName,'\0',m_nAsyncGetServByName);
			memcpy(m_lpszAsyncGetServByName,&se,sizeof(struct servent));

			// ha incontrato il servizio nell'array, invia il messaggio alla On...()
			nWSAError = 0;
			::PostMessage(this->m_hWnd,WM_ASYNCGETSERVBYNAME,0,MAKELPARAM(0,nWSAError));
		}
	}

	return(nWSAError);
}

/*
	OnAsyncGetServByName()

	Callback per WSAAsyncGetServByName().
	Formatta i dati ricevuti e chiama la callback di CAsyncSock.

	input:
	UINT				(wParam) codice d'errore WSA
	LONG				(lParam) puntatore al buffer utilizzato da WSAAsyncGetServByName()

	output:
	LONG				0L (il codice d'errore viene passato alla callback di CAsyncSock in wParam)
*/
LONG CSockWnd::OnAsyncGetServByName(UINT /*wParam*/,LONG lParam)
{
	int nWSAError = WSAGETASYNCERROR(lParam);

	m_hAsyncGetServByName = (HANDLE)0;
	m_nPort = 0;

	// errore Winsock
	if(nWSAError!=0)
	{
		// azzera il buffer di CAsyncSock
		memset(m_lpszAsyncGetServByName,'\0',m_nAsyncGetServByName);
	}
	else
	{
		// copia dal buffer di CAsyncSock a quello interno
		m_nPort = (int)((struct servent FAR *)m_lpszAsyncGetServByName)->s_port;
	}

	// chiama la callback di CAsyncSock
	if(m_pAsyncSock)
		m_pAsyncSock->AsyncGetServByNameCallBack(nWSAError,MAKELPARAM(LOWORD(m_nPort),HIWORD(m_nPort)));

	return(0L);
}

/*
	AsyncGetServByPort()

	Ricava il nome del servizio relativo al # porta in modo asincrono, chiamando la WSAAsyncGetServByPort().
	Imposta la OnAsyncGetServByPort() come callback per WSAAsyncGetServByPort() per poter formattare i 
	dati ricevuti.

	input:
	LPCSTR			# porta
	LPCSTR			puntatore al buffer con il protocollo (default tcp)
	LPSTR			puntatore al buffer per WSAAsyncGetServByPort() (CAsyncSock)
	UINT				dimensione del buffer (CAsyncSock)

	output:
	int				0 o codice d'errore WSA
*/
int CSockWnd::AsyncGetServByPort(UINT m_nPort,LPCSTR lpcszProto,LPSTR pBuffer,UINT nBufSize)
{
	static LPSTR lpName;
	static char szName[32];

	int nWSAError = WSA_FAILURE;

	m_lpszAsyncGetServByPort = pBuffer;
	m_nAsyncGetServByPort = nBufSize;
	memset(m_lpszAsyncGetServByPort,'\0',m_nAsyncGetServByPort);

	// controlla che sia stato passato un puntatore valido alla classe
	if(m_pAsyncSock)
	{
		lpName = NULL;
		memset(szName,'\0',sizeof(szName));

		// prima di chiamare winsock controlla nell'array dei servizi di CSock
		ITERATOR iter;
		SERVICES* s;
		if((iter = m_pAsyncSock->m_pServicesList.First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				s = (SERVICES*)iter->data;
				if(stricmp(lpcszProto,s->proto)==0)
				{
					strcpyn(szName,s->service,sizeof(szName));
					lpName = szName;
					break;
				}

				iter = m_pAsyncSock->m_pServicesList.Next(iter);
			}

		if(!lpName)
		{
			// effettua la richiesta asincrona passando l'handle della finestra interna ed il ptr al buffer di CAsyncSock
			if((m_hAsyncGetServByPort=::WSAAsyncGetServByPort(this->m_hWnd,WM_ASYNCGETSERVBYPORT,m_nPort,lpcszProto,m_lpszAsyncGetServByPort,m_nAsyncGetServByPort))==(HANDLE)0)
			{
				// in caso di errore deve inviare il messaggio autonomamente perche' la On...() non verra' chiamata
				nWSAError = m_pAsyncSock->GetWSALastError(WSA_GETLASTERROR);
				::PostMessage(this->m_hWnd,WM_ASYNCGETSERVBYPORT,0,MAKELPARAM(0,nWSAError));
			}
			else
				nWSAError = 0;
		}
		else
		{
			struct servent se = {0};
			se.s_name = (char FAR *)szName;
			memset(m_lpszAsyncGetServByPort,'\0',m_nAsyncGetServByPort);
			memcpy(m_lpszAsyncGetServByPort,&se,sizeof(struct servent));

			// ha incontrato il servizio nell'array, invia il messaggio alla On...()
			nWSAError = 0;
			::PostMessage(this->m_hWnd,WM_ASYNCGETSERVBYPORT,0,MAKELPARAM(0,nWSAError));
		}
	}

	return(nWSAError);
}

/*
	OnAsyncGetServByPort()

	Callback per WSAAsyncGetServByPort().
	Formatta i dati ricevuti e chiama la callback di CAsyncSock.

	input:
	UINT				(wParam) codice d'errore WSA
	LONG				(lParam) puntatore al buffer utilizzato da WSAAsyncGetServByPort()

	output:
	LONG				0L (il codice d'errore viene passato alla callback di CAsyncSock in wParam)
*/
#pragma warning(disable:4305)
LONG CSockWnd::OnAsyncGetServByPort(UINT /*wParam*/,LONG lParam)
{
	int nWSAError = WSAGETASYNCERROR(lParam);

	m_hAsyncGetServByPort = (HANDLE)0;
	memset(m_szService,'\0',sizeof(m_szService));

	// errore Winsock
	if(nWSAError!=0)
	{
		// azzera il buffer di CAsyncSock
		memset(m_lpszAsyncGetServByPort,'\0',m_nAsyncGetServByPort);
	}
	else
	{
		// copia dal buffer di CAsyncSock a quello interno
		strcpyn(m_szService,(char FAR *)((struct servent FAR *)m_lpszAsyncGetServByPort)->s_name,sizeof(m_szService));
	}

	// chiama la callback di CAsyncSock
	if(m_pAsyncSock)
		m_pAsyncSock->AsyncGetServByPortCallBack(nWSAError,MAKELPARAM(LOWORD(m_szService),HIWORD(m_szService)));

	return(0L);
}
#pragma warning(default:4305)

/*
	OnAsyncSelect()
	
	Callback per WSAAsyncSelect().
	Chiama la callback di CAsyncSock relativa all'evento segnalato.
	La chiamata a WSAAsyncSelect() per registrare gli eventi da segnalare viene effettuata
	durante la creazione del socket in CAsyncSock::Create(), passando come handle di
	finestra quello di CSockWnd.
*/
LONG CSockWnd::OnAsyncSelect(UINT /*wParam*/,LONG lParam)
{
	WORD wWSAEvent = WSAGETSELECTEVENT(lParam);	// evento (FD_READ|FD_WRITE|FD_OOB|FD_ACCEPT|FD_CONNECT|FD_CLOSE)
	WORD wWSAError = WSAGETSELECTERROR(lParam);	// errore winsock

	if(wWSAError!=0)
		m_pAsyncSock->SetWSALastError(wWSAError);

	static char szWSAString[128];
	strcpyn(szWSAString,m_pAsyncSock->GetWSAErrorString(),sizeof(szWSAString));

	switch(wWSAEvent)
	{
		case FD_READ:
			if(m_pAsyncSock)
				m_pAsyncSock->AsyncReadCallBack(wWSAError,MAKELPARAM(LOWORD(szWSAString),HIWORD(szWSAString)));
			break;

		case FD_WRITE:
			if(m_pAsyncSock)
				m_pAsyncSock->AsyncWriteCallBack(wWSAError,MAKELPARAM(LOWORD(szWSAString),HIWORD(szWSAString)));
			break;

		case FD_OOB:
			break;

		case FD_ACCEPT:
			break;

		case FD_CONNECT:
			if(m_pAsyncSock)
				m_pAsyncSock->AsyncConnectCallBack(wWSAError,MAKELPARAM(LOWORD(szWSAString),HIWORD(szWSAString)));
			break;

		case FD_CLOSE:
			if(m_pAsyncSock)
				m_pAsyncSock->AsyncCloseCallBack(wWSAError,MAKELPARAM(LOWORD(szWSAString),HIWORD(szWSAString)));
			break;
	}

	return(0L);
}

/*
	CAsyncSock()
*/
CAsyncSock::CAsyncSock(CWnd* pParent) : CSock(pParent)
{
	CSock::m_bInitialized = FALSE;

	// azzera i buffer interni
	memset(m_szAsyncGetHostByName,'\0',sizeof(m_szAsyncGetHostByName));
	memset(m_szAsyncGetHostByAddr,'\0',sizeof(m_szAsyncGetHostByAddr));
	memset(m_szAsyncGetServByName,'\0',sizeof(m_szAsyncGetServByName));
	memset(m_szAsyncGetServByPort,'\0',sizeof(m_szAsyncGetServByPort));

	// crea la finestra interna
	m_pSockWnd = new CSockWnd(this,pParent);
	if(m_pSockWnd)
	{
		m_pSockWnd->ShowWindow(SW_HIDE);
		m_pSockWnd->UpdateWindow();
	}
	else
		return;

	CSock::m_bInitialized = TRUE;

	CSock::ShowErrors(FALSE);
}

/*
	~CAsyncSock()
*/
CAsyncSock::~CAsyncSock(void)
{
	// chiude il socket
	CSock::Close();

	// elimina la finestra interna
	if(m_pSockWnd)
		delete m_pSockWnd,m_pSockWnd = NULL;
}

/*
	Create()

	Ridefinisce la virtual di CSock per la gestione degli eventi asincroni.
	Gi eventi (FD_READ, etc.) vengono direzionati alla finestra di CSockWnd che chiama la
	callback di CAsyncSock corrispondente.
*/
SOCKET CAsyncSock::Create(void)
{
	SOCKET s = INVALID_SOCKET;
	int nWSAError = SOCKET_ERROR;

	// controlla che il costruttore abbia terminato correttamente
	if(CSock::m_bInitialized)
	{
		// crea il socket tramite CSock e imposta l'handler per i messaggi asincroni
		if((s = CSock::Create())!=INVALID_SOCKET)
		{
			// controlla il puntatore alla finestra per i messaggi asincroni
			if(m_pSockWnd && m_pSockWnd->m_hWnd)
			{
				// imposta l'handler
				if((nWSAError = ::WSAAsyncSelect(s,m_pSockWnd->m_hWnd,WM_ASYNCSELECT,FD_READ|FD_WRITE|FD_OOB|FD_ACCEPT|FD_CONNECT|FD_CLOSE))==SOCKET_ERROR)
					nWSAError = CSock::GetWSALastError(WSA_GETLASTERROR);
			}
		}

		// impostazione gestione asincrona fallita, chiude il socket (con CSock)
		if(nWSAError==SOCKET_ERROR && s!=INVALID_SOCKET)
			CSock::Close();
	}
	else
		CSock::SetWSALastError(WSANOTINITIALISED);

	return(nWSAError==SOCKET_ERROR ? INVALID_SOCKET : s);
}

/*
	Close()

	Ridefinisce la virtual di CSock per la gestione degli eventi asincroni.
*/
int CAsyncSock::Close(LPSTR /*lpDiscardBuffer*/,int /*iBufferLen*/)
{
	// controlla che il costruttore abbia terminato correttamente
	if(CSock::m_bInitialized)
	{
		// controlla il puntatore alla finestra per i messaggi asincroni
		if(m_pSockWnd && m_pSockWnd->m_hWnd)
		{
			// elimina l'handler per la gestione dei messaggi asincroni
			if(::WSAAsyncSelect(CSock::GetHandle(),m_pSockWnd->m_hWnd,0,0)==SOCKET_ERROR)
				CSock::GetWSALastError(WSA_GETLASTERROR);
		}

		// chiude il socket (con CSock)
		CSock::Close();
	}
	else
		CSock::SetWSALastError(WSANOTINITIALISED);

	return(0);
}

/*
	AsyncConnect()

	Effettua il collegamento all'host/porta.
	L'host deve essere specificato attraverso il relativo indirizzo ip in formato stringa.
	L'applicazione, al termine dell'operazione, ricevera' il messaggio WM_ASYNSELECT.

	input:
	LPCSTR			ptr all'ip in formato stringa ("n.n.n.n")
	UINT				numero porta

	output:
	BOOL				flag per collegamento riuscito
*/
BOOL CAsyncSock::AsyncConnect(LPCSTR lpcszIPAddr,UINT m_nPort)
{
	BOOL bConnected = FALSE;
	int nWSAError = 0;
	
	// controlla che il costruttore abbia terminato correttamente
	if(CSock::m_bInitialized)
	{
		// controlla che sia un indirizzo valido ("n.n.n.n")
		if(CSock::ValidateIPAddr(lpcszIPAddr))
		{
			SOCKADDR_IN sockaddr_in;
			
			// imposta il socket (tipo, porta, indirizzo)
			sockaddr_in.sin_family           = PF_INET;
			sockaddr_in.sin_port             = ::htons((u_short)m_nPort);
			sockaddr_in.sin_addr.S_un.S_addr = ::inet_addr(lpcszIPAddr);

			// collega il socket
			if(::connect(CSock::GetHandle(),(SOCKADDR *)&sockaddr_in,SOCKADDR_IN_LEN)==SOCKET_ERROR)
			{
				// nel caso di socket asincroni connect() genera un WSAEWOULDBLOCK
				if((nWSAError=CSock::GetWSALastError(WSA_GETLASTERROR))==WSAEWOULDBLOCK)
					bConnected = TRUE;
			}
			else
				bConnected = TRUE;
		}
		else
			nWSAError = CSock::SetWSALastError(WSAEDESTADDRREQ);
	}
	else
		nWSAError = CSock::SetWSALastError(WSANOTINITIALISED);

	// connessione fallita, invia autonomamente il messaggio all'applicazione perche' se connect()
	// fallisce non viene eseguita la callback
	if(!bConnected)
	{
		if(CSock::m_pParent)
			CSock::m_pParent->PostMessage(WM_ASYNCCONNECT,nWSAError,MAKELPARAM(0,nWSAError));
	}

	return(bConnected);
}

/*
	AsyncConnectCallback()

	Callback per CSockWnd::OnAsyncSelect().
	Invia il messaggio di connessione avvenuta (WM_ASYNCCONNECT) all'applicazione.
*/
LONG CAsyncSock::AsyncConnectCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCCONNECT,wParam,lParam);

	return(0L);
}

/*
	AsyncWriteCallback()

	Callback per CSockWnd::OnAsyncSelect().
	Invia il messaggio socket pronto in scrittura (WM_ASYNCWRITE) all'applicazione.
*/
LONG CAsyncSock::AsyncWriteCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCWRITE,wParam,lParam);

	return(0L);
}

/*
	AsyncReadCallback()

	Callback per CSockWnd::OnAsyncSelect().
	Invia il messaggio socket pronto in lettura (WM_ASYNCREAD) all'applicazione.
*/
LONG CAsyncSock::AsyncReadCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCREAD,wParam,lParam);

	return(0L);
}

/*
	AsyncCloseCallback()

	Callback per CSockWnd::OnAsyncSelect().
	Invia il messaggio di chiusura socket (WM_ASYNCCLOSE) all'applicazione.
*/
LONG CAsyncSock::AsyncCloseCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCCLOSE,wParam,lParam);

	return(0L);
}

/*
	AsyncGetHostByName()

	Ricava l'indirizzo ip relativo al nome host in modo asincrono.
	L'applicazione, al termine dell'operazione, ricevera' il messaggio WM_ASYNCGETHOSTBYNAME.

	input:
	LPCSTR			ptr al nome host

	output:
	BOOL				flag per operazione riuscita
*/
BOOL CAsyncSock::AsyncGetHostByName(LPCSTR lpcszHostName)
{
	BOOL bGet = FALSE;

	// controlla che il costruttore abbia terminato correttamente
	if(CSock::m_bInitialized)
	{
		// controlla che esista la finestra interna
		if(m_pSockWnd)
		{
			int nWSAError;

			// chiama la async di CSockWnd, l'applicazione ricevera il messaggio tramite le callback
			if((nWSAError=m_pSockWnd->AsyncGetHostByName(lpcszHostName,m_szAsyncGetHostByName,sizeof(m_szAsyncGetHostByName)))!=0)
				CSock::SetWSALastError(nWSAError);

			bGet = (nWSAError==0);
		}
		else
			CSock::SetWSALastError(WSANOTINITIALISED);
	}
	else
		CSock::SetWSALastError(WSANOTINITIALISED);

	return(bGet);
}

/*
	AsyncGetHostByNameCallBack()

	Callback per CSockWnd::OnAsyncGetHostByName().
	Invia il messaggio WM_ASYNCGETHOSTBYNAME all'applicazione.
*/
LONG CAsyncSock::AsyncGetHostByNameCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	CAsyncSock::OnAsyncGetHostByName((LPCSTR)lParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCGETHOSTBYNAME,wParam,lParam);

	return(0L);
}

/*
	AsyncGetHostByAddr()

	Ricava il nome dell'host relativo all'indirizzo ip in modo asincrono.
	L'applicazione, al termine dell'operazione, ricevera' il messaggio WM_ASYNCGETHOSTBYADDR.

	input:
	LPCSTR			ptr all'indirizzo ip

	output:
	BOOL				flag per operazione riuscita
*/
BOOL CAsyncSock::AsyncGetHostByAddr(LPCSTR lpcszHostIP)
{
	BOOL bGet = FALSE;

	// controlla che il costruttore abbia terminato correttamente
	if(CSock::m_bInitialized)
	{
		// controlla che esista la finestra interna
		if(m_pSockWnd)
		{
			int nWSAError;

			// chiama la async di CSockWnd, l'applicazione ricevera il messaggio tramite le callback
			if((nWSAError=m_pSockWnd->AsyncGetHostByAddr(lpcszHostIP,m_szAsyncGetHostByAddr,sizeof(m_szAsyncGetHostByAddr)))!=0)
				CSock::SetWSALastError(nWSAError);

			bGet = (nWSAError==0);
		}
		else
			CSock::SetWSALastError(WSANOTINITIALISED);
	}
	else
		CSock::SetWSALastError(WSANOTINITIALISED);

	return(bGet);
}

/*
	AsyncGetHostByAddrCallBack()

	Callback per CSockWnd::OnAsyncGetHostByAddr().
	Invia il messaggio WM_ASYNCGETHOSTBYADDR all'applicazione.
*/
LONG CAsyncSock::AsyncGetHostByAddrCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	CAsyncSock::OnAsyncGetHostByAddr((LPCSTR)lParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCGETHOSTBYADDR,wParam,lParam);

	return(0L);
}

/*
	AsyncGetServByName()

	Ricava il # della porta corrispondente al servizio in modo asincrono.
	L'applicazione, al termine dell'operazione, ricevera' il messaggio WM_ASYNCGETSERVBYNAME.

	input:
	LPCSTR			ptr al nome del servizio

	output:
	BOOL				flag per operazione riuscita
*/
BOOL CAsyncSock::AsyncGetServByName(LPCSTR lpcszService,LPCSTR lpcszProto)
{
	BOOL bGet = FALSE;

	// controlla che il costruttore abbia terminato correttamente
	if(CSock::m_bInitialized)
	{
		// controlla che esista la finestra interna
		if(m_pSockWnd)
		{
			int nWSAError;

			// chiama la async di CSockWnd, l'applicazione ricevera il messaggio tramite le callback
			if((nWSAError=m_pSockWnd->AsyncGetServByName(lpcszService,lpcszProto,m_szAsyncGetServByName,sizeof(m_szAsyncGetServByName)))!=0)
				CSock::SetWSALastError(nWSAError);

			bGet = (nWSAError==0);
		}
		else
			CSock::SetWSALastError(WSANOTINITIALISED);
	}
	else
		CSock::SetWSALastError(WSANOTINITIALISED);

	return(bGet);
}

/*
	AsyncGetServByNameCallBack()

	Callback per CSockWnd::OnAsyncGetServByName().
	Invia il messaggio WM_ASYNCGETSERVBYNAME all'applicazione.
*/
LONG CAsyncSock::AsyncGetServByNameCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	CAsyncSock::OnAsyncGetServByName((UINT)lParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCGETSERVBYNAME,wParam,lParam);

	return(0L);
}

/*
	AsyncGetServByPort()

	Ricava il servizio corrispondente al # della porta in modo asincrono.
	L'applicazione, al termine dell'operazione, ricevera' il messaggio WM_ASYNCGETSERVBYPORT.

	input:
	UINT				numero porta

	output:
	BOOL				flag per operazione riuscita
*/
BOOL CAsyncSock::AsyncGetServByPort(UINT m_nPort,LPCSTR lpcszProto)
{
	BOOL bGet = FALSE;

	// controlla che il costruttore abbia terminato correttamente
	if(CSock::m_bInitialized)
	{
		// controlla che esista la finestra interna
		if(m_pSockWnd)
		{
			int nWSAError;

			// chiama la async di CSockWnd, l'applicazione ricevera il messaggio tramite le callback
			if((nWSAError=m_pSockWnd->AsyncGetServByPort(m_nPort,lpcszProto,m_szAsyncGetServByPort,sizeof(m_szAsyncGetServByPort)))!=0)
				CSock::SetWSALastError(nWSAError);

			bGet = (nWSAError==0);
		}
		else
			CSock::SetWSALastError(WSANOTINITIALISED);
	}
	else
		CSock::SetWSALastError(WSANOTINITIALISED);

	return(bGet);
}

/*
	AsyncGetServByPortCallBack()

	Callback per CSockWnd::OnAsyncGetServByPort().
	Invia il messaggio WM_ASYNCGETSERVBYPORT all'applicazione.
*/
LONG CAsyncSock::AsyncGetServByPortCallBack(UINT wParam,LONG lParam)
{
	// in wParam l'errore Winsock
	if(wParam!=0)
		CSock::SetWSALastError(wParam);

	CAsyncSock::OnAsyncGetServByPort((LPCSTR)lParam);

	// invia il messaggio all'applicazione (controlla che sia stata specificata una finestra)
	if(CSock::m_pParent)
		CSock::m_pParent->PostMessage(WM_ASYNCGETSERVBYPORT,wParam,lParam);

	return(0L);
}
