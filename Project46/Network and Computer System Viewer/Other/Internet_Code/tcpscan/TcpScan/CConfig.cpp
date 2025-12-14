/*
	CConfig.cpp
	Classe base per la gestione della configurazione tramite il registro (SDK).
	Luca Piergentili, 14/07/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "strcpyn.h"
#include "window.h"
#include "CConfig.h"
#include "CNodeList.h"
#include "CRegKey.h"

/*
	CConfig()
*/
CConfig::CConfig()
{
	m_Config = new CConfigList();
	m_Registry = new CRegKey();
	SetModified(FALSE);
}

/*
	~CConfig()
*/
CConfig::~CConfig()
{
	if(m_Config)
		delete m_Config,m_Config = NULL;
	if(m_Registry)
		delete m_Registry,m_Registry = NULL;
}

/*
	Insert()

	Inserisce nella lista il valore (stringa) per la sezione/chiave specificati.

	LPCSTR	lpcszSectionName	nome sezione
	LPCSTR	lpcszKeyName		nome chiave
	LPCSTR	lpcszKeyValue		valore chiave (stringa)
*/
BOOL CConfig::Insert(LPCSTR lpcszSectionName,LPCSTR lpcszKeyName,LPCSTR lpcszKeyValue)
{
	BOOL bInserted = FALSE;

	if(m_Config)
	{
		CONFIG* c = new CONFIG();
		if(c)
		{
			c->Init(lpcszSectionName,lpcszKeyName,lpcszKeyValue);
			m_Config->Add(c);
			SetModified(TRUE);
			bInserted = TRUE;
		}
	}

	return(bInserted);
}

/*
	Insert()

	Inserisce nella lista il valore (numerico) per la sezione/chiave specificati.

	LPCSTR	lpcszSectionName	nome sezione
	LPCSTR	lpcszKeyName		nome chiave
	LPCSTR	lpcszKeyValue		valore chiave (numero)
*/
BOOL CConfig::Insert(LPCSTR lpcszSectionName,LPCSTR lpcszKeyName,DWORD dwKeyValue)
{
	BOOL bInserted = FALSE;

	if(m_Config)
	{
		CONFIG* c = new CONFIG();
		if(c)
		{
			c->Init(lpcszSectionName,lpcszKeyName,dwKeyValue);
			m_Config->Add(c);
			SetModified(TRUE);
			bInserted = TRUE;
		}
	}

	return(bInserted);
}

/*
	Delete()

	Elimina della lista il valore relativo alla coppia sezione/chiave.
	Non elimina fisicamente l'elemento ma si limita a marcarlo in modo tale che quando la lista
	viene salvata sul registro si possano individuare le chiavi da eliminare fisicamente.

	LPCSTR	lpcszSectionName	nome sezione
	LPCSTR	lpcszKeyName		nome chiave
*/
BOOL CConfig::Delete(LPCSTR lpcszSectionName,LPCSTR lpcszKeyName)
{
	BOOL bDeleted = FALSE;
	CONFIG* c;
	ITERATOR iter;

	// scorre la lista cercando l'entrata relativa alla coppia sezione/chiave
	if((iter = m_Config->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			c = (CONFIG*)iter->data;
			if(c)
				if(strcmp(lpcszSectionName,c->GetSection())==0)
				{
					if(strcmp(lpcszKeyName,c->GetName())==0)
					{
						// marca l'elemento per l'eliminazione
						c->SetType(NULL_TYPE);
						SetModified(TRUE);
						bDeleted = TRUE;
						break;
					}
				}

			iter = m_Config->Next(iter);
		}

	return(bDeleted);
}

/*
	DeleteAll()

	Elimina della lista tutti i valori, rimuovendoli anche dal registro.
*/
BOOL CConfig::DeleteAll(LPCSTR lpcszRootKey)
{
	BOOL bDeleted = TRUE;
	CONFIG* c;
	ITERATOR iter;
	char szKey[REGKEY_MAX_KEY_VALUE+1];

	if(m_Registry)
	{
		m_Registry->Attach(HKEY_LOCAL_MACHINE);

		if((iter = m_Config->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				c = (CONFIG*)iter->data;
				if(c)
				{
					_snprintf(szKey,sizeof(szKey)-1,DEFAULT_REG_KEY"\\%s\\%s",lpcszRootKey,c->GetSection());
					if(m_Registry->Open(HKEY_LOCAL_MACHINE,szKey)==ERROR_SUCCESS)
					{
						m_Registry->DeleteValue(c->GetName());
						m_Registry->Close();
					}
				}

				iter = m_Config->Next(iter);
			}

		m_Registry->Detach();
	
		SetModified(TRUE);
	}

	m_Config->DeleteAll();

	return(bDeleted);
}

/*
	ReloadString()

	Ricarica dal registro il valore stringa associato alla chiave, aggiornando l'elemento
	corrispondente della lista.
*/
LPCSTR CConfig::ReloadString(LPCSTR lpcszRootKey,LPCSTR section,LPCSTR name,LPCSTR defaultvalue/*=NULL*/)
{
	char key[_MAX_PATH+1];
	static char value[_MAX_PATH+1];
	LONG reg;

	memset(key,'\0',sizeof(key));
	_snprintf(key,sizeof(key)-1,"%s\\%s",lpcszRootKey,section);
	memset(value,'\0',sizeof(value));

	m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if((reg = m_Registry->Open(HKEY_LOCAL_MACHINE,key))==ERROR_SUCCESS)
	{
		memset(value,'\0',sizeof(value));
		DWORD valuesize = sizeof(value);
		if(m_Registry->QueryValue(value,name,&valuesize)!=ERROR_SUCCESS)
		{
			if(defaultvalue)
				strcpyn(value,defaultvalue,sizeof(value));
			else
				memset(value,'\0',sizeof(value));
			m_Registry->SetValue(value,name);
		}

		strcpyn(value,(char*)UpdateString(section,name,value),sizeof(value));
		
		m_Registry->Close();
	}

	m_Registry->Detach();

	return(value);
}

/*
	ReloadNumber()

	Ricarica dal registro il valore numerico associato alla chiave, aggiornando l'elemento
	corrispondente della lista.
*/
DWORD CConfig::ReloadNumber(LPCSTR lpcszRootKey,LPCSTR section,LPCSTR name,DWORD defaultvalue/*=0L*/)
{
	char key[_MAX_PATH+1];
	DWORD value = 0;
	LONG reg;

	memset(key,'\0',sizeof(key));
	_snprintf(key,sizeof(key)-1,"%s\\%s",lpcszRootKey,section);

	m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if((reg = CConfig::m_Registry->Open(HKEY_LOCAL_MACHINE,key))==ERROR_SUCCESS)
	{
		if(m_Registry->QueryValue(value,name)!=ERROR_SUCCESS)
		{
			value = defaultvalue;
			m_Registry->SetValue(value,name);
		}

		value = UpdateNumber(section,name,value);

		m_Registry->Close();
	}

	m_Registry->Detach();

	return(value);
}

/*
	String()

	Restituisce o aggiorna il valore (stringa) associato alla sezione/chiave a seconda del parametro
	associato al valore (NULL/-1 recupera, in caso contrario aggiorna).

	LPCSTR	lpcszSectionName	nome sezione
	LPCSTR	lpcszKeyName		nome chiave
	LPCSTR	lpcszKeyValue		valore chiave (stringa)
*/
LPCSTR CConfig::String(LPCSTR lpcszSectionName,LPCSTR lpcszKeyName,LPCSTR lpcszKeyValue/*=NULL*/)
{
	static char* p;
	CONFIG* c;
	ITERATOR iter;

	p = "";

	// scorre la lista cercando l'entrata relativa alla coppia sezione/chiave
	if((iter = m_Config->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			c = (CONFIG*)iter->data;
			if(c)
				if(strcmp(lpcszSectionName,c->GetSection())==0)
				{
					if(strcmp(lpcszKeyName,c->GetName())==0)
					{
						// salta i valori marcati per l'eliminazione (NULL_TYPE)
						if(c->GetType()!=NULL_TYPE)
						{
							if(lpcszKeyValue!=NULL)
							{
								// aggiorna il valore
								c->SetValue(lpcszKeyValue);
								p = (char*)c->GetValue(p);
								break;
							}
							else
							{
								// ricava il valore
								p = (char*)c->GetValue(p);
								if(!*p)
									p = "";
								break;
							}
						}
					}
				}

			iter = m_Config->Next(iter);
		}

	return(p);
}

/*
	Number()

	Restituisce o aggiorna il valore (numerico) associato alla sezione/nome a seconda del parametro
	associato al valore (NULL/-1 recupera, in caso contrario aggiorna).

	LPCSTR	lpcszSectionName	nome sezione
	LPCSTR	lpcszKeyName		nome chiave
	LPCSTR	lpcszKeyValue		valore chiave (numero)
*/
DWORD CConfig::Number(LPCSTR lpcszSectionName,LPCSTR lpcszKeyName,DWORD dwKeyValue/*=(DWORD)-1L*/)
{
	DWORD l = (DWORD)-1L;
	CONFIG* c;
	ITERATOR iter;

	// scorre la lista cercando l'entrata relativa alla coppia sezione/chiave
	if((iter = m_Config->First())!=(ITERATOR)NULL)
		while(iter!=(ITERATOR)NULL)
		{
			c = (CONFIG*)iter->data;
			if(c)
				if(strcmp(lpcszSectionName,c->GetSection())==0)
				{
					if(strcmp(lpcszKeyName,c->GetName())==0)
					{
						// salta i valori marcati per l'eliminazione (NULL_TYPE)
						if(c->GetType()!=NULL_TYPE)
						{
							if(dwKeyValue!=(DWORD)-1L)
							{
								// aggiorna il valore
								c->SetValue(dwKeyValue);
								l = c->GetValue(l);
								break;
							}
							else
							{
								// ricava il valore
								l = c->GetValue(l);
								break;
							}
						}
					}
				}

			iter = m_Config->Next(iter);
		}

	return(l);
}

/*
	Save()

	Salva nel registro i valori presenti nella lista.

	LPCSTR	lpcszRootKey	nome della chiave base
*/
void CConfig::Save(LPCSTR lpcszRootKey)
{
	CONFIG* c;
	ITERATOR iter;
	LONG lRet;
	char szKey[REGKEY_MAX_KEY_VALUE+1];
	memset(szKey,'\0',sizeof(szKey));

	if(m_Registry)
	{
		m_Registry->Attach(HKEY_LOCAL_MACHINE);

		// elimina (dalla lista e dal registro) le chiavi marcate per la cancellazione
		if((iter = m_Config->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				c = (CONFIG*)iter->data;
				if(c)
					// chiave da eliminare
					if(c->GetType()==NULL_TYPE)
					{
						// elimina la chiave dal registro
						_snprintf(szKey,sizeof(szKey)-1,DEFAULT_REG_KEY"\\%s\\%s",lpcszRootKey,c->GetSection());
						if(m_Registry->Open(HKEY_LOCAL_MACHINE,szKey)==ERROR_SUCCESS)
						{
							m_Registry->DeleteValue(c->GetName());
							m_Registry->Close();
						}

						// elimina la chiave dalla lista
						m_Config->Delete(iter);
					}

				iter = m_Config->Next(iter);
			}

		// salva nel registro le chiavi presenti nella lista
		if((iter = m_Config->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				c = (CONFIG*)iter->data;
				if(c)
					// non inserisce nel registro le chiavi eliminate
					if(c->GetType()!=NULL_TYPE)
					{
						_snprintf(szKey,sizeof(szKey)-1,DEFAULT_REG_KEY"\\%s\\%s",lpcszRootKey,c->GetSection());

						if((lRet = m_Registry->Open(HKEY_LOCAL_MACHINE,szKey))!=ERROR_SUCCESS)
							lRet = m_Registry->Create(HKEY_LOCAL_MACHINE,szKey);
						if(lRet==ERROR_SUCCESS)
						{
							if(c->GetType()==LPSTR_TYPE)
								m_Registry->SetValue(c->GetValue((LPCSTR)NULL),c->GetName());
							else if(c->GetType()==DWORD_TYPE)
								m_Registry->SetValue(c->GetValue((DWORD)0L),c->GetName());
							
							m_Registry->Close();
						}
					}

				iter = m_Config->Next(iter);
			}

		m_Registry->Detach();
	
		SetModified(FALSE);
	}
}

/*
	SaveKey()

	Salva nel registro il valori della chiave presente nella lista.

	LPCSTR	lpcszRootKey		nome della chiave base
	LPCSTR	lpcszSectionKey	nome della sezione
	LPCSTR	lpcszNameKey		nome della chiave
*/
void CConfig::SaveKey(LPCSTR lpcszRootKey,LPCSTR lpcszSectionKey,LPCSTR lpcszNameKey)
{
	CONFIG* c;
	ITERATOR iter;
	LONG lRet;
	char szKey[REGKEY_MAX_KEY_VALUE+1];

	if(m_Registry)
	{
		m_Registry->Attach(HKEY_LOCAL_MACHINE);

		// scorre la lista aggiornando la chiave
		if((iter = m_Config->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				c = (CONFIG*)iter->data;
				if(c)
					// non inserisce nel registro le chiavi eliminate
					if(c->GetType()!=NULL_TYPE && strcmp(c->GetSection(),lpcszSectionKey)==0 && strcmp(c->GetName(),lpcszNameKey)==0)
					{
						// salva la chiave nel registro
						_snprintf(szKey,sizeof(szKey)-1,DEFAULT_REG_KEY"\\%s\\%s",lpcszRootKey,lpcszSectionKey);

						if((lRet = m_Registry->Open(HKEY_LOCAL_MACHINE,szKey))!=ERROR_SUCCESS)
							lRet = m_Registry->Create(HKEY_LOCAL_MACHINE,szKey);
						if(lRet==ERROR_SUCCESS)
						{
							if(c->GetType()==LPSTR_TYPE)
								m_Registry->SetValue(c->GetValue((LPCSTR)NULL),lpcszNameKey);
							else if(c->GetType()==DWORD_TYPE)
								m_Registry->SetValue(c->GetValue((DWORD)0L),lpcszNameKey);
							
							m_Registry->Close();
						}
					}

				iter = m_Config->Next(iter);
			}

		m_Registry->Detach();
	}
}

/*
	SaveSection()

	Salva nel registro i valori presenti nella lista relativi alla sezione.

	LPCSTR	lpcszRootKey		nome della chiave base
	LPCSTR	lpcszSectionKey	nome della sezione
*/
void CConfig::SaveSection(LPCSTR lpcszRootKey,LPCSTR lpcszSectionKey)
{
	CONFIG* c;
	ITERATOR iter;
	LONG lRet;
	char szKey[REGKEY_MAX_KEY_VALUE+1];

	if(m_Registry)
	{
		m_Registry->Attach(HKEY_LOCAL_MACHINE);

		// scorre la lista aggiornando la sezione
		if((iter = m_Config->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				c = (CONFIG*)iter->data;
				if(c)
					// non inserisce nel registro le chiavi eliminate
					if(c->GetType()!=NULL_TYPE && strcmp(c->GetSection(),lpcszSectionKey)==0)
					{
						// salva la chiave nel registro
						_snprintf(szKey,sizeof(szKey)-1,DEFAULT_REG_KEY"\\%s\\%s",lpcszRootKey,c->GetSection());

						if((lRet = m_Registry->Open(HKEY_LOCAL_MACHINE,szKey))!=ERROR_SUCCESS)
							lRet = m_Registry->Create(HKEY_LOCAL_MACHINE,szKey);
						if(lRet==ERROR_SUCCESS)
						{
							if(c->GetType()==LPSTR_TYPE)
								m_Registry->SetValue(c->GetValue((LPCSTR)NULL),c->GetName());
							else if(c->GetType()==DWORD_TYPE)
								m_Registry->SetValue(c->GetValue((DWORD)0L),c->GetName());
							
							m_Registry->Close();
						}
					}

				iter = m_Config->Next(iter);
			}

		m_Registry->Detach();
	}
}

/*
	DeleteSection()

	Elimina dal registro (e dalla lista) i valori presenti nella lista relativi alla sezione.

	LPCSTR	lpcszRootKey		nome della chiave base
	LPCSTR	lpcszSectionKey	nome della sezione
	BOOL		bDeleteFromRegistry	flag per eliminazione delle chiavi dal registro
*/
void CConfig::DeleteSection(LPCSTR lpcszRootKey,LPCSTR lpcszSectionKey,BOOL bDeleteFromRegistry/*=FALSE*/)
{
	CONFIG* c;
	ITERATOR iter;
	char szKey[REGKEY_MAX_KEY_VALUE+1];

	if(m_Registry)
	{
		m_Registry->Attach(HKEY_LOCAL_MACHINE);

		// elimina (dalla lista e dal registro) le chiavi relative alla sezione
		if((iter = m_Config->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				c = (CONFIG*)iter->data;
				if(c)
					// chiave da eliminare
					if(c->GetType()!=NULL_TYPE && strcmp(c->GetSection(),lpcszSectionKey)==0)
					{
						// elimina la chiave dal registro
						if(bDeleteFromRegistry)
						{
							_snprintf(szKey,sizeof(szKey)-1,DEFAULT_REG_KEY"\\%s\\%s",lpcszRootKey,c->GetSection());
							if(m_Registry->Open(HKEY_LOCAL_MACHINE,szKey)==ERROR_SUCCESS)
							{
								m_Registry->DeleteValue(c->GetName());
								m_Registry->Close();
							}
						}

						// elimina la chiave dalla lista
						//m_Config->Delete(iter);
						//$ eliminando l'elemento della lista (iter) e non la chiave (marcandola come
						// cancellata) i salvataggi successivi non possono eliminare dal registro le
						// serie di chiavi come Key[0]...Key[n]
						Delete(c->GetSection(),c->GetName());
					}

				iter = m_Config->Next(iter);
			}

		m_Registry->Detach();
	
		SetModified(TRUE);
	}
}

/*
	Export()
*/
BOOL	CConfig::Export(LPCSTR /*lpcszRootKey*/,LPCSTR lpcszFileName)
{
	BOOL bSaved = FALSE;
	FILE* fp;

	if((fp = fopen(lpcszFileName,"w"))!=(FILE*)NULL)
	{
		CONFIG* c;
		ITERATOR iter;

		fprintf(fp,"[%s]\n","Configuration File");

		// salva nel file le chiavi presenti nella lista
		if((iter = m_Config->First())!=(ITERATOR)NULL)
			while(iter!=(ITERATOR)NULL)
			{
				c = (CONFIG*)iter->data;
				if(c)
					// non inserisce le chiavi eliminate
					if(c->GetType()!=NULL_TYPE)
					{
						if(c->GetType()==LPSTR_TYPE)
							fprintf(fp,"%s;%s;%s;%s\n",c->GetSection(),c->GetName(),c->GetValue((LPCSTR)NULL),"SZ");
						else if(c->GetType()==DWORD_TYPE)
							fprintf(fp,"%s;%s;%ld;%s\n",c->GetSection(),c->GetName(),c->GetValue((DWORD)0L),"DW");
					}

				iter = m_Config->Next(iter);
			}

		fclose(fp);
		
		bSaved = TRUE;
	}

	return(bSaved);
}

/*
	Import()
*/
BOOL	CConfig::Import(LPCSTR lpcszRootKey,LPCSTR lpcszFileName)
{
	BOOL bLoaded = FALSE;
	FILE* fp;

	if((fp = fopen(lpcszFileName,"r"))!=(FILE*)NULL)
	{
		char* p;
		char szBuffer[REGKEY_MAX_SECTION_NAME+REGKEY_MAX_KEY_NAME+REGKEY_MAX_KEY_VALUE+16];
		char szSection[REGKEY_MAX_SECTION_NAME+1];
		char szName[REGKEY_MAX_KEY_NAME+1];
		char szValue[REGKEY_MAX_KEY_VALUE+1];
		char szType[5];

		// legge la prima linea controllando se si tratta di un file di configurazione
		fgets(szBuffer,sizeof(szBuffer)-1,fp);
		if((p = strchr(szBuffer,'\r'))==NULL)
			p = strchr(szBuffer,'\n');
		if(p)
			*p = '\0';
		if(strcmp(szBuffer,"[Configuration File]")!=0)
		{
			fclose(fp);
			return(bLoaded);
		}

		// legge il file di configurazione per linee
		while(fgets(szBuffer,sizeof(szBuffer)-1,fp))
		{
			if((p = strchr(szBuffer,'\r'))==NULL)
				p = strchr(szBuffer,'\n');
			if(p)
				*p = '\0';
			
			// estrae i valori dalla linea (sezione, chiave, valore, tipo)
			memset(szSection,'\0',sizeof(szSection));
			memset(szName,'\0',sizeof(szName));
			memset(szValue,'\0',sizeof(szValue));
			memset(szType,'\0',sizeof(szType));

			p = strrchr(szBuffer,';');
			if(p)
			{
				strcpyn(szType,p+1,sizeof(szType));
				*p = '\0';
			}
			p = strrchr(szBuffer,';');
			if(p)
			{
				strcpyn(szValue,p+1,sizeof(szValue));
				*p = '\0';
			}
			p = strrchr(szBuffer,';');
			if(p)
			{
				strcpyn(szName,p+1,sizeof(szName));
				*p = '\0';
			}
			p = szBuffer;
			if(p)
				strcpyn(szSection,p,sizeof(szSection));

			if(szSection[0]!='\0' && szName[0]!='\0' && szValue[0]!='\0' && szType[0]!='\0')
			{
				if(strcmp(szType,"SZ")==0)
				{
					if(strcmp(UpdateString(szSection,szName,szValue),"")==0)
					{
						CONFIG* c = new CONFIG();
						if(c)
						{
							c->Init(szSection,szName,szValue);
							m_Config->Add(c);
						}
					}
				}
				else if(strcmp(szType,"DW")==0)
				{
					if(UpdateNumber(szSection,szName,atol(szValue))==(DWORD)-1)
					{
						CONFIG* c = new CONFIG();
						if(c)
						{
							c->Init(szSection,szName,atol(szValue));
							m_Config->Add(c);
						}
					}
				}
			}
		}

		fclose(fp);
		
		Save(lpcszRootKey);
		
		bLoaded = TRUE;
	}

	return(bLoaded);
}

/*
	RegistryCreateValue()

	Crea la coppia nome/valore dentro la chiave specificata, es.:
	key   = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
	name  = "WallPaper"
	value = "C:\\WallPaper\\WallPaper.exe"
*/
BOOL CConfig::RegistryCreateValue(LPCSTR lpcszKey,LPCSTR lpcszName,LPCSTR lpcszValue)
{
	BOOL flag = FALSE;

	m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if(m_Registry->Open(HKEY_LOCAL_MACHINE,lpcszKey)==ERROR_SUCCESS)
	{
		char name[_MAX_PATH+1];
		DWORD namesize = sizeof(name);

		if(m_Registry->QueryValue(name,lpcszName,&namesize)!=ERROR_SUCCESS)
			flag = m_Registry->SetValue(lpcszValue,lpcszName)==ERROR_SUCCESS;
		
		m_Registry->Close();
	}
	
	m_Registry->Detach();

	return(flag);
}

/*
	RegistryCreateValue()

	Crea la coppia nome/valore dentro la chiave specificata, es.:
	key   = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
	name  = "WallPaper"
	value = "C:\\WallPaper\\WallPaper.exe"
*/
BOOL CConfig::RegistryCreateValue(LPCSTR lpcszKey,LPCSTR lpcszName,DWORD dwValue)
{
	BOOL flag = FALSE;

	m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if(m_Registry->Open(HKEY_LOCAL_MACHINE,lpcszKey)==ERROR_SUCCESS)
	{
		if(m_Registry->QueryValue(dwValue,lpcszName)!=ERROR_SUCCESS)
			flag = m_Registry->SetValue(dwValue,lpcszName)==ERROR_SUCCESS;
		
		m_Registry->Close();
	}
	
	m_Registry->Detach();

	return(flag);
}

/*
	RegistryDeleteValue()

	Elimina la coppia nome/valore dentro la chiave specificata, es.:
	key   = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Run"
	name  = "WallPaper"
	value = "C:\\WallPaper\\WallPaper.exe"
*/
BOOL CConfig::RegistryDeleteValue(LPCSTR lpcszKey,LPCSTR lpcszName)
{
	BOOL flag = FALSE;

	m_Registry->Attach(HKEY_LOCAL_MACHINE);

	if(m_Registry->Open(HKEY_LOCAL_MACHINE,lpcszKey)==ERROR_SUCCESS)
	{
		char name[_MAX_PATH+1];
		DWORD namesize = sizeof(name);

		if(m_Registry->QueryValue(name,lpcszName,&namesize)==ERROR_SUCCESS)
			flag = m_Registry->DeleteValue(lpcszName)==ERROR_SUCCESS;

		m_Registry->Close();
	}
	
	m_Registry->Detach();

	return(flag);
}

/*
	Reset()
*/
void CConfig::CONFIG::Reset(void)
{
	memset(m_szSection,'\0',sizeof(m_szSection));
	memset(m_szName,'\0',sizeof(m_szName));
	memset(&m_Value,'\0',sizeof(VALUE));
	m_Type = NULL_TYPE;
}

/*
	Init()
*/
void CConfig::CONFIG::Init(LPCSTR lpcszSectionName/*=NULL*/,LPCSTR lpcszKeyName/*=NULL*/,LPCSTR lpcszKeyValue/*=NULL*/)
{
	SetSection(lpcszSectionName);
	SetName(lpcszKeyName);
	SetValue(lpcszKeyValue);
}

/*
	Init()
*/
void CConfig::CONFIG::Init(LPCSTR lpcszSectionName/*=NULL*/,LPCSTR lpcszKeyName/*=NULL*/,DWORD dwKeyValue/*=(DWORD)-1L*/)
{
	SetSection(lpcszSectionName);
	SetName(lpcszKeyName);
	SetValue(dwKeyValue);
}

/*
	SetSection()
*/
void CConfig::CONFIG::SetSection(LPCSTR lpcszSectionName)
{
	if(lpcszSectionName)
		strcpyn(m_szSection,lpcszSectionName,sizeof(m_szSection));
}

/*
	SetName()
*/
void CConfig::CONFIG::SetName(LPCSTR lpcszKeyName)
{
	if(lpcszKeyName)
		strcpyn(m_szName,lpcszKeyName,sizeof(m_szName));
}

/*
	SetValue()
*/
void CConfig::CONFIG::SetValue(LPCSTR lpcszKeyValue)
{	
	if(lpcszKeyValue)
	{
		memset(m_Value.szValue,'\0',REGKEY_MAX_KEY_VALUE+1);
		strcpyn(m_Value.szValue,lpcszKeyValue,REGKEY_MAX_KEY_VALUE+1);
		m_Type = LPSTR_TYPE;
	}
}

/*
	SetValue()
*/
void CConfig::CONFIG::SetValue(DWORD dwKeyValue)
{
	if(dwKeyValue!=(DWORD)-1L)
	{
		m_Value.dwValue = dwKeyValue;
		m_Type = DWORD_TYPE;
	}
}
