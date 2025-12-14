// ADConnect.cpp: implementation of the ADConnect class.
// Version 4.3.5
//////////////////////////////////////////////////////////////////////


#include "stdafx.h"
#include "ADConnect.h"
//adsi use
#include <activeds.h>

//OLE2T and T2OLE use
#include <atlconv.h>

#include <windows.h>

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

ADConnect::ADConnect()
{
	CoInitialize(0);
}


ADConnect::~ADConnect()
{
	
	CoUninitialize();
}


CString ADConnect::GetDoMain()
{
	IADs    *pRoot=NULL;
    VARIANT varDSRoot;
	USES_CONVERSION;
    HRESULT hr;

	hr = CoInitialize(NULL);
    hr = ADsGetObject(L"LDAP://RootDSE",IID_IADs,(void**)&pRoot);

	// Get the Directory Object on the root DSE, to get to the server configuration
	//hr = pRoot->Get(L"defaultNamingContext",&varDSRoot);
	hr = pRoot->Get(L"dnsHostName",&varDSRoot);
	if (FAILED(hr)) return "";
    
//	VariantClear(&varDSRoot);

    if (pRoot)
	{
        pRoot->Release();
	}

    CoUninitialize();


	return OLE2T(varDSRoot.bstrVal);

}

bool ADConnect::GetList(CString View,CStringArray& Name,CStringArray& DistinguishedName)
{	
	IDirectorySearch *pContainerToSearch = NULL;
	HRESULT hr;

	//Specify subtree search
	ADS_SEARCHPREF_INFO SearchPrefs;
	SearchPrefs.dwSearchPref = ADS_SEARCHPREF_SEARCH_SCOPE;
	SearchPrefs.vValue.dwType = ADSTYPE_INTEGER;
	SearchPrefs.vValue.Integer = ADS_SCOPE_SUBTREE;
	LPOLESTR	pszTmpPath = new OLECHAR[MAX_PATH];
    DWORD dwNumPrefs = 1;

	// COL for iterations
	LPOLESTR pszColumn = NULL;    
	ADS_SEARCH_COLUMN col;
    
    // Handle used for searching
    ADS_SEARCH_HANDLE hSearch = NULL;	
	USES_CONVERSION;

	wcscpy(pszTmpPath,L"LDAP://");
	wcscat(pszTmpPath,T2OLE(ADConnect::GetDoMain()));

	hr = ADsOpenObject(L"LDAP://DC=firewall,DC=COM",
						 NULL,
						 NULL,
						 ADS_SECURE_AUTHENTICATION, //Use Secure Authentication
						 IID_IDirectorySearch,
						 (void**)&pContainerToSearch);

	if (!pContainerToSearch)
		return false;
	
	//Start new T2OLE

    //Create search filter Add the filter.
	LPOLESTR pszSearchFilter = new OLECHAR[MAX_PATH*2];
	wcscpy(pszSearchFilter,L"(&(objectClass=");
	wcscat(pszSearchFilter,T2OLE(View));
	wcscat(pszSearchFilter,L"))");

//	MessageBox(NULL,OLE2T(pszSearchFilter),"nice",MB_OK);
	// Set the search preference
    hr = pContainerToSearch->SetSearchPreference( &SearchPrefs, dwNumPrefs);
    if (FAILED(hr))
	{
		if (pContainerToSearch)
			pContainerToSearch->Release();
        return false;
	}
	
	LPOLESTR pszNonVerboseList[] = {L"name",L"distinguishedName"};
	LPOLESTR szName = new OLECHAR[MAX_PATH];
	LPOLESTR szDN = new OLECHAR[MAX_PATH];

	wcscpy(szName,L"");
	wcscpy(szDN,L"");

	//Return non-verbose list properties only
    hr = pContainerToSearch->ExecuteSearch(pszSearchFilter,
		                    pszNonVerboseList,
							sizeof(pszNonVerboseList)/sizeof(LPOLESTR),
							&hSearch
							);	
 	if ( SUCCEEDED(hr) )
	{    
	  // Call IDirectorySearch::GetNextRow() to retrieve the next row of data
	  hr = pContainerToSearch->GetFirstRow(hSearch);
	  if (SUCCEEDED(hr))
	  {
        while( hr != S_ADS_NOMORE_ROWS )
		{
			while( pContainerToSearch->GetNextColumnName( hSearch, &pszColumn ) != S_ADS_NOMORE_COLUMNS )
            {
                hr = pContainerToSearch->GetColumn( hSearch, pszColumn, &col );
			    if ( SUCCEEDED(hr) )
				{		            
					if (0==wcscmp(L"name",pszColumn))
					{
						wcscpy(szName,col.pADsValues->CaseIgnoreString);
						Name.Add(OLE2T(szName)); 
					}					
					if (0==wcscmp(L"distinguishedName",pszColumn))
					{
						wcscpy(szDN,col.pADsValues->CaseIgnoreString);
						DistinguishedName.Add(OLE2T(szDN)); 
					}					
					pContainerToSearch->FreeColumn(&col);
			    }
				FreeADsMem(pszColumn);
			}	//Get the next row
			hr = pContainerToSearch->GetNextRow(hSearch);
		}
	  }  
	  // Close the search handle to clean up
      pContainerToSearch->CloseSearchHandle(hSearch);
	} 

	if (pContainerToSearch)
	   pContainerToSearch->Release();
    return true;
}


bool ADConnect::GetMember(CString UserPath,CStringArray& Member)
{
	// COM result variable
	HRESULT hr;

	// Interface Pointers
	IADs	    *   pIADs = NULL;
	LPOLESTR	pszTmpPath = new OLECHAR[MAX_PATH];
	
	//Start new T2OLE
	USES_CONVERSION;

	wcscpy(pszTmpPath,L"LDAP://");
	wcscat(pszTmpPath,T2OLE(ADConnect::GetDoMain()));
	wcscat(pszTmpPath,L"/");
	wcscat(pszTmpPath,T2OLE(UserPath));
    
	// Bind to the actual server	
	hr = ADsGetObject(pszTmpPath,IID_IADs,(void **)&pIADs);

	if (!SUCCEEDED(hr)) return false;	

	//Get firewallRule
	VARIANT var;
	hr = pIADs->GetEx(L"member", &var );
	if (SUCCEEDED(hr))
	{
		LONG lstart, lend;
		SAFEARRAY *sa = V_ARRAY( &var );
		VARIANT var;
		
		// Get the lower and upper bound
		hr = SafeArrayGetLBound( sa, 1, &lstart );
		hr = SafeArrayGetUBound( sa, 1, &lend );
		
		// Now iterate and print the content
		VariantInit(&var);
		
		for ( long idx=lstart; idx <= lend; idx++ )
		{			
			hr = SafeArrayGetElement( sa, &idx, &var);
			Member.Add(OLE2T(V_BSTR(&var)));
			VariantClear(&var);	
		} 
	}

	if(pIADs) pIADs->Release();
	return true;
}


bool ADConnect::GetMemberOf(CString UserPath,CStringArray& MemberOf)
{
	// COM result variable
	HRESULT hr;

	// Interface Pointers
	IADs	    *   pIADs = NULL;
	LPOLESTR	pszTmpPath = new OLECHAR[MAX_PATH];
	
	//Start new T2OLE
	USES_CONVERSION;

	wcscpy(pszTmpPath,L"LDAP://");
	wcscat(pszTmpPath,T2OLE(ADConnect::GetDoMain()));
	wcscat(pszTmpPath,L"/");
	wcscat(pszTmpPath,T2OLE(UserPath));

    // Bind to the actual server	
	hr = ADsGetObject(pszTmpPath,IID_IADs,(void **)&pIADs);

	if (!SUCCEEDED(hr)) return false;	

	//Get firewallRule
	VARIANT var;
	hr = pIADs->GetEx(L"memberof", &var );
	if ( SUCCEEDED(hr) )
	{
		LONG lstart, lend;
		SAFEARRAY *sa = V_ARRAY( &var );
		VARIANT var;		
 
		// Get the lower and upper bound
		hr = SafeArrayGetLBound( sa, 1, &lstart );
		hr = SafeArrayGetUBound( sa, 1, &lend );
		
		// Now iterate and print the content
		VariantInit(&var);
		
		for ( long idx=lstart; idx <= lend; idx++ )
		{		
			hr = SafeArrayGetElement( sa, &idx, &var);
			MemberOf.Add(OLE2T(V_BSTR(&var)));
			VariantClear(&var);	
		} 
	}

	if(pIADs) pIADs->Release();
	return true;
}

bool ADConnect::GetRule(CString Path,CStringArray& Rule)
{
// COM result variable
	HRESULT hr;

	// Interface Pointers
	IADs	    *   pIADs = NULL;
	LPOLESTR	pszTmpPath = new OLECHAR[MAX_PATH];
	
	//Start new T2OLE
	USES_CONVERSION;

	wcscpy(pszTmpPath,L"LDAP://");
	wcscat(pszTmpPath,T2OLE(ADConnect::GetDoMain()));
	wcscat(pszTmpPath,L"/");
	wcscat(pszTmpPath,T2OLE(Path));

    // Bind to the actual server	
	hr = ADsGetObject(pszTmpPath,IID_IADs,(void **)&pIADs);

	if (!SUCCEEDED(hr)) return false;	

	//Get firewallRule
	VARIANT var;
	hr = pIADs->GetEx(L"firewallRule", &var );
	if ( SUCCEEDED(hr) )
	{
		LONG lstart, lend;
		SAFEARRAY *sa = V_ARRAY( &var );
		VARIANT var;		
 
		// Get the lower and upper bound
		hr = SafeArrayGetLBound( sa, 1, &lstart );
		hr = SafeArrayGetUBound( sa, 1, &lend );
		
		// Now iterate and print the content
		VariantInit(&var);
		
		for ( long idx=lstart; idx <= lend ; idx++ )
		{			
			hr = SafeArrayGetElement( sa, &idx, &var);
//			MessageBox(NULL,OLE2T(V_BSTR(&var)),"nice",MB_OK);
			Rule.Add(OLE2T(V_BSTR(&var)));
			VariantClear(&var);	
		} 
	}

	if(pIADs) pIADs->Release();
	return true;
}

bool ADConnect::SetNewRule(CString Path, CString NewRule)
{
	// COM result variable
	HRESULT hr;
	// Interface Pointers
	IADs	            *   pIADs = NULL;
	LPOLESTR				pszTmpPath = new OLECHAR[MAX_PATH];
	CStringArray			Rule;
	//Start new T2OLE
	USES_CONVERSION;

	wcscpy(pszTmpPath,L"LDAP://");
	wcscat(pszTmpPath,T2OLE(ADConnect::GetDoMain()));
	wcscat(pszTmpPath,L"/");
	wcscat(pszTmpPath,T2OLE(Path));
//	MessageBox(NULL,OLE2T(pszTmpPath),"nice",MB_OK);
    // Bind to the actual server	
	hr = ADsGetObject(pszTmpPath,IID_IADs,(void **)&pIADs);

	if (!SUCCEEDED(hr)) return false;	

	//Get firewallRule
	VARIANT var;
	hr = pIADs->GetEx(L"firewallRule", &var );
	if (SUCCEEDED(hr))
	{
		LONG lstart, lend;
		SAFEARRAY *sa = V_ARRAY( &var );
 
		// Get the lower and upper bound
		hr = SafeArrayGetLBound( sa, 1, &lstart );
		hr = SafeArrayGetUBound( sa, 1, &lend );
		
		// Now iterate and print the content
		VariantInit(&var);
		
		for ( long idx=lstart; idx <= lend ; idx++ )
		{			
			hr = SafeArrayGetElement( sa, &idx, &var);
			Rule.Add(OLE2T(V_BSTR(&var)));
			VariantClear(&var);	
		} 

//		char buffer[20];
//		NewRule = "," + NewRule;
//		NewRule = _itoa(lend+2,buffer,10) + NewRule;
//		if((lend+2) < 10)
//			NewRule = "0" + NewRule;
		
		Rule.Add(T2OLE(NewRule));
		LPWSTR *sa2;
		sa2 = new LPWSTR[lend + 2];
		for(idx=lstart; idx <= (lend+1) ; idx++)
			sa2[idx] = T2OLE(Rule.GetAt(idx));

		VariantClear(&var);		
		hr = ADsBuildVarArrayStr(sa2,lend + 2, &var);
		if (!SUCCEEDED(hr)) return false;
		hr = pIADs->Put(L"firewallRule", var);
		VariantClear(&var);

	}
	else
	{
//		NewRule = "01," + NewRule;
		LPWSTR sa2 = T2OLE(NewRule);
		hr = ADsBuildVarArrayStr( &sa2, 1, &var );
		hr = pIADs->Put(L"firewallRule", var); 
		VariantClear(&var);
	}

	if (!SUCCEEDED(hr)) return false;
	
	hr = pIADs->SetInfo();
	
	if (!SUCCEEDED(hr)) return false;
	
	pIADs->Release();
	return true;
}

/*bool ADConnect::SetEditRule(CString Path, CString NewRule,int Order)
{
	// COM result variable
	HRESULT hr;

	// Interface Pointers
	IADs	    *   pIADs = NULL;
	LPOLESTR	pszTmpPath = new OLECHAR[MAX_PATH];
	CStringArray			Rule;
	
	//Start new T2OLE
	USES_CONVERSION;

	wcscpy(pszTmpPath,L"LDAP://");
	wcscat(pszTmpPath,T2OLE(ADConnect::GetDoMain()));
	wcscat(pszTmpPath,L"/");
	wcscat(pszTmpPath,T2OLE(Path));

    // Bind to the actual server	
	hr = ADsGetObject(pszTmpPath,IID_IADs,(void **)&pIADs);

	if (!SUCCEEDED(hr)) return false;	

	//Get firewallRule
	VARIANT var;
	hr = pIADs->GetEx(L"firewallRule", &var );
	if ( SUCCEEDED(hr) )
	{
		LONG lstart, lend;
		SAFEARRAY *sa = V_ARRAY( &var );
		LPWSTR *sa2;
		VARIANT var;
 
		// Get the lower and upper bound
		hr = SafeArrayGetLBound( sa, 1, &lstart );
		hr = SafeArrayGetUBound( sa, 1, &lend );		
		sa2 = new LPWSTR[lend+1];

		// Now iterate and print the content
		VariantInit(&var);
		for ( long idx=lstart; idx <= lend; idx++ )
		{	hr = SafeArrayGetElement( sa, &idx, &var);		
//			MessageBox(NULL,OLE2T(V_BSTR(&var)),"nice",MB_OK);
			if(idx == Order)
			{
				CString TmpNewRule = OLE2T(V_BSTR(&var));				
//				TmpNewRule = TmpNewRule.Mid(0,2);			
//				TmpNewRule += "," + NewRule ;
				Rule.Add(TmpNewRule);
			}
			else
			{			
				Rule.Add(OLE2T(V_BSTR(&var)));
				VariantClear(&var);
			}			
		} 

		for (long idx2 = lstart; idx2 <= lend; idx2++ )
		{		
			sa2[idx2] = T2OLE(Rule.GetAt(idx2));			
			
		}
		
		VariantClear(&var);
		V_VT(&var)=VT_NULL;
		hr = pIADs->PutEx( ADS_PROPERTY_CLEAR, L"firewallRule", var);
		hr = pIADs->SetInfo();  

		VariantClear(&var);		
		hr = ADsBuildVarArrayStr(sa2,lend + 1, &var);
		if (!SUCCEEDED(hr)) return false;
		hr = pIADs->PutEx(ADS_PROPERTY_UPDATE,L"firewallRule", var);		
		
		hr = pIADs->SetInfo();
		if (!SUCCEEDED(hr)) return false;
		VariantClear(&var);
		if (!SUCCEEDED(hr)) return false;
	}
	
	if(pIADs) pIADs->Release();
	return true;
}
*/

bool ADConnect::SetDeleteRule(CString Path,int Order)
{
// COM result variable
	HRESULT hr;

	// Interface Pointers
	IADs	    *   pIADs = NULL;
	LPOLESTR	pszTmpPath = new OLECHAR[MAX_PATH];
	CStringArray			Rule;
	
	//Start new T2OLE
	USES_CONVERSION;

	wcscpy(pszTmpPath,L"LDAP://");
	wcscat(pszTmpPath,T2OLE(ADConnect::GetDoMain()));
	wcscat(pszTmpPath,L"/");
	wcscat(pszTmpPath,T2OLE(Path));

    // Bind to the actual server	
	hr = ADsGetObject(pszTmpPath,IID_IADs,(void **)&pIADs);

	if (!SUCCEEDED(hr)) return false;	

	//Get firewallRule
	VARIANT var;
	hr = pIADs->GetEx(L"firewallRule", &var );
	if ( SUCCEEDED(hr) )
	{
		LONG lstart, lend;
		SAFEARRAY *sa = V_ARRAY( &var );
		LPWSTR *sa2;
		CString *saStr;
		VARIANT var;
 
		// Get the lower and upper bound
		hr = SafeArrayGetLBound( sa, 1, &lstart );
		hr = SafeArrayGetUBound( sa, 1, &lend );
		if(lend != 0)
		{
			sa2 = new LPWSTR[lend];
			saStr = new CString[lend];
			// Now iterate and print the content
			VariantInit(&var);
			int icount = 0;
			for ( long idx=lstart; idx <= lend; idx++ )
			{
				
				if(idx != (Order))
				{
					hr = SafeArrayGetElement( sa, &idx, &var);	
					if(idx != (Order))
					{			
						CString TmpNewRule = OLE2T(V_BSTR(&var));
						TmpNewRule = OLE2T(V_BSTR(&var));					
//						TmpNewRule = TmpNewRule.Mid(2);
//						TmpNewRule = itoa((lend - icount),buffer,10) + TmpNewRule;
//						if((lend - icount) < 10)
//							TmpNewRule = "0" + TmpNewRule;
						Rule.Add(TmpNewRule);
						icount++;
					}
					VariantClear(&var);
				}
			} 

			for ( long idx2=lstart; idx2 < lend; idx2++ )
			{	
				sa2[idx2] = T2OLE(Rule.GetAt(idx2));
			}
					
			VariantClear(&var);		
			hr = ADsBuildVarArrayStr(sa2,lend , &var);
			hr = pIADs->Put(L"firewallRule", var);			
			if (!SUCCEEDED(hr)) return false;
			hr = pIADs->SetInfo();			
			if (!SUCCEEDED(hr)) return false;
		}
		else
		{
			VariantClear(&var);
			V_VT(&var)=VT_NULL;
			hr = pIADs->PutEx( ADS_PROPERTY_CLEAR, L"firewallRule", var);
			hr = pIADs->SetInfo();  
		}
	}
	if(pIADs) pIADs->Release();
	return true;
}
