/*
	TcpScanConfig.h
	Luca Piergentili, 06/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _TCPSCANCONFIG_H
#define _TCPSCANCONFIG_H 1

#include "window.h"
#include "lmhosts.h"
#include "CConfig.h"
#include "TcpScanVersion.h"

// chiavi registro
#define TCPSCAN_KEY				PROGRAM_NAME
#define DEFAULT_TCPSCAN_KEY		DEFAULT_REG_KEY"\\"TCPSCAN_KEY

/*
	Pathnames
*/
#define DEFAULT_DIR					"C:\\"PROGRAM_NAME
#define TCPSCAN_PATHNAMES_KEY			"PathNames"
#define TCPSCAN_DEFAULTDIR_KEY			"DefaultDir"

/*
	Scanner
*/
#define DEFAULT_HOST				LOCAL_HOST
#define DEFAULT_PORTMODE				0
#define DEFAULT_PORTNUMBERS			"0"
#define TCPSCAN_SCAN_KEY				"Scanner"
#define TCPSCAN_HOST_KEY					"Host"
#define TCPSCAN_SCANNING_STARTHOST_KEY		"StartHost"
#define TCPSCAN_SCANNING_ENDHOST_KEY		"EndHost"
#define TCPSCAN_SCANNING_PORTMODE_KEY		"PortMode"
#define TCPSCAN_SCANNING_PORTNUMBERS_KEY	"PortNumbers"

/*
	Miner
*/
//#define DEFAULT_HOST				LOCAL_HOST
#define DEFAULT_PORT				0
#define DEFAULT_MINE_PATH			DEFAULT_DIR
#define DEFAULT_MINE_BROWSER			""
#define TCPSCAN_MINE_KEY				"Miner"
//#define TCPSCAN_HOST_KEY				"Host"
#define TCPSCAN_PORT_KEY					"Port"
#define TCPSCAN_URL_KEY					"Url"
#define TCPSCAN_MINE_PATH_KEY				"Pathname"
#define TCPSCAN_MINE_BROWSER_KEY			"Browser"

/*
	Connect
*/
//#define DEFAULT_HOST				LOCAL_HOST
//#define DEFAULT_PORT				0
#define TCPSCAN_CONNECT_KEY			"Connect"
//#define TCPSCAN_HOST_KEY				"Host"
#define TCPSCAN_HOSTADDR_KEY				"Addr"
//#define TCPSCAN_PORT_KEY				"Port"
#define TCPSCAN_PORTNUMBER_KEY			"Number"

/*
	Services
*/
#define DEFAULT_DATABASE				""
#define DEFAULT_TOTSERVICES			0
#define TCPSCAN_SERVICES_KEY			"Services"
#define TCPSCAN_DATABASE_KEY				"Database"
#define TCPSCAN_DATABASEFILE_KEY			"File"
#define TCPSCAN_TOTSERVICES_KEY			"Tot"
#define TCPSCAN_SERVICENAME_KEY			"Service"

/*
	Options
*/
#define DEFAULT_LOG					PROGRAM_NAME".log"
#define DEFAULT_SESSIONLOG			0
#define DEFAULT_SHOWCONN				0
#define DEFAULT_SCANDELAY			0
#define DEFAULT_MINEDELAY			0
#define DEFAULT_MINEUSETHREADS		1

#define DEFAULT_MAX_HOSTENTRY			5
#define DEFAULT_MAX_PORTENTRY			5
#define DEFAULT_MAX_DATABASEENTRY		5

// Scanner
#define DEFAULT_SCAN_HOST_COLSIZE		0
#define DEFAULT_SCAN_PORT_COLSIZE		0
#define DEFAULT_SCAN_DESC_COLSIZE		0

// Miner
#define DEFAULT_MINE_URL_COLSIZE		0
#define DEFAULT_MINE_COMMENT_COLSIZE	0
#define DEFAULT_MINE_HTTP_COLSIZE		0
#define DEFAULT_MINE_DESC_COLSIZE		0
#define DEFAULT_MINE_DOCUMENT_COLSIZE	0

// Services
#define DEFAULT_SERVICES_SERVICE_COLSIZE  0
#define DEFAULT_SERVICES_PORT_COLSIZE     0
#define DEFAULT_SERVICES_PROTOCOL_COLSIZE 0
#define DEFAULT_SERVICES_COMMENT_COLSIZE  0

#define TCPSCAN_OPTIONS_KEY			"Options"
#define TCPSCAN_LOG_KEY					"Log"
#define TCPSCAN_SESSIONLOG_KEY			"SessionLog"
#define TCPSCAN_SHOWCONN_KEY				"ShowOnlyValidConnections"
#define TCPSCAN_SCANDELAY_KEY				"ScanDelay"
#define TCPSCAN_MINEDELAY_KEY				"MineDelay"
#define TCPSCAN_MINEUSETHREADS_KEY			"MineUseThreads"

#define TCPSCAN_MAX_HOSTENTRY_KEY			"MaxHostEntry"
#define TCPSCAN_MAX_PORTENTRY_KEY			"MaxPortEntry"
#define TCPSCAN_MAX_DATABASEENTRY_KEY		"MaxDatabaseEntry"

// Scanner
#define TCPSCAN_SCAN_HOST_COLSIZE_KEY		"ScanHostColumnSize"
#define TCPSCAN_SCAN_PORT_COLSIZE_KEY		"ScanPortColumnSize"
#define TCPSCAN_SCAN_DESC_COLSIZE_KEY		"ScanDescriptionColumnSize"

// Miner
#define TCPSCAN_MINE_URL_COLSIZE_KEY		"MineUrlColumnSize"
#define TCPSCAN_MINE_COMMENT_COLSIZE_KEY	"MineCommentColumnSize"
#define TCPSCAN_MINE_HTTP_COLSIZE_KEY		"MineHttpColumnSize"
#define TCPSCAN_MINE_DESC_COLSIZE_KEY		"MineDescriptionColumnSize"
#define TCPSCAN_MINE_DOCUMENT_COLSIZE_KEY	"MineDocumentColumnSize"

// Services
#define TCPSCAN_SERVICES_SERVICE_COLSIZE_KEY	"ServicesServiceColumnSize"
#define TCPSCAN_SERVICES_PORT_COLSIZE_KEY	"ServicesPortColumnSize"
#define TCPSCAN_SERVICES_PROTOCOL_COLSIZE_KEY "ServicesProtocolColumnSize"
#define TCPSCAN_SERVICES_COMMENT_COLSIZE_KEY	"ServicesCommentColumnSize"

class CTcpScanConfig : public CConfig
{
public:
	// costruttore/distruttore
	CTcpScanConfig() {CTcpScanConfig::Load();}
	~CTcpScanConfig() {CTcpScanConfig::Save();}
	
	// registro
	BOOL	CreateValue	(LPCSTR,LPCSTR,LPCSTR);				// crea la coppia nome/valore dentro la chiave specificata
	BOOL	DeleteValue	(LPCSTR,LPCSTR);					// elimina la coppia nome/valore dentro la chiave specificata
	void Save			(void) {CConfig::Save(TCPSCAN_KEY);}	// salva la lista sul registro
	void Load			(LPCSTR lpcszSectionName = NULL,BOOL bLoadDefaults = FALSE);							// carica la lista dla registro
	DWORD ReloadNumber	(LPCSTR,LPCSTR);					// ricarica il numero dal registro nella lista
	LPCSTR ReloadString	(LPCSTR,LPCSTR);					// ricarica la stringa dal registro nella lista

private:
	// registro
	void LoadNumber	(LPCSTR,DWORD&,DWORD);				// legge il numero dal registro creando la chiave se non esiste
	void LoadString	(LPCSTR,LPSTR,int,LPCSTR);			// legge la stringa dal registro creando la chiave se non esiste
	BOOL	ReadNumber	(LPCSTR,DWORD&);					// legge il numero dal registro (la chiave deve esistere)
	BOOL	ReadString	(LPCSTR,LPSTR,int);					// legge la stringa dal registro (la chiave deve esistere)
};

#endif // _TCPSCANCONFIG_H
