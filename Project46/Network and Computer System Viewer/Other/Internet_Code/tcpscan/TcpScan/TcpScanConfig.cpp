/*
	TcpScanConfig.cpp
	Luca Piergentili, 06/08/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "TcpScanConfig.h"

/*
	CreateValue()

	Crea la coppia nome/valore dentro la chiave specificata, es.:
	key   = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
	name  = "TcpScan"
	value = "C:\\TcpScan\\TcpScan.exe"
*/
BOOL CTcpScanConfig::CreateValue(LPCSTR lpcszKey,LPCSTR lpcszName,LPCSTR lpcszValue)
{
	BOOL flag = FALSE;

	CConfig::m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if(CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,lpcszKey)==ERROR_SUCCESS)
	{
		char name[REGKEY_MAX_KEY_NAME+1] = {0};
		DWORD namesize = sizeof(name)-1;

		if(CConfig::m_Registry->QueryValue(name,lpcszName,&namesize)!=ERROR_SUCCESS)
			flag = CConfig::m_Registry->SetValue(lpcszValue,lpcszName)==ERROR_SUCCESS;
		
		CConfig::m_Registry->Close();
	}
	
	CConfig::m_Registry->Detach();

	return(flag);
}


/*
	DeleteValue()

	Elimina la coppia nome/valore dentro la chiave specificata, es.:
	key   = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
	name  = "TcpScan"
	value = "C:\\TcpScan\\TcpScan.exe"
*/
BOOL CTcpScanConfig::DeleteValue(LPCSTR lpcszKey,LPCSTR lpcszName)
{
	BOOL flag = FALSE;

	CConfig::m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if(CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,lpcszKey)==ERROR_SUCCESS)
	{
		char name[REGKEY_MAX_KEY_NAME+1] = {0};
		DWORD namesize = sizeof(name)-1;

		if(CConfig::m_Registry->QueryValue(name,lpcszName,&namesize)==ERROR_SUCCESS)
			flag = CConfig::m_Registry->DeleteValue(lpcszName)==ERROR_SUCCESS;

		CConfig::m_Registry->Close();
	}
	
	CConfig::m_Registry->Detach();

	return(flag);
}

/*
	Load()

	Carica nella lista i valori di configurazione presenti nel registro.
*/
void CTcpScanConfig::Load(LPCSTR /*lpcszSectionName*//*=NULL*/,BOOL /*bLoadDefaults*//*=FALSE*/)
{
	LONG reg;
	char key[REGKEY_MAX_KEY_NAME+1];
	char value[REGKEY_MAX_KEY_VALUE+1];
	DWORD dword = 0;

	CConfig::m_Registry->Attach(HKEY_LOCAL_MACHINE);
	
	/*
		TcpScan
	*/
	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY))!=ERROR_SUCCESS)
		reg = CConfig::m_Registry->Create(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY);
	if(reg==ERROR_SUCCESS)
		CConfig::m_Registry->Close();

	/*
		TcpScan\\PathNames
	*/
	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_PATHNAMES_KEY))!=ERROR_SUCCESS)
		reg = CConfig::m_Registry->Create(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_PATHNAMES_KEY);
	if(reg==ERROR_SUCCESS)
	{
		// DefaultDir
		LoadString(TCPSCAN_DEFAULTDIR_KEY,value,sizeof(value),DEFAULT_DIR);
		CConfig::Insert(TCPSCAN_PATHNAMES_KEY,TCPSCAN_DEFAULTDIR_KEY,value);

		CConfig::m_Registry->Close();
	}

	/*
		TcpScan\\Scanner
	*/
	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_SCAN_KEY))!=ERROR_SUCCESS)
		reg = CConfig::m_Registry->Create(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_SCAN_KEY);
	if(reg==ERROR_SUCCESS)
	{
		// Host
		LoadString(TCPSCAN_HOST_KEY,value,sizeof(value),DEFAULT_HOST);
		CConfig::Insert(TCPSCAN_SCAN_KEY,TCPSCAN_HOST_KEY,value);

		// StartHost
		LoadString(TCPSCAN_SCANNING_STARTHOST_KEY,value,sizeof(value),DEFAULT_HOST);
		CConfig::Insert(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_STARTHOST_KEY,value);

		// EndHost
		LoadString(TCPSCAN_SCANNING_ENDHOST_KEY,value,sizeof(value),DEFAULT_HOST);
		CConfig::Insert(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_ENDHOST_KEY,value);

		// PortMode
		LoadNumber(TCPSCAN_SCANNING_PORTMODE_KEY,dword,DEFAULT_PORTMODE);
		CConfig::Insert(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTMODE_KEY,dword);

		// PortNumbers
		LoadString(TCPSCAN_SCANNING_PORTNUMBERS_KEY,value,sizeof(value),DEFAULT_PORTNUMBERS);
		CConfig::Insert(TCPSCAN_SCAN_KEY,TCPSCAN_SCANNING_PORTNUMBERS_KEY,value);

		CConfig::m_Registry->Close();
	}

	/*
		TcpScan\\Miner
	*/
	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_MINE_KEY))!=ERROR_SUCCESS)
		reg = CConfig::m_Registry->Create(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_MINE_KEY);
	if(reg==ERROR_SUCCESS)
	{
		int i;

		// Host
		LoadString(TCPSCAN_HOST_KEY,value,sizeof(value),DEFAULT_HOST);
		CConfig::Insert(TCPSCAN_MINE_KEY,TCPSCAN_HOST_KEY,value);

		// Port
		LoadNumber(TCPSCAN_PORT_KEY,dword,DEFAULT_PORT);
		CConfig::Insert(TCPSCAN_MINE_KEY,TCPSCAN_PORT_KEY,dword);

		// Url[0...n]
		for(i = 0;; i++)
		{
			wsprintf(key,"%s%d",TCPSCAN_URL_KEY,i);
			if(ReadString(key,value,sizeof(value)))
				CConfig::Insert(TCPSCAN_MINE_KEY,key,value);
			else
				break;
		}

		// Pathname
		LoadString(TCPSCAN_MINE_PATH_KEY,value,sizeof(value),DEFAULT_MINE_PATH);
		CConfig::Insert(TCPSCAN_MINE_KEY,TCPSCAN_MINE_PATH_KEY,value);

		// Browser
		LoadString(TCPSCAN_MINE_BROWSER_KEY,value,sizeof(value),DEFAULT_MINE_BROWSER);
		if(strcmp(value,"")==0)
		{
			memset(value,'\0',sizeof(value));
			DWORD valuesize = sizeof(value)-1;
			CRegKey regkey;
			LONG reg;

			// ricava il pathname per l'eseguibile dal registro
			regkey.Attach(HKEY_LOCAL_MACHINE);
			
			if((reg = regkey.Open(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\Netscape.exe"))!=ERROR_SUCCESS)
				reg = regkey.Open(HKEY_LOCAL_MACHINE,"SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\IExplore.exe");

			if(reg==ERROR_SUCCESS)
			{
				regkey.QueryValue(value,"",&valuesize);
				regkey.Close();
			}
			else
				memset(value,'\0',sizeof(value));
			
			regkey.Detach();
		}
		CConfig::Insert(TCPSCAN_MINE_KEY,TCPSCAN_MINE_BROWSER_KEY,value);


		CConfig::m_Registry->Close();
	}

	/*
		TcpScan\\Connect
	*/
	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_CONNECT_KEY))!=ERROR_SUCCESS)
		reg = CConfig::m_Registry->Create(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_CONNECT_KEY);
	if(reg==ERROR_SUCCESS)
	{
		int i;

		// Host
		LoadString(TCPSCAN_HOST_KEY,value,sizeof(value),DEFAULT_HOST);
		CConfig::Insert(TCPSCAN_CONNECT_KEY,TCPSCAN_HOST_KEY,value);

		// Addr[0...n]
		for(i = 0;; i++)
		{
			wsprintf(key,"%s%d",TCPSCAN_HOSTADDR_KEY,i);
			if(ReadString(key,value,sizeof(value)))
				CConfig::Insert(TCPSCAN_CONNECT_KEY,key,value);
			else
				break;
		}

		// Port
		LoadNumber(TCPSCAN_PORT_KEY,dword,DEFAULT_PORT);
		CConfig::Insert(TCPSCAN_CONNECT_KEY,TCPSCAN_PORT_KEY,dword);

		// Number[0...n]
		for(i = 0;; i++)
		{
			wsprintf(key,"%s%d",TCPSCAN_PORTNUMBER_KEY,i);
			if(ReadNumber(key,dword))
				CConfig::Insert(TCPSCAN_CONNECT_KEY,key,dword);
			else
				break;
		}

		CConfig::m_Registry->Close();
	}

	/*
		TcpScan\\Services
	*/
	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_SERVICES_KEY))!=ERROR_SUCCESS)
		reg = CConfig::m_Registry->Create(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_SERVICES_KEY);
	if(reg==ERROR_SUCCESS)
	{
		int i;

		// Database
		LoadString(TCPSCAN_DATABASE_KEY,value,sizeof(value),DEFAULT_DATABASE);
		CConfig::Insert(TCPSCAN_SERVICES_KEY,TCPSCAN_DATABASE_KEY,value);

		// File[0...n]
		for(i = 0;; i++)
		{
			wsprintf(key,"%s%d",TCPSCAN_DATABASEFILE_KEY,i);
			if(ReadString(key,value,sizeof(value)))
				CConfig::Insert(TCPSCAN_SERVICES_KEY,key,value);
			else
				break;
		}

		// Tot
		LoadNumber(TCPSCAN_TOTSERVICES_KEY,dword,DEFAULT_TOTSERVICES);
		CConfig::Insert(TCPSCAN_SERVICES_KEY,TCPSCAN_TOTSERVICES_KEY,dword);

		// Service[0...n]
		for(i = 0; i < (int)dword; i++)
		{
			wsprintf(key,"%s%d",TCPSCAN_SERVICENAME_KEY,i);
			if(ReadString(key,value,sizeof(value)))
				CConfig::Insert(TCPSCAN_SERVICES_KEY,key,value);
			else
				break;
		}

		CConfig::m_Registry->Close();
	}

	/*
		TcpScan\\Options
	*/
	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_OPTIONS_KEY))!=ERROR_SUCCESS)
		reg = CConfig::m_Registry->Create(HKEY_LOCAL_MACHINE,DEFAULT_TCPSCAN_KEY"\\"TCPSCAN_OPTIONS_KEY);
	if(reg==ERROR_SUCCESS)
	{
		// Log
		LoadString(TCPSCAN_LOG_KEY,value,sizeof(value),DEFAULT_LOG);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_LOG_KEY,value);

		// SessionLog
		LoadNumber(TCPSCAN_SESSIONLOG_KEY,dword,DEFAULT_SESSIONLOG);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SESSIONLOG_KEY,dword);

		// ShowOnlyValidConnections
		LoadNumber(TCPSCAN_SHOWCONN_KEY,dword,DEFAULT_SHOWCONN);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SHOWCONN_KEY,dword);

		// ScanDelay
		LoadNumber(TCPSCAN_SCANDELAY_KEY,dword,DEFAULT_SCANDELAY);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCANDELAY_KEY,dword);

		// MineDelay
		LoadNumber(TCPSCAN_MINEDELAY_KEY,dword,DEFAULT_MINEDELAY);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MINEDELAY_KEY,dword);

		// MineUseThreads
		LoadNumber(TCPSCAN_MINEUSETHREADS_KEY,dword,DEFAULT_MINEUSETHREADS);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MINEUSETHREADS_KEY,dword);

		// MaxHostEntry
		LoadNumber(TCPSCAN_MAX_HOSTENTRY_KEY,dword,DEFAULT_MAX_HOSTENTRY);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MAX_HOSTENTRY_KEY,dword);

		// MaxPortEntry
		LoadNumber(TCPSCAN_MAX_PORTENTRY_KEY,dword,DEFAULT_MAX_PORTENTRY);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MAX_PORTENTRY_KEY,dword);

		// MaxDatabaseEntry
		LoadNumber(TCPSCAN_MAX_DATABASEENTRY_KEY,dword,DEFAULT_MAX_DATABASEENTRY);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MAX_DATABASEENTRY_KEY,dword);

		// ScanHostColumnSize
		LoadNumber(TCPSCAN_SCAN_HOST_COLSIZE_KEY,dword,DEFAULT_SCAN_HOST_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_HOST_COLSIZE_KEY,dword);

		// ScanPortColumnSize
		LoadNumber(TCPSCAN_SCAN_PORT_COLSIZE_KEY,dword,DEFAULT_SCAN_PORT_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_PORT_COLSIZE_KEY,dword);

		// ScanDescriptionColumnSize
		LoadNumber(TCPSCAN_SCAN_DESC_COLSIZE_KEY,dword,DEFAULT_SCAN_DESC_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SCAN_DESC_COLSIZE_KEY,dword);

		// MineUrlColumnSize
		LoadNumber(TCPSCAN_MINE_URL_COLSIZE_KEY,dword,DEFAULT_MINE_URL_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MINE_URL_COLSIZE_KEY,dword);

		// MineCommentColumnSize
		LoadNumber(TCPSCAN_MINE_COMMENT_COLSIZE_KEY,dword,DEFAULT_MINE_COMMENT_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MINE_COMMENT_COLSIZE_KEY,dword);

		// MineHttpColumnSize
		LoadNumber(TCPSCAN_MINE_HTTP_COLSIZE_KEY,dword,DEFAULT_MINE_HTTP_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MINE_HTTP_COLSIZE_KEY,dword);

		// MineDescriptionColumnSize
		LoadNumber(TCPSCAN_MINE_DESC_COLSIZE_KEY,dword,DEFAULT_MINE_DESC_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MINE_DESC_COLSIZE_KEY,dword);

		// MineDocumentColumnSize
		LoadNumber(TCPSCAN_MINE_DOCUMENT_COLSIZE_KEY,dword,DEFAULT_MINE_DOCUMENT_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_MINE_DOCUMENT_COLSIZE_KEY,dword);

		// ServicesServiceColumnSize
		LoadNumber(TCPSCAN_SERVICES_SERVICE_COLSIZE_KEY,dword,DEFAULT_SERVICES_SERVICE_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_SERVICE_COLSIZE_KEY,dword);

		// ServicesPortColumnSize
		LoadNumber(TCPSCAN_SERVICES_PORT_COLSIZE_KEY,dword,DEFAULT_SERVICES_PORT_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_PORT_COLSIZE_KEY,dword);

		// ServicesProtocolColumnSize
		LoadNumber(TCPSCAN_SERVICES_PROTOCOL_COLSIZE_KEY,dword,DEFAULT_SERVICES_PROTOCOL_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_PROTOCOL_COLSIZE_KEY,dword);

		// ServicesCommentColumnSize
		LoadNumber(TCPSCAN_SERVICES_COMMENT_COLSIZE_KEY,dword,DEFAULT_SERVICES_COMMENT_COLSIZE);
		CConfig::Insert(TCPSCAN_OPTIONS_KEY,TCPSCAN_SERVICES_COMMENT_COLSIZE_KEY,dword);

		CConfig::m_Registry->Close();
	}

	CConfig::m_Registry->Detach();
}

/*
	LoadNumber()

	Ricava dal registro il valore numerico associato alla chiave, creandola con il valore di default
	se non esiste.
*/
void CTcpScanConfig::LoadNumber(LPCSTR key,DWORD& value,DWORD defaultvalue)
{
	value = 0L;

	if(CConfig::m_Registry->QueryValue(value,key)!=ERROR_SUCCESS)
	{
		value = defaultvalue;
		CConfig::m_Registry->SetValue(value,key);
	}
}

/*
	LoadString()

	Ricava dal registro il valore stringa associato alla chiave, creandola con il valore di default
	se non esiste.
*/
void CTcpScanConfig::LoadString(LPCSTR key,LPSTR value,int size,LPCSTR defaultvalue)
{
	memset(value,'\0',size);
	DWORD valuesize = size-1;

	if(CConfig::m_Registry->QueryValue(value,key,&valuesize)!=ERROR_SUCCESS)
	{
		strcpyn(value,defaultvalue,size);
		CConfig::m_Registry->SetValue(value,key);
	}
}

/*
	ReadString()

	Ricava dal registro il valore stringa associato alla chiave.
*/
BOOL CTcpScanConfig::ReadString(LPCSTR key,LPSTR value,int size)
{
	memset(value,'\0',size);
	DWORD valuesize = size-1;

	return(CConfig::m_Registry->QueryValue(value,key,&valuesize)==ERROR_SUCCESS);
}

/*
	ReadNumber()

	Ricava dal registro il valore numerico associato alla chiave.
*/
BOOL CTcpScanConfig::ReadNumber(LPCSTR key,DWORD& value)
{
	value = 0L;

	return(CConfig::m_Registry->QueryValue(value,key)==ERROR_SUCCESS);
}

/*
	ReloadNumber()

	Ricarica dal registro il valore numerico associato alla chiave, aggiornando l'elemento
	corrispondente della lista.
*/
DWORD CTcpScanConfig::ReloadNumber(LPCSTR section,LPCSTR name)
{
	char key[REGKEY_MAX_KEY_NAME+1];
	DWORD value = 0;
	LONG reg;

	wsprintf(key,"%s\\%s",DEFAULT_TCPSCAN_KEY,section);

	CConfig::m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,key))==ERROR_SUCCESS)
	{
		LoadNumber(name,value,0);
		value = CConfig::UpdateNumber(section,name,value);
		CConfig::m_Registry->Close();
	}

	CConfig::m_Registry->Detach();

	return(value);
}

/*
	ReloadString()

	Ricarica dal registro il valore stringa associato alla chiave, aggiornando l'elemento
	corrispondente della lista.
*/
LPCSTR CTcpScanConfig::ReloadString(LPCSTR section,LPCSTR name)
{
	char key[REGKEY_MAX_KEY_NAME+1];
	static char value[REGKEY_MAX_KEY_VALUE+1];
	LONG reg;

	wsprintf(key,"%s\\%s",DEFAULT_TCPSCAN_KEY,section);
	memset(value,'\0',sizeof(value));

	CConfig::m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,key))==ERROR_SUCCESS)
	{
		LoadString(name,value,sizeof(value),0);
		strcpyn(value,(char*)CConfig::UpdateString(section,name,value),sizeof(value)-1);
		CConfig::m_Registry->Close();
	}

	CConfig::m_Registry->Detach();

	return(value);
}
