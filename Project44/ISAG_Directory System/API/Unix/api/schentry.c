
#include "ldapinit.h"


int SearchEntry( schBase, filter, sort, result)
char *schBase;
char *filter;
char *sort;
SecureAgent **result;
{
    int         version, ldapPort, i, rc, entryCount;
    char        *ldapHost, *loginDN, *password, *searchBase;   
    char        *attribute, *dn, **values,  *sortAttribute;       
    struct      timeval timeOut;
	SecureAgent *Head, *St, *NewEntry;
    BerElement  *ber;
    LDAP        *ld;
    LDAPMessage *searchResult, *entry;



	ldapHost          = LDAP_SERVER;
	ldapPort          = LDAP_PORT;
	loginDN           = LDAP_LOGIN;
	password          = LDAP_PSWD;
	searchBase     = schBase;
	sortAttribute      = sort;
    timeOut.tv_sec    = 10L;
    timeOut.tv_usec   = 0L;
    
	

	version = LDAP_VERSION3;
	ldap_set_option( NULL, LDAP_OPT_PROTOCOL_VERSION, &version);


	if (( ld = ldap_init( ldapHost, ldapPort )) == NULL)          
	      return(101);
	

	rc = ldap_simple_bind_s( ld, loginDN, password );
	if (rc != LDAP_SUCCESS )
	{
	  ldap_unbind_s ( ld );
	  return(rc);
	}


    rc = ldap_search_ext_s(  
                    ld,                    /* LDAP session handle */
                    searchBase,            /* container to search */
                    LDAP_SCOPE_SUBTREE,   /* search scope : BASE,ONELEVEL,SUBTREE */
                    filter,     /*  "(objectclass=*)"  search filter */
                    NULL,                  /* return all attributes */
                    0,                     /* return attributes and values */
                    NULL,                  /* server controls */
                    NULL,                  /* client controls */
                    &timeOut,              /* time out */
                    LDAP_NO_LIMIT,         /* no size limit */
                    &searchResult );       /* returned results */


	if ( rc != LDAP_SUCCESS )
	{
	  ldap_unbind_s ( ld );
	  return(rc);

	}


    ldap_sort_entries( ld, &searchResult, sortAttribute, strcmp );

        St = (SecureAgent*) malloc(sizeof(SecureAgent));
		St->left = 0;
		St->right = 0;

		NewEntry = (SecureAgent*) malloc(sizeof(SecureAgent));

        NewEntry->left = 0;
		NewEntry->right = 0;
		St = NewEntry;
		Head = St;

        St->dn[0] = 0;
        St->agentid[0] = 0;
        St->ip[0] = 0;
        St->starttime[0] = 0;
        St->refresh[0] = 0;
        St->sstarttime[0] = 0;
        St->srefresh[0] = 0;
        St->status[0] = 0;
        St->source[0] = 0;
        St->destination[0] = 0;
        St->service[0] = 0;
        St->action[0] = 0;
        St->ipcap[0] = 0;
        St->portcap[0] = 0;
        St->attacktype[0] = 0;
        St->atime[0] = 0;


   dn=(char*) malloc(MXMESG);
   dn[0] =0;
   attribute=(char*) malloc(MXMESG);
   attribute[0] =0;
   values = (char**) malloc(MXMESG*2);   //multi with 2

    for (   entry   =   ldap_first_entry( ld, searchResult ); entry   !=  NULL; entry   =   ldap_next_entry( ld, entry ) ) 
    {


        if (( dn = ldap_get_dn( ld, entry )) != NULL )            
        {
			strcpy(St->dn,dn);
            St->dn[strlen(St->dn)] =0;
            ldap_memfree( dn );
        }
            
        for (   attribute = ldap_first_attribute( ld, entry, &ber ); attribute != NULL;  attribute = ldap_next_attribute( ld, entry, ber ) ) 
        {   
		   if(!strcmp(AGENTID,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
					strcpy(St->agentid,values[i]);
                    St->agentid[strlen(St->agentid)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(IP,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->ip,values[i]);
                    St->ip[strlen(St->ip)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(STARTTIME,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->starttime,values[i]);
                    St->starttime[strlen(St->starttime)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(REFRESH,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->refresh,values[i]);
                    St->refresh[strlen(St->refresh)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(SSTARTTIME,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->sstarttime,values[i]);
                    St->sstarttime[strlen(St->sstarttime)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(SREFRESH,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->srefresh,values[i]);
                    St->srefresh[strlen(St->srefresh)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(STATUS,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->status,values[i]);
                    St->status[strlen(St->status)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(SOURCE,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->source,values[i]);
                    St->source[strlen(St->source)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(DESTINATION,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->destination,values[i]);
                    St->destination[strlen(St->destination)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(SERVICE,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->service,values[i]);
                    St->service[strlen(St->service)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(ACTION,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->action,values[i]);
                    St->action[strlen(St->action)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(IPCAP,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->action,values[i]);
                    St->action[strlen(St->action)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(PORTCAP,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->portcap,values[i]);
                    St->portcap[strlen(St->portcap)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(ATTACKTYPE,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->attacktype,values[i]);
                    St->attacktype[strlen(St->attacktype)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else if(!strcmp(ATIME,attribute))
		   {
            if (( values = ldap_get_values( ld, entry, attribute)) != NULL ) 
            {
                for ( i = 0; values[i] != NULL; i++ )
				{
			        strcpy(St->atime,values[i]);
                    St->atime[strlen(St->atime)] =0;
                }
                ldap_value_free( values );
            }
           }

		   else;


            attribute[0] =0;
			ldap_memfree( attribute );

        }
		   NewEntry = (SecureAgent*) malloc(sizeof(SecureAgent));
           NewEntry->left = St;
		   NewEntry->right = 0;
		   St->right = NewEntry;
		   St = NewEntry;

           St->dn[0] = 0;
           St->agentid[0] = 0;
           St->ip[0] = 0;
           St->starttime[0] = 0;
           St->refresh[0] = 0;
           St->sstarttime[0] = 0;
           St->srefresh[0] = 0;
           St->status[0] = 0;
           St->source[0] = 0;
           St->destination[0] = 0;
           St->service[0] = 0;
           St->action[0] = 0;
           St->ipcap[0] = 0;
           St->portcap[0] = 0;
           St->attacktype[0] = 0;
           St->atime[0] = 0;

       
        ber_free(ber, 0);

    }
     if(St->left)
	 {
		St = St->left;
        free(St->right);
		St->right = 0;
     } 


    *result = Head;
	ldap_unbind_s( ld );
	return(rc);

}

