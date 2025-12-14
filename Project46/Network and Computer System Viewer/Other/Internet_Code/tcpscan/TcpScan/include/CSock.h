/*
	CSock.h
	Classe derivata per interfaccia Winsock (CRT/SDK/MFC).
	Luca Piergentili, 06/07/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CSOCK_H
#define _CSOCK_H 1

#include "macro.h"
#include <stdio.h>
#include <stdlib.h>
#include "strcpyn.h"
#if defined(_WINDOWS)
  #include "window.h"
#else
  #include "typedef.h"
#endif
#include <winsock.h>
#include "lmhosts.h"
#include "CWinsock.h"
#include "CBase64.h"
#include "CUuenc.h"
#include "CNodeList.h"

// messaggi Winsock
#if defined(_WINDOWS)
//#define FD_READ			0x01
//#define FD_WRITE			0x02
//#define FD_OOB			0x04
//#define FD_ACCEPT			0x08
//#define FD_CONNECT		0x10
//#define FD_CLOSE			0x20
  #define FD_CLOSEEX		0x40
#endif

// codici WSA
#define WSA_SUCCESS			WSABASEERR-1
#define WSA_FAILURE			WSABASEERR-2
#define WSA_GETLASTERROR		WSABASEERR-3
#define WSA_UNKNOWERROR		WSABASEERR-4

// messaggi per WSAAsyncSelect()
#if defined(_WINDOWS)
  #define WM_WSAASYNC		WM_USER+667
  #define WM_WSAASYNCREJECT	WM_USER+668
#endif

// WSAStartup()
#ifndef MAKEWORD
  #define MAKEWORD(l,h)		((WORD)(((BYTE)(l))|(((WORD)(BYTE)(h))<<8)))
#endif
#define WSA_MAJOR_VERSION	1
#define WSA_MINOR_VERSION	1
#define WSA_VERSION			MAKEWORD(WSA_MAJOR_VERSION,WSA_MINOR_VERSION)

// dimensione buffer I/O
#define WSA_BUF_SIZE		8192

// dimensioni campi
#define MAX_USER_LEN		64			// utente
#define MAX_PASS_LEN		64			// password
#define IP_ADDRESS_SIZE		16			// stringa indirizzo ip
#define HOSTNAME_SIZE		_MAX_PATH		// nome host
#define MAX_SERVICES		512			// array servizi
#define SERVICE_NAME		64			// nome servizio
#define PORT_NAME			5			// numero porta
#define PROTOCOL_NAME		64			// nome protocollo
#define COMMENT_NAME		64			// comento

/*
	SOCKETSTATE
	tipo per lo status delle operazioni di I/O sul socket
*/
enum SOCKETSTATE {
	UNDEFINED,
	OPEN,
	CLOSED,
	WAITING,
	PENDING,
	DONE
};

/*
	SOCKET_EXT
	struttura per il socket
*/
struct SOCKET_EXT {
	SOCKET      socket;		// handle del socket
	SOCKETSTATE status;		// status
	int         error;		// codice d'errore
	int         format;		// formato
	int         type;		// tipo
	int         proto;		// protocollo
};

/*
	SOCKET_EXT_LEN
	dimensione della struttura per il socket
*/
#define SOCKET_EXT_LEN sizeof(SOCKET_EXT)

/*
	SOCKADDR_LEN
	dimensione della struttura per l'ip
*/
#define SOCKADDR_LEN sizeof(struct sockaddr)

/*
	SOCKADDR_IN_LEN
	dimensione della struttura per l'ip
*/
#define SOCKADDR_IN_LEN sizeof(SOCKADDR_IN)

/*
	WSADATA_EXT
	struttura per i dati WSA (winsock)
*/
struct WSADATA_EXT {
	WSADATA data;
	int     error;
	char    errorstr[128];
};

/*
	IP_RANGE
	struttura per la gestione degli intervalli di indirizzi ip
*/
struct IP_RANGE {
	char ip_start[IP_ADDRESS_SIZE+1];
	int  a_start,b_start,c_start,d_start;
	char ip_end[IP_ADDRESS_SIZE+1];
	int  a_end,b_end,c_end,d_end;
};

/*
	SERVICES
	struttura per il database (locale) dei servizi
*/
struct SERVICES {
public:
	SERVICES(LPCSTR lpcszService = NULL,UINT nPort = (UINT)-1,LPCSTR lpcszProto = NULL,LPCSTR lpcszComment = NULL)
	{
		if(lpcszService)
			strcpyn(service,lpcszService,sizeof(service));
		else
			memset(service,'\0',sizeof(service));

		if(nPort != -1)
			port = nPort;
		else
			port = 0;

		if(lpcszProto)
			strcpyn(proto,lpcszProto,sizeof(proto));
		else
			memset(proto,'\0',sizeof(proto));

		if(lpcszComment)
			strcpyn(comment,lpcszComment,sizeof(comment));
		else
			memset(comment,'\0',sizeof(comment));
	}

	virtual ~SERVICES() {}
	
	char service[SERVICE_NAME+1];
	UINT port;
	char proto[PROTOCOL_NAME+1];
	char comment[COMMENT_NAME+1];
};

/*
	CServicesList
	Lista per i servizi presenti nel database (locale).
*/
class CServicesList : public CNodeList
{
public:
	CServicesList() {}
	virtual ~CServicesList() {CNodeList::DeleteAll();}
	BOOL PreDelete(ITERATOR iter)
	{
		if((SERVICES*)iter->data)
		{
			delete ((SERVICES*)iter->data);
			iter->data = (SERVICES*)NULL;
		}
		return(TRUE);
	}
	int Size(void) {return(sizeof(SERVICES));}
#ifdef _DEBUG
	const char* Signature(void) {return("CServicesList");}
#endif
};

/*
	TCPSCAN
	Elemento per la lista per lo scanning TCP/IP.
*/
struct TCPSCAN {
public:
	TCPSCAN(LPCSTR lpcszIP = NULL,UINT nPort = (UINT)-1)
	{
		if(lpcszIP)
			strcpyn(ip,lpcszIP,sizeof(ip));
		else
			strcpyn(ip,LOCAL_HOST,sizeof(ip));
		
		if(nPort!=(UINT)-1)
			port = nPort;
		else
			port = 0;
	}

	virtual ~TCPSCAN() {}
	
	char ip[IP_ADDRESS_SIZE+1];
	UINT port;
};

/*
	CTcpscanList
	Classe derivata per la lista per lo scanning TCP/IP.
*/
class CTcpscanList : public CNodeList
{
public:
	CTcpscanList() {}
	virtual ~CTcpscanList() {CNodeList::DeleteAll();}
	BOOL PreDelete(ITERATOR iter)
	{
		if((TCPSCAN*)iter->data)
		{
			delete ((TCPSCAN*)iter->data);
			iter->data = (TCPSCAN*)NULL;
		}
		return(TRUE);
	}
	int Size(void) {return(sizeof(TCPSCAN));}
#ifdef _DEBUG
	const char* Signature(void) {return("CTcpscanList");}
#endif
};

/*
	CSock
*/
class CSock : public CWinsock, public CBase64, public CUuenc
{
public:
	// costruttore (ptr alla finestra dell'applicazione)/distruttore
#ifdef WIN32_MFC
	CSock(CWnd* pParent = NULL);
#else
	#ifdef WIN32_SDK
		CSock(HWND hWnd = NULL);
	#else
		CSock();
	#endif
#endif
	virtual ~CSock(void);

	// inizializzazione
	inline BOOL	IsValid		(void) {return(m_bInitialized);}
	void			Init			(SOCKET socket = INVALID_SOCKET,SOCKETSTATE state = UNDEFINED);
	void			Reset		(void);

	// formato, tipo, protocollo
	int			SetFormat		(int nFormat = PF_INET);
	int			SetType		(int nType = SOCK_STREAM);
	int			SetProto		(int nProto = 0);
	int			SetBufferSize	(UINT nSize = WSA_BUF_SIZE);
	int			SetTimeout	(UINT nSecs = 15);

	// apertura, collegamento, chiusura
	inline BOOL	IsOpen		(void) {return(m_Socket.status!=UNDEFINED && m_Socket.status!=CLOSED);}
	BOOL			Open			(int nFormat = PF_INET,int nType = SOCK_STREAM,int nProto = 0);
	BOOL			Connect		(LPCSTR lpcszHost,UINT nPort);
	BOOL			Abort		(void);
	BOOL			Close		(void);

	// handle del socket
	inline const SOCKET GetHandle	(void) {return(m_Socket.socket);}
	inline void	SetHandle		(SOCKET socket) {m_Socket.socket = socket;}
	LPCSTR		GetIPAddress	(SOCKET socket = INVALID_SOCKET);

	// connessioni
#if defined(_WINDOWS)
	SOCKET		CreateListenSocket		(HWND hWnd,UINT uMsg,UINT nPort);
	CSock*		AcceptConnectingSocket	(HWND hWnd,UINT uMsg);
#endif

	// invio, ricezione
	inline void	ResetData			(void) {memset(m_szSendBuffer,'\0',sizeof(m_szSendBuffer)); memset(m_szRecvBuffer,'\0',sizeof(m_szRecvBuffer));}
	inline void	ResetIncomingData	(void) {memset(m_szRecvBuffer,'\0',sizeof(m_szRecvBuffer));}
	inline void	ResetOutgoingData	(void) {memset(m_szSendBuffer,'\0',sizeof(m_szSendBuffer));}

	inline int	HaveIncomingData	(void) {return(strlen(m_szRecvBuffer));}
	inline int	HaveOutgoingData	(void) {return(strlen(m_szSendBuffer));}

	inline void	SetData			(LPCSTR pData) {strcpyn(m_szSendBuffer,pData,sizeof(m_szSendBuffer));}
	inline LPCSTR	GetData			(void) {return(m_szRecvBuffer);}

	int			Send				(int nLen = -1);
	int			Send				(LPCSTR pData,int nLen);
	LPCSTR		Receive			(int* nRecv = NULL,int = -1);
	int			Receive			(LPSTR pBuffer,int nLen);

	// host, addr
	LPCSTR		GetLocalHostName	(void);
	LPCSTR		GetLocalHostAddr	(void);
	LPCSTR		GetHostByName		(LPCSTR);
	LPCSTR		GetHostByAddr		(LPCSTR);
	
	// servizi
	int			GetServiceByName	(LPCSTR lpcszService,LPCSTR lpcszProto = "tcp",BOOL bUseLocalDabatase = TRUE);
	LPCSTR		GetServiceByPort	(UINT nPort,LPCSTR lpcszProto = "tcp",BOOL bUseLocalDabatase = TRUE);

	// indirizzi ip
	LPCSTR		ParseIPRange		(LPCSTR,LPCSTR);

	// errori
#if defined(_WINDOWS)
	void			ShowErrors		(BOOL);
#endif
	BOOL			IsWSAError		(int);
	const int		GetWSAErrorNumber	(void);
	const char*	GetWSAErrorString	(void);

	int			GetWSALastError	(int = WSA_GETLASTERROR);
	int			SetWSALastError	(int);

private:
	// host, addr
	LPHOSTENT		GetHostInfo		(LPCSTR);
	LPCSTR		GetHostLocalName	(void);
	LPCSTR		GetHostLocalAddr	(void);

	// servizi
	int			LoadServices		(LPCSTR = NULL);
	
	// indirizzi ip
	void			TokenizeIPAddr		(const char*,unsigned int&,unsigned int&,unsigned int&,unsigned int&);
	const char*	GetIPFromRange		(IP_RANGE*);

	SOCKET_EXT	m_Socket;									// socket
	WSADATA_EXT	m_WsaData;								// dati WSA
	char			m_szSendBuffer[WSA_BUF_SIZE+1];				// ptr al buffer per l'invio
	char			m_szRecvBuffer[WSA_BUF_SIZE+1];				// ptr al buffer per la ricezione
	char			m_szLocalHostIP[IP_ADDRESS_SIZE + 1];			// buffer per l'ip dell'host locale
	char			m_szLocalHostName[HOSTNAME_SIZE + 1];			// buffer per il nome dell'host locale

protected:
	// creazione, chiusura
	virtual SOCKET	Create			(void);
	virtual int	Shutdown			(LPSTR lpszDiscard = NULL,int nSize = 0);
	
	// indirizzi ip
	BOOL			ValidateIPAddr		(const char*);

#ifdef WIN32_MFC
	CWnd*		m_pParent;								// ptr/handle finestra applicazione principale
#endif
#if defined(WIN32_MFC) || defined(WIN32_SDK)
	HWND			m_hWnd;
#endif
	BOOL			m_bInitialized;							// flag per inizializzazione
#if defined(_WINDOWS)
	BOOL			m_bShowErrors;								// flag per visualizzazione errori
#endif
	CServicesList	m_pServicesList;							// lista per i servizi
};

#endif // _CSOCK_H
